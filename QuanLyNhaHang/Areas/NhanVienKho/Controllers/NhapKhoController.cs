using QuanLyNhaHang.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.Data.Entity;

namespace QuanLyNhaHang.Areas.NhanVienKho.Controllers
{
    public class NhapKhoController : Controller
    {
        private DatabaseQuanLyNhaHang db = new DatabaseQuanLyNhaHang();

        // GET: NhanVienKho/NhapKho/DSNhapKho
        public ActionResult DSNhapKho()
        {
            var danhSachPhieuNhap = db.PhieuNhaps
               .Include(p => p.NhaCC)
               .Include(p => p.NhanVien)
               .ToList();
            return View(danhSachPhieuNhap);
        }

        // GET: NhanVienKho/NhapKho/XemChiTiet/5
        public ActionResult XemChiTiet(int id)
        {
            var phieu = db.PhieuNhaps
                          .Include("ChiTietPhieuNhaps.NguyenLieu") // load cả nguyên liệu
                          .FirstOrDefault(p => p.MaPhieuNhap == id);

            if (phieu == null)
                return HttpNotFound();

            return View(phieu); // Truyền đúng kiểu PhieuNhap
        }
        // GET
        public ActionResult ThemPhieuNhap()
        {
            ViewBag.NhaCungCapList = db.NhaCCs.ToList();
            var nguyenLieuList = ViewBag.NguyenLieuList as IEnumerable<QuanLyNhaHang.Models.NguyenLieu> ?? new List<QuanLyNhaHang.Models.NguyenLieu>();
            ViewBag.TaiKhoanNV_id = Session["TaiKhoanNV"];
            return View(new PhieuNhap()); // tạo model rỗng
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ThemPhieuNhap(PhieuNhap phieuNhap, List<ChiTietPhieuNhap> ChiTietPhieuNhaps)
        {
            if (ModelState.IsValid)
            {
                // Lấy mã tài khoản từ session
                var taiKhoanNV = Session["TaiKhoanNV"]?.ToString();
                if (string.IsNullOrEmpty(taiKhoanNV))
                {
                    ModelState.AddModelError("", "Không xác định được tài khoản nhân viên đang đăng nhập.");
                    return View(phieuNhap);
                }

                phieuNhap.TaiKhoanNV_id = taiKhoanNV;
                phieuNhap.NgayNhap = DateTime.Now;

                db.PhieuNhaps.Add(phieuNhap);
                db.SaveChanges(); // Lưu để có MaPhieuNhap mới

                // Nhóm các dòng nguyên liệu trùng theo MaNguyenLieu_id
                var groupedChiTiet = ChiTietPhieuNhaps
                    .GroupBy(ct => ct.MaNguyenLieu_id)
                    .Select(g => new ChiTietPhieuNhap
                    {
                        MaNguyenLieu_id = g.Key,
                        MaPhieuNhap_id = phieuNhap.MaPhieuNhap,
                        SoLuongNhap = g.Sum(x => x.SoLuongNhap),
                        GiaNhap = g.Last().GiaNhap, // hoặc lấy trung bình nếu bạn muốn
                        ThanhTien = g.Sum(x => x.SoLuongNhap * x.GiaNhap)
                    })
                    .ToList();

                double tongTien = 0;
                foreach (var ct in groupedChiTiet)
                {
                    tongTien += ct.ThanhTien ?? 0;
                    db.ChiTietPhieuNhaps.Add(ct);

                    // Cập nhật tồn kho
                    var nl = db.NguyenLieus.Find(ct.MaNguyenLieu_id);
                    if (nl != null)
                    {
                        nl.SoLuongHienCon = (nl.SoLuongHienCon ?? 0) + ct.SoLuongNhap;
                        nl.GiaNhapCuoi = ct.GiaNhap;
                    }
                }

                phieuNhap.TongTien = tongTien;
                db.SaveChanges();

                return RedirectToAction("DSNhapKho");
            }

            // Nếu ModelState không hợp lệ, load lại dropdown và hiển thị form
            ViewBag.NhaCungCapList = db.NhaCCs.ToList();
            var nguyenLieuList = ViewBag.NguyenLieuList as IEnumerable<QuanLyNhaHang.Models.NguyenLieu> ?? new List<QuanLyNhaHang.Models.NguyenLieu>();
            ViewBag.TaiKhoanNV_id = Session["TaiKhoanNV"];
            return View(phieuNhap);
        }

        public ActionResult CapNhatPhieuNhap(int id)
        {
            var phieu = db.PhieuNhaps.Find(id);
            if (phieu == null)
                return HttpNotFound();

            ViewBag.DSNhaCC = db.NhaCCs.ToList(); // Truyền đúng danh sách thô
            ViewBag.ChiTiet = db.ChiTietPhieuNhaps
                                .Where(c => c.MaPhieuNhap_id == id)
                                .Include(c => c.NguyenLieu)
                                .ToList();

            return View(phieu);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CapNhatPhieuNhap(PhieuNhap model, FormCollection form)
        {
            var phieu = db.PhieuNhaps.Find(model.MaPhieuNhap);
            if (phieu == null)
                return HttpNotFound();

            try
            {
                // Cập nhật thông tin cơ bản
                phieu.MaNCC_id = model.MaNCC_id;
                phieu.NgayNhap = model.NgayNhap;
                phieu.TaiKhoanNV_id = model.TaiKhoanNV_id;

                // Cập nhật chi tiết phiếu nhập
                var chiTietList = db.ChiTietPhieuNhaps
                                    .Where(c => c.MaPhieuNhap_id == model.MaPhieuNhap)
                                    .ToList();

                double tongTien = 0;

                foreach (var ct in chiTietList)
                {
                    string slKey = $"SoLuongNhap_{ct.MaNguyenLieu_id}";
                    string giaKey = $"GiaNhap_{ct.MaNguyenLieu_id}";

                    double sl = Convert.ToDouble(form[slKey]);
                    double gia = Convert.ToDouble(form[giaKey]);

                    ct.SoLuongNhap = sl;
                    ct.GiaNhap = gia;
                    ct.ThanhTien = sl * gia;
                    tongTien += ct.ThanhTien ?? 0;
                }

                phieu.TongTien = tongTien;

                db.SaveChanges();
                return RedirectToAction("DSNhapKho");
            }
            catch
            {
                // Nếu có lỗi thì nạp lại ViewBag
                ViewBag.DSNhaCC = db.NhaCCs.ToList(); // Truyền đúng danh sách thô
                ViewBag.ChiTiet = db.ChiTietPhieuNhaps
                                    .Where(c => c.MaPhieuNhap_id == model.MaPhieuNhap)
                                    .Include(c => c.NguyenLieu)
                                    .ToList();

                return View(model);
            }
        }


        // GET: NhanVienKho/NhapKho/XoaPhieuNhap/5
        public ActionResult XoaPhieuNhap(int id)
        {
            var phieu = db.PhieuNhaps.Find(id);
            if (phieu == null)
                return HttpNotFound();

            var chiTiet = db.ChiTietPhieuNhaps.Where(c => c.MaPhieuNhap_id == id).ToList();
            foreach (var item in chiTiet)
            {
                var nl = db.NguyenLieus.Find(item.MaNguyenLieu_id);
                if (nl != null)
                    nl.SoLuongHienCon -= item.SoLuongNhap;

                db.ChiTietPhieuNhaps.Remove(item);
            }

            db.PhieuNhaps.Remove(phieu);
            db.SaveChanges();

            return RedirectToAction("DSNhapKho");
        }
    }
}

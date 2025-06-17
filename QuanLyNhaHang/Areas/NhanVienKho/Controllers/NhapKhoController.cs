using QuanLyNhaHang.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace QuanLyNhaHang.Areas.NhanVienKho.Controllers
{
    public class NhapKhoController : Controller
    {
        private DatabaseQuanLyNhaHang db = new DatabaseQuanLyNhaHang();

        // GET: NhanVienKho/NhapKho/DSNhapKho
        public ActionResult DSNhapKho()
        {
            var list = db.PhieuNhaps.OrderByDescending(p => p.NgayNhap).ToList();
            return View(list);
        }

        // GET: NhanVienKho/NhapKho/XemChiTiet/5
        public ActionResult XemChiTiet(int id)
        {
            var phieu = db.PhieuNhaps.Find(id);
            if (phieu == null)
                return HttpNotFound();

            ViewBag.ChiTiet = db.ChiTietPhieuNhaps
                                .Where(c => c.MaPhieuNhap_id == id)
                                .ToList();

            return View(phieu);
        }

        // GET: NhanVienKho/NhapKho/ThemPhieuNhap
        public ActionResult ThemPhieuNhap()
        {
            ViewBag.NhaCC = new SelectList(db.NhaCCs.ToList(), "MaNCC", "TenNCC");
            ViewBag.NguyenLieu = db.NguyenLieus.ToList();
            return View();
        }

        // POST: NhanVienKho/NhapKho/ThemPhieuNhap
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ThemPhieuNhap(PhieuNhap phieuNhap, List<ChiTietPhieuNhap> chiTietList)
        {
            if (ModelState.IsValid)
            {
                phieuNhap.NgayNhap = DateTime.Now;
                db.PhieuNhaps.Add(phieuNhap);
                db.SaveChanges();

                double tongTien = 0;
                foreach (var ct in chiTietList)
                {
                    ct.MaPhieuNhap_id = phieuNhap.MaPhieuNhap;
                    ct.ThanhTien = ct.SoLuongNhap * ct.GiaNhap;
                    tongTien += ct.ThanhTien ?? 0;

                    db.ChiTietPhieuNhaps.Add(ct);

                    // Cập nhật tồn kho
                    var nl = db.NguyenLieus.Find(ct.MaNguyenLieu_id);
                    if (nl != null)
                    {
                        nl.SoLuongHienCon += ct.SoLuongNhap;
                        nl.GiaNhapCuoi = ct.GiaNhap;
                    }
                }

                phieuNhap.TongTien = tongTien;
                db.SaveChanges();

                return RedirectToAction("DSNhapKho");
            }

            ViewBag.NhaCC = new SelectList(db.NhaCCs.ToList(), "MaNCC", "TenNCC", phieuNhap.MaNCC_id);
            ViewBag.NguyenLieu = db.NguyenLieus.ToList();
            return View(phieuNhap);
        }

        // GET: NhanVienKho/NhapKho/CapNhatPhieuNhap/5
        public ActionResult CapNhatPhieuNhap(int id)
        {
            var phieu = db.PhieuNhaps.Find(id);
            if (phieu == null)
                return HttpNotFound();

            ViewBag.NhaCC = new SelectList(db.NhaCCs.ToList(), "MaNCC", "TenNCC", phieu.MaNCC_id);
            ViewBag.ChiTiet = db.ChiTietPhieuNhaps
                                .Where(c => c.MaPhieuNhap_id == id)
                                .ToList();
            ViewBag.NguyenLieu = db.NguyenLieus.ToList();

            return View(phieu);
        }

        // POST: NhanVienKho/NhapKho/CapNhatPhieuNhap
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CapNhatPhieuNhap(PhieuNhap model)
        {
            var phieu = db.PhieuNhaps.Find(model.MaPhieuNhap);
            if (phieu == null)
                return HttpNotFound();

            phieu.MaNCC_id = model.MaNCC_id;
            phieu.TaiKhoanNV_id = model.TaiKhoanNV_id;
            db.SaveChanges();

            return RedirectToAction("DSNhapKho");
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

using QuanLyNhaHang.Models;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;

namespace QuanLyNhaHang.Areas.Admin.Controllers
{
    public class NhanVienController : Controller
    {
        DatabaseQuanLyNhaHang db = new DatabaseQuanLyNhaHang();

        // Hiển thị danh sách nhân viên order (phục vụ):
        public ActionResult DSNhanVienPhucVu()
        {
            var list = db.NhanViens.Where(n => n.MaQuyen_id == 1 && n.TrangThai != 4).ToList();
            return View(list);
        }

        // Hiển thị danh sách nhân viên bếp:
        public ActionResult DSNhanVienBep()
        {
            var list = db.NhanViens.Where(n => n.MaQuyen_id == 4).ToList();
            return View(list);
        }

        // Hiển thị danh sách nhân viên kho:
        public ActionResult DSNhanVienKho()
        {
            var list = db.NhanViens.Where(n => n.MaQuyen_id == 2 && n.TrangThai != 4).ToList();
            return View(list);
        }


        // Danh sách nhân viên có tài khoản bị khóa 
        public ActionResult DSNhanVienKhoa()
        {
            var list = db.NhanViens.Where(n => n.TrangThai == 4).ToList();
            return View(list);
        }

        // Mở/Khóa tài khoản
        public ActionResult LockAccount(string sTaiKhoanNV)
        {
            var nhanvien = db.NhanViens.FirstOrDefault(n => n.TaiKhoanNV == sTaiKhoanNV);
            if (nhanvien.TrangThai == 4) // Đang bị khóa
            {
                nhanvien.TrangThai = 0;
                db.SaveChanges();

                if (nhanvien.MaQuyen_id == 1)
                {
                    return RedirectToAction("DSNhanVienPhucVu", "Nhanvien");

                }
                else if (nhanvien.MaQuyen_id == 2)
                {
                    return RedirectToAction("DSNhanVienKho", "Nhanvien");
                }
                //else
                {
                    return RedirectToAction("DSNhanVienBep", "Nhanvien");
                }
            }
            else // Chưa khóa 
            {
                nhanvien.TrangThai = 4;
                db.SaveChanges();
            }
            return RedirectToAction("DSNhanVienKhoa", "Nhanvien");
        }

        // Thêm mới nhân vien
        public ActionResult ThemNhanVien()
        {
            ViewBag.Quyen = db.Quyens.ToList();
            return View();
        }

        [HttpPost]
        public ActionResult ThemNhanVien(QuanLyNhaHang.Models.NhanVien Model)
        {
            // Kiểm tra tài khoản đã tồn tại chưa
            if (db.NhanViens.Any(nv => nv.TaiKhoanNV == Model.TaiKhoanNV))
            {
                ModelState.AddModelError("TaiKhoanNV", "Tài khoản đã tồn tại.");
            }
            // Kiểm tra mật khẩu
            if (string.IsNullOrWhiteSpace(Model.MatKhauNV) || Model.MatKhauNV.Length < 6)
            {
                ModelState.AddModelError("MatKhauNV", "Mật khẩu phải có ít nhất 6 ký tự.");
            }
            // Kiểm tra tên nhân viên
            if (string.IsNullOrWhiteSpace(Model.TenNhanVien))
            {
                ModelState.AddModelError("TenNhanVien", "Tên nhân viên không được để trống.");
            }
            // Kiểm tra số điện thoại (nếu nhập)
            if (!string.IsNullOrWhiteSpace(Model.SoDienThoai) && !System.Text.RegularExpressions.Regex.IsMatch(Model.SoDienThoai, @"^\d{10,11}$"))
            {
                ModelState.AddModelError("SoDienThoai", "Số điện thoại phải là 10-11 chữ số.");
            }

            if (!ModelState.IsValid)
            {
                ViewBag.Quyen = db.Quyens.ToList();
                return View(Model);
            }
            Model.TrangThai = 0; // 0: đang hoạt động
            db.NhanViens.Add(Model);
            db.SaveChanges();
            return RedirectToAction("DSNhanVienPhucVu", "NhanVien");
        }

        // Xóa nhân viên
        public ActionResult Xoa(string sTaiKhoanid)
        {
            var nhanVien = db.NhanViens.Find(sTaiKhoanid);
            db.NhanViens.Remove(nhanVien);
            db.SaveChanges();
            return RedirectToAction("DSNhanVienPhucVu", "NhanVien");
        }

        // Xem chi tiết nhân viên
        public ActionResult XemChiTiet(string sTaiKhoanid)
        {
            var nhanVien = db.NhanViens.Find(sTaiKhoanid);
            return View(nhanVien);
        }

        // Cập nhật nhân viên
        public ActionResult CapNhat(string sTaiKhoanid)
        {
            QuanLyNhaHang.Models.NhanVien nhanVien = db.NhanViens.Find(sTaiKhoanid);
            ViewBag.MaQuyen_id = new SelectList(db.Quyens, "MaQuyen", "TenQuyen", nhanVien.MaQuyen_id);
            ViewBag.Quyen = db.Quyens.ToList();
            return View(nhanVien);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CapNhat([Bind(Include = "TaiKhoanNV,MatKhauNV,TenNhanVien,NgaySinh,SoDienThoai,MaQuyen_id")] QuanLyNhaHang.Models.NhanVien nhanVien)
        {
            // Kiểm tra mật khẩu
            if (string.IsNullOrWhiteSpace(nhanVien.MatKhauNV) || nhanVien.MatKhauNV.Length < 6)
            {
                ModelState.AddModelError("MatKhauNV", "Mật khẩu phải có ít nhất 6 ký tự.");
            }
            // Kiểm tra tên nhân viên
            if (string.IsNullOrWhiteSpace(nhanVien.TenNhanVien))
            {
                ModelState.AddModelError("TenNhanVien", "Tên nhân viên không được để trống.");
            }
            // Kiểm tra số điện thoại (nếu nhập)
            if (!string.IsNullOrWhiteSpace(nhanVien.SoDienThoai) && !System.Text.RegularExpressions.Regex.IsMatch(nhanVien.SoDienThoai, @"^\d{10,11}$"))
            {
                ModelState.AddModelError("SoDienThoai", "Số điện thoại phải là 10-11 chữ số.");
            }

            if (ModelState.IsValid)
            {
                db.Entry(nhanVien).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("DSNhanVienPhucVu", "NhanVien");
            }
            ViewBag.MaQuyen_id = new SelectList(db.Quyens, "MaQuyen", "TenQuyen", nhanVien.MaQuyen_id);
            ViewBag.Quyen = db.Quyens.ToList();
            return View(nhanVien);
        }
    }
}
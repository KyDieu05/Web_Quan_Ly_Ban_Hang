using QuanLyNhaHang.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyNhaHang.Areas.NhanVienKho.Controllers
{
    public class DangNhapController : Controller
    {
        DatabaseQuanLyNhaHang db = new DatabaseQuanLyNhaHang();
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DangNhap(FormCollection f)
        {
            string ssTaiKhoan = f["txtTaiKhoan"]?.ToString();
            string ssMatKhau = f["txtMatKhau"]?.ToString();

            if (string.IsNullOrEmpty(ssTaiKhoan) && string.IsNullOrEmpty(ssMatKhau))
            {
                ModelState.AddModelError("", "Vui lòng nhập tên đăng nhập và mật khẩu của bạn !");
                return View();
            }
            if (string.IsNullOrEmpty(ssTaiKhoan))
            {
                ModelState.AddModelError("", "Bạn không được bỏ trống tên đăng nhập !");
                return View();
            }
            if (string.IsNullOrEmpty(ssMatKhau))
            {
                ModelState.AddModelError("", "Bạn không được bỏ trống mật khẩu !");
                return View();
            }

            var kh = db.NhanViens.SingleOrDefault(n => n.TaiKhoanNV == ssTaiKhoan);
            if (kh == null)
            {
                ModelState.AddModelError("", "Tài khoản không hợp lệ !");
                return View();
            }

            if (kh.MatKhauNV != ssMatKhau)
            {
                kh.TrangThai = (kh.TrangThai ?? 0) + 1;
                db.SaveChanges();
                ModelState.AddModelError("", "Bạn nhập sai mật khẩu !");
                return View();
            }

            if ((kh.TrangThai ?? 0) == 4)
            {
                ModelState.AddModelError("", "Tài khoản của bạn đã bị khóa !");
                return View();
            }

            // Đăng nhập thành công, reset trạng thái nếu cần
            kh.TrangThai = 0;
            db.SaveChanges();

            if (kh.MaQuyen_id == 1) // nhân viên phục vụ:
            {
                Session["TaiKhoanNV"] = kh;
                return Redirect("/NhanVien/Home/Index");
            }
            else if (kh.MaQuyen_id == 4) // nhân viên bếp
            {
                Session["TaiKhoanBep"] = kh;
                return Redirect("/NhanVienKho/Home/Index");
            }
            else if (kh.MaQuyen_id == 3) // Nhân viên admin
            {
                Session["Admin"] = kh;
                return Redirect("/Admin/Home/Index");
            }
            else // nhân viên kho
            {
                Session["TaiKhoanKho"] = kh;
                return Redirect("/NhanVienKho/Home/Index");
            }
            // Sau khi đăng nhập thành công
            Session["TaiKhoanNV"] = kh.TaiKhoanNV; // lưu lại mã tài khoản vào session
        }
        public ActionResult DangXuatNhanVien()
        {
            Session["TaiKhoanNV"] = null;
            return RedirectToAction("DangNhap", "DangNhap");
        }

        public ActionResult DangXuatNhanVienKho()
        {
            Session["TaiKhoanKho"] = null;
            return RedirectToAction("DangNhap", "DangNhap");
        }
        public ActionResult DangXuatNhanVienBep()
        {
            Session["TaiKhoanBep"] = null;
            return RedirectToAction("DangNhap", "DangNhap");
        }

        public ActionResult DangXuatAdmin()
        {
            Session["Admin"] = null;
            return RedirectToAction("DangNhap", "DangNhap");
        }
    }
}
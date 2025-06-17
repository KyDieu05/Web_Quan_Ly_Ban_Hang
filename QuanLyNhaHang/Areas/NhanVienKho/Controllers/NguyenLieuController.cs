using QuanLyNhaHang.Models;
using System;
using System.Linq;
using System.Web.Mvc;

namespace QuanLyNhaHang.Areas.NhanVienKho.Controllers
{
    public class NguyenLieuController : Controller
    {
        private DatabaseQuanLyNhaHang db = new DatabaseQuanLyNhaHang();

        // GET: NhanVienKho/NguyenLieu/DSNguyenLieu
        public ActionResult DSNguyenLieu()
        {
            var list = db.NguyenLieus.OrderByDescending(n => n.SoLuongHienCon).ToList();
            return View(list);
        }

        // GET: NhanVienKho/NguyenLieu/XemChiTiet/5
        public ActionResult XemChiTiet(int id)
        {
            var nl = db.NguyenLieus.Find(id);
            if (nl == null)
                return HttpNotFound();

            return View(nl);
        }

        // GET: NhanVienKho/NguyenLieu/ThemNguyenLieu
        public ActionResult ThemNguyenLieu()
        {
            ViewBag.LoaiNguyenLieu = new SelectList(db.LoaiNguyenLieus.ToList(), "MaLNL", "TenLNL");
            return View();
        }

        // POST: NhanVienKho/NguyenLieu/ThemNguyenLieu
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ThemNguyenLieu(NguyenLieu model)
        {
            if (ModelState.IsValid)
            {
                model.SoLuongHienCon = model.SoLuongHienCon ?? 0;
                db.NguyenLieus.Add(model);
                db.SaveChanges();
                return RedirectToAction("DSNguyenLieu");
            }
            ViewBag.LoaiNguyenLieu = new SelectList(db.LoaiNguyenLieus.ToList(), "MaLNL", "TenLNL", model.MaLNL_id);
            return View(model);
        }

        // GET: NhanVienKho/NguyenLieu/CapNhatNguyenLieu/5
        public ActionResult CapNhatNguyenLieu(int id)
        {
            var nl = db.NguyenLieus.Find(id);
            if (nl == null)
                return HttpNotFound();

            ViewBag.LoaiNguyenLieu = new SelectList(db.LoaiNguyenLieus.ToList(), "MaLNL", "TenLNL", nl.MaLNL_id);
            return View(nl);
        }

        // POST: NhanVienKho/NguyenLieu/CapNhatNguyenLieu/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CapNhatNguyenLieu(NguyenLieu model)
        {
            if (ModelState.IsValid)
            {
                var nl = db.NguyenLieus.Find(model.MaNguyenLieu);
                if (nl == null)
                    return HttpNotFound();

                nl.TenNguyenLieu = model.TenNguyenLieu;
                nl.SoLuongHienCon = model.SoLuongHienCon;
                nl.GiaNhapCuoi = model.GiaNhapCuoi;
                nl.GhiChu = model.GhiChu;
                nl.MaLNL_id = model.MaLNL_id;

                db.SaveChanges();
                return RedirectToAction("DSNguyenLieu");
            }

            ViewBag.LoaiNguyenLieu = new SelectList(db.LoaiNguyenLieus.ToList(), "MaLNL", "TenLNL", model.MaLNL_id);
            return View(model);
        }

        // GET: NhanVienKho/NguyenLieu/XoaNguyenLieu/5
        public ActionResult XoaNguyenLieu(int id)
        {
            var nl = db.NguyenLieus.Find(id);
            if (nl == null)
                return HttpNotFound();

            db.NguyenLieus.Remove(nl);
            db.SaveChanges();
            return RedirectToAction("DSNguyenLieu");
        }
    }
}

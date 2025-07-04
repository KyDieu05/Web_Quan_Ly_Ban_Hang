using QuanLyNhaHang.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.Data.Entity; // dành cho Entity Framework 6


namespace QuanLyNhaHang.Areas.NhanVienKho.Controllers
{
    public class XuatKhoController : Controller
    {
        private DatabaseQuanLyNhaHang db = new DatabaseQuanLyNhaHang();

        // GET: NhanVienKho/XuatKho/DSXuatKho
        public ActionResult DSXuatKho()
        {
            var danhSach = db.XuatKhoes
                .Include(x => x.NguyenLieuXuats)
                .OrderByDescending(x => x.NgayXuat)
                .ToList();

            return View(danhSach);
        }


        // GET: NhanVienKho/XuatKho/XemChiTiet/5
        public ActionResult XemChiTiet(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);

            var phieu = db.XuatKhoes.Find(id);
            if (phieu == null)
                return HttpNotFound();

            var danhSach = db.NguyenLieuXuats
                .Where(x => x.MaXuatKho_id == id)
                .ToList();

            return View(danhSach);
        }

    }
}

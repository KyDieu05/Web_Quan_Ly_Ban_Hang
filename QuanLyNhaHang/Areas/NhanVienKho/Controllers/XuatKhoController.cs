using QuanLyNhaHang.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace QuanLyNhaHang.Areas.NhanVienKho.Controllers
{
    public class XuatKhoController : Controller
    {
        private DatabaseQuanLyNhaHang db = new DatabaseQuanLyNhaHang();

        // GET: NhanVienKho/XuatKho/DSXuatKho
        public ActionResult DSXuatKho()
        {
            var danhSachXuatKho = db.XuatKhoes.OrderByDescending(x => x.NgayXuat).ToList();
            return View(danhSachXuatKho);
        }

        // GET: NhanVienKho/XuatKho/XemChiTiet/5
        public ActionResult XemChiTiet(int id)
        {
            var dotXuat = db.XuatKhoes.Find(id);
            if (dotXuat == null)
            {
                return HttpNotFound();
            }

            var danhSachNguyenLieu = db.NguyenLieuXuats
                                        .Where(x => x.MaXuatKho_id == id)
                                        .Select(x => new
                                        {
                                            x.MaNguyenLieu_id,
                                            x.NguyenLieu.TenNguyenLieu,
                                            x.SoLuongXuat,                                          
                                        })
                                        .ToList();

            ViewBag.DanhSachNguyenLieu = danhSachNguyenLieu;
            return View(dotXuat);
        }
    }
}

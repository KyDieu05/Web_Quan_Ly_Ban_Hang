/*using QuanLyNhaHang.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyNhaHang.Areas.NhanVienKho.Controllers
{
    public class HomeController : Controller
    {
        DatabaseQuanLyNhaHang db = new DatabaseQuanLyNhaHang();

        //Tranh chủ nhân viên bếp
        public ActionResult Index()
        {
            ViewBag.DoanhThu = DoanhThuDonHang();
            ViewBag.SumHoaDon = db.HoaDons.Count();
            ViewBag.SumMonAn = db.MonAns.Count();         
            ViewBag.SumBan = db.Bans.Count();
            ViewBag.Tang = db.Tangs.Count();
            // Món Ăn Bán Chạy
            ViewBag.BanChay = db.MonAns.Where(n => n.MaLMA_id != 10 & n.MaMonAn != 1).ToList().OrderByDescending(n => n.SoLuongDaBan);
            // Hóa đơn
            //var list = db.HoaDons.ToList().Where(n =>n.NgayTao.Value.ToString("dd/MM/yyyy")== time2).FirstOrDefault();
            //ViewBag.HoaDOn = list;
            ViewBag.HoaDon = db.HoaDons.ToList();
            return View();
        }
        public double DoanhThuDonHang()
        {
            double TongDoanhThu = 0;
            if (0 < db.HoaDons.Count())
            {
                // doanh thu tất cả 
                TongDoanhThu = db.HoaDons.Where(n => n.TrangThai == 0).Sum(n => n.TongTien);
                return TongDoanhThu;
            }
            else
                return TongDoanhThu;
        }
        #region Hiển thị danh sách các bàn theo tầng khác nhau
        public ActionResult Ban(int iMaTang)
        {
            var tenTang = db.Tangs.Find(iMaTang);
            ViewBag.Tang = tenTang.TenTang;

            var listBan = db.Bans.Where(n => n.MaTang_id == iMaTang).OrderBy(n => n.MaBan).ToList();
            return View(listBan);
        }
        public ActionResult Par_Tang()
        {
            var listTang = db.Tangs.ToList().OrderBy(n => n.MaTang);
            return PartialView(listTang);
        }

        #endregion
    }
}*/
using QuanLyNhaHang.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace QuanLyNhaHang.Areas.NhanVienKho.Controllers
{
    public class HomeController : Controller
    {
        DatabaseQuanLyNhaHang db = new DatabaseQuanLyNhaHang();

        // Trang chủ dành cho nhân viên bếp
        public ActionResult Index()
        {
            ViewBag.DoanhThu = DoanhThuDonHang();
            ViewBag.SumHoaDon = db.HoaDons.Count();
            ViewBag.SumMonAn = db.MonAns.Count();
            ViewBag.SumBan = db.Bans.Count();
            ViewBag.Tang = db.Tangs.Count();

            // Món ăn bán chạy (ngoại trừ khăn lạnh và danh mục đặc biệt)
            ViewBag.BanChay = db.MonAns
                .Where(n => n.MaLMA_id != 10 && n.MaMonAn != 1)
                .OrderByDescending(n => n.SoLuongDaBan)
                .ToList();

            // Hiển thị toàn bộ hóa đơn (mặc định)
            ViewBag.HoaDon = db.HoaDons.ToList();

            return View();
        }

        // Tổng doanh thu từ các hóa đơn đã thanh toán
        public double DoanhThuDonHang()
        {
            double tong = 0;
            if (db.HoaDons.Any())
            {
                tong = db.HoaDons
                    .Where(n => n.TrangThai == 0) // 0: đã thanh toán
                    .Sum(n => n.TongTien);
            }
            return tong;
        }

        #region Danh sách các bàn theo tầng
        public ActionResult Ban(int iMaTang)
        {
            var tenTang = db.Tangs.Find(iMaTang);
            ViewBag.Tang = tenTang?.TenTang ?? "Không rõ tầng";

            var listBan = db.Bans
                .Where(n => n.MaTang_id == iMaTang)
                .OrderBy(n => n.MaBan)
                .ToList();

            return View(listBan);
        }

        public ActionResult Par_Tang()
        {
            var listTang = db.Tangs
                .OrderBy(n => n.MaTang)
                .ToList();

            return PartialView(listTang);
        }
        #endregion

        
    }
}

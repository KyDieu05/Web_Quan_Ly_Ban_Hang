using System.Linq;
using System.Web.Mvc;
using QuanLyNhaHang.Models;

namespace QuanLyNhaHang.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        private DatabaseQuanLyNhaHang db = new DatabaseQuanLyNhaHang();

        // GET: Admin/Home
        public ActionResult Index()
        {
            ViewBag.DoanhThu = DoanhThuDonHang();
            ViewBag.SumHoaDon = db.HoaDons.Count();
            ViewBag.SumMonAn = db.MonAns.Count();
            ViewBag.SumNhanVien = db.NhanViens.Count();
            ViewBag.SumBan = db.Bans.Count();
            ViewBag.Tang = db.Tangs.Count();
            // Món Ăn Bán Chạy
            ViewBag.BanChay = db.MonAns.Where(n => n.MaLMA_id != 10 & n.MaMonAn != 1).ToList().OrderByDescending(n => n.SoLuongDaBan);
            // Hóa đơn
            //var list = db.HoaDons.ToList().Where(n =>n.NgayTao.Value.ToString("dd/MM/yyyy")== time2).FirstOrDefault();
            //ViewBag.HoaDOn = list;
            ViewBag.HoaDon = db.HoaDons.ToList();
            // Tổng số nhân viên (không tính admin)
            ViewBag.TongNhanVien = db.NhanViens.Count(nv => nv.MaQuyen_id != 1);

            // Số nhân viên đang hoạt động
            ViewBag.NhanVienHoatDong = db.NhanViens.Count(nv => nv.MaQuyen_id != 1 && nv.TrangThai != 4);

            // Số nhân viên bị khóa
            ViewBag.NhanVienBiKhoa = db.NhanViens.Count(nv => nv.MaQuyen_id != 1 && nv.TrangThai == 4);

            // Phân loại nhân viên
            ViewBag.SoPhucVu = db.NhanViens.Count(nv => nv.MaQuyen_id == 1);
            ViewBag.SoKho = db.NhanViens.Count(nv => nv.MaQuyen_id == 2);
            ViewBag.SoBep = db.NhanViens.Count(nv => nv.MaQuyen_id == 4);

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
    }
}

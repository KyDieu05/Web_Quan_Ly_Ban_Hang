using QuanLyNhaHang.Models;
using System;
using System.Linq;
using System.Web.Mvc;
using QuanLyNhaHang.Areas.Admin.ViewModels;

namespace QuanLyNhaHang.Areas.Admin.Controllers
{
    public class ThongKeController : Controller
    {
        DatabaseQuanLyNhaHang db = new DatabaseQuanLyNhaHang();

        public ActionResult DoanhThuTheoThang()
        {
            var danhSach = db.HoaDons
                .Where(hd => hd.TrangThai == 0 && hd.NgayTao != null)
                .AsEnumerable() // chuyển sang LINQ to Object để dùng DateTime
                .GroupBy(hd => new { hd.NgayTao.Value.Year, hd.NgayTao.Value.Month })
                .OrderByDescending(g => g.Key.Year).ThenByDescending(g => g.Key.Month)
                .Take(5)
                .Select(g => new ThongKeDoanhThuViewModel
                {
                    ThangNam = $"{g.Key.Month:D2}/{g.Key.Year}",
                    TongDoanhThu = (decimal)g.Sum(hd => hd.TongTien)
                })
                .OrderBy(x => DateTime.Parse("01/" + x.ThangNam)) // sắp tăng dần theo tháng
                .ToList();

            return View(danhSach);
        }
    }
}

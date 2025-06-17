using System;
using System.Collections.Generic;

namespace QuanLyNhaHang.Models.ViewModels
{
    public class PhieuXuatViewModel
    {
        public int MaXuatKho { get; set; }
        public DateTime NgayNhap { get; set; }
        public string NgayXuat { get; set; }
        public decimal TongTien { get; set; }
        public List<ChiTietPhieuXuatViewModel> ChiTietPhieuXuat { get; set; }

        public PhieuXuatViewModel()
        {
            ChiTietPhieuXuat = new List<ChiTietPhieuXuatViewModel>();
        }
    }

    public class ChiTietPhieuXuatViewModel
    {
        public int MaXuatKho_id { get; set; }
        public string MaNguyenLieu_id { get; set; }
        public int SoLuongXuat { get; set; }
        public decimal DonGia { get; set; }
        public decimal ThanhTien
        {
            get { return SoLuongXuat * DonGia; }
        }
    }
}

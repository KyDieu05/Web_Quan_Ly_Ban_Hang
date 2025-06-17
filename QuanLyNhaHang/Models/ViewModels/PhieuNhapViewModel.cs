using System;
using System.Collections.Generic;

namespace QuanLyNhaHang.Models.ViewModels
{
    public class PhieuNhapViewModel
    {
        public int PhieuNhapId { get; set; }
        public DateTime NgayNhap { get; set; }
        public string NhaCungCap { get; set; }
        public string NhanVien { get; set; }
        public decimal TongTien { get; set; }
        public List<ChiTietPhieuNhapViewModel> ChiTietPhieuNhap { get; set; }

        public PhieuNhapViewModel()
        {
            ChiTietPhieuNhap = new List<ChiTietPhieuNhapViewModel>();
        }
    }

    public class ChiTietPhieuNhapViewModel
    {
        public int SanPhamId { get; set; }
        public string TenSanPham { get; set; }
        public int SoLuong { get; set; }
        public decimal DonGia { get; set; }
        public decimal ThanhTien
        {
            get { return SoLuong * DonGia; }
        }
    }
}

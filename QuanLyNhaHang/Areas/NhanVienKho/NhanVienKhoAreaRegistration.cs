using System.Web.Mvc;

namespace QuanLyNhaHang.Areas.NhanVienKho
{
    public class NhanVienKhoAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get { return "NhanVienKho"; }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "NhanVienKho_default",
                "NhanVienKho/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "QuanLyNhaHang.Areas.NhanVienKho.Controllers" }
            );
        }
    }
}

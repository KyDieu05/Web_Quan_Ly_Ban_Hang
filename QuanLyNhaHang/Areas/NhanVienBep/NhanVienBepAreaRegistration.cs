using System.Web.Mvc;

namespace QuanLyNhaHang.Areas.NhanVienKho
{
    public class NhanVienBepAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get { return "NhanVienBep"; }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "NhanVienBep_default",
                "NhanVienBep/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "QuanLyNhaHang.Areas.NhanVienBep.Controllers" }
            );
        }
    }
}

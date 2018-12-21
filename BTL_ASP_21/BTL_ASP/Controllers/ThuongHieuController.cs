using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_ASP.Models;

namespace BTL_ASP.Controllers
{
    public class ThuongHieuController : Controller
    {
        DB_TikiNowEntities db = new DB_TikiNowEntities();
        // GET: ThuongHieu
        public PartialViewResult ThuongHieuPartial()
        {
            
            return PartialView(db.ThuongHieux.ToList());
        }
        public ViewResult HangByThuongHieu(string thuongHieuID)
        {
            ThuongHieu thuongHieu = db.ThuongHieux.SingleOrDefault(n => n.ThuongHieuID==thuongHieuID);
            if (thuongHieu == null)
            {
                //trang baos looix
                Response.StatusCode = 404;
                return null;
            }
            List<Hang> lstHang = db.Hangs.Where(n => n.ThuongHieuID==thuongHieuID).OrderBy(n => n.DonGia).ToList();
            if (lstHang.Count == 0)
            {
                ViewBag.Hang = "Khong co hang nao cua thuong hieu nay";
            }
            return View(lstHang);
        }
    }
}
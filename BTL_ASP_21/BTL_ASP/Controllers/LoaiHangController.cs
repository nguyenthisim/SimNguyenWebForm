using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_ASP.Models;
namespace BTL_ASP.Controllers
{
    public class LoaiHangController : Controller
    {
        DB_TikiNowEntities db = new DB_TikiNowEntities();
       
        // GET: HangMoi
        public PartialViewResult LoaiHangPartial()
        {

            return PartialView(db.LoaiHangs.ToList());
        }
        public PartialViewResult LoaiHangMenuPartial()
        {
            return PartialView(db.LoaiHangs.ToList());
        }
        public PartialViewResult LoaiHangLocPartial()
        {
            return PartialView(db.LoaiHangs.ToList());
        }
        public ViewResult DanhMucLoaiHang()
        {
            return View(db.LoaiHangs.Take(5).ToList());
        }
        public ViewResult HangByLoaiHang(string LoaiHangID)
        {
            LoaiHang loaiHang = db.LoaiHangs.SingleOrDefault(n => n.LoaiHangID == LoaiHangID);
            if (loaiHang == null)
            {
                //trang baos looix
                Response.StatusCode = 404;
                return null;
            }
            List<Hang> lstHang = db.Hangs.Where(n => n.LoaiHangID == LoaiHangID).OrderBy(n => n.DonGia).ToList();
            if (lstHang.Count == 0)
            {
                ViewBag.Hang = "Khong co hang nao trong loai nay";
            }
            return View(lstHang);
        }
        public ViewResult HangByLoaiHangLoc(string LoaiHangID)
        {
            LoaiHang loaiHang = db.LoaiHangs.SingleOrDefault(n => n.LoaiHangID == LoaiHangID);
            if (loaiHang == null)
            {
                //trang baos looix
                Response.StatusCode = 404;
                return null;
            }
            List<Hang> lstHang = db.Hangs.Where(n => n.LoaiHangID == LoaiHangID).OrderBy(n => n.DonGia).ToList();
            if (lstHang.Count == 0)
            {
                ViewBag.Hang = "Khong co hang nao trong loai nay";
            }
            return View(lstHang);
        }
    }
}
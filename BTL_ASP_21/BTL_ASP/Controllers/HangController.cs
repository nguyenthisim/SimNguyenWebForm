using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_ASP.Models;
using PagedList;
using PagedList.Mvc;

namespace BTL_ASP.Controllers
{
    public class HangController : Controller
    {
       
        DB_TikiNowEntities db = new DB_TikiNowEntities();

        // GET: HangMoi
        public PartialViewResult HangMoiPartial()
        {
            var lstSanPhamMoi = db.Hangs.Take(3).OrderByDescending(n => n.CreatedDate).ToList();
            return PartialView(lstSanPhamMoi);
        }
        public PartialViewResult HangMoiIndexPartial()
        {
            var lstSanPhamMoi = db.Hangs.Take(3).OrderByDescending(n => n.CreatedDate).ToList();
            return PartialView(lstSanPhamMoi);
        }
        public ViewResult XemChiTiet(string HangID)
        {
            Hang hang = db.Hangs.SingleOrDefault(n=>n.HangID==HangID);
            if (hang == null)
            {
                //trang baos looix
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.LoaiHangName = db.LoaiHangs.Single(n => n.LoaiHangID == hang.LoaiHangID).LoaiHangName;

            return View(hang);
        }
        public ActionResult HangSale(int? page)
        {
            //tao bien so sp tren trang
            int pageSize = 9;
            //bien so trang
            int pageNumber = (page ?? 1);
            return View(db.Hangs.Take(15).ToList().OrderBy(n => n.CreatedDate).ToPagedList(pageNumber, pageSize));
        }
    }
}
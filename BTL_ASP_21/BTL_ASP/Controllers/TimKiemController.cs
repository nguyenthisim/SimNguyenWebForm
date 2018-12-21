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
    public class TimKiemController : Controller
    {
        DB_TikiNowEntities db = new DB_TikiNowEntities();
        // GET: TimKiem
        [HttpPost]
        public ActionResult KetQuaTimKiem(FormCollection f,int? page)
        {

            string tuKhoa = f["txtTimKiem"].ToString();
            if (tuKhoa == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.TuKhoa = tuKhoa;
                List<Hang> lstKQTK = db.Hangs.Where(n => n.HangName.Contains(tuKhoa)).ToList();
                //phan trang
                int pageNumber = (page ?? 1);
                int pageSize = 9;
                if (lstKQTK.Count == 0)
                {
                    ViewBag.ThongBao = "Không tìm thấy kết quả nào.";
                    return View(db.Hangs.OrderBy(n => n.HangName).ToPagedList(pageNumber, pageSize));
                }

                ViewBag.ThongBao = "Đã tìm thấy " + lstKQTK.Count() + " sản phẩm liên quan.";
                return View(lstKQTK.OrderBy(n => n.HangName).ToPagedList(pageNumber, pageSize));
            }
           
        }
        [HttpGet]
        public ActionResult KetQuaTimKiem(int? page,string tuKhoa)
        {
            ViewBag.TuKhoa = tuKhoa;
            List<Hang> lstKQTK = db.Hangs.Where(n => n.HangName.Contains(tuKhoa)).ToList();
            //phan trang
            int pageNumber = (page ?? 1);
            int pageSize = 9;
            if (lstKQTK.Count == 0)
            {
                ViewBag.ThongBao = "Không tìm thấy kết quả nào.";
                return View(db.Hangs.OrderBy(n => n.HangName).ToPagedList(pageNumber, pageSize));
            }

            ViewBag.ThongBao = "Đã tìm thấy " + lstKQTK.Count() + " sản phẩm liên quan.";
            return View(lstKQTK.OrderBy(n => n.HangName).ToPagedList(pageNumber, pageSize));
        }
        /////
        [HttpPost]
        public ActionResult KetQuaPrice(FormCollection f, int? page)
        {

            try
            {
                decimal pMin = decimal.Parse(f["txtMin"].ToString());
                decimal pMax = decimal.Parse(f["txtMax"].ToString());
                ViewBag.PMin = pMin;
                ViewBag.PMax = pMax;

                List<Hang> lstKQTK = db.Hangs.Where(n => n.DonGia >= pMin && n.DonGia <= pMax).ToList();
                //phan trang
                int pageNumber = (page ?? 1);
                int pageSize = 9;
                if (lstKQTK.Count == 0)
                {
                    ViewBag.ThongBao = "Không tìm thấy kết quả nào.";
                    return View(db.Hangs.OrderBy(n => n.DonGia).ToPagedList(pageNumber, pageSize));
                }

                ViewBag.ThongBao = "Đã tìm thấy " + lstKQTK.Count() + " sản phẩm liên quan.";
                return View(lstKQTK.OrderBy(n => n.DonGia).ToPagedList(pageNumber, pageSize));
            }
            catch (Exception)
            {

                return RedirectToAction("Index", "Home");
            }

                
            
        }
        [HttpGet]
        public ActionResult KetQuaPrice(int? page, decimal pMin,decimal pMax)
        {
            ViewBag.PMin = pMin;
            ViewBag.PMax = pMax;
            List<Hang> lstKQTK = db.Hangs.Where(n => n.DonGia >= pMin && n.DonGia <= pMax).ToList();
            //phan trang
            int pageNumber = (page ?? 1);
            int pageSize = 9;
            if (lstKQTK.Count == 0)
            {
                ViewBag.ThongBao = "Không tìm thấy kết quả nào.";
                return View(db.Hangs.OrderBy(n => n.DonGia).ToPagedList(pageNumber, pageSize));
            }

            ViewBag.ThongBao = "Đã tìm thấy " + lstKQTK.Count() + " sản phẩm liên quan.";
            return View(lstKQTK.OrderBy(n => n.DonGia).ToPagedList(pageNumber, pageSize));
        }
    }
}
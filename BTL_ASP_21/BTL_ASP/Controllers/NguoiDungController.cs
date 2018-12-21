using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_ASP.Models;

namespace BTL_ASP.Controllers
{
    public class NguoiDungController : Controller
    {
        DB_TikiNowEntities db = new DB_TikiNowEntities();
        // GET: NguoiDung
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
       // [ValidateInput(false)]
        public ActionResult DangKy(KhachHang khachhang)
        {
            if (ModelState.IsValid)
            {
                db.KhachHangs.Add(khachhang);
                db.SaveChanges();
            }
           
            return View();
        }
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection f)
        {
            string hoTen = f["txtHoTen"].ToString();
            string matKhau = f["txtMatKhau"].ToString();
            KhachHang khachhang = db.KhachHangs.SingleOrDefault(n => n.KhachHangName == hoTen && n.MatKhau == matKhau);
            if (khachhang != null)
            {
                ViewBag.ThongBao = "Chuc mung dn thanh cong";
                Session["TaiKhoan"] = khachhang;
                Session["UserName"] = khachhang.KhachHangName.ToString();
              
                return RedirectToAction("Index", "Home");
            }
            ViewBag.ThongBao = "Ten tk hoac mk khong dung";
            return View();
        }
    }
}
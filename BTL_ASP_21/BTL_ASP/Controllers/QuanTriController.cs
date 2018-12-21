using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_ASP.Models;

namespace BTL_ASP.Controllers
{
    public class QuanTriController : Controller
    {
        DB_TikiNowEntities db = new DB_TikiNowEntities();
        // GET: QuanTri
        public ActionResult Index()
        {
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
            string hoTen = f["username"].ToString();
            string matKhau = f["password"].ToString();
            QTAdmin qt = db.QTAdmins.SingleOrDefault(n => n.AdminName == hoTen && n.Password == matKhau);
            if (qt != null)
            {
               
                Session["AdminName"] = qt.AdminName.ToString();
                Session["TaiKhoan"] = qt;
                return RedirectToAction("IndexStart", "QuanLySanPham");
            }
            ViewBag.ThongBao = "Tên hoặc mật khẩu không đúng!";
            return View();
        }
    }
}
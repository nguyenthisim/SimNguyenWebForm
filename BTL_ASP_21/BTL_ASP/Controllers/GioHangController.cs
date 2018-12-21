using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_ASP.Models;

namespace BTL_ASP.Controllers
{
    public class GioHangController : Controller
    {
        DB_TikiNowEntities db = new DB_TikiNowEntities();
        // GET: GioHang
        public List<GioHang> LayGioHang()
        {
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang == null)
            {
                lstGioHang = new List<GioHang>();
                Session["GioHang"] = lstGioHang;
            }
            return lstGioHang;
        }
        //them 
        public ActionResult ThemGioHang(string hangID,string strUrl)
        {
            Hang hang = db.Hangs.SingleOrDefault(n => n.HangID == hangID);
            if (hang == null)
            {
                //trang baos looix
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> lstGioHang = LayGioHang();
            GioHang sanpham = lstGioHang.Find(n => n.HangID == hangID);
            if (sanpham == null)
            {
                sanpham = new GioHang(hangID);
                //them moi them
                lstGioHang.Add(sanpham);
                return Redirect(strUrl);
            }
            else
            {
                sanpham.SoLuong++;
                return Redirect(strUrl);
            }
        }
        public  ActionResult ThemInGioHang(string hangID)
        {
            Hang hang = db.Hangs.SingleOrDefault(n => n.HangID == hangID);
            if (hang == null)
            {
                //trang baos looix
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> lstGioHang = LayGioHang();
            GioHang sanpham = lstGioHang.Find(n => n.HangID == hangID);
            if (sanpham == null)
            {
                sanpham = new GioHang(hangID);
                //them moi them
                lstGioHang.Add(sanpham);
                return RedirectToAction("GioHang", "GioHang");
            }
            else
            {
                sanpham.SoLuong++;
                return RedirectToAction("GioHang", "GioHang");
            }
        }
        //cap nhat
        public ActionResult CapNhatGioHang(string hangID,FormCollection f)
        {
            Hang hang = db.Hangs.SingleOrDefault(n => n.HangID == hangID);
            if (hang == null)
            {
                //trang baos looix
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> lstGioHang = LayGioHang();
            GioHang sanpham = lstGioHang.Find(n => n.HangID == hangID);
            if (sanpham != null)
            {
                sanpham.SoLuong = int.Parse(f["txtSoLuong"].ToString());

            }
            return RedirectToAction("GioHang");
        }
        //xoa
        public ActionResult XoaGioHang(string hangID)
        {
            Hang hang = db.Hangs.SingleOrDefault(n => n.HangID == hangID);
            if (hang == null)
            {
                //trang baos looix
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> lstGioHang = LayGioHang();
            GioHang sanpham = lstGioHang.Find(n => n.HangID == hangID);
            if (sanpham != null)
            {
                lstGioHang.RemoveAll(n => n.HangID == hangID);
            }
            if (lstGioHang.Count == 0)
            {
                return RedirectToAction("Index","Home");
            }
            return RedirectToAction("GioHang");

        }
        //xay dung trang gio hang
        public ActionResult GioHang()
        {
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            List<GioHang> lstGioHang = LayGioHang();
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return View(lstGioHang);
        }
        //tong so luong , tong tien
        private int TongSoLuong()
        {
            int tongSoLuong = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang != null)
            {
                tongSoLuong = lstGioHang.Sum(n => n.SoLuong);
            }
            return tongSoLuong;
        }
        private decimal TongTien()
        {
            decimal tongTien = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang != null)
            {
                tongTien = lstGioHang.Sum(n => n.ThanhTien);
            }
            return tongTien;
        }
        public ActionResult GioHangPartial()
        {
            if (TongSoLuong() == 0)
            {
                return PartialView();
            }
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return PartialView();
        }
        public ActionResult SuaGioHang()
        {
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("TrangChu", "Home");
            }
            List<GioHang> lstGioHang = LayGioHang();

            return View(lstGioHang);
        }
    }
}
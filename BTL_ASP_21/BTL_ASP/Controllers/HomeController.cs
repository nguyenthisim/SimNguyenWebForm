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
    public class HomeController : Controller
    {
        // GET: Home
        DB_TikiNowEntities db = new DB_TikiNowEntities();

        public ActionResult Index(int? page)
        {
            //tao bien so sp tren trang
            int pageSize = 9;
            //bien so trang
            int pageNumber = (page ?? 1);
            return View(db.Hangs.ToList().OrderBy(n=>n.DonGia).ToPagedList(pageNumber,pageSize));
        }
        
    }
}
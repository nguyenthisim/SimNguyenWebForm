using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_ASP.Models;
using System.IO;
using PagedList;
using PagedList.Mvc;
using System.Linq.Expressions;
using System.Linq.Dynamic;
using System.Reflection;

namespace BTL_ASP.Controllers
{
    public class QuanLySanPhamController : Controller
    {
        DB_TikiNowEntities db = new DB_TikiNowEntities();
        // GET: QuanLySanPham
        public ActionResult IndexStart()
        {
            if (Session["TaiKhoan"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("DangNhap", "QuanTri");
            }
        }
        public ActionResult Index(int? size, int? page, string sortOrder)
        {
            if (Session["TaiKhoan"] != null)
            {
                ViewBag.LoaiHangID = new SelectList(db.LoaiHangs.ToList(), "LoaiHangID", "LoaiHangName");
                
                ViewBag.page = page;
              ViewBag.SoLuongSortParm = String.IsNullOrEmpty(sortOrder) ? "soluong_desc" : "";
                var hangs = from h in db.Hangs
                            select h;
             
                // 3. Thứ tự sắp xếp theo thuộc tính LinkName
                switch (sortOrder)
                {
                    // 3.1 Nếu biến sortOrder sắp giảm thì sắp giảm theo LinkName
                    case "soluong_desc":
                        hangs = hangs.OrderByDescending(s => s.SoLuong);
                        break;

                    // 3.2 Mặc định thì sẽ sắp tăng
                    case "":
                        hangs = hangs.OrderBy(s => s.SoLuong);
                        break;
                    default:
                        hangs = hangs.OrderBy(s => s.HangID);
                        break;
                }

                List<SelectListItem> items = new List<SelectListItem>();
                items.Add(new SelectListItem { Text = "5", Value = "5" });
                items.Add(new SelectListItem { Text = "10", Value = "10" });
                items.Add(new SelectListItem { Text = "20", Value = "20" });
                items.Add(new SelectListItem { Text = "25", Value = "25" });
                items.Add(new SelectListItem { Text = "50", Value = "50" });
                items.Add(new SelectListItem { Text = "100", Value = "100" });
                items.Add(new SelectListItem { Text = "200", Value = "200" });

                // 1.1. Giữ trạng thái kích thước trang được chọn trên DropDownList
                foreach (var item in items)
                {
                    if (item.Value == size.ToString()) item.Selected = true;
                }
                // 1.2. Tạo các biến ViewBag
                ViewBag.size = items; // ViewBag DropDownList
                ViewBag.currentSize = size; // tạo biến kích thước trang hiện tại
              
                    //phan trang
                    int pageNumber = (page ?? 1);
                int pageSize = (size ?? 5);
                return View(hangs.ToPagedList(pageNumber, pageSize));

            }
            else
            {
                return RedirectToAction("DangNhap", "QuanTri");
            }
        }
        #region IndexPage
        //public ActionResult Index(int ? size,int? page)
        //{
        //    if (Session["TaiKhoan"] != null)
        //    {
        //        List<SelectListItem> items = new List<SelectListItem>();
        //        items.Add(new SelectListItem { Text = "5", Value = "5" });
        //        items.Add(new SelectListItem { Text = "10", Value = "10" });
        //        items.Add(new SelectListItem { Text = "20", Value = "20" });
        //        items.Add(new SelectListItem { Text = "25", Value = "25" });
        //        items.Add(new SelectListItem { Text = "50", Value = "50" });
        //        items.Add(new SelectListItem { Text = "100", Value = "100" });
        //        items.Add(new SelectListItem { Text = "200", Value = "200" });

        //        // 1.1. Giữ trạng thái kích thước trang được chọn trên DropDownList
        //        foreach (var item in items)
        //        {
        //            if (item.Value == size.ToString()) item.Selected = true;
        //        }
        //        // 1.2. Tạo các biến ViewBag
        //        ViewBag.size = items; // ViewBag DropDownList
        //        ViewBag.currentSize = size; // tạo biến kích thước trang hiện tại

        //        //phan trang
        //        int pageNumber = (page ?? 1);
        //        int pageSize = (size ?? 5);
        //        return View(db.Hangs.OrderBy(n => n.HangName).ToPagedList(pageNumber, pageSize));

        //    }
        //    else
        //    {
        //        return RedirectToAction("DangNhap", "QuanTri");
        //    }
        //}
        #endregion
        #region index
        //public ActionResult Index(int? page)
        //{
        //    if (Session["TaiKhoan"] != null)
        //    {
        //        //phan trang
        //        int pageNumber = (page ?? 1);
        //        int pageSize = 5;
        //        return View(db.Hangs.OrderBy(n => n.HangName).ToPagedList(pageNumber, pageSize));

        //    }
        //    else
        //    {
        //        return RedirectToAction("DangNhap", "QuanTri");
        //    }
        //}
        #endregion
        #region filterMySim
        //public class HttpParamActionAttribute : ActionNameSelectorAttribute
        //{
        //    public override bool IsValidName(ControllerContext controllerContext, string actionName, MethodInfo methodInfo)
        //    {
        //        if (actionName.Equals(methodInfo.Name, StringComparison.InvariantCultureIgnoreCase))
        //            return true;

        //        var request = controllerContext.RequestContext.HttpContext.Request;
        //        return request[methodInfo.Name] != null;
        //    }
        //}
        //[HttpGet]
        //// GET: /Link/
        //public ActionResult Index(int? size, int? page, string sortProperty, string sortOrder)
        //{
        //    // 1. Tạo biến ViewBag gồm sortOrder, searchValue, sortProperty và page
        //    if (sortOrder == "asc") ViewBag.sortOrder = "desc";
        //    if (sortOrder == "desc") ViewBag.sortOrder = "";
        //    if (sortOrder == "") ViewBag.sortOrder = "asc";

        //    ViewBag.sortProperty = sortProperty;
        //    ViewBag.page = page;

        //    // 2. Tạo danh sách chọn số trang
        //    List<SelectListItem> items = new List<SelectListItem>();
        //    items.Add(new SelectListItem { Text = "5", Value = "5" });
        //    items.Add(new SelectListItem { Text = "10", Value = "10" });
        //    items.Add(new SelectListItem { Text = "20", Value = "20" });
        //    items.Add(new SelectListItem { Text = "25", Value = "25" });
        //    items.Add(new SelectListItem { Text = "50", Value = "50" });
        //    items.Add(new SelectListItem { Text = "100", Value = "100" });
        //    items.Add(new SelectListItem { Text = "200", Value = "200" });

        //    // 2.1. Thiết lập số trang đang chọn vào danh sách List<SelectListItem> items
        //    foreach (var item in items)
        //    {
        //        if (item.Value == size.ToString()) item.Selected = true;
        //    }
        //    ViewBag.size = items;
        //    ViewBag.currentSize = size;

        //    // 3. Lấy tất cả tên thuộc tính của lớp Link (LinkID, LinkName, LinkURL,...)
        //    var properties = typeof(Hang).GetProperties();
        //    List<Tuple<string, bool, int>> list = new List<Tuple<string, bool, int>>();
        //    foreach (var item in properties)
        //    {
        //        int order = 999;
        //        var isVirtual = item.GetAccessors()[0].IsVirtual;
        //        if (item.Name == "HangID") order = 1;
        //        if (item.Name == "HangName") order = 2;
        //        if (item.Name == "SKU") order = 3;
        //        if (item.Name == "HangImage") order = 4;
        //        if (item.Name == "SoLuong") order = 5;
        //        if (item.Name == "DonGia") order = 6;
        //        if (item.Name == "LoaiHangID") order =7;
        //        if (item.Name == "CreatedDate") order = 8;

        //        if (item.Name == "MoTa") continue;
        //        if (item.Name == "ThuongHieuID") continue;// Không hiển thị cột này
        //        if (item.Name == "NhaCungCapID") continue;// Không hiển thị cột này
        //        Tuple<string, bool, int> t = new Tuple<string, bool, int>(item.Name, isVirtual, order);
        //        list.Add(t);
        //    }
        //    list = list.OrderBy(x => x.Item3).ToList();

        //    // 3.1. Tạo Heading sắp xếp cho các cột
        //    foreach (var item in list)
        //    {
        //        if (!item.Item2)
        //        {
        //            if (sortOrder == "desc" && sortProperty == item.Item1)
        //            {
        //                ViewBag.Headings += "<th><a href='?page=" + page + "&size=" + ViewBag.currentSize + "&sortProperty=" + item.Item1 + "&sortOrder=" +
        //                    ViewBag.sortOrder  + "'>" + item.Item1 + "<i class='fa fa-fw fa-sort-desc'></i></th></a></th>";
        //            }
        //            else if (sortOrder == "asc" && sortProperty == item.Item1)
        //            {
        //                ViewBag.Headings += "<th><a href='?page=" + page + "&size=" + ViewBag.currentSize + "&sortProperty=" + item.Item1 + "&sortOrder=" +
        //                    ViewBag.sortOrder +  "'>" + item.Item1 + "<i class='fa fa-fw fa-sort-asc'></a></th>";
        //            }
        //            else
        //            {
        //                ViewBag.Headings += "<th><a href='?page=" + page + "&size=" + ViewBag.currentSize + "&sortProperty=" + item.Item1 + "&sortOrder=" +
        //                   ViewBag.sortOrder +  "'>" + item.Item1 + "<i class='fa fa-fw fa-sort'></a></th>";
        //            }

        //        }
        //        else ViewBag.Headings += "<th>" + "" + "</th>";
        //    }

        //    // 4. Truy vấn lấy tất cả đường dẫn
        //    var links = from l in db.Hangs
        //                select l;

        //    // 5. Tạo thuộc tính sắp xếp mặc định là "LinkID"
        //    if (String.IsNullOrEmpty(sortProperty)) sortProperty = "HangID";

        //    // 5. Sắp xếp tăng/giảm bằng phương thức OrderBy sử dụng trong thư viện Dynamic LINQ
        //    if (sortOrder == "desc") links = links.OrderBy(sortProperty + " desc");
        //    else if (sortOrder == "asc") links = links.OrderBy(sortProperty);
        //    else links = links.OrderBy("HangID");

        //    // 5.1. Thêm phần tìm kiếm


        //    // 5.2. Nếu page = null thì đặt lại là 1.
        //    page = page ?? 1; //if (page == null) page = 1;

        //    // 5.3. Tạo kích thước trang (pageSize), mặc định là 5.
        //    int pageSize = (size ?? 5);

        //    ViewBag.pageSize = pageSize;

        //    // 6. Toán tử ?? trong C# mô tả nếu page khác null thì lấy giá trị page, còn
        //    // nếu page = null thì lấy giá trị 1 cho biến pageNumber. --- dammio.com
        //    int pageNumber = (page ?? 1);

        //    // 6.2 Lấy tổng số record chia cho kích thước để biết bao nhiêu trang
        //    int checkTotal = (int)(links.ToList().Count / pageSize) + 1;
        //    // Nếu trang vượt qua tổng số trang thì thiết lập là 1 hoặc tổng số trang
        //    if (pageNumber > checkTotal) pageNumber = checkTotal;

        //    // 7. Trả về các Link được phân trang theo kích thước và số trang.
        //    return View(links.ToPagedList(pageNumber, pageSize));
        //}

        //[HttpPost, HttpParamAction]
        //public ActionResult Reset()
        //{
        //    ViewBag.searchValue = "";
        //    Index(null, null, "", "");
        //    return View();
        //}
        ////them
        //[HttpGet]
        //public ActionResult Create()
        //{
        //    ViewBag.LoaiHangID = new SelectList(db.LoaiHangs.ToList(),"LoaiHangID","LoaiHangName");
        //    ViewBag.ThuongHieuID = new SelectList(db.ThuongHieux.ToList(),"ThuongHieuID","ThuongHieuName");
        //    ViewBag.NhaCungCapID = new SelectList(db.NhaCungCaps.ToList(),"NhaCungCapID","NhaCungCapName");
        //    return View();
        //}
        //[HttpPost]
        //[ValidateInput(false)]
        //public ActionResult Create(Hang hang, HttpPostedFileBase fileUpload)
        //{

        //    ViewBag.LoaiHangID = new SelectList(db.LoaiHangs.ToList(), "LoaiHangID", "LoaiHangName");
        //    ViewBag.ThuongHieuID = new SelectList(db.ThuongHieux.ToList(), "ThuongHieuID", "ThuongHieuName");
        //    ViewBag.NhaCungCapID = new SelectList(db.NhaCungCaps.ToList(), "NhaCungCapID", "NhaCungCapName");
        //    if (fileUpload == null)
        //    {
        //        ViewBag.ThongBao = "chua nhap hinh anh";
        //        return View();
        //    }
        //    //them vao csdl
        //    if (ModelState.IsValid)
        //    {
        //        //luu duong dan cua file
        //        var fileName = Path.GetFileName(fileUpload.FileName);
        //        var path = Path.Combine(Server.MapPath("~/images/products/"), fileName);
        //        //kiem tra ton tai
        //        if (System.IO.File.Exists(path))
        //        {
        //            ViewBag.ThongBao = "Hinh da ton tai";
        //        }
        //        else
        //        {
        //            fileUpload.SaveAs(path);
        //        }
        //        hang.HangImage = "~/images/products/" + fileUpload.FileName;
        //        db.Hangs.Add(hang);
        //        db.SaveChanges();
        //    }
        //    return View();
        //}
        #endregion
        [HttpGet]
        public ActionResult CreateHang()
        {
            ViewBag.LoaiHangID = new SelectList(db.LoaiHangs.ToList(), "LoaiHangID", "LoaiHangName");
            ViewBag.ThuongHieuID = new SelectList(db.ThuongHieux.ToList(), "ThuongHieuID", "ThuongHieuName");
            ViewBag.NhaCungCapID = new SelectList(db.NhaCungCaps.ToList(), "NhaCungCapID", "NhaCungCapName");
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreateHang(Hang hang, HttpPostedFileBase fileUpload)
        {
           
            ViewBag.LoaiHangID = new SelectList(db.LoaiHangs.ToList(), "LoaiHangID", "LoaiHangName");
            ViewBag.ThuongHieuID = new SelectList(db.ThuongHieux.ToList(), "ThuongHieuID", "ThuongHieuName");
            ViewBag.NhaCungCapID = new SelectList(db.NhaCungCaps.ToList(), "NhaCungCapID", "NhaCungCapName");
            //i
            if (fileUpload == null)
            {
                ViewBag.ThongBao = "chua nhap hinh anh";
                return View();
            }
            if (ModelState.IsValid)
            {
                var fileName = Path.GetFileName(fileUpload.FileName);
                var path = Path.Combine(Server.MapPath("~/images/products/"), fileName);
                if (System.IO.File.Exists(path))
                {
                    ViewBag.ThongBao = "Hinh da ton tai";
                }
                else
                {
                    fileUpload.SaveAs(path);
                }
                hang.HangImage= "~/images/products/" + fileUpload.FileName;
                db.Hangs.Add(hang);
                db.SaveChanges();
            }
            return View();
        }
        //sua
        [HttpGet]
        public ActionResult Edit(string HangID)
        {
            //lay doi tuong hang theo ma
            Hang hang = db.Hangs.SingleOrDefault(n => n.HangID == HangID);
            if (hang == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.LoaiHangID = new SelectList(db.LoaiHangs.ToList(), "LoaiHangID", "LoaiHangName",hang.LoaiHangID);
            ViewBag.ThuongHieuID = new SelectList(db.ThuongHieux.ToList(), "ThuongHieuID", "ThuongHieuName",hang.ThuongHieuID);
            ViewBag.NhaCungCapID = new SelectList(db.NhaCungCaps.ToList(), "NhaCungCapID", "NhaCungCapName",hang.NhaCungCapID);
            return View(hang);
        }
    
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Hang hang)
        {
           
            if (ModelState.IsValid)
            {
                //thuc hien 
                db.Entry(hang).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
            ViewBag.LoaiHangID = new SelectList(db.LoaiHangs.ToList(), "LoaiHangID", "LoaiHangName");
            ViewBag.ThuongHieuID = new SelectList(db.ThuongHieux.ToList(), "ThuongHieuID", "ThuongHieuName");
            ViewBag.NhaCungCapID = new SelectList(db.NhaCungCaps.ToList(), "NhaCungCapID", "NhaCungCapName");
          
            return RedirectToAction("Index");
        }
        public ActionResult Details(string HangID)
        {
            //lay doi tuong hang theo ma
            Hang hang = db.Hangs.SingleOrDefault(n => n.HangID == HangID);
            if (hang == null)
            {
                Response.StatusCode = 404;
                return null;
            }
          
            return View(hang);
        }
        //xoa
       // [HttpPost,ActionName("Delete"]
        public ActionResult Delete(string HangID)
        {
            //lay doi tuong hang theo ma
            Hang hang = db.Hangs.SingleOrDefault(n => n.HangID == HangID);
            if (hang == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.Hangs.Remove(hang);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        ///tim kiem
         // GET: TimKiem
        [HttpPost]
        public ActionResult KetQuaTimKiem(FormCollection f, int? page)
        {

            string tuKhoa = f["txtTimKiem"].ToString();
            if (tuKhoa == null)
            {
                return RedirectToAction("Index", "QuanLySanPham");
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

                ViewBag.ThongBao = "Đã tìm thấy " + lstKQTK.Count() + " sản phẩm liên quan đến "+ViewBag.TuKhoa;
                return View(lstKQTK.OrderBy(n => n.HangName).ToPagedList(pageNumber, pageSize));
            }

        }
        [HttpGet]
        public ActionResult KetQuaTimKiem(int? page, string tuKhoa)
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

            ViewBag.ThongBao = "Đã tìm thấy " + lstKQTK.Count() + " sản phẩm liên quan đến "+ ViewBag.TuKhoa;
            return View(lstKQTK.OrderBy(n => n.HangName).ToPagedList(pageNumber, pageSize));
        }
        /////
    }
}
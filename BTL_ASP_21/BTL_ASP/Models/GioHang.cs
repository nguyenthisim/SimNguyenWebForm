using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BTL_ASP.Models;

namespace BTL_ASP.Models
{
    public class GioHang
    {
        DB_TikiNowEntities db = new DB_TikiNowEntities();
        public string HangID { get; set; }
        public string HangName { get; set; }
        public string HangImange { get; set; }
        public int SoLuong { get; set; }
        public decimal DonGia { get; set; }
        public decimal ThanhTien {
            get { return SoLuong * DonGia; }
        }
        public GioHang()
        {

        }

        public GioHang(string hangID)
        {
            HangID = hangID;
            Hang hang = db.Hangs.Single(n => n.HangID == HangID);
            HangName = hang.HangName;
            HangImange = hang.HangImage;
            SoLuong = 1;
            DonGia = hang.DonGia;

        }
    }
}
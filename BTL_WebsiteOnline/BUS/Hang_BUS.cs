using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;
using System.Data;
using System.Data.SqlClient;

namespace BUS
{
   public class Hang_BUS
    {
        Data da = new Data();
        Hang_DTO hangDTO = new Hang_DTO();
        public DataTable ShowHang()
        {
            string sql = "select HangID, HangName,SKU, HangImage,MoTa,Note,SoLuong,DonGia,ThuongHieuID,NhaCungCapID,LoaiHangName,'~/views/admin/UpdateProduct.aspx' as ChiTiet from Hang inner join LoaiHang on Hang.LoaiHangID=LoaiHang.LoaiHangID";
            DataTable dt = new DataTable();
            dt = da.GetTable(sql);
            return dt;
        }
        public DataTable ShowProduct()
        {
            string sql = "select * from Hang";
            DataTable dt = new DataTable();
            dt = da.GetTable(sql);
            return dt;
        }
        public DataTable ShowHangID(string id)
        {
            string sql = "select HangName,HangImage,Note,MoTa,DonGia,SoLuong,ThuongHieuName,SKU from Hang inner join ThuongHieu on Hang.ThuongHieuID=ThuongHieu.ThuongHieuID where HangID=N'" + id + "'";
            DataTable dt = new DataTable();
            dt = da.GetTable(sql);
            return dt;
        }
        public DataTable ShowHangByLoaiID(string id)
        {
            string sql = "select * from Hang where LoaiHangID=N'" + id + "'";
            DataTable dt = new DataTable();
            dt = da.GetTable(sql);
            return dt;
        }
        public DataTable ShowHangByTHID(string id)
        {
            string sql = "select * from Hang where ThuongHieuID=N'" + id + "'";
            DataTable dt = new DataTable();
            dt = da.GetTable(sql);
            return dt;
        }
        public string ShowTong()
        {
            string sql = "select count(*) from Hang";
            DataTable dt = new DataTable();
            dt = da.GetTable(sql);
            string tong = dt.ToString();
            return tong;
        }
       
        private string RandomString(int size, bool lowerCase)
        {
            StringBuilder builder = new StringBuilder();
            Random random = new Random();
            char ch;
            for (int i = 0; i < size; i++)
            {
                ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
                builder.Append(ch);
            }
            if (lowerCase)
                return builder.ToString().ToLower();
            return builder.ToString();
        }
        private int RandomNumber(int min, int max)
        {
            Random random = new Random();
            return random.Next(min, max);
        }
        public string GetPassword()
        {
            StringBuilder builder = new StringBuilder();
            builder.Append(RandomString(4, true));
            builder.Append(RandomNumber(1000, 9999));
            builder.Append(RandomString(2, false));
            return builder.ToString();
        }
        public void InsertHang(string hangname, string hangImage, string moTa,string note,int soLuong,decimal donGia,string loai,string thuonghieu,string ncc)
        {
            string al = GetPassword();
            //string dateTime = DateTime.Now.ToString("yyyy-MM-ddTHH:mm:sszzz");
            string id = 'H' + al;

            string sku = 'S' + al;
            string sql = "insert into Hang values(N'" + id + "',N'" + hangname + "',N'" + sku + "',N'" +"~/images/products/"+ hangImage + "',N'" + moTa + "',N'" + note + "',N'" + soLuong + "',N'" + donGia + "',N'" + loai + "',N'" + thuonghieu + "',N'" + ncc + "')";
            da.ExcuteNonQuery(sql);
        }
        public void UpdateHang(string hangID,string hangname, string hangImage,string sku, string moTa, string note, int soLuong, decimal donGia, string loai, string thuonghieu, string ncc)
        {
            string sql = "update Hang set HangName=N'" + hangname + "',HangImage=N'" + hangImage + "',SKU=N'" + sku + "',MoTa=N'" + moTa + "',Note=N'" + note + "',SoLuong=N'" + soLuong + "',DonGia=N'" + donGia + "',LoaiHangID=N'" + loai + "',ThuongHieuID=N'" + thuonghieu + "',NhaCungCapID=N'" + ncc + "' where HangID=N'" + hangID + "'";
            da.ExcuteNonQuery(sql);
        }
        public void UpdateHang12(string hangID, string hangname,string moTa, int soLuong)
        {
            string sql = "update Hang set HangName=N'" + hangname + "',MoTa=N'" + moTa + "',SoLuong=N'" + soLuong + "' where HangID=N'" + hangID + "'";
            da.ExcuteNonQuery(sql);
        }
        public void DeleteHang(string hangID)
        {
            string sql = "delete Hang where HangID=N'" + hangID + "'";
            da.ExcuteNonQuery(sql);
        }
        public void ShowHangID1(string id)
        {
            string sql = "select * Hang where HangID=N'" + id + "'";
            da.ExcuteNonQuery(sql);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using DTO;
using BUS;

namespace GUI.views.admin
{
    public partial class InsertHang : System.Web.UI.Page
    {
        Hang_DTO hangDTO = new Hang_DTO();
        Hang_BUS hangBUS = new Hang_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void SaveFileUpload()
        {
            string strFilePath;
            if (FileUploadAnh.FileName != "")
            {
                strFilePath = Server.MapPath("../../images/products/" + FileUploadAnh.FileName);
                FileUploadAnh.PostedFile.SaveAs(strFilePath);
            }
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            hangDTO.HangName = txtTen.Text;
            hangDTO.HangImage = FileUploadAnh.FileName;
            hangDTO.MoTa = txtmota.Text;
            hangDTO.Note = txtnote.Text;
            hangDTO.SoLuong = int.Parse(txtsoluong.Text);
            hangDTO.DonGia = decimal.Parse(txtgia.Text);
            hangDTO.LoaiHangID = dlsLoai.SelectedValue;
            hangDTO.ThuongHieuID = dlsthuonghieu.SelectedValue;
            hangDTO.NhaCungCapID = dlsNhacungcap.SelectedValue;
            hangBUS.InsertHang(hangDTO.HangName, hangDTO.HangImage, hangDTO.MoTa, hangDTO.Note, hangDTO.SoLuong, hangDTO.DonGia, hangDTO.LoaiHangID, hangDTO.ThuongHieuID, hangDTO.NhaCungCapID);
            SaveFileUpload();
            Response.Redirect("~/views/admin/QuanLyHang.aspx");
        }
    }
}
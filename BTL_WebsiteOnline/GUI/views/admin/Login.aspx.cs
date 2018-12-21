using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using DTO;
using BUS;
using GUI.Code;

namespace GUI.views.admin
{
    public partial class Login : System.Web.UI.Page
    {
        Admin_DTO adDTO = new Admin_DTO();
        Admin_BUS adBUS = new Admin_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(txtPassword.Text.Trim())|| string.IsNullOrEmpty(txtUserName.Text.Trim()))
            {
                lblMsgError.Text = "Vui lòng kiểm tra tên đăng nhập và mật khẩu.";
                return;
            }
            //xuống csdl lấy người dùng

            string adminname = txtUserName.Text.Trim();
            string password = txtPassword.Text.Trim();
           bool checkAdmin= adBUS.CheckAdmin(adminname,password);
            //adBUS.CheckAdmin(txtUserName.Text.Trim(), txtPassword.Text.Trim());
       
            if (checkAdmin)
            {
                var adminSession = new Admin_DTO();
                adminSession.AdminName = adDTO.AdminName;
                adminSession.Password = adDTO.Password;

                Session.Add(SesionExt.ADMIN_SESSION,adminSession);
                Response.Redirect("Quantri.aspx");
            }
            else
            {
                lblMsgError.Text = "Thông tin đăng nhập không hợp lệ!";
            }
        }
    }
}
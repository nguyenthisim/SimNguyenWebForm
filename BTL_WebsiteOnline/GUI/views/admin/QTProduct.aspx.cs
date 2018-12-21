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
    public partial class QTProduct : System.Web.UI.Page
    {
        Hang_DTO hangDTO = new Hang_DTO();
        Hang_BUS hangBUS = new Hang_BUS();
        public void HienThi()
        {
            GridView1.DataSource = hangBUS.ShowHang();
            GridView1.DataBind();

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            HienThi();
        }

        protected void btnThemsp_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/views/admin/InsertHang.aspx");
        }
    }
}
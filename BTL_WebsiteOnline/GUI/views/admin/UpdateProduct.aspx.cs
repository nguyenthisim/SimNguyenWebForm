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
    public partial class UpdateProduct : System.Web.UI.Page
    {
        Hang_DTO hangDTO = new Hang_DTO();
        Hang_BUS hangBUS = new Hang_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
           //string ma = Request.QueryString["HangID"].ToString();
           // GridView1.DataSource = hangBUS.ShowHangID(ma);
           // GridView1.DataBind();
           
        }

       
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using DTO;
using BUS;

namespace GUI.views.customer
{
    public partial class DetailsProducts : System.Web.UI.Page
    {
        Hang_DTO hangDTO = new Hang_DTO();
        Hang_BUS hangBUS = new Hang_BUS();

        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["HangID"].ToString();
            DataListDetail.DataSource = hangBUS.ShowHangID(id);
            DataListDetail.DataBind();
        }
    }
}
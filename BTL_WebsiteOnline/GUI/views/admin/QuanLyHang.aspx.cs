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
    public partial class QuanLyHang : System.Web.UI.Page
    {
        Hang_DTO hangDTO = new Hang_DTO();
        Hang_BUS hangBUS = new Hang_BUS();
        public void HienThi()
        {
            dtgHang.DataSource = hangBUS.ShowHang();

            dtgHang.DataBind();

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            HienThi();
           
            xoaTextbox();
           
        }

        private void setId()
        {
            for(int i = 0; i < dtgHang.Rows.Count; i++)
            {
                //dtgHang.Rows[i].Cells[8].Text = dtgHang.Rows[i].Cells[1].Text.Trim();
                //dtgHang.Rows[i].Cells[8]
            }
        }

        protected void btnThemsp_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/views/admin/InsertHang.aspx");
        }
       
        protected void dtgHang_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                if (e.NewPageIndex != -1)
                {
                    dtgHang.PageIndex = e.NewPageIndex;
                    // Call the method to assing datasource to grid view again
                    //HienThi();
                }
                else
                {

                }
            }
            catch
            {
            }

        }
        private void xoaTextbox()
        {
            txtSPID.Text = "";
        }
        protected void dtgHang_SelectedIndexChanged(object sender, EventArgs e)
        {
            int dong = dtgHang.SelectedIndex;
            txtSPID.Text = dtgHang.Rows[dong].Cells[1].Text;
            dropLoai.SelectedItem.Text = dtgHang.Rows[dong].Cells[7].Text;

        }

        protected void dtgHang_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
           
        }

        protected void dtgHang_PreRender(object sender, EventArgs e)
        {
            
        }
    }
}
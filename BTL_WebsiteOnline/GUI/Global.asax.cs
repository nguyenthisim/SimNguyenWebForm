using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace GUI
{
    public class Global : System.Web.HttpApplication
    {
        
        protected void Application_Start(object sender, EventArgs e)
        {
            Application.Lock();
            System.IO.StreamReader sr;
            sr = new System.IO.StreamReader(Server.MapPath("SL.txt"));
            string S = sr.ReadLine();
            sr.Close();
            Application.UnLock();
            Application["SLTruyCap"] = "";
        }
        protected void Session_Start(object sender, EventArgs e)
        {

            Application["SLTruyCap"] = Application["SLTruyCap"].ToString() + 1;
            System.IO.StreamWriter sw;
            sw = new System.IO.StreamWriter(Server.MapPath("SL.txt"));
            sw.Write(Application["SLTruyCap"].ToString());
            sw.Close();
        }
    }
}
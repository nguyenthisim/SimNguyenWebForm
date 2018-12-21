using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace BTL_ASP
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            Application.Lock();
            System.IO.StreamReader sr;
            sr = new System.IO.StreamReader(Server.MapPath("\\SL.txt"));
            string S = sr.ReadLine();
            sr.Close();
            Application.UnLock();
            Application["SLTruyCap"] = S;
            Application["Online"] = 0;
        }
        void Session_Start(object sender, EventArgs e)
        {
            Application["Online"] = Convert.ToInt32(Application["Online"]) +1;
            Application["SLTruyCap"] = Convert.ToInt32(Application["SLTruyCap"]) + 1;
            System.IO.StreamWriter sw;
            sw = new System.IO.StreamWriter(Server.MapPath("\\SL.txt"));
            sw.Write(Application["SLTruyCap"].ToString());
            sw.Close();
        }
       void Session_End(object sender, EventArgs e)
        {
            Application["Online"] = Convert.ToInt32(Application["Online"]) - 1;
        }
    }
}

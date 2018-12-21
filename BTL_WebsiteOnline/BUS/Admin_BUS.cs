using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;
using System.Data;
using System.Data.SqlClient;

namespace BUS
{
   public class Admin_BUS
    {
        Data da = new Data();
        Admin_DTO ad = new Admin_DTO();

        public bool CheckAdmin(string name, string mk)
        {
            return da.checkAdmin(name, mk);
        }
    }
}

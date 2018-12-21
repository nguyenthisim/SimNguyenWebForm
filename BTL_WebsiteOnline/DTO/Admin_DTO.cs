using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
   public class Admin_DTO
    {
        private int adminID;
       
        private string adminName;
        private string password;
        private string email;
        public Admin_DTO() { }
        public Admin_DTO(int adminID, string adminName, string password, string email)
        {
            AdminID = adminID;
            AdminName = adminName;
            Password = password;
            Email = email;
        }
       
        public int AdminID
        {
            get
            {
                return adminID;
            }

            set
            {
                adminID = value;
            }
        }
      
        public string AdminName
        {
            get
            {
                return adminName;
            }

            set
            {
                adminName = value;
            }
        }

        public string Password
        {
            get
            {
                return password;
            }

            set
            {
                password = value;
            }
        }

        public string Email
        {
            get
            {
                return email;
            }

            set
            {
                email = value;
            }
        }
        
    }
}

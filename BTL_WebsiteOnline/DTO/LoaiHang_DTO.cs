using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
   public class LoaiHang_DTO
    {
        private string loaiHangID;
        private string loaiHangName;

        public string LoaiHangID
        {
            get
            {
                return loaiHangID;
            }

            set
            {
                loaiHangID = value;
            }
        }

        public string LoaiHangName
        {
            get
            {
                return loaiHangName;
            }

            set
            {
                loaiHangName = value;
            }
        }
    }
}

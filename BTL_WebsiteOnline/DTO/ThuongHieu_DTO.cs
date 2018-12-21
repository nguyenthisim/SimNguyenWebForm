using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
   public class ThuongHieu_DTO
    {
        private string thuongHieuID;
        private string thuongHieuName;

        public string ThuongHieuID
        {
            get
            {
                return thuongHieuID;
            }

            set
            {
                thuongHieuID = value;
            }
        }

        public string ThuongHieuName
        {
            get
            {
                return thuongHieuName;
            }

            set
            {
                thuongHieuName = value;
            }
        }
    }
}

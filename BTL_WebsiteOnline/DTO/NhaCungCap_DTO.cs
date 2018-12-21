using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
   public class NhaCungCap_DTO
    {
        private string nhaCungCapID;
        private string nhaCungCapName;
        private string nhaCungCapDiaChi;

        public string NhaCungCapID
        {
            get
            {
                return nhaCungCapID;
            }

            set
            {
                nhaCungCapID = value;
            }
        }

        public string NhaCungCapName
        {
            get
            {
                return nhaCungCapName;
            }

            set
            {
                nhaCungCapName = value;
            }
        }

        public string NhaCungCapDiaChi
        {
            get
            {
                return nhaCungCapDiaChi;
            }

            set
            {
                nhaCungCapDiaChi = value;
            }
        }
    }
}

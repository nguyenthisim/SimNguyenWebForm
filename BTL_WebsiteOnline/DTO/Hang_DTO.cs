using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
   public class Hang_DTO
    {
        private string hangID;
        private string hangName;
        private string sKU;
        private string hangImage;
        private string moTa;
        private string note;
        private int soLuong;
        private decimal donGia;
        private string loaiHangID;
        private string thuongHieuID;
        private string nhaCungCapID;

        public string HangID
        {
            get
            {
                return hangID;
            }

            set
            {
                hangID = value;
            }
        }

        public string HangName
        {
            get
            {
                return hangName;
            }

            set
            {
                hangName = value;
            }
        }

        public string SKU
        {
            get
            {
                return sKU;
            }

            set
            {
                sKU = value;
            }
        }

        public string HangImage
        {
            get
            {
                return hangImage;
            }

            set
            {
                hangImage = value;
            }
        }

        public string MoTa
        {
            get
            {
                return moTa;
            }

            set
            {
                moTa = value;
            }
        }

        public string Note
        {
            get
            {
                return note;
            }

            set
            {
                note = value;
            }
        }

        public int SoLuong
        {
            get
            {
                return soLuong;
            }

            set
            {
                soLuong = value;
            }
        }

        public decimal DonGia
        {
            get
            {
                return donGia;
            }

            set
            {
                donGia = value;
            }
        }

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
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace BTL_ASP.Models
{
    [MetadataTypeAttribute(typeof(HangMetadata))]
    public partial class Hang
    {
        internal sealed class HangMetadata
        {
            [Required(ErrorMessage = "{0} không được để trống")]
            [Display(Name = "Mã hàng")]
            public string HangID { get; set; }
            [Required(ErrorMessage = "Vui lòng nhập dữ liệu")]
            [Display(Name = "Tên hàng")]
            public string HangName { get; set; }
            public string SKU { get; set; }
            [Display(Name = "Hình ảnh")]
            public string HangImage { get; set; }
            [Display(Name = "Mô tả")]
            public string MoTa { get; set; }
            [Display(Name = "Chú thích")]
            public string Note { get; set; }
            [Required(ErrorMessage ="{0} không được để trống")]
            [Display(Name = "Số lượng")]
            public int SoLuong { get; set; }
            [Display(Name = "Giá hàng")]
            public decimal DonGia { get; set; }
            [Display(Name = "Loại hàng")]
            public string LoaiHangID { get; set; }
            [Display(Name = "Thương hiệu")]
            public string ThuongHieuID { get; set; }
            [Display(Name = "Nhà cung cấp")]
            public string NhaCungCapID { get; set; }
            [Required(ErrorMessage = "{0} không được để trống")]
            [DataType(DataType.Date)]
            [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
            [Display(Name = "Ngày nhập")]
            public Nullable<System.DateTime> CreatedDate { get; set; }
        }
    }
}
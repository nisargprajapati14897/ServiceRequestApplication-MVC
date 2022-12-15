using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ServiceRequestApplicationMVC.Models
{
    public class ServiceRequest
    {
        [Display(Name = "ServiceRequestId")]
        public int ServiceRequestId { get; set; }

        [Required(ErrorMessage = "First name is required.")]
        public string FirstName { get; set; }
        [Required(ErrorMessage = "Last name is required.")]
        public string LastName { get; set; }
        [Required(ErrorMessage = "MobileNo is required.")]
        public long MobileNo { get; set; }
        [Required(ErrorMessage = "Email is required.")]
        public string Email { get; set; }

        [Required(ErrorMessage = "EnquiryPurpose is required.")]
        public string EnquiryPurpose { get; set; }

        [Required(ErrorMessage = "Comment is required.")]
        //[UIHint("tinymce_jquery_full"), AllowHtml]
        [AllowHtml]
        public string Comments { get; set; }

        public string CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public DateTime ModifyDate { get; set; }

    }
    public class EnquiryPurpose
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }
}
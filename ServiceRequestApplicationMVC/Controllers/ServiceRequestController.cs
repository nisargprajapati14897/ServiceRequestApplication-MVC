using ServiceRequestApplicationMVC.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ServiceRequestApplicationMVC.Controllers
{
    public class ServiceRequestController : Controller
    {
        // GET: ServiceRequest
        public ActionResult Index()
        {
            ServiceRequestDBHandller DbServiceRequest = new ServiceRequestDBHandller();
            ModelState.Clear();
            return View(DbServiceRequest.GetServiceRequest());
        }

        // GET: ServiceRequest/Details/5
        public ActionResult Details(int ServiceRequestId)
        {
            return View();
        }

        // GET: ServiceRequest/Create
        public ActionResult Create()
        {
            List<SelectListItem> items = new List<SelectListItem>();
            items.Add(new SelectListItem { Text = "Interview", Value = "Interview" });
            items.Add(new SelectListItem { Text = "Cariour", Value = "Cariour" });
            ViewBag.EnquiryPurpose = items;

            return View();
        }

        // POST: ServiceRequest/Create
        [HttpPost]
        public ActionResult Create(ServiceRequest ServiceRequest, HttpPostedFileBase postedFile)
        {
            try
            {
                // TODO: Add insert logic here

                if (ModelState.IsValid)
                {
                    if (postedFile != null)
                    {
                        string fileName = Path.GetFileName(postedFile.FileName);
                        string path = Server.MapPath("~/Scripts/Images/");
                        if (!Directory.Exists(path))
                        {
                            Directory.CreateDirectory(path);
                        }

                        postedFile.SaveAs(path + fileName);
                        ViewBag.ImageUrl = "Scripts/Images/" + fileName;
                    }

                    ServiceRequestDBHandller sdb = new ServiceRequestDBHandller();
                    if (sdb.AddServiceRequest(ServiceRequest))
                    {
                        ViewBag.Message = "ServiceRequest Details Added Successfully";
                        ModelState.Clear();
                    }

                    //List<EnquiryPurpose> ListEnquiryPurpose = new List<EnquiryPurpose>()
                    //{
                    //    new EnquiryPurpose() {Id = 1, Name="Interview" },
                    //    new EnquiryPurpose() {Id = 2, Name="Cariour" },
                    //};
                    //ViewBag.EnquiryPurpose = new SelectList(ListEnquiryPurpose, "Id", "Name");

                }
                else
                {
                    ViewBag.ErrorMsg = "ServiceRequest Deleted Successfully";
                }

                return RedirectToAction("Index");
                //return View();
            }
            catch (Exception ex)
            {
                return View(ex);
            }
        }

        // GET: ServiceRequest/Edit/5
        public ActionResult Edit(int ServiceRequestId)
        {
            ServiceRequestDBHandller DbServiceRequest = new ServiceRequestDBHandller();
            var list = DbServiceRequest.GetServiceRequest().Find(SRModel => SRModel.ServiceRequestId == ServiceRequestId);

            List<SelectListItem> items = new List<SelectListItem>();
            items.Add(new SelectListItem { Text = "Interview", Value = "Interview" });
            items.Add(new SelectListItem { Text = "Cariour", Value = "Cariour" });
            ViewBag.ListEp = items;
            ViewBag.EnquiryPurpose = list.EnquiryPurpose;

            return View(list);
        }

        // POST: ServiceRequest/Edit/5
        [HttpPost]
        public ActionResult Edit(int ServiceRequestId, ServiceRequest ServiceRequest)
        {
            try
            {
                // TODO: Add update logic here

                ServiceRequestDBHandller DbServiceRequest = new ServiceRequestDBHandller();
                DbServiceRequest.UpdateServiceRequest(ServiceRequest);

                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                return View(ex);
            }
        }


        // POST: ServiceRequest/Delete/5
        public ActionResult Delete(int ServiceRequestId)
        {
            try
            {
                // TODO: Add delete logic here

                ServiceRequestDBHandller DbServiceRequest = new ServiceRequestDBHandller();
                if (DbServiceRequest.DeleteServiceRequest(ServiceRequestId))
                {
                    ViewBag.SuccessMsg = "ServiceRequest Deleted Successfully";
                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ServiceRequestApplicationMVC.Models
{
    public class ServiceRequestDBHandller
    {
        private SqlConnection con;
        private void connection()
        {
            string constring = ConfigurationManager.ConnectionStrings["ServiceRequestconn"].ToString();
            con = new SqlConnection(constring);
        }

        public List<ServiceRequest> GetServiceRequest()
        {
            connection();
            List<ServiceRequest> ServiceRequestlist = new List<ServiceRequest>();

            SqlCommand cmd = new SqlCommand("GetAllServiceRequest", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sd = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            con.Open();
            sd.Fill(dt);
            con.Close();

            foreach (DataRow dr in dt.Rows)
            {
                ServiceRequestlist.Add(
                    new ServiceRequest
                    {
                        ServiceRequestId = Convert.ToInt32(dr["ServiceRequestId"]),
                        FirstName = Convert.ToString(dr["FirstName"]),
                        LastName = Convert.ToString(dr["LastName"]),
                        Email = Convert.ToString(dr["Email"]),
                        MobileNo = Convert.ToInt64(dr["MobileNo"]),
                        EnquiryPurpose = Convert.ToString(dr["EnquiryPurpose"]),
                        Comments = Convert.ToString(dr["Comments"]),
                    });
            }
            return ServiceRequestlist;
        }

        public bool AddServiceRequest(ServiceRequest ServiceRequestModel)
        {
            ServiceRequestModel.CreatedDate = DateTime.Now;
            connection();
            SqlCommand cmd = new SqlCommand("AddServiceRequest", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@FirstName", ServiceRequestModel.FirstName);
            cmd.Parameters.AddWithValue("@LastName", ServiceRequestModel.LastName);
            cmd.Parameters.AddWithValue("@MobileNo", ServiceRequestModel.MobileNo);
            cmd.Parameters.AddWithValue("@Email", ServiceRequestModel.Email);
            cmd.Parameters.AddWithValue("@EnquiryPurpose", ServiceRequestModel.EnquiryPurpose);
            cmd.Parameters.AddWithValue("@Comments", ServiceRequestModel.Comments);

            cmd.Parameters.AddWithValue("@CreatedBy", ServiceRequestModel.CreatedBy == null ? ServiceRequestModel.CreatedBy = "Undefine" : ServiceRequestModel.CreatedBy = "user");
            cmd.Parameters.AddWithValue("@CreatedDate", ServiceRequestModel.CreatedDate);


            con.Open();
            int EnQ = cmd.ExecuteNonQuery();
            con.Close();

            if (EnQ >= 1)
                return true;
            else
                return false;
        }

        public bool UpdateServiceRequest(ServiceRequest ServiceRequestModel)
        {
            ServiceRequestModel.ModifyDate = DateTime.Now;
            connection();
            SqlCommand cmd = new SqlCommand("UpdateServiceRequest", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ServiceRequestId", ServiceRequestModel.ServiceRequestId);
            cmd.Parameters.AddWithValue("@FirstName", ServiceRequestModel.FirstName);
            cmd.Parameters.AddWithValue("@LastName", ServiceRequestModel.LastName);
            cmd.Parameters.AddWithValue("@Email", ServiceRequestModel.Email);
            cmd.Parameters.AddWithValue("@MobileNo", ServiceRequestModel.MobileNo);
            cmd.Parameters.AddWithValue("@EnquiryPurpose", ServiceRequestModel.EnquiryPurpose);
            cmd.Parameters.AddWithValue("@Comments", ServiceRequestModel.Comments);

            cmd.Parameters.AddWithValue("@ModifiedBy", ServiceRequestModel.ModifiedBy == null ? ServiceRequestModel.ModifiedBy = "Undefine" : ServiceRequestModel.ModifiedBy = "user");
            cmd.Parameters.AddWithValue("@ModifyDate", ServiceRequestModel.ModifyDate);

            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();

            if (i >= 1)
                return true;
            else
                return false;
        }

        public bool DeleteServiceRequest(int ServiceRequestId)
        {
            connection();
            SqlCommand cmd = new SqlCommand("DeleteServiceRequest", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ServiceRequestId", ServiceRequestId);

            con.Open();
            int EnQ = cmd.ExecuteNonQuery();
            con.Close();

            if (EnQ >= 1)
                return true;
            else
                return false;
        }

    }
}
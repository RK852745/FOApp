using GymMvc.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GPSandFastTag : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString.ToString()))
        {
            HttpCookie checkCookie = new HttpCookie("checkCookie");
            checkCookie.Value = "Y";  // Case sensitivity
            checkCookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(checkCookie);
            CreateSession();

        }
        else
        {
            CheckSession();

        }

    }
    private void CheckSession()
    {
        try
        {
            if (!UtilityModule.AdminSessionCheck())
            {
                Response.Redirect(UtilityModule.getLoginPageUrl());
            }
            else
            {
                userName.InnerText = UtilityModule.getParamFromUrl("name");
                string str = UtilityModule.getParamFromUrl("name");
                string[] strSplit = str.Split();
                var sname = "";
                foreach (string res in strSplit)
                {
                    sname = sname + res.Substring(0, 1);
                }
                shortname.InnerText = sname;
                shortname2.InnerText = sname;

            }

        }
        catch (Exception ex)
        {
            new ExceptionLogging(ex);
            Response.Redirect(UtilityModule.getLoginPageUrl());
        }
    }
    private void CreateSession()
    {
        try
        {
            string Qstring = Request.QueryString.ToString();
            string QueryString = PasswordEncryptDecrypt.DecryptString(HttpUtility.UrlDecode(Qstring));
            string UserId = HttpUtility.ParseQueryString(QueryString).Get("userid").Trim();
            string token = HttpUtility.ParseQueryString(QueryString).Get("token").Trim();
            string ProcedureName = "Pro_UserLogin";
            string Parameters = @"@UserId='" + UserId + "',@token='" + token + "',@Mode='getUserDetailsByUserId'";
            new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                string UserDetails = HttpUtility.UrlEncode(PasswordEncryptDecrypt.EncryptString(
                     "userid=" + ds.Tables[0].Rows[0]["UserId"].ToString() +
                     "&username=" + ds.Tables[0].Rows[0]["UserName"].ToString() +
                     "&password=" + ds.Tables[0].Rows[0]["Password"].ToString() +
                     "&name=" + ds.Tables[0].Rows[0]["Name"].ToString() +
                     "&mobile=" + ds.Tables[0].Rows[0]["Mobile"].ToString() +
                     "&executiveid=" + ds.Tables[0].Rows[0]["ExecutiveId"].ToString() +
                     "&employeeid=" + ds.Tables[0].Rows[0]["EmployeeID"].ToString() +
                     "&loginpin=" + ds.Tables[0].Rows[0]["LoginPin"].ToString() +
                     "&usertype=" + ds.Tables[0].Rows[0]["UserType"].ToString() +
                     "&token=" + token +
                     "&email=" + ds.Tables[0].Rows[0]["Email"].ToString()));

                if (Request.Cookies["checkCookie"] == null)
                {
                    Session["usersdata"] = UserDetails;
                }
                else
                {
                    HttpCookie UserD = new HttpCookie("usersdata");
                    UserD.Value = UserDetails;
                    UserD.Expires = DateTime.Now.AddDays(365);
                    HttpContext.Current.Response.Cookies.Add(UserD);

                    HttpCookie UseriD = new HttpCookie("userid");
                    UseriD.Value = ds.Tables[0].Rows[0]["UserId"].ToString();
                    UseriD.Expires = DateTime.Now.AddDays(365);
                    HttpContext.Current.Response.Cookies.Add(UseriD);

                    HttpCookie Username = new HttpCookie("username");
                    Username.Value = ds.Tables[0].Rows[0]["UserName"].ToString();
                    Username.Expires = DateTime.Now.AddDays(365);
                    HttpContext.Current.Response.Cookies.Add(Username);
                }
            }
            else
            {
                Response.Redirect(UtilityModule.getLoginPageUrl());
            }
        }
        catch (Exception ex)
        {
            new ExceptionLogging(ex);
            Response.Redirect(UtilityModule.getLoginPageUrl());
        }
    }

    [WebMethod]
    public static string GetProductDetails()
    {
        string result = "";
        try
        {
            if (UtilityModule.getUserTokenCheck())
            {
                string UserId = UtilityModule.getParamFromUrl("userid");
                string ProcedureName = "ManageProductDetails";
                string Parameters = "@mode='GetProductDetails'";
                new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    result = LowercaseJsonSerializer.SerializeObject(ds);
                }
            }
        }
        catch (Exception ex)
        {
            new ExceptionLogging(ex);

        }
        return result;
    }

    [WebMethod]
    public static string GetProductName(string CategoryName)
    {
        string result = "";
        try
        {
            if (UtilityModule.getUserTokenCheck())
            {
                string UserId = UtilityModule.getParamFromUrl("userid");
                string ProcedureName = "ManageProductDetails";
                string Parameters = "@mode='GetProductDetailsByCategory',@SelectedCategoryName='" + CategoryName + "'";
                new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    result = LowercaseJsonSerializer.SerializeObject(ds);
                }
            }
        }
        catch (Exception ex)
        {
            new ExceptionLogging(ex);

        }
        return result;
    }


    [WebMethod]
    public static string MethodAddData(
        string productCategory,
        string productName,
        string servicesProvider,

        string mrp,
        string quantity,
        string discount,
        string netAmount,

        string mobileNumber,
        string fullName,
        string addressLine,
        string city,
        string state,
        string pincode,

        string vehicleNumber,
        string chassisNumber, 
        string tag
        ) {
        string result = "";
        try
        {
            if (UtilityModule.getUserTokenCheck())
            {
                string UserId = UtilityModule.getParamFromUrl("userid");
                string ProcedureName = "ManageProductDetails";
                string Parameters = "@mode='InsertOrder',@MobileNumber='" + mobileNumber + "'," +
                    "@Name='"+ fullName + "',@ProductID='"+productName+ "'," +
                    "@Price='"+ mrp + "',@Amount='"+ netAmount + "',@ReceivedAmt='"+ netAmount + "'," +
                    "@ProductCategoryId='"+ productCategory+ "'," +
                    "@CategoryId='"+ productCategory + "',@VehicleNo='"+ vehicleNumber + "',@VehicleNo='"+ chassisNumber + "'," +
                    "@Provider='"+ servicesProvider + "',@Code='"+ tag + "',@M2M_MobileNo='"+ mobileNumber + "'," +
                    "@QTY='"+ quantity + "',@DiscountAmount='"+discount+ "',@AddressLine1='"+addressLine+ "',@City='"+city+"'" +
                    "@State='"+ state + "',@Pincode='"+pincode+"'";
                new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    result = LowercaseJsonSerializer.SerializeObject(ds);
                }
            }
        }
        catch (Exception ex)
        {
            new ExceptionLogging(ex);

        }
        return result;
    }

}

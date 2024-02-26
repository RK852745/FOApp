using GymMvc.Models;
using Microsoft.Owin.BuilderProperties;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Index : System.Web.UI.Page
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
    public static string Getcounts(string startdate, string enddate)
    {
        string result = "";
        try
        {
            if (UtilityModule.getUserTokenCheck())
            {
                string UserId = UtilityModule.getParamFromUrl("userid");
                string ProcedureName = "ProAddNewVisit";
                string Parameters = "@mode='getdailycounts',@UserId='" + UserId + "',@startdate='" + startdate + "',@enddate='" + enddate + "'";
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
    public static string MethodGetDataByCurrentDate(string startdate, string enddate)
    {
        string Result = "";
        try
        {
            if (UtilityModule.getUserTokenCheck())
            {
                string UserId = UtilityModule.getParamFromUrl("userid");
                string ProcedureName = "ProAddNewVisit";
                string Parameters = "@mode='getdailydatabydaterange',@createdby='" + UserId
                    + "',@startdate='" + startdate + "',@enddate='" + enddate + "'";
                new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    Result = LowercaseJsonSerializer.SerializeObject(ds);
                    return Result;
                }
            }
        }
        catch (Exception ex)
        {
            new ExceptionLogging(ex);
            Result = "Some Error Occured";
            return Result;
        }
        return Result;
    }


    [WebMethod]
    public static string MethodGetVehicleData(string fovmid)
    {
        string Result = "";
        try
        {
            if (UtilityModule.getUserTokenCheck())
            {
                string UserId = UtilityModule.getParamFromUrl("userid");
                string ProcedureName = "ProAddNewVisit";
                string Parameters = "@mode='getVehicledatabyfovid',@createdby='" + UserId
                    + "',@fovmid='" + fovmid + "'";
                new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    Result = LowercaseJsonSerializer.SerializeObject(ds);
                    return Result;
                }
            }
        }
        catch (Exception ex)
        {
            new ExceptionLogging(ex);
            Result = "Some Error Occured";
            return Result;
        }
        return Result;
    }

    [WebMethod]
    public static string MethodGetPreferredLocData(string fovmid)
    {
        string Result = "";
        try
        {
            if (UtilityModule.getUserTokenCheck())
            {
                string UserId = UtilityModule.getParamFromUrl("userid");
                string ProcedureName = "ProAddNewVisit";
                string Parameters = "@mode='getPreferredLocationbyfovid',@createdby='" + UserId
                    + "',@fovmid='" + fovmid + "'";
                new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    Result = LowercaseJsonSerializer.SerializeObject(ds);
                    return Result;
                }
            }
        }
        catch (Exception ex)
        {
            new ExceptionLogging(ex);
            Result = "Some Error Occured";
            return Result;
        }
        return Result;
    }

    [WebMethod]
    public static string MethodGetAllImagesData(string fovmid)
    {
        string Result = "";
        try
        {
            if (UtilityModule.getUserTokenCheck())
            {
                string UserId = UtilityModule.getParamFromUrl("userid");
                string ProcedureName = "ProAddNewVisit";
                string Parameters = "@mode='getAllImagesUploadedbyfovid',@createdby='" + UserId
                    + "',@fovmid='" + fovmid + "'";
                new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    Result = LowercaseJsonSerializer.SerializeObject(ds);
                    return Result;
                }
            }
        }
        catch (Exception ex)
        {
            new ExceptionLogging(ex);
            Result = "Some Error Occured";
            return Result;
        }
        return Result;
    }


    [WebMethod]
    public static string MethodEncryptData(string str)
    {
        return HttpUtility.UrlEncode(PasswordEncryptDecrypt.EncryptString(str));
    }
}
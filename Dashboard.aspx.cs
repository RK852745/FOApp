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
public partial class Dashboard : System.Web.UI.Page
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
            userName.InnerText = UtilityModule.getParamFromUrl("name");
            string str = "Admin";
            string[] strSplit = str.Split();
            var sname = "";
            foreach (string res in strSplit)
            {
                sname = sname + res.Substring(0, 1);
            }
            shortname.InnerText = sname;
            shortname2.InnerText = sname;
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
                if (UtilityModule.getParamFromUrl("isadmin").ToUpper() == "Y")
                {
                    userName.InnerText = UtilityModule.getParamFromUrl("name");
                    string str = "Admin";
                    string[] strSplit = str.Split();
                    var sname = "";
                    foreach (string res in strSplit)
                    {
                        sname = sname + res.Substring(0, 1);
                    }
                    shortname.InnerText = sname;
                    shortname2.InnerText = sname;
                }
                else
                {
                    Response.Redirect(UtilityModule.getLoginPageUrl());
                }

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
            string Parameters = @"@UserId='" + UserId + "',@token='" + token + "',@Mode='getAdminDetails'";
            new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                string UserDetails = HttpUtility.UrlEncode(PasswordEncryptDecrypt.EncryptString(
                     "userid=" + ds.Tables[0].Rows[0]["UserId"].ToString() +
                     "&username=" + ds.Tables[0].Rows[0]["UserName"].ToString() +
                     "&password=" + ds.Tables[0].Rows[0]["Password"].ToString() +
                     "&name=" + ds.Tables[0].Rows[0]["Name"].ToString() +
                     "&mobile=" + ds.Tables[0].Rows[0]["Mobile"].ToString() +
                     "&isadmin=" + ds.Tables[0].Rows[0]["IsAdmin"].ToString() +
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
    public static string MethodGetDataforAdmin(string startdate,string enddate,string foid,string tvisit, string owntype, string Status)
    {
        string result = "";
        try
        {
            if (UtilityModule.getUserTokenCheck())
            {
                if (UtilityModule.getParamFromUrl("isadmin").ToUpper() == "Y")
                {
                    string UserId = UtilityModule.getParamFromUrl("userid");
                    string ProcedureName = "[dbo].[AdminDasboardMaster]";
                    string Parameters = "@mode='AdminDasboardData',@UserId='" + UserId 
                        + "',@startdate='"+ startdate + "',@enddate='"+ enddate
                        + "',@fomid='"+ foid + "',@totalvisit='"+ tvisit + "',@owntype='"+ owntype + "',@Status='" + Status + "'";
                    new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
                    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        result = LowercaseJsonSerializer.SerializeObject(ds);
                    }
                }
            }

        }
        catch (Exception ex)
        {
            result = ex.Message;
            new ExceptionLogging(ex);
        }
        return result;
    }
     

    [WebMethod]
    public static string MethodGetFieldofficers()
    {
        string result = "";
        try
        {
            if (UtilityModule.getUserTokenCheck())
            {
                if (UtilityModule.getParamFromUrl("isadmin").ToUpper() == "Y")
                {
                    string UserId = UtilityModule.getParamFromUrl("userid");
                    string ProcedureName = "[dbo].[AdminDasboardMaster]";
                    string Parameters = "@mode='GetFieldOfficerData',@UserId='" + UserId + "'";
                    new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
                    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        result = LowercaseJsonSerializer.SerializeObject(ds);
                    }
                }
            }

        }
        catch (Exception ex)
        {
            result = ex.Message;
            new ExceptionLogging(ex);
        }
        return result;
    }

    [WebMethod]
    public static string MethodGetcounts(string startdate, string enddate)
    {
        string result = "";
        try
        {
            if (UtilityModule.getUserTokenCheck())
            {
                if (UtilityModule.getParamFromUrl("isadmin").ToUpper() == "Y")
                {
                    string UserId = UtilityModule.getParamFromUrl("userid");
                    string ProcedureName = "[dbo].[AdminDasboardMaster]";
                    string Parameters = "@mode='GetTotalsCounts',@UserId='" + UserId 
                        + "',@startdate='" + startdate + "',@enddate='" + enddate + "'";
                    new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
                    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        result = LowercaseJsonSerializer.SerializeObject(ds);
                    }
                }
            }

        }
        catch (Exception ex)
        {
            result = ex.Message;
            new ExceptionLogging(ex);
        }
        return result;
    }


    [WebMethod]
    public static string MethodGetVehicleInfo(string fovmid)
    {
        string result = "";
        try
        {
            if (UtilityModule.getUserTokenCheck())
            {
                if (UtilityModule.getParamFromUrl("isadmin").ToUpper() == "Y")
                {
                    string UserId = UtilityModule.getParamFromUrl("userid");
                    string ProcedureName = "[dbo].[AdminDasboardMaster]";
                    string Parameters = "@mode='GetVehicleInfodata',@UserId='" + UserId + "',@fovmid='"+ fovmid + "'";
                    new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
                    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        result = LowercaseJsonSerializer.SerializeObject(ds);
                    }
                }
            }

        }
        catch (Exception ex)
        {
            result = ex.Message;
            new ExceptionLogging(ex);
        }
        return result;
    }

    [WebMethod]
    public static string MethodGetPrefLocationData(string fovmid)
    {
        string result = "";
        try
        {
            if (UtilityModule.getUserTokenCheck())
            {
                if (UtilityModule.getParamFromUrl("isadmin").ToUpper() == "Y")
                {
                    string UserId = UtilityModule.getParamFromUrl("userid");
                    string ProcedureName = "[dbo].[AdminDasboardMaster]";
                    string Parameters = "@mode='GetPrefLocationInfodata',@UserId='" + UserId + "',@fovmid='" + fovmid + "'";
                    new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
                    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        result = LowercaseJsonSerializer.SerializeObject(ds);
                    }
                }
            }

        }
        catch (Exception ex)
        {
            result = ex.Message;
            new ExceptionLogging(ex);
        }
        return result;
    }
     
    [WebMethod]
    public static string MethodGetAllimages(string fovmid)
    {
        string result = "";
        try
        {
            if (UtilityModule.getUserTokenCheck())
            {
                if (UtilityModule.getParamFromUrl("isadmin").ToUpper() == "Y")
                {
                    string UserId = UtilityModule.getParamFromUrl("userid");
                    string ProcedureName = "[dbo].[AdminDasboardMaster]";
                    string Parameters = "@mode='GetAllImages',@UserId='" + UserId + "',@fovmid='" + fovmid + "'";
                    new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
                    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        result = LowercaseJsonSerializer.SerializeObject(ds);
                    }
                }
            }

        }
        catch (Exception ex)
        {
            result = ex.Message;
            new ExceptionLogging(ex);
        }
        return result;
    }
     
    [WebMethod]
    public static string MethodGetDataforAdminbyuserid(string startdate, string enddate,List<Useridlist> Useridlist)
    {
        string result = "";
        try
        {
            if (UtilityModule.getUserTokenCheck())
            {
                if (UtilityModule.getParamFromUrl("isadmin").ToUpper() == "Y")
                {
                    string XML = UtilityModule.getXmlFromList("Insertuseridlist", Useridlist);
                    string UserId = UtilityModule.getParamFromUrl("userid");
                    string ProcedureName = "[dbo].[AdminDasboardMaster]";
                    string Parameters = "@mode='getdatabyuserid',@UserId='" + UserId
                        + "',@startdate='" + startdate + "',@enddate='" + enddate
                        + "',@xmluseridlist='" + XML + "'";
                    new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
                    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        result = LowercaseJsonSerializer.SerializeObject(ds);
                    }
                }
            }

        }
        catch (Exception ex)
        {
            result = ex.Message;
            new ExceptionLogging(ex);
        }
        return result;
    }

}

public class Useridlist
{
    public string userid { get; set; }
}
using GymMvc.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpContext.Current.Session["OTPVerified"] = "N";
        HttpCookie mycookie = new HttpCookie("checkCookie");
        mycookie.Value = "Y";  // Case sensitivity
        mycookie.Expires = DateTime.Now.AddDays(365);
        HttpContext.Current.Response.Cookies.Add(mycookie);
        //CheckConnection();
    }


    public bool CheckConnection()
    {
        string conString = ConfigurationManager.ConnectionStrings["ConnStringFO"].ConnectionString;  
        bool isValid = false;
        SqlConnection con = null;
        try
        {
            con = new SqlConnection(conString);
            con.Open();
            isValid = true;
            Response.Write("Connection is open");
        }
        catch (SqlException ex)
        {
            isValid = false;
            Response.Write(ex.Message);
           
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
                Response.Write("Connection is closed");
            }
        }

        return isValid;
    }





    [WebMethod]
    public static string CheckCredentials(string UserName, string Password)
    {
        string Result = "E|Some error occured";
        try
        {
            if (UserName.Length != 10)
            {
                return "E|Please enter 10 digits Mobile Number";
            }
            else if (Password == "")
            {
                return "E|Please enter your password";
            }
            string ProcedureName = "Pro_UserLogin";
            string Parameters = @"@password='" + Password + "',@UserName='" + UserName + "',@Mode='CheckUserLogin'";
            new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["IsAdmin"].ToString().ToUpper()=="Y")
                {
                    string Url = "username=" + ds.Tables[0].Rows[0]["username"].ToString()
                       + "&password=" + ds.Tables[0].Rows[0]["password"].ToString()
                       + "&userid=" + ds.Tables[0].Rows[0]["Userid"].ToString()
                       + "&token=" + ds.Tables[0].Rows[0]["Token"].ToString();
                    //Result = "Y|/TrucksUpFO/Dashboard.aspx?" + HttpUtility.UrlEncode(PasswordEncryptDecrypt.EncryptString(Url));
                   Result = "Y|/Dashboard.aspx?" + HttpUtility.UrlEncode(PasswordEncryptDecrypt.EncryptString(Url));
                }
                else
                {
                    string Url = "username=" + ds.Tables[0].Rows[0]["username"].ToString()
                       + "&password=" + ds.Tables[0].Rows[0]["password"].ToString()
                       + "&userid=" + ds.Tables[0].Rows[0]["Userid"].ToString()
                       + "&token=" + ds.Tables[0].Rows[0]["Token"].ToString();
                   // Result = "Y|/TrucksUpFO/Index.aspx?" + HttpUtility.UrlEncode(PasswordEncryptDecrypt.EncryptString(Url));
                    Result = "Y|/Index.aspx?" + HttpUtility.UrlEncode(PasswordEncryptDecrypt.EncryptString(Url));
                }
                                
                return Result;
            }
        }
        catch (Exception ex)
        {
            new ExceptionLogging(ex);
            Result=ex.Message;
            return Result;
        } 
        return Result;
    }

    [WebMethod]
    public static string LogOut()
    {
        string userid = UtilityModule.getAdminSession("userid");
        string token = UtilityModule.getAdminSession("token");
        string ProcedureName = "Pro_UserLogin";
        string Parameters = @"@userid='" + userid + "',@token='" + token + "',@Mode='updateTokenExpire'";
        new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
         
        HttpContext.Current.Session.Abandon();
        HttpContext.Current.Session.Clear();
        if (HttpContext.Current != null)
        {
            int cookieCount = HttpContext.Current.Request.Cookies.Count;
            for (var i = 0; i < cookieCount; i++)
            {
                var cookie = HttpContext.Current.Request.Cookies[i];
                if (cookie != null)
                {
                    var expiredCookie = new HttpCookie(cookie.Name)
                    {
                        Expires = DateTime.Now.AddDays(-1),
                        Domain = cookie.Domain
                    };
                    HttpContext.Current.Response.Cookies.Add(expiredCookie); // overwrite it
                }
            }
            HttpContext.Current.Request.Cookies.Clear();
        }  
        return UtilityModule.getLoginPageUrl();
    }
}
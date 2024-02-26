using GymMvc.Models;
using Microsoft.Owin.BuilderProperties;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Core.EntityClient;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class AddFieldOfficer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CheckSession();
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

    [WebMethod]
    public static string MethodAddNewFieldOfficer(string name, string mobile, string altmob, string email, string address, string empid, string usertype)
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
                    string Parameters = "@mode='createfieldofficer',@UserId='" + UserId
                        + "',@Name='" + name + "',@Mobile='" + mobile + "',@AltMobile='" + altmob
                        + "',@Email='" + email + "',@FullAddress='" + address + "',@EmployeeID='" + empid + "',@CreatedBy='" + UserId + "',@EmployeeType='"+ usertype + "'";
                    new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
                    result = "Y";

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
    public static string MethodgetFieldOfficerdata()
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
                    string Parameters = "@mode='FetchFieldOfficerdata',@UserId='" + UserId + "'";
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
    public static string MethodUpdateOfficerdata(string employeeid, string fullname, string mobile,
        string altmobile, string emailid, string address, string username, string password, string updateid)
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
                    string Parameters = "@mode='UpdateFieldOfficerdata',@UserId='" + UserId
                        + "',@Name='" + fullname + "',@Mobile='" + mobile + "',@AltMobile='" + altmobile
                        + "',@Email='" + emailid + "',@FullAddress='" + address + "',@EmployeeID='" + employeeid
                        + "',@CreatedBy='" + UserId + "',@EcecutiveId='" + updateid + "',@username='" + username
                        + "',@password='" + password + "'";
                    new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
                    return "Y";
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
    public static string MethodDeleteOfficerdata(string deleteid)
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
                    string Parameters = "@mode='DeleteFieldOfficerdata',@UserId='" + UserId + "',@EcecutiveId='" + deleteid + "'";
                    new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
                    return "Y";
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
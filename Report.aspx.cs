using GymMvc.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Report : System.Web.UI.Page
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
    public static string MethodGetFieldofficersReports(string startdate, string enddate, string type)
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
                    string Parameters = "@mode='GetFieldOfficerReports',@UserId='" + UserId
                        + "',@startdate='" + startdate + "',@enddate='" + enddate
                        + "',@EmployeeType='" + type + "'";
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
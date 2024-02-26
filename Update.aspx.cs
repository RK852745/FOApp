using GymMvc.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Update : System.Web.UI.Page
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
                // Get UserId from the query string or wherever it is available
                string userId = UtilityModule.getParamFromUrl("userid");

                // Store UserId in the session
                Session["UserId"] = userId;
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


    [WebMethod]
    public static string MethodGetDataForUpdate(string fovmid)
    {
        string Result = "";
        try
        {
            string UserId = UtilityModule.getParamFromUrl("userid");
            string ProcedureName = "ProUpdateVisitData";
            string Parameters = "@mode='getdatabyfovmidforupdate',@createdby='" + UserId
                + "',@fovmid='" + PasswordEncryptDecrypt.DecryptString(HttpUtility.UrlDecode(fovmid)) + "'";
            new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
            if (ds != null && ds.Tables.Count > 0)
            {
                Result = LowercaseJsonSerializer.SerializeObject(ds);
                return Result;
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
    public static string MethodUpdatedatabyid(string updateid, string updatefor, string fovmid)
    {
        string Result = "";
        try
        {
            string UserId = UtilityModule.getParamFromUrl("userid");
            string ProcedureName = "ProUpdateVisitData";
            string Parameters = "@mode='updatedatabyoptions',@createdby='" + UserId
                + "',@fovmid='" + PasswordEncryptDecrypt.DecryptString(HttpUtility.UrlDecode(fovmid))
                + "',@updateid='" + updateid + "',@updatefor='" + updatefor + "'";
            new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
            if (ds != null && ds.Tables.Count > 0)
            {
                Result = ds.Tables[0].Rows[0]["result"].ToString();
                return Result;
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
    public static string MethodUpdateVisitData(List<VehicleInfolists> veiclelist, List<PreferredLoactionLists> locationList,
        string type, string fullname, string phoneno, string email, string emaildomain, string address, string stickeringstatus,
        List<uploadimagewithstickerLists> stickerList, List<uploadimagewithownerLists> ownerinfoList, List<uploadvisitingcardLists> visitingcardList, string Latitude, string Longitude,
        string VisitDate, string VisitTime, string Company, string updateid, string status, string remarks, string VehicleOwnType)
    {
        string Result = "";
        try
        {
            if (UtilityModule.getUserTokenCheck())
            {
                if (string.IsNullOrEmpty(type))
                {
                    Result = "Please select own type|warning";
                    return Result;
                }
                if (string.IsNullOrEmpty(fullname))
                {
                    Result = "Please enter full name|warning";
                    return Result;
                }
                if (string.IsNullOrEmpty(phoneno))
                {
                    Result = "Please enter phone no|warning";
                    return Result;
                } 
                  
                List<uploadimagewithstickerLists> uploadimagewithstickerListurl = new List<uploadimagewithstickerLists>();
                for (int i = 0; i < stickerList.Count; i++)
                {
                    if (stickerList[i].imagewithstickerurl != "")
                    {
                        uploadimagewithstickerListurl.Add(new uploadimagewithstickerLists
                        {
                            imagewithstickerurl = Saveimage.savedocumentinfolder(stickerList[i].imagewithstickerurl, "Sticker"),
                        });
                    }

                }
                string stickerXML = UtilityModule.getXmlFromList("Insertstickerlist", uploadimagewithstickerListurl);

                List<uploadimagewithownerLists> uploadimagewithownerListUrl = new List<uploadimagewithownerLists>();
                for (int i = 0; i < ownerinfoList.Count; i++)
                {
                    if (ownerinfoList[i].imagewithownerurl != "")
                    {
                        uploadimagewithownerListUrl.Add(new uploadimagewithownerLists
                        {
                            imagewithownerurl = Saveimage.savedocumentinfolder(ownerinfoList[i].imagewithownerurl, "Ownerinfo"),
                        });
                    }

                }
                string OwnerinfoXML = UtilityModule.getXmlFromList("InsertOwnerinfolist", uploadimagewithownerListUrl);

                List<uploadvisitingcardLists> uploadvisitingcardListUrl = new List<uploadvisitingcardLists>();
                for (int i = 0; i < visitingcardList.Count; i++)
                {
                    if (visitingcardList[i].VisitingCardUrl != "")
                    {
                        uploadvisitingcardListUrl.Add(new uploadvisitingcardLists
                        {
                            VisitingCardUrl = Saveimage.savedocumentinfolder(visitingcardList[i].VisitingCardUrl, "Visitingcard"),
                        });

                    }
                }
                string VisitingcardXML = UtilityModule.getXmlFromList("InsertVisitingcardlist", uploadvisitingcardListUrl);
                 
                string XML = UtilityModule.getXmlFromList("Insertveiclelist", veiclelist); 
                string XMLL = UtilityModule.getXmlFromList("InsertlocationList", locationList); 
                string UserId = UtilityModule.getParamFromUrl("userid");
                string ProcedureName = "ProUpdateVisitData";
                string Parameters = "@mode='updatedatabyfieldofficer',@Name='" + fullname
                    + "',@Mobile='" + phoneno + "',@EmailId='" + email + "',@Address='" + address
                    + "',@OwnType='" + type + "',@VehicleCount='" + veiclelist.Count
                    + "',@VisitDate='" + VisitDate + "',@VisitTime='" + VisitTime
                    + "',@Latitude='" + Latitude + "',@Longitude='" + Longitude
                    + "',@VisitingCardUrlXML='" + VisitingcardXML + "',@CreatedBy='" + UserId
                    + "',@StickeringStatus='" + stickeringstatus + "',@xmlvehicleInfolist='" + XML
                    + "',@xmlprefloctaionlist='" + XMLL + "',@imagewithstickerurlXML='" + stickerXML
                    + "',@imagewithownerurlXML='" + OwnerinfoXML + "',@Company='" + Company 
                    + "',@Status='" + status + "',@Remarks='"+ remarks + "',@fovmid='" + PasswordEncryptDecrypt.DecryptString(HttpUtility.UrlDecode(updateid)) 
                    + "',@VehicleOwnType='"+ VehicleOwnType + "'";
                new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
                if (ds != null)
                {
                    if (ds.Tables[0].Rows[0]["result"].ToString().ToUpper() == "Y")
                    {
                        Result = "Record updated successfully|success";
                    }
                    else
                    {
                        Result = "You cannot update the record. Please contact with your senior |error";
                    }

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


}


public class uploadimagewithstickerLists
{
    public string imagewithstickerurl { get; set; }
}

public class uploadimagewithownerLists
{
    public string imagewithownerurl { get; set; }
}

public class uploadvisitingcardLists
{
    public string VisitingCardUrl { get; set; }
}

public class VehicleInfolists
{
    public string VehicleSize { get; set; }
    public string VehicleType { get; set; }
    public string Vehiclecapacity { get; set; }
    public string VehicleCount { get; set; }
}

public class PreferredLoactionLists
{
    public string FromLoction { get; set; }
    public string ToLocation { get; set; }
}
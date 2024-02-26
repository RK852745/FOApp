using GymMvc.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing.Drawing2D;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Threading;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.IdentityModel.Protocols.WSTrust;
using System.Activities.Statements;
using System.EnterpriseServices;
using System.Reflection;
using static System.Net.Mime.MediaTypeNames;
using Microsoft.Owin.BuilderProperties;
using System.Web.Providers.Entities;
using System.Net.Http;
using System.ServiceModel.Channels;
using System.Threading.Tasks;
using Newtonsoft.Json;

public partial class VisitingRegistration : System.Web.UI.Page
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
    public static string MethodAddNewVisitData(List<VehicleInfolist> veiclelist, List<PreferredLoactionList> locationList,
        string type, string fullname, string phoneno, string email, string emaildomain, string address, string stickeringstatus,
        List<uploadimagewithstickerList> stickerList, List<uploadimagewithownerList> ownerinfoList, List<uploadvisitingcardList> visitingcardList, string Latitude, string Longitude,
    string VisitDate, string VisitTime, string Company, string status, string remarks, string VehicleOwnType,
    string IsMobileVerified, string verifytype)
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


                List<uploadimagewithstickerList> uploadimagewithstickerListurl = new List<uploadimagewithstickerList>();
                for (int i = 0; i < stickerList.Count; i++)
                {
                    if (stickerList[i].imagewithstickerurl != "")
                    {
                        uploadimagewithstickerListurl.Add(new uploadimagewithstickerList
                        {
                            imagewithstickerurl = stickerList[i].imagewithstickerurl
                        });
                    }

                }
                string stickerXML = UtilityModule.getXmlFromList("Insertstickerlist", uploadimagewithstickerListurl);

                List<uploadimagewithownerList> uploadimagewithownerListUrl = new List<uploadimagewithownerList>();
                for (int i = 0; i < ownerinfoList.Count; i++)
                {
                    if (ownerinfoList[i].imagewithownerurl != "")
                    {
                        uploadimagewithownerListUrl.Add(new uploadimagewithownerList
                        {
                            imagewithownerurl = ownerinfoList[i].imagewithownerurl,
                        });
                    }

                }
                string OwnerinfoXML = UtilityModule.getXmlFromList("InsertOwnerinfolist", uploadimagewithownerListUrl);

                List<uploadvisitingcardList> uploadvisitingcardListUrl = new List<uploadvisitingcardList>();
                for (int i = 0; i < visitingcardList.Count; i++)
                {
                    if (visitingcardList[i].VisitingCardUrl != "")
                    {
                        uploadvisitingcardListUrl.Add(new uploadvisitingcardList
                        {
                            VisitingCardUrl = visitingcardList[i].VisitingCardUrl,
                        });
                    }
                }
                string VisitingcardXML = UtilityModule.getXmlFromList("InsertVisitingcardlist", uploadvisitingcardListUrl);
                string XML = UtilityModule.getXmlFromList("Insertveiclelist", veiclelist);
                string XMLL = UtilityModule.getXmlFromList("InsertlocationList", locationList);
                string UserId = UtilityModule.getParamFromUrl("userid");

                string ProcedureName = "ProAddNewVisit";
                string Parameters = "@mode='addnewdatabyfieldofficer',@Name='" + fullname
                    + "',@Mobile='" + phoneno + "',@EmailId='" + email + "',@Address='" + address
                    + "',@OwnType='" + type + "',@VehicleCount='" + veiclelist.Count
                    + "',@VisitDate='" + VisitDate + "',@VisitTime='" + VisitTime
                    + "',@Latitude='" + Latitude + "',@Longitude='" + Longitude
                    + "',@VisitingCardUrlXML='" + VisitingcardXML + "',@CreatedBy='" + UserId
                    + "',@StickeringStatus='" + stickeringstatus + "',@xmlvehicleInfolist='" + XML
                    + "',@xmlprefloctaionlist='" + XMLL + "',@imagewithstickerurlXML='" + stickerXML
                    + "',@imagewithownerurlXML='" + OwnerinfoXML + "',@Company='" + Company
                    + "',@Status='" + status + "',@Remarks='" + remarks + "',@VehicleOwnType='" + VehicleOwnType
                    + "',@IsMobileVerified='" + IsMobileVerified + "',@verifytype='" + verifytype + "'";
                new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
                if (ds != null)
                {
                    if (ds.Tables[0].Rows[0]["result"].ToString().ToUpper() == "Y")
                    {
                        Result = "Record added successfully|success";
                    }
                    else
                    {
                        Result = "The Person with this number (" + phoneno + ") is already registered|error";
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

    //[WebMethod]
    //public static string MethodAddNewVisitData(string type,string fullname,string phoneno,string email,string address,List<uploadvisitingcardList> visitingcardList,
    // string Latitude,string Longitude,string VisitDate,string VisitTime,string status,string remarks,string IsMobileVerified,string verifytype,
    // string Company,List<PreferredLoactionList> locationList)
    //{
    //    string Result = "";
    //    try
    //    {
    //        if (UtilityModule.getUserTokenCheck())
    //        {
    //            if (string.IsNullOrEmpty(type))
    //            {
    //                Result = "Please select own type|warning";
    //                return Result;
    //            }
    //            if (string.IsNullOrEmpty(fullname))
    //            {
    //                Result = "Please enter full name|warning";
    //                return Result;
    //            }
    //            if (string.IsNullOrEmpty(phoneno))
    //            {
    //                Result = "Please enter phone no|warning";
    //                return Result;
    //            }

    //            List<uploadvisitingcardList> uploadvisitingcardListUrl = new List<uploadvisitingcardList>();
    //            for (int i = 0; i < visitingcardList.Count; i++)
    //            {
    //                if (!string.IsNullOrEmpty(visitingcardList[i].VisitingCardUrl))
    //                {
    //                    uploadvisitingcardListUrl.Add(new uploadvisitingcardList
    //                    {
    //                        VisitingCardUrl = visitingcardList[i].VisitingCardUrl,
    //                    });
    //                }
    //            }

    //            string VisitingcardXML = UtilityModule.getXmlFromList("InsertVisitingcardlist", uploadvisitingcardListUrl);

    //            string LocationXML = UtilityModule.getXmlFromList("InsertlocationList", locationList);

    //            string UserId = UtilityModule.getParamFromUrl("userid");

    //            string ProcedureName = "ProAddNewVisit";
    //            string Parameters = "@mode='addnewdatabyfieldofficer',@Name='" + fullname
    //                + "',@Mobile='" + phoneno + "',@EmailId='" + email + "',@Address='" + address
    //                + "',@OwnType='" + type + "',@VisitDate='" + VisitDate + "',@VisitTime='" + VisitTime
    //                + "',@Latitude='" + Latitude + "',@Longitude='" + Longitude
    //                + "',@VisitingCardUrlXML='" + VisitingcardXML + "',@xmlprefloctaionlist='" + LocationXML + "',@CreatedBy='" + UserId
    //                + "',@Status='" + status + "',@Company='" + Company + "',@Remarks='" + remarks
    //                + "',@IsMobileVerified='" + IsMobileVerified + "',@verifytype='" + verifytype + "'";
    //            new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);

    //            if (ds != null)
    //            {
    //                if (ds.Tables[0].Rows[0]["result"].ToString().ToUpper() == "Y")
    //                {
    //                    Result = "Record added successfully|success";
    //                }
    //                else
    //                {
    //                    Result = "The person with this number (" + phoneno + ") is already registered|error";
    //                }

    //                return Result;
    //            }
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        new ExceptionLogging(ex);
    //        Result = "Some error occurred";
    //    }
    //    return Result;
    //}


    [WebMethod]
    public static string Getapirequest(string SearchCity)
    {
        string results = "";
        try
        {
            if (UtilityModule.getUserTokenCheck())
            {

                results = HttpGet("https://sslapi.ritcologistics.com/Apigateway/Gateway/GetLocations?searchText=" + SearchCity + "&isHindiSearch=false");

            }
        }
        catch (Exception ex)
        {
            new ExceptionLogging(ex);
        }
        //results = getApidatatable(usefor);
        return results;
    }
    public static string HttpGet(string uri)
    {
        string content = null;
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(uri);
        var username = "DevUser";
        var password = "Dev@123";
        string encoded = System.Convert.ToBase64String(Encoding.GetEncoding("ISO-8859-1")
                                       .GetBytes(username + ":" + password));
        request.Headers.Add("Authorization", "Basic " + encoded);
        using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
        using (Stream stream = response.GetResponseStream())
        using (StreamReader sr = new StreamReader(stream))
        {
            content = sr.ReadToEnd();

        }

        return content;
    }

    [WebMethod]
    public static string MethodVerifymobilenumber(string mobilenumber, string sendotp)
    {
        string result = "";
        try
        {
            if (UtilityModule.getUserTokenCheck())
            {

                string UserId = UtilityModule.getParamFromUrl("userid");
                string ProcedureName = "AdminDasboardMaster";
                string Parameters = "@mode='checkuserexistance',@Mobile='" + mobilenumber + "'";
                new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    if (ds.Tables[0].Rows[0]["result"].ToString().ToUpper() == "Y")
                    {
                        result = "Y";
                    }
                    else
                    {
                        if (sendotp == "Y")
                        {

                            int OTP = new Random().Next(100000, 999999);
                            int refno = new Random().Next(10000, 99999);
                            HttpContext.Current.Session["OTPMobile"] = OTP + "," + mobilenumber;
                            string sms = "TrucksUp OTP - " + OTP + " आपके मोबाइल नंबर को मान्य करने के लिए। Ref No. " + refno + "";
                            var payload = Newtonsoft.Json.JsonConvert.SerializeObject(
                        new
                        {
                            RequestType = "OTP",
                            ActionType = "I",
                            RequestedBy = "91" + mobilenumber,
                            MessageText = sms,
                            Recipients = "91" + mobilenumber,
                            Variables = "",
                            AppSignatureKey = "TrucksUp Field Officer",
                            DO_ID = "",
                            caller = "TrucksUpOTP",
                            unicode = true
                        });
                            string uri = "https://sslapi.ritcologistics.com/Apigateway/Gateway/V2/Message";
                            string content = postRequest(uri, payload);
                            result = content;
                            return result;
                        }
                        else
                        {
                            result = "N";
                        }

                    }
                }

            }

            else
            {

            }
        }
        catch (Exception ex)
        {
            new ExceptionLogging(ex);
            return ex.Message;
        }
        return result;

    }

    public static string postRequest(string url, string prams)
    {
        // Create a request using a URL that can receive a post. 
        WebRequest request = WebRequest.Create(url);
        // Set the Method property of the request to POST.
        request.Method = "POST";

        // Create POST data and convert it to a byte array.
        string postData = prams;
        byte[] byteArray = Encoding.UTF8.GetBytes(postData);
        // Set the ContentType property of the WebRequest.
        request.ContentType = "application/json";
        // Set the ContentLength property of the WebRequest.
        request.ContentLength = byteArray.Length;
        var username = "DevUser";
        var password = "Dev@123";
        string encoded = System.Convert.ToBase64String(Encoding.GetEncoding("ISO-8859-1")
                                       .GetBytes(username + ":" + password));
        request.Headers.Add("Authorization", "Basic " + encoded);
        // Get the request stream.
        Stream dataStream = request.GetRequestStream();
        // Write the data to the request stream.
        dataStream.Write(byteArray, 0, byteArray.Length);
        // Close the Stream object.
        dataStream.Close();

        // Get the response.
        WebResponse response = request.GetResponse();
        // Display the status.
        Console.WriteLine(((HttpWebResponse)response).StatusDescription);
        // Get the stream containing content returned by the server.
        dataStream = response.GetResponseStream();
        // Open the stream using a StreamReader for easy access.
        StreamReader reader = new StreamReader(dataStream);
        // Read the content.
        string responseFromServer = reader.ReadToEnd();
        // Display the content. 
        reader.Close();
        dataStream.Close();
        response.Close();
        return responseFromServer;
    }

    [WebMethod]
    public static string VerifyOTP(string Mobile, string OTP)
    {
        try
        {
            if (Mobile.Length != 10)
            {
                return "E|Please enter 10 digits Mobile Number";
            }
            else if (OTP.Length != 6)
            {
                return "E|Please enter 4 digits OTP";
            }
            string SessionMobile = HttpContext.Current.Session["OTPMobile"].ToString().Split(',')[1];
            string SessionOTP = HttpContext.Current.Session["OTPMobile"].ToString().Split(',')[0];
            if (SessionMobile == Mobile && SessionOTP == OTP)
            {
                return "Y|Mobile number verified successfully";
            }
            else
            {
                return "E|Wrong OTP. Please enter correct OTP";
            }
        }
        catch (Exception ex)
        {
            new ExceptionLogging(ex);
            return "Z|Some error occurred. Please try again later.";
        }

    }


    [WebMethod]
    public static string reducefilesize(string imageBase64, string type)
    {
        string prefix = "";
        if (type == "1")
        {
            prefix = "sticker";

        }
        else if (type == "2")
        {
            prefix = "owner";

        }
        else if (type == "3")
        {
            prefix = "visitingcard";
        }

        return Saveimage.savedocumentinfolder(imageBase64, "");
    }

    [WebMethod]
    public static string SendDownloadLinkviasmswhatsapp(string mobilenumber, string sms, string wapp)
    {
        //mobilenumber = "";
        string result = "Something went wrong";        
        try
        {
            if (UtilityModule.getUserTokenCheck())
            { 
                string textsms = "ट्रकसअप (TrucksUp) में आपका स्वागत है।अब जुड़िए लाखों ट्रक मालिक, ट्रांसपोर्टर, बुकिंग एजेंट, ब्रोकर तथा छोटे बड़े उद्योग समूह से।अब आप दो क्लिक में मनचाहे लोड तथा गाड़ियों से जुड़ सकते हैं।इस सुरक्षित लिंक को क्लिक करें और गूगल प्ले स्टोर से इस ऐप को डाउनलोड करें।लिंक - https://TrkUp.page.link/H3Ed";
                var client = new HttpClient();
                var request = new HttpRequestMessage(HttpMethod.Post, "https://msg.mtalkz.com/V2/http-api-post.php");
                var content = new StringContent("{\r\n    \"apikey\": \"ZiTHUlk27VS48oXd\",\r\n    \"senderid\": \"TRUKUP\",\r\n    \"number\": \""+ mobilenumber + "\",\r\n    \"message\": \"ट्रकसअप (TrucksUp) में आपका स्वागत है।अब जुड़िए लाखों ट्रक मालिक, ट्रांसपोर्टर, बुकिंग एजेंट, ब्रोकर तथा छोटे बड़े उद्योग समूह से।अब आप दो क्लिक में मनचाहे लोड तथा गाड़ियों से जुड़ सकते हैं।इस सुरक्षित लिंक को क्लिक करें और गूगल प्ले स्टोर से इस ऐप को डाउनलोड करें।लिंक - https://TrkUp.page.link/H3Ed\",\r\n   \"unicode\":\"2\",\r\n   \"format\": \"json\"    \r\n}", null, "application/json");
                request.Content = content;

                HttpResponseMessage response = null;
                try
                {
                    response = client.SendAsync(request).Result;
                    response.EnsureSuccessStatusCode(); 
                    string results = response.Content.ReadAsStringAsync().Result; 
                    
                    var responseObject = JsonConvert.DeserializeObject<ResponseObject>(results);

                    // Check if the data array is not null and contains at least one element
                    if (responseObject?.Data?.Count > 0)
                    {
                        // Access the mobile value from the first element in the data array
                        string status = responseObject.Status;
                        if (status.ToLower() == "ok")
                        {
                            result = "true";
                            savesharedlinkdata(textsms, UtilityModule.getParamFromUrl("userid"), mobilenumber, "Y");
                        }
                        else
                        {
                            savesharedlinkdata(textsms, UtilityModule.getParamFromUrl("userid"), mobilenumber, "N");
                        }

                    }
                    else
                    {
                        result = "false";

                    }
                     
                    return result;

                }
                catch (HttpRequestException e)
                {
                    Console.WriteLine($"Request Exception: {e.Message}");
                }
                finally
                {
                    // Ensure to dispose of the HttpClient to avoid resource leaks.
                    client.Dispose();
                }



                return result;
            }

        }
        catch (Exception ex)
        {
            new ExceptionLogging(ex);
            return ex.Message;
        }
        return result;
    }
     
    public static string savesharedlinkdata(string SharedSMS, string SharedBy,
        string SharedTo, string SMSDelivered)
    {
        string result = "N";
        try
        {
            if (UtilityModule.getUserTokenCheck())
            {
                string UserId = UtilityModule.getParamFromUrl("userid");
                string ProcedureName = "ProAddNewVisit";
                string Parameters = "@mode='savesharedlinkdata',@SharedSMS=N'" + SharedSMS
                    + "',@SharedBy='" + SharedBy + "',@SharedTo='" + SharedTo + "',@SMSDelivered='" + SMSDelivered
                    + "',@createdBy='" + UserId + "'";
                new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
            }
        }
        catch (Exception ex)
        {
            new ExceptionLogging(ex);
            return ex.Message;

        }
        return result;
    }

}

public class uploadimagewithstickerList
{
    public string imagewithstickerurl { get; set; }
}

public class uploadimagewithownerList
{
    public string imagewithownerurl { get; set; }
}

public class uploadvisitingcardList
{
    public string VisitingCardUrl { get; set; }
}

public class VehicleInfolist
{
    public string VehicleSize { get; set; }
    public string VehicleType { get; set; }
    public string Vehiclecapacity { get; set; }
    public string VehicleCount { get; set; }
    public string VehicleRC { get; set; }
    public string VehicleNum { get; set; }
    public string DriverNum { get; set; }
}

public class PreferredLoactionList
{
    public string FromLoction { get; set; }
    public string ToLocation { get; set; }
}


public class ResponseObject
{
    public string Status { get; set; }
    public List<DataObject> Data { get; set; }
    public string MsgId { get; set; }
    public string Message { get; set; }
}

public class DataObject
{
    public string Id { get; set; }
    public string Mobile { get; set; }
    public string Status { get; set; }
}
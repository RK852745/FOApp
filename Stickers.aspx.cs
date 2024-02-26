using GymMvc.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using ThirdParty.BouncyCastle.Utilities.IO.Pem;
using static System.Data.Entity.Infrastructure.Design.Executor;
using System.Runtime;
using System.Runtime.InteropServices;
using System.Web.Providers.Entities;
using System.IO;
using Newtonsoft.Json.Linq;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Threading.Tasks;

public partial class Stickers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CheckSession();
        bool Network = IsConnectedToInternet();
        if (Network == false)
        {
            networkalert.Visible = false;
            
        }
        else
        {

            networkalert.Visible = false;
        }
    }

    [DllImport("wininet.dll")]
    private extern static bool InternetGetConnectedState(out int Description, int ReservedValue);
    //Creating a function that uses the API function...  
    public static bool IsConnectedToInternet()
    {
        int Desc;
        return InternetGetConnectedState(out Desc, 0);
    }
    private void CheckSession()
    {
        try
        {
            if (!UtilityModule.AdminSessionCheck())
            {
                Response.Redirect(UtilityModule.getLoginPageUrl());
            }
            GetCounts();
            GetCountsDhaba();


        }
        catch (Exception ex)
        {
            new ExceptionLogging(ex);   
            Response.Redirect(UtilityModule.getLoginPageUrl());
        }
    }
    public void GetCounts()
    {
        string Result = "";
        try
        {
            string UserId = UtilityModule.getParamFromUrl("userid");
            string ProcedureName = "SP_StickerVisits";
            string Parameters = "@mode='GetCountOftheday',@createdby='" + UserId + "'";
            new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
            if (ds != null && ds.Tables.Count > 0)
            {
                dailyvisitcounts.InnerText = ds.Tables[0].Rows[0]["Counts"].ToString();
                H1.InnerText = ds.Tables[0].Rows[0]["StickerSize"].ToString();
            }
        }
        catch (Exception ex)
        {
            new ExceptionLogging(ex);
            Result = "error|Some Error Occured";
        }
    }


    public void GetCountsDhaba()
    {
        string Result = "";
        try
        {
            string UserId = UtilityModule.getParamFromUrl("userid");
            string ProcedureName = "SP_StickerMasterDhaba";
            string Parameters = "@mode='GetCountOfthedaybyuserid',@createdby='" + UserId + "'";
            new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
            if (ds != null && ds.Tables.Count > 0)
            {
                dailyvisitcountsDhaba.InnerText = ds.Tables[0].Rows[0]["CountOfTheDayByUserId"].ToString();
            }
        }
        catch (Exception ex)
        {
            new ExceptionLogging(ex);
            Result = "error|Some Error Occurred";
        }
    }


    [WebMethod]
    public static string MethodAddNewStickerVisitData(List<DataLists> DataList)
    {
        string Result = "";

        if (string.IsNullOrEmpty(DataList[0].stickerimg))
        {
            Result = "warning|Please upload sticker img";
            return Result;
        }
        if (string.IsNullOrEmpty(DataList[0].StickerSize))
        {
            Result = "warning|Please enter sticker size";
            return Result;
        }
        if (string.IsNullOrEmpty(DataList[0].vehiclenumber))
        {
            Result = "warning|Please enter vehicle number";
            return Result;
        }
        try
        {
            bool network = IsConnectedToInternet();
            if (network == false)
            {
                if (string.IsNullOrEmpty(DataList[0].UserMobile))
                {
                    Result = "warning|Please enter user mobile number";
                    return Result;
                }

                DataLists dst = new DataLists();
                dst.userid = DataList[0].userid;
                dst.UserMobile = DataList[0].UserMobile;
                dst.FullName = DataList[0].FullName;
                dst.DriverNo = DataList[0].DriverNo;
                dst.OperatorNo = DataList[0].OperatorNo;
                dst.Downloads = DataList[0].Downloads;
                dst.stickerimg = DataList[0].stickerimg;
                dst.vehicleCapacity = DataList[0].vehicleCapacity;
                dst.vehicleCount = DataList[0].vehicleCount;
                dst.LaneFrom = DataList[0].LaneFrom;
                dst.LaneTo = DataList[0].LaneTo;
                dst.StickerSize = DataList[0].StickerSize;
                dst.vehicleType = DataList[0].vehicleType;
                dst.vehicleSize = DataList[0].vehicleSize;
                dst.vehiclenumber = DataList[0].vehiclenumber.ToUpper();

                var serializer = new JavaScriptSerializer();
                string outputPath = HttpContext.Current.Server.MapPath("~/DataFileOfflline.json");

                // Load current list from the file
                string currentList = System.IO.File.ReadAllText(outputPath);
                List<DataLists> screenData = serializer.Deserialize<List<DataLists>>(currentList);

                // Add the new object to this list
                screenData.Add(dst);

                // Serialize the list including the new object, and replace the file
                string jsonWithNewObject = serializer.Serialize(screenData);
                System.IO.File.WriteAllText(outputPath, jsonWithNewObject);

                Result = "success|Data is not stored in the database; it's stored locally. Please push your data whenever you come to a network area";
                return Result;
            }
            else
            {
                string UserId = UtilityModule.getParamFromUrl("userid");               
                string ProcedureName = "SP_StickerVisits";
                string Parameters = "@mode='insertstickervisit',@createdby='" + UserId
                    + "',@FullName='" + DataList[0].FullName + "',@DriverNumber='" + DataList[0].DriverNo
                    + "',@OperatorNumber='" + DataList[0].OperatorNo + "',@Downloads='" + DataList[0].Downloads
                    + "',@StickerImage='" + DataList[0].stickerimg + "',@StickerSize='" + DataList[0].StickerSize
                    + "',@LaneFrom='" + DataList[0].LaneFrom + "',@LaneTo='" + DataList[0].LaneTo
                    + "',@VehicleType='" + DataList[0].vehicleType + "',@VehicleSize='" + DataList[0].vehicleSize
                    + "',@VehicleCapacity='" + DataList[0].vehicleCapacity + "',@VechileNumber='" + DataList[0].vehiclenumber
                    + "',@DoneBy='" + UserId + "',@VerifiedStatus='0',@VerifiedBy='',@StickerDimension='" + DataList[0].StickerDimension + "'";
                new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
                if (ds != null && ds.Tables.Count > 0)
                {
                    Result = ds.Tables[0].Rows[0]["result"].ToString();
                    return Result;
                }
            }
        }
        catch (Exception ex)
        {
            new ExceptionLogging(ex);
            Result = "error|Some Error Occurred";
            return Result;
        }
        return Result;
    }

    [WebMethod]
    public static string MethodDhabaVisitData(List<DhabaData> DataList)
    {
        string Result = "";

        if (string.IsNullOrEmpty(DataList[0].DhabaName))
        {
            Result = "warning|Please enter Dhaba Name";
            return Result;
        }

        if (string.IsNullOrEmpty(DataList[0].DhabaOwnerNumber))
        {
            Result = "warning|Please enter Dhaba Owner Number";
            return Result;
        }

        if (string.IsNullOrEmpty(DataList[0].Address))
        {
            Result = "warning|Please Enter Address";
            return Result;
        }
        if (string.IsNullOrEmpty(DataList[0].OwnerName))
        {
            Result = "warning|Please enter  Owner Name";
            return Result;
        }
        if (string.IsNullOrEmpty(DataList[0].stickerimg))
        {
            Result = "warning|Please upload sticker img";
            return Result;
        }

        try
        {
            bool network = IsConnectedToInternet();
            if (network == false)
            {
                if (string.IsNullOrEmpty(DataList[0].UserMobile))
                {
                    Result = "warning|Please enter user mobile number";
                    return Result;
                }

                DhabaData dhabaData = new DhabaData();
                dhabaData.userid = DataList[0].userid;
                dhabaData.UserMobile = DataList[0].UserMobile;
                dhabaData.DhabaName = DataList[0].DhabaName;
                dhabaData.DhabaOwnerNumber = DataList[0].DhabaOwnerNumber;
                dhabaData.Address = DataList[0].Address;
                dhabaData.OwnerName = DataList[0].OwnerName;
                dhabaData.stickerimg = DataList[0].stickerimg;
                dhabaData.Latitude = DataList[0].Latitude;
                dhabaData.Longitude = DataList[0].Longitude;

                var serializer = new JavaScriptSerializer();
                string outputPath = HttpContext.Current.Server.MapPath("~/DhabaDataOffline.json");

              
                string currentList = System.IO.File.ReadAllText(outputPath);
                List<DhabaData> dhabaDataList = serializer.Deserialize<List<DhabaData>>(currentList);

                dhabaDataList.Add(dhabaData);

                string jsonWithNewObject = serializer.Serialize(dhabaDataList);
                System.IO.File.WriteAllText(outputPath, jsonWithNewObject);

                Result = "success|Data is not stored in database, it's in local storage. Please push your data whenever you come to a network area.";
                return Result;
            }
            else
            {
                string UserId = UtilityModule.getParamFromUrl("userid");
                string ProcedureName = "SP_StickerMasterDhaba";
                string Parameters = "@mode='InsertStickervisit',@createdby='" + UserId
                + "',@DhabaName='" + DataList[0].DhabaName + "',@DhabaOwnerNumber='" + DataList[0].DhabaOwnerNumber
                + "',@Address='" + DataList[0].Address + "',@OwnerName='" + DataList[0].OwnerName
                + "',@StickerImageName='" + DataList[0].stickerimg + "',@Latitude=" + DataList[0].Latitude + ",@Longitude=" + DataList[0].Longitude;

                new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
                if (ds != null && ds.Tables.Count > 0)
                {
                    Result = ds.Tables[0].Rows[0]["result"].ToString();
                    return Result;
                }
            }
        }
        catch (Exception ex)
        {
            new ExceptionLogging(ex);
            Result = "error|Some Error Occured";
            return Result;
        }
        return Result;
    }

    //public static string DeleteCompany(string id)
    //{
    //   string jsonFile = HttpContext.Current.Server.MapPath("~/DataFileOfflline.json");

    //    var json = File.ReadAllText(jsonFile);
    //    try
    //    { 
    //            var companyName = string.Empty;
    //        var companyToDeleted = json.FirstOrDefault(obj => obj["userid"].Value<string>() == id);
    //        json.Remove(companyToDeleted);
    //            string output = Newtonsoft.Json.JsonConvert.SerializeObject(json, Newtonsoft.Json.Formatting.Indented);
    //            File.WriteAllText(jsonFile, output); 
    //        return "Y";
    //    }
    //    catch (Exception)
    //    {

    //        throw;
    //    }
    //}

    [WebMethod]
    public static string MethodAddLocalVisitDataintodatabase(List<DataLists> DataPushList)
    {
        string Result = "";
        List<DataLists> DataPushLists = new List<DataLists>();
        for (int i = 0; i < DataPushList.Count; i++)
        {
            DataPushLists.Add(new DataLists
            {
                userid = DataPushList[i].userid,
                UserMobile = DataPushList[i].UserMobile,
                FullName = DataPushList[i].FullName,
                DriverNo = DataPushList[i].DriverNo,
                OperatorNo = DataPushList[i].OperatorNo,
                Downloads = DataPushList[i].Downloads,
                stickerimg = DataPushList[i].stickerimg,
                StickerSize = DataPushList[i].StickerSize,
                LaneFrom = DataPushList[i].LaneFrom,
                LaneTo = DataPushList[i].LaneTo,
                vehicleType = DataPushList[i].vehicleType,
                vehicleSize = DataPushList[i].vehicleSize,
                vehicleCapacity = DataPushList[i].vehicleCapacity,
                vehicleCount = DataPushList[i].vehicleCount,
                vehiclenumber = DataPushList[i].vehiclenumber
            });

            //DeleteCompany(DataPushList[i].userid);
        }

        string LocalXML = UtilityModule.getXmlFromList("Insertlocallist", DataPushLists);
        string UserId = UtilityModule.getParamFromUrl("userid");
        string ProcedureName = "SP_StickerVisits";
        string Parameters = "@mode='insertstickervisitfromlocalstorage',@createdby='" + UserId
            + "',@LocalXML='" + LocalXML + "'";
        new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
        if (ds != null && ds.Tables.Count > 0)
        {
            Result = ds.Tables[0].Rows[0]["result"].ToString();
            return Result;
        }


        return "";
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
    public static bool MethodCheckMobileNumber(string Mobile)
    {
        bool Result = false;
        try
        {
            string UserId = UtilityModule.getParamFromUrl("userid");
            string ProcedureName = "Proc_checkdownloadstatus";
            string Parameters = "@mobile='" + Mobile + "'";
            new cl_DataSetClass(out DataSet ds, ProcedureName, Parameters);
            if (ds != null && ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["mobileno"].ToString() != "")
                {
                    Result = true;
                }

            }
        }
        catch (Exception ex)
        {
            new ExceptionLogging(ex);
            Result = false;
        }
        return Result;
    }

}

public class DataLists
{
    public string userid { get; set; }
    public string UserMobile { get; set; }
    public string FullName { get; set; }
    public string DriverNo { get; set; }
    public string OperatorNo { get; set; }
    public string Downloads { get; set; }
    public string stickerimg { get; set; }
    public string StickerSize { get; set; }
    public string LaneFrom { get; set; }
    public string LaneTo { get; set; }
    public string vehicleType { get; set; }
    public string vehicleSize { get; set; }
    public string vehicleCapacity { get; set; }
    public string vehicleCount { get; set; }
    public string vehiclenumber { get; set; }
    public string StickerDimension { get; set; }
}
public class DhabaData
{
    public string userid { get; set; }
    public string UserMobile { get; set; }
    public string DhabaName { get; set; }
    public string DhabaOwnerNumber { get; set; }
    public string Address { get; set; }
    public string OwnerName { get; set; }
    public string stickerimg { get; set; }
    public double Latitude { get; set; }
    public double Longitude { get; set; }
}


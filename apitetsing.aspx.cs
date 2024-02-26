using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Net.Mime;

public partial class apitetsing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        postRequest();
    }

    public async void postRequest()
    {
        using (MultipartFormDataContent multipartContent = new MultipartFormDataContent())
        {
            multipartContent.Add(new StringContent("50faa9811bcfa5b7c5e05aefa3d84e4e", Encoding.UTF8, MediaTypeNames.Text.Plain), "authcode");
            multipartContent.Add(new StringContent("8076629495", Encoding.UTF8, MediaTypeNames.Text.Plain), "contact_num");
            multipartContent.Add(new StringContent("Suraj Singh", Encoding.UTF8, MediaTypeNames.Text.Plain), "contact_name");

            using (var client = new HttpClient())
            {
                string uri = "https://app.callerdesk.io/api/savecontact_v2";
                client.BaseAddress = new Uri("https://app.callerdesk.io/api/savecontact_v2");
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                HttpResponseMessage response = await client.PostAsync(uri, multipartContent);

                if (response.IsSuccessStatusCode)
                {
                }
            }
        }
    }
    //            using var response =   _httpClient.PostAsync("http://localhost:5272/upload-form", multipartContent);
    //if (response.Is)
    //{
    //    // Data uploaded successfully.
    //}
    //var client = new HttpClient(); 
    //client.Timeout = TimeSpan.FromSeconds(300);
    //client.DefaultRequestHeaders.Accept.Add(
    //new MediaTypeWithQualityHeaderValue("application/json")); 
    //var request = new HttpRequestMessage();
    //request.Method = HttpMethod.Post;
    //request.RequestUri = new Uri("https://app.callerdesk.io/api/savecontact_v2"); 

    //var content = new MultipartFormDataContent(); 
    //content.Add(new StringContent("50faa9811bcfa5b7c5e05aefa3d84e4e"), "authcode");
    //content.Add(new StringContent("8076629495"), "contact_num");
    //content.Add(new StringContent("Suraj Singh"), "contact_name"); 

    //request.Content = content;

    //var header = new ContentDispositionHeaderValue("form-data");
    //request.Content.Headers.ContentDisposition = header; 
    //var response = client.PostAsync(request.RequestUri.ToString(), request.Content);
    //var result = response.Content.ReadAsStringAsync().Result;
}


using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.ServiceProcess;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections.Specialized;
using System.Net.WebSockets;
using System.Threading;
using System.Timers;
using System.Web.UI;
using System.Web.Services;
using System.Web.Script.Services;

public partial class PaymentByCard : BasePage
{

    // page = null;
    System.Threading.Timer timer = null;
    Thread _thread = null;
    static string urnnumber = "";
    string tid = "";
    static string stat = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        tid = ConfigurationManager.AppSettings["terminalID"].ToString();

        //if (Session["Consumer_WTbalance"] == null && Session["Consumer_WTbalance"].ToString() == "")
        //{ Response.Redirect("WaterTax.aspx"); }
        if (tid == "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "js", "alert('Invalid terminal id');");
        }

        new Thread(new ThreadStart(Load)).Start();
        
        Session["ermsg"] = "";
    }


    void Load() {
        while (true)
            if (stat == "success") {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "js", "alert('Invalid terminal id');");
            }
    }

    
    void Page_LoadComplete(object sender, EventArgs e)
    {
        hiddenlabel.Value = Session["AccountLabel"].ToString();

        if (Session["AccountLabel"].ToString().ToLower() == "water")
        {
            makingWTPayment();
        }
        else if (Session["AccountLabel"].ToString().ToLower() == "property")
        {
            makingPTPayment();
        }


    }

    public class RequestWaterTax
    {
        public string consumerID;
    }
    public class ResponseWaterTax
    {
        public string propertyName;
        public string balance;
        public string propertyAddress;
        public string finalUseType;
        public string consumerID;
        public string gatName;
        public string zoneName;
    }


    public class JsonParams
    {
        public string username; 
        public InputParams input;
    }




    public class Worldline_cardresponse
    {
        public int response_code { get; set; }
        public string response_message { get; set; }
        public string urn { get; set; }
        public string tid { get; set; }
        public string amount { get; set; }
        public string invoiceNumber { get; set; }
        public string rrn { get; set; }
        public string type { get; set; }
        public string app_code { get; set; }
        public string cb_amt { get; set; }
        public string tokenisedValue { get; set; }
    }


    private void makingPTPayment()
    {
        try
        {

            Worldline_cardrequest kioskCardRequest = new Worldline_cardrequest
            {
                tid = tid,

                amount = Session["Consumer_PTbalance"].ToString(),
                organization_code = "LIPI",
                additional_attribute1 = "PCMC",
                additional_attribute2 = Session["ConsumerID"].ToString(),
                additional_attribute3 = Session["AccountLabel"].ToString(),
                invoiceNumber = "",
                rrn = "",
                type = "SALE",
                cb_amt = "",
                app_code = "",
                tokenisedValue = ""
            };

            //input objAbortJsonParams = new input();
            //objAbortJsonParams.username = "2222214001";

            //Session["JsonParamsAbort"] = objAbortJsonParams;
            //JsonParams objJsonParams = new JsonParams();
            //objJsonParams.username = "2222214001";
            //objJsonParams.input = new InputParams();
            //objJsonParams.input.amount = Convert.ToInt32(2);
            //objJsonParams.input.type = "TXN_CARD_AUTH";
            //objJsonParams.input.orderid = DateTime.Now.ToString("yyMMddHHmmss");
            //objJsonParams.input.customerMobile = "9694444444";
            //objJsonParams.input.accountLabel = "WATER";

            //Session["AccountLabel"] = "WATER";
            //Session["Consumer_WTbalance"] = txtAmountToPay.Text;
            //Session["JsonParams"] = objJsonParams;

            string strURL = URLS.url.allurls.kiosk_card_request;
            DataContractJsonSerializer objRequestJsonSerializer = new DataContractJsonSerializer(typeof(Worldline_cardrequest));
            MemoryStream objMemoryStream = new MemoryStream();
            objRequestJsonSerializer.WriteObject(objMemoryStream, kioskCardRequest);

            WebClient objWebClient = new WebClient();
            ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
            ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
            objWebClient.Headers[HttpRequestHeader.ContentType] = "application/json";
            //  objWebClient.Headers["apikey"] = "U0ydhj7MnzXc4PfgIKs9NmcKSWQA7asOP";

            string strResponse = objWebClient.UploadString(strURL, "POST", Encoding.Default.GetString(objMemoryStream.ToArray()));
            DataContractJsonSerializer objJsonSerializerRes = new DataContractJsonSerializer(typeof(Worldline_cardresponse));
            MemoryStream objMSRes = new MemoryStream(Encoding.Default.GetBytes(strResponse));
            Worldline_cardresponse objResponse = (Worldline_cardresponse)objJsonSerializerRes.ReadObject(objMSRes);

            if (objResponse.response_code == 0 && objResponse.response_message != null && objResponse.response_message.ToLower() == "success")
            {
                //divloader.Style.Add("display", "block");
                Session["urnnumber"] = urnnumber = objResponse.urn;
            }
            else
            {
                //this.Page.RegisterStartupScript("alert", "alert('Invalid response received!')");
            }
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
    }
     void makingWTPayment()
    {
        try
        {

            Worldline_cardrequest kioskCardRequest = new Worldline_cardrequest
            {
                tid = tid,
                amount = Session["Consumer_WTbalance"].ToString(),
                organization_code = "LIPI",
                additional_attribute1 = "PCMC",
                additional_attribute2 = Session["ConsumerIDWater"].ToString(),
                additional_attribute3 = Session["AccountLabel"].ToString(),
                invoiceNumber = "",
                rrn = "",
                type = "SALE",
                cb_amt = "",
                app_code = "",
                tokenisedValue = ""
            };

            //input objAbortJsonParams = new input();
            //objAbortJsonParams.username = "2222214001";

            //Session["JsonParamsAbort"] = objAbortJsonParams;
            //JsonParams objJsonParams = new JsonParams();
            //objJsonParams.username = "2222214001";
            //objJsonParams.input = new InputParams();
            //objJsonParams.input.amount = Convert.ToInt32(2);
            //objJsonParams.input.type = "TXN_CARD_AUTH";
            //objJsonParams.input.orderid = DateTime.Now.ToString("yyMMddHHmmss");
            //objJsonParams.input.customerMobile = "9694444444";
            //objJsonParams.input.accountLabel = "WATER";

            //Session["AccountLabel"] = "WATER";
            //Session["Consumer_WTbalance"] = txtAmountToPay.Text;
           

            string strURL = URLS.url.allurls.kiosk_card_request;
            DataContractJsonSerializer objRequestJsonSerializer = new DataContractJsonSerializer(typeof(Worldline_cardrequest));
            MemoryStream objMemoryStream = new MemoryStream();
            objRequestJsonSerializer.WriteObject(objMemoryStream, kioskCardRequest);

            WebClient objWebClient = new WebClient();
            ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
            ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
            objWebClient.Headers[HttpRequestHeader.ContentType] = "application/json";
            //  objWebClient.Headers["apikey"] = "U0ydhj7MnzXc4PfgIKs9NmcKSWQA7asOP";

            string strResponse = objWebClient.UploadString(strURL, "POST", Encoding.Default.GetString(objMemoryStream.ToArray()));
            DataContractJsonSerializer objJsonSerializerRes = new DataContractJsonSerializer(typeof(Worldline_cardresponse));
            MemoryStream objMSRes = new MemoryStream(Encoding.Default.GetBytes(strResponse));
            Worldline_cardresponse objResponse = (Worldline_cardresponse)objJsonSerializerRes.ReadObject(objMSRes);

            if (objResponse.response_code == 0 && objResponse.response_message != null && objResponse.response_message.ToLower() == "success")
            {
                //divloader.Style.Add("display", "block");
                Session["urnnumber"] = urnnumber = objResponse.urn;
                

                StatusResponse checkObjResp = null;

            }
            else
            {
                //this.Page.RegisterStartupScript("alert", "alert('Invalid response received!')");
            }
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
    }


    [WebMethod(enableSession: true)]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string chkStatus()
    {
        StatusResponse objResponse = new StatusResponse();
        try
        {
            string strURL = URLS.url.allurls.checkworldlinestatus; //"https://esb.in.worldline.com:8443/retail/statusCheckType4?";
            string methosParams = "urn=" + urnnumber;

            WebClient objWebClient = new WebClient();
            ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
            ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
            //  objWebClient.Headers["apikey"] = "U0ydhj7MnzXc4PfgIKs9NmcKSWQA7asOP";

            string strResponse = objWebClient.DownloadString(strURL + methosParams);
            DataContractJsonSerializer objJsonSerializerRes = new DataContractJsonSerializer(typeof(StatusResponse));
            MemoryStream objMSRes = new MemoryStream(Encoding.Default.GetBytes(strResponse));
            objResponse = (StatusResponse)objJsonSerializerRes.ReadObject(objMSRes);
            
            //objResponse.status = "success";

        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        return objResponse.status;
    }

    private StatusResponse CheckStatus()
    {
        StatusResponse objResponse = new StatusResponse();
        try
        {
            string strURL = URLS.url.allurls.checkworldlinestatus; //"https://esb.in.worldline.com:8443/retail/statusCheckType4?";
            string methosParams = "urn=" + urnnumber;

            WebClient objWebClient = new WebClient();
            ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
            ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
            //  objWebClient.Headers["apikey"] = "U0ydhj7MnzXc4PfgIKs9NmcKSWQA7asOP";

            string strResponse = objWebClient.DownloadString(strURL + methosParams);
            DataContractJsonSerializer objJsonSerializerRes = new DataContractJsonSerializer(typeof(StatusResponse));
            MemoryStream objMSRes = new MemoryStream(Encoding.Default.GetBytes(strResponse));
            objResponse = (StatusResponse)objJsonSerializerRes.ReadObject(objMSRes);

            Thread.Sleep(2000);
           objResponse.status = "success";
           
           
        
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        return objResponse;
    }



    private static bool bypassAllCertificateStuff(object sender, X509Certificate cert, X509Chain chain, System.Net.Security.SslPolicyErrors error)
    {
        return true;
    }

    public class Worldline_cardrequest
    {
        public string tid { get; set; }
        public string amount { get; set; }
        public string organization_code { get; set; }
        public string additional_attribute1 { get; set; }
        public string additional_attribute2 { get; set; }
        public string additional_attribute3 { get; set; }
        public string invoiceNumber { get; set; }
        public string rrn { get; set; }
        public string type { get; set; }
        public string cb_amt { get; set; }
        public string app_code { get; set; }
        public string tokenisedValue { get; set; }
    }

    public class StatusResponse
    {
        public string tid { get; set; }
        public string amount { get; set; }
        public string billing_number { get; set; }
        public int response_code { get; set; }
        public string response_message { get; set; }
        public string additional_attribute1 { get; set; }
        public string additional_attribute2 { get; set; }
        public string additional_attribute3 { get; set; }
        public string rrn { get; set; }
        public string card_scheme { get; set; }
        public string txn_date { get; set; }
        public string txn_time { get; set; }
        public string mid { get; set; }
        public string masked_card_number { get; set; }
        public string txn_type { get; set; }
        public string status { get; set; }
        public string urn { get; set; }
        public string fetch_count { get; set; }
        public string batchNumber { get; set; }
        public string app_code { get; set; }
        public string type { get; set; }
        public string invoicenumber { get; set; }
        public string cb_amt { get; set; }
        public string tokenised_value_of_card_number { get; set; }
        public string tvr { get; set; }
        public string tsi { get; set; }
        public string tc { get; set; }
        public string chip { get; set; }
        public string card_holder_name { get; set; }
        public string aid { get; set; }
        public string capture_method { get; set; }
    }

    public class status
    {
        public string urn { get; set; }
    }

    protected void gdview_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == System.Web.UI.WebControls.DataControlRowType.Header)
            {
                e.Row.Visible = false;
            }
        }
        catch (Exception ex)
        {

            throw;
        }
    }


}




//public class InputParams
//{
//    public int amount;
//    public string type;
//    public string orderid;
//    public string customerMobile;
//    public string accountLabel;
//}

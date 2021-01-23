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

public partial class PaymentByCard : BasePage
{


    Thread _mThread = null;
    static string urnnumber = "";
    string tid = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        tid = ConfigurationManager.AppSettings["terminalID"].ToString();

        //if (Session["Consumer_WTbalance"] == null && Session["Consumer_WTbalance"].ToString() == "")
        //{ Response.Redirect("WaterTax.aspx"); }
        if (tid == "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "js", "alert('Invalid terminal id');");
        }




        Session["ermsg"] = "";
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

                StatusResponse checkObjResp = CheckStatus();

                if (checkObjResp != null)
                {
                    //lblrespmsg.InnerText = objResponse.status == null || objResponse.status == "" ? "-NIL-" : objResponse.status;
                    //lblamount.InnerText = objResponse.amount == null || objResponse.amount == "" ? "-NIL-" : objResponse.amount;
                    //lblurnnumber.InnerText = objResponse.urn == null || objResponse.urn == "" ? "-NIL-" : objResponse.urn;
                    //lblbillingnumber.InnerText = objResponse.billing_number == "" ? "-NIL-" : objResponse.billing_number;
                    //lbldate.InnerText = objResponse.txn_date == null || objResponse.txn_date == "" ? "-NIL-" : objResponse.txn_date;
                    //lbltime.InnerText = objResponse.txn_time == null || objResponse.txn_time == "" ? "-NIL-" : objResponse.txn_time;

                    //divloader.Style.Add("display", "none");

                    if (checkObjResp.response_code == 1)
                    {

                        // error_div.Style.Add("display", "block");
                        Session["Status"] = checkObjResp.status;
                        Session["ermsg"] = checkObjResp.response_message;
                        
                        //myModal.Attributes.Add("class", "modal fade hide");
                     

                    }
                    else if (checkObjResp.status.ToLower() == "initiate" && objResponse.response_code == 0)
                    {
                        Session["Status"] = checkObjResp.status = "Declined";
                        Session["paymentMode"] = "card";
                    }
                    else
                    {
                        Session["PaymentStatus"] = "Auth / completed successful";
                        lblrespmsg.InnerText = "Auth / completed successful";
                        Session["paymentMode"] = "card";
                        // Response.Redirect("PrintReciptWaterTaxEzetap.aspx");
                        // myModal.Attributes.Add("class", "fade modal-lg show");
                        //statusdiv.Style.Add("display", "none");
                        //error_div.Style.Add("display", "none");
                        //modaldialog.Style.Add("display", "block");
                    }
                    //Response.Redirect("PrintReceiptNew.aspx");
                }
                else
                {
                    //this.Page.RegisterStartupScript("alert", "alert('Invalid response received!')");
                }
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
    private void makingWTPayment()
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

                StatusResponse checkObjResp = CheckStatus();

                if (checkObjResp != null)
                {
                    //lblrespmsg.InnerText = objResponse.status == null || objResponse.status == "" ? "-NIL-" : objResponse.status;
                    //lblamount.InnerText = objResponse.amount == null || objResponse.amount == "" ? "-NIL-" : objResponse.amount;
                    //lblurnnumber.InnerText = objResponse.urn == null || objResponse.urn == "" ? "-NIL-" : objResponse.urn;
                    //lblbillingnumber.InnerText = objResponse.billing_number == "" ? "-NIL-" : objResponse.billing_number;
                    //lbldate.InnerText = objResponse.txn_date == null || objResponse.txn_date == "" ? "-NIL-" : objResponse.txn_date;
                    //lbltime.InnerText = objResponse.txn_time == null || objResponse.txn_time == "" ? "-NIL-" : objResponse.txn_time;

                    //divloader.Style.Add("display", "none");

                    if (checkObjResp.response_code == 1)
                    {

                        // error_div.Style.Add("display", "block");
                        Session["Status"] = checkObjResp.status;
                        Session["ermsg"] = checkObjResp.response_message;
                        statusdiv.Style.Add("display", "block");
                        myModal.Attributes.Add("class", "modal fade hide");
                        Response.Redirect("PrintReceiptWaterTaxEzetap.aspx");

                    }
                    else if (checkObjResp.status.ToLower() == "initiate" && objResponse.response_code == 0)
                    {

                        Session["Status"] = checkObjResp.status = "Declined";
                        Session["paymentMode"] = "card";
                    }
                    else
                    {
                        Session["PaymentStatus"] = "Auth / completed successful";
                        lblrespmsg.InnerText = "Auth / completed successful";
                        Session["paymentMode"] = "card";
                        // Response.Redirect("PrintReciptWaterTaxEzetap.aspx");
                        // myModal.Attributes.Add("class", "fade modal-lg show");
                        //statusdiv.Style.Add("display", "none");
                        //error_div.Style.Add("display", "none");
                        //modaldialog.Style.Add("display", "block");
                    }
                }
                else
                {
                    //this.Page.RegisterStartupScript("alert", "alert('Invalid response received!')");
                }

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

    private StatusResponse CheckStatus()
    {
        StatusResponse objResponse = new StatusResponse();
        try
        {
            string strURL = "https://esb.in.worldline.com:8443/retail/statusCheckType4?";
            string methosParams = "urn=" + urnnumber;

            WebClient objWebClient = new WebClient();
            ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
            ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
            //  objWebClient.Headers["apikey"] = "U0ydhj7MnzXc4PfgIKs9NmcKSWQA7asOP";

            string strResponse = objWebClient.DownloadString(strURL + methosParams);
            DataContractJsonSerializer objJsonSerializerRes = new DataContractJsonSerializer(typeof(StatusResponse));
            MemoryStream objMSRes = new MemoryStream(Encoding.Default.GetBytes(strResponse));
            objResponse = (StatusResponse)objJsonSerializerRes.ReadObject(objMSRes);
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



public class input
{
    public string username;
    public string Password;

}

public class InputParams
{
    public int amount;
    public string type;
    public string orderid;
    public string customerMobile;
    public string accountLabel;
}
public class Root
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
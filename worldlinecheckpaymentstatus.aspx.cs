using System;
using System.Collections.Specialized;
using System.Data;
using System.IO;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using WebSocketSharp;
public partial class worldlinecheckpaymentstatus : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //lblamount.InnerText = "Amount : "+jsonString.amount;
        //lblinvoicenumber.InnerText = "Invoice : " + jsonString.invoiceNumber;
        //lblresponsemessage.InnerText = "Response : " + jsonString.response_message;
        Session["ermsg"] = "";

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

    public class InputParams
    {
        public int amount;
        public string type;
        public string orderid;
        public string customerMobile;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            // Response.Redirect("~/JSP/test.html");
            using (var ws = new WebSocket("ws://localhost:8080/abort"))
            {
                ws.Connect();
                ws.Send("{\"username\":\"9922501200\"}");
                ws.Close();
            }
        }
        catch (Exception)
        {

        }

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


    protected void btnCheckStatus_Click(object sender, EventArgs e)
    {
        try
        {

            string strURL = "https://esb.in.worldline.com:8443/retail/statusCheckType4?";
            string methosParams = "urn=" + txturnnumber.Text;

            var data = new NameValueCollection();
            data.Add("urn", "2311");

            WebClient objWebClient = new WebClient();
            ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
            ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
            //  objWebClient.Headers["apikey"] = "U0ydhj7MnzXc4PfgIKs9NmcKSWQA7asOP";

            string strResponse = objWebClient.DownloadString(strURL + methosParams);
            DataContractJsonSerializer objJsonSerializerRes = new DataContractJsonSerializer(typeof(StatusResponse));
            MemoryStream objMSRes = new MemoryStream(Encoding.Default.GetBytes(strResponse));
            StatusResponse objResponse = (StatusResponse)objJsonSerializerRes.ReadObject(objMSRes);

            if (objResponse != null)
            {
                lblrespmsg.InnerText = objResponse.status == null|| objResponse.status == "" ? "-NIL-" : objResponse.status;
                lblamount.InnerText = objResponse.amount ==null || objResponse.amount == "" ? "-NIL-" : objResponse.amount;
                lblurnnumber.InnerText = objResponse.urn == null|| objResponse.urn == "" ? "-NIL-" : objResponse.urn;
                lblbillingnumber.InnerText = objResponse.billing_number == "" ? "-NIL-" : objResponse.billing_number;
                lbldate.InnerText = objResponse.txn_date==null|| objResponse.txn_date == "" ? "-NIL-": objResponse.txn_date;
                lbltime.InnerText = objResponse.txn_time == null || objResponse.txn_time=="" ? "-NIL-" : objResponse.txn_time;




                DataTable table = new DataTable();
                table.Columns.Add(" ");
                table.Columns.Add("  ");

                if ( objResponse.response_code == 1)
                {
                    error_div.Style.Add("display", "block");
                    Session["ermsg"] = objResponse.response_message;
                    statusdiv.Style.Add("display", "block");
                    myModal.Attributes.Add("class", "modal fade hide");

                } else if (objResponse.status.ToLower()== "expired"&&objResponse.response_code==0) {
                    lblrespmsg.InnerText = "Failed";
                    error_div.Style.Add("display", "none");
                    statusdiv.Style.Add("display", "none");
                   // Session["ermsg"] ="URN number is "+ objResponse.status;
                    myModal.Attributes.Add("class", "fade modal-lg show");
                }
                else if (objResponse.status.ToLower() == "initiate" && objResponse.response_code == 0)
                {
                    lblrespmsg.InnerText = "Open / pending";
                    error_div.Style.Add("display", "none");
                    statusdiv.Style.Add("display", "none");
                   // Session["ermsg"] =  objResponse.status;
                    myModal.Attributes.Add("class", "fade modal-lg show");
                }
                else if (objResponse.status.ToLower() == "fetched" && objResponse.response_code == 0)
                {
                    lblrespmsg.InnerText = "Open / pending";
                    error_div.Style.Add("display", "none");
                    statusdiv.Style.Add("display", "none");
                  //  Session["ermsg"] = objResponse.status;
                    myModal.Attributes.Add("class", "fade modal-lg show");
                }
                else
                {
                    lblrespmsg.InnerText = "Auth / completed successful";
                    myModal.Attributes.Add("class", "fade modal-lg show");
                    statusdiv.Style.Add("display", "none");
                    error_div.Style.Add("display", "none");
                    modaldialog.Style.Add("display", "block");
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
            if (e.Row.RowType == System.Web.UI.WebControls.DataControlRowType.Header) {
                e.Row.Visible = false;
            }
        }
        catch (Exception ex)
        {

            throw;
        }
    }
}
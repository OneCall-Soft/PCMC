using System;
using System.IO;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Web;

public partial class WaterTax : BasePage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        // MARK:- setting up all urls here


        string userRequest = System.Web.HttpContext.Current.Request.UserHostAddress;
        if (!IsPostBack)
        {
            btnmakepayment.Visible = false;
        }
        //lbledit.Text = Resources.Resource.lbledit;
    }
    protected void btn_Home(object sender, EventArgs e)
    {
        //  Session["language"] = "mr";
        Response.Redirect("MainPage.aspx");
    }

    protected void btn_EditPayment(object sender, EventArgs e)
    {
        if (this.txtbalance.ReadOnly == true)
        {
            this.txtbalance.ReadOnly = false;
            lblRupeeSymbol.Visible = false;
        }
        else
        {
            lblRupeeSymbol.Visible = true;
            this.txtbalance.ReadOnly = true;
        }

        // lblRupeeSymbol.Visible = lblbalance.Visible = false;
        // txtbalance.Visible = true;
    }

    //MARK:- WaterTax btn method to show details
    protected void btn_WaterTax(object sender, EventArgs e)
    {
        //divConsumerDetail.Visible = true;
        //btnmakepayment.Visible = true;
        try
        {
            divConsumerDetail.Visible = false;
            lblErrorMsg.InnerText = "";
            lbladdress.InnerText = "";
            lblname.InnerText = "";
            lblbalance.InnerText = "";
            lblward.InnerText = "";
            lblzone.InnerText = "";
            txtbalance.Text = "";

            int n;
            bool isANumber = int.TryParse(this.txtconsumerid.Text, out n);
            if (txtconsumerid.Text.Length == 0 || isANumber == false)
            {
                lblErrorMsg.InnerText = "Please enter a valid consumer ID";
                return;
            }


            //string strURL = URLS.url.allurls.watertaxpcmc;
            string strURL = "https://water.cranb.in/api/kiosk/get_consumer";

            RequestWaterTax ObjRequestWaterTax = new RequestWaterTax();
            ObjRequestWaterTax.consumer_id = txtconsumerid.Text;

            DataContractJsonSerializer objRequestJsonSerializer = new DataContractJsonSerializer(typeof(RequestWaterTax));
            MemoryStream objMemoryStream = new MemoryStream();
            objRequestJsonSerializer.WriteObject(objMemoryStream, ObjRequestWaterTax);

            WebClient objWebClient = new WebClient();
            ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
            ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
            objWebClient.Headers[HttpRequestHeader.ContentType] = "application/json";
            objWebClient.Headers["apikey"] = "U0ydhj7MnzXc4PfgIKs9NmcKSWQA7asOP";

            string strResponse = objWebClient.UploadString(strURL, "POST", Encoding.Default.GetString(objMemoryStream.ToArray()));
            DataContractJsonSerializer objJsonSerializerRes = new DataContractJsonSerializer(typeof(ResponseWaterTax));
            MemoryStream objMSRes = new MemoryStream(Encoding.Default.GetBytes(strResponse));
            ResponseWaterTax objResponse = (ResponseWaterTax)objJsonSerializerRes.ReadObject(objMSRes);
            divConsumerDetail.Visible = true;
            lblConsumerId.InnerText = txtconsumerid.Text;
            lbladdress.InnerText = objResponse.address;
            lblname.InnerText = objResponse.consumer_name;
            Session["WTCustomer_Name"] = objResponse.consumer_name;

            if (Convert.ToInt32(objResponse.balance) < 0)
            {
                var posValue = Math.Abs(Convert.ToDecimal(objResponse.balance));
                // lblbalance.InnerText = posValue.ToString();
                txtbalance.Text = posValue.ToString();
            }
            else
            {
                txtbalance.Text = objResponse.balance;
                //  lblbalance.InnerText = objResponse.balance;
            }
            lblward.InnerText = objResponse.ward;
            lblzone.InnerText = objResponse.zone;
            btnmakepayment.Visible = true;
            // txtbalance.Visible = false;
            // lblRupeeSymbol.Visible = lblbalance.Visible = true;
            // lbledit.Visible = true;


        }
        catch (Exception ex)
        {
            //if (ex.Message == "Unable to connect to the remote server")
            lblErrorMsg.InnerText = "No Connectivity or check consumer Id and try again";
            //else {
            //	lblErrorMsg.InnerText = "No Connectivity At the Moment.Please Try After Some Time";
            //}

            btnmakepayment.Visible = false;
            txtbalance.Visible = false;
            // lblRupeeSymbol.Visible = lblbalance.Visible = false;
            // lbledit.Visible = false;

            lbladdress.InnerText = "";
            lblname.InnerText = "";
            lblbalance.InnerText = "";
            lblward.InnerText = "";
            lblzone.InnerText = "";
            txtbalance.Text = "";
        }
    }

    //MARK:- Billcloud payment method
    protected void btn_MakePayment(object sender, EventArgs e)
    {
        try
        {
            string host = HttpContext.Current.Request.Url.Host;

            //UAT 
            //  string strURL = "https://water.cranb.in/api/kiosk/kiosk_request";
            string strURL = URLS.url.allurls.withoutcard_kiosk_request;

            //string strURL = URLS.url.allurls.kisokrequest;
            ReqBilldeskApi ObjReqPayuApi = new ReqBilldeskApi();
            ObjReqPayuApi.consumer_id = txtconsumerid.Text;
            ObjReqPayuApi.amount = txtbalance.Text;
            ObjReqPayuApi.kiosk_machine_id = "A3456371";
            ObjReqPayuApi.request_type = "KIOSK";
            ObjReqPayuApi.platform = "KIOSK";



            //Live code with settalment
            // ObjReqPayuApi.surl = "http://localhost:57227/PrintReceiptNewWater.aspx";

            // ObjReqPayuApi.furl = "http://localhost:57227/PrintReceiptNewWater.aspx";
            // ObjReqPayuApi.furl = "http://172.16.19.230/PCMC/PrintReceiptNewWater.aspx";


            ObjReqPayuApi.surl = URLS.url.allurls.surl; //Success url
            ObjReqPayuApi.furl = URLS.url.allurls.furl; //failure url

            Session["ConsumerIDWater"] = ObjReqPayuApi.consumer_id;

            DataContractJsonSerializer objRequestJsonSerializer = new DataContractJsonSerializer(typeof(ReqBilldeskApi));
            MemoryStream objMemoryStream = new MemoryStream();
            objRequestJsonSerializer.WriteObject(objMemoryStream, ObjReqPayuApi);

            WebClient objWebClient = new WebClient();
            ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
            ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
            objWebClient.Headers[HttpRequestHeader.ContentType] = "application/json";
            objWebClient.Headers["apikey"] = "U0ydhj7MnzXc4PfgIKs9NmcKSWQA7asOP";

            string strResponse = objWebClient.UploadString(strURL, "POST", Encoding.Default.GetString(objMemoryStream.ToArray()));
            DataContractJsonSerializer objJsonSerializerRes = new DataContractJsonSerializer(typeof(ResBilldeskApi));
            MemoryStream objMSRes = new MemoryStream(Encoding.Default.GetBytes(strResponse));
            ResBilldeskApi objResponse = (ResBilldeskApi)objJsonSerializerRes.ReadObject(objMSRes);


            //Table start.
            string html = "<html>" + Environment.NewLine;
            html += "<head>" + Environment.NewLine;
            html += "</head>" + Environment.NewLine;

            //Adding HeaderRow.
            html += "<body>" + Environment.NewLine;
            html += "<form action=\'" + objResponse.action + "' method='post'>" + Environment.NewLine;
            html += "<input type=\"hidden\" name =\"msg\" value='" + objResponse.value + "' />" + Environment.NewLine;

            html += "<h1 style=\"color:black;margin-top:15% ;margin-left:39%; \">Do You Want to Procced</h1><br/>" + Environment.NewLine;
            html += "<input  style=\"background-color:blue;height:50px;width:200px;margin-left:35%;color:white;font-size:18px; \" type=\"submit\" value=\"Yes\"  />" + Environment.NewLine;

            html += "<button type=\"button\" style=\"background-color:red;height:50px;width:200px;margin-left:2%;color:white;font-size:18px; \" onclick = \"window.location.href='" + URLS.url.allurls.watertaxHome + "'\" > No </ button >" + Environment.NewLine;

            //html += "&nbsp;&nbsp;&nbsp;&nbsp;<input  style=\"background-color:red;height:50px;width:200px;color:white;font-size:18px;\" type=\"submit\" value=\"No\"  />" + Environment.NewLine;

            //Table end.
            html += "</form>" + Environment.NewLine;
            html += "</body></html>";


            if (File.Exists(Server.MapPath("JSP/PAyU.html")))
                File.Delete(Server.MapPath("JSP/PAyU.html"));


            File.WriteAllText(Server.MapPath("JSP/PAyU.html"), html);
            Response.Redirect("~/JSP/PAyU.html");

        }
        catch (Exception ex)
        {

        }

    }


    //protected void btn_MakePaymentByCard(object sender, EventArgs e)
    //{
    //    try
    //    {


    //        Worldline_cardrequest kioskCardRequest = new Worldline_cardrequest
    //        {
    //            tid = "0118882U",
    //            amount = "28",
    //            organization_code = "Retail",
    //            additional_attribute1 = "attribute1",
    //            additional_attribute2 = "attribute2",
    //            additional_attribute3 = "attribute3",
    //            invoiceNumber = "",
    //            rrn = "",
    //            type = "SALE",
    //            cb_amt = "",
    //            app_code = "",
    //            tokenisedValue = ""
    //        };

    //        //input objAbortJsonParams = new input();
    //        //objAbortJsonParams.username = "2222214001";

    //        //Session["JsonParamsAbort"] = objAbortJsonParams;
    //        //JsonParams objJsonParams = new JsonParams();
    //        //objJsonParams.username = "2222214001";
    //        //objJsonParams.input = new InputParams();
    //        //objJsonParams.input.amount = Convert.ToInt32(2);
    //        //objJsonParams.input.type = "TXN_CARD_AUTH";
    //        //objJsonParams.input.orderid = DateTime.Now.ToString("yyMMddHHmmss");
    //        //objJsonParams.input.customerMobile = "9694444444";
    //        //objJsonParams.input.accountLabel = "WATER";

    //        Session["ConsumerIDWater"] = txtconsumerid.Text;
    //        Session["AccountLabel"] = "WATER";
    //        Session["Consumer_WTbalance"] = txtbalance.Text;
    //        //Session["JsonParams"] = objJsonParams;

    //        Session["WTCustomerName"] = lblname.InnerText;

    //        Card_Request card_Request = new Card_Request { consumer_id = txtconsumerid.Text, kiosk_machine_id = "128745692" };
    //        string strURL = URLS.url.allurls.kiosk_card_request;
    //        DataContractJsonSerializer objRequestJsonSerializer = new DataContractJsonSerializer(typeof(Worldline_cardrequest));
    //        MemoryStream objMemoryStream = new MemoryStream();
    //        objRequestJsonSerializer.WriteObject(objMemoryStream, kioskCardRequest);

    //        WebClient objWebClient = new WebClient();
    //        ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
    //        ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
    //        objWebClient.Headers[HttpRequestHeader.ContentType] = "application/json";
    //      //  objWebClient.Headers["apikey"] = "U0ydhj7MnzXc4PfgIKs9NmcKSWQA7asOP";

    //        string strResponse = objWebClient.UploadString(strURL, "POST", Encoding.Default.GetString(objMemoryStream.ToArray()));
    //        DataContractJsonSerializer objJsonSerializerRes = new DataContractJsonSerializer(typeof(Worldline_cardresponse));
    //        MemoryStream objMSRes = new MemoryStream(Encoding.Default.GetBytes(strResponse));
    //        Worldline_cardresponse objResponse = (Worldline_cardresponse)objJsonSerializerRes.ReadObject(objMSRes);

    //        if (objResponse != null)
    //        {
    //            Session["CardRequestJsonParams"] = objResponse;

    //            Response.Redirect("WaterTaxEzetap.aspx");
    //        }
    //        else {
    //            //this.Page.RegisterStartupScript("alert", "alert('Invalid response received!')");
    //        }

    //        //if (File.Exists(@"D:\EzyTap\Data.txt"))
    //        //{

    //        //    File.Delete(@"D:\EzyTap\Data.txt");
    //        //    StreamWriter st = new StreamWriter(@"D:\EzyTap\Data.txt");
    //        //    string[] allString = {"Date Time:" + DateTime.Now.ToString(), " CustomerID:" + objAbortJsonParams.username ,
    //        //    "Txn No :" + objJsonParams.input.orderid.ToString(),"Txn amount: "+ objJsonParams.input.amount.ToString()};

    //        //    foreach (var l in allString) {
    //        //        st.WriteLine(l);
    //        //    }
    //        //    st.Close();
    //        //}
    //        //else {
    //        //    StreamWriter st = new StreamWriter(@"D:\EzyTap\Data.txt");

    //        //    string[] allString = {"Date Time:" + DateTime.Now.ToString(), "CustomerID:" + objAbortJsonParams.username ,
    //        //    "Txn No :" + objJsonParams.input.orderid.ToString(),"Txn amount: "+ objJsonParams.input.amount.ToString()};

    //        //    foreach (var l in allString)
    //        //    {
    //        //        st.WriteLine(l);
    //        //    }
    //        //    st.Close();
    //        //}



    //    }
    //    catch (Exception ex)
    //    {
    //        Console.Write(ex.Message);
    //    }

    //}

    protected void btn_MakePaymentByCard(object sender, EventArgs e)
    {
        try
        {
           Session["ConsumerIDWater"] = txtconsumerid.Text;
            Session["WTCustomerName"] = lblname.InnerText;
            Session["AccountLabel"] = "WATER";
           Session["Consumer_WTbalance"] = txtbalance.Text;
           Response.Redirect("paymentbycard.aspx");    
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }

    }

    //MARK:- Card payment method
    //protected void btn_MakePaymentByCard(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        input objAbortJsonParams = new input();
    //        objAbortJsonParams.username = "2222214001";

    //        Session["JsonParamsAbort"] = objAbortJsonParams;
    //        JsonParams objJsonParams = new JsonParams();
    //        objJsonParams.username = "2222214001";
    //        objJsonParams.input = new InputParams();
    //        objJsonParams.input.amount = Convert.ToInt32(txtbalance.Text);
    //        objJsonParams.input.type = "TXN_CARD_AUTH";
    //        objJsonParams.input.orderid = DateTime.Now.ToString("yyMMddHHmmss");
    //        objJsonParams.input.customerMobile = "9694444444";
    //        objJsonParams.input.accountLabel = "WATER";

    //        Session["ConsumerIDWater"] = txtconsumerid.Text;
    //        Session["AccountLabel"] = objJsonParams.input.accountLabel;
    //        Session["Consumer_WTbalance"] = txtbalance.Text;
    //        Session["JsonParams"] = objJsonParams;
    //        Session["WTCustomerName"] = lblname.InnerText;

    //        Card_Request card_Request = new Card_Request { consumer_id = txtconsumerid.Text, kiosk_machine_id = "128745692" };
    //        string strURL = URLS.url.allurls.kiosk_card_request;
    //        DataContractJsonSerializer objRequestJsonSerializer = new DataContractJsonSerializer(typeof(Card_Request));
    //        MemoryStream objMemoryStream = new MemoryStream();
    //        objRequestJsonSerializer.WriteObject(objMemoryStream, card_Request);

    //        WebClient objWebClient = new WebClient();
    //        ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
    //        ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
    //        objWebClient.Headers[HttpRequestHeader.ContentType] = "application/json";
    //        objWebClient.Headers["apikey"] = "U0ydhj7MnzXc4PfgIKs9NmcKSWQA7asOP";

    //        string strResponse = objWebClient.UploadString(strURL, "POST", Encoding.Default.GetString(objMemoryStream.ToArray()));
    //        DataContractJsonSerializer objJsonSerializerRes = new DataContractJsonSerializer(typeof(ResKioskCardRequest));
    //        MemoryStream objMSRes = new MemoryStream(Encoding.Default.GetBytes(strResponse));
    //        ResKioskCardRequest objResponse = (ResKioskCardRequest)objJsonSerializerRes.ReadObject(objMSRes);


    //        //if (File.Exists(@"D:\EzyTap\Data.txt"))
    //        //{

    //        //    File.Delete(@"D:\EzyTap\Data.txt");
    //        //    StreamWriter st = new StreamWriter(@"D:\EzyTap\Data.txt");
    //        //    string[] allString = {"Date Time:" + DateTime.Now.ToString(), " CustomerID:" + objAbortJsonParams.username ,
    //        //    "Txn No :" + objJsonParams.input.orderid.ToString(),"Txn amount: "+ objJsonParams.input.amount.ToString()};

    //        //    foreach (var l in allString) {
    //        //        st.WriteLine(l);
    //        //    }
    //        //    st.Close();
    //        //}
    //        //else {
    //        //    StreamWriter st = new StreamWriter(@"D:\EzyTap\Data.txt");

    //        //    string[] allString = {"Date Time:" + DateTime.Now.ToString(), "CustomerID:" + objAbortJsonParams.username ,
    //        //    "Txn No :" + objJsonParams.input.orderid.ToString(),"Txn amount: "+ objJsonParams.input.amount.ToString()};

    //        //    foreach (var l in allString)
    //        //    {
    //        //        st.WriteLine(l);
    //        //    }
    //        //    st.Close();
    //        //}


    //        Response.Redirect("WaterTaxEzetap.aspx");

    //    }
    //    catch (Exception ex)
    //    {
    //        Console.Write(ex.Message);
    //    }

    //}

    private static bool bypassAllCertificateStuff(object sender, X509Certificate cert, X509Chain chain, System.Net.Security.SslPolicyErrors error)
    {
        return true;
    }

    protected void Home_click(object sender, EventArgs e)
    {
        Response.Redirect("MainHome.aspx");
    }
    public class RequestWaterTax
    {
        public string consumer_id;
    }

    public class Card_Request
    {

        public string consumer_id { get; set; }
        public string kiosk_machine_id { get; set; }
    }

    public class ResponseWaterTax
    {
        public string consumer_name;
        public string address;
        public string zone;
        public string ward;
        public string balance;
        public string deprecated_consumer_id;
    }

    public class JsonParams
    {
        public string username;
        public InputParams input;
    }
    public class ReqPayuApi
    {
        public string consumer_id;
        public string amount;
        public string kiosk_machine_id;
        public string request_type;
        public string platform;
        public string surl;
        public string furl;

    }
    public class ResKioskCardRequest
    {
        public string consumer_id;
        public string consumer_name;
        public string balance;
        public string transaction_id;
        public string mobile;
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
    public class ResPayuApi
    {
        public string hash;
        public string amount;
        public string consumer_id;
        public string firstname;
        public string lastname;
        public string txnid;

        public string surl;
        public string furl;
        public string email;
        public string enforce_paymethod;
        public string key;
        public string udf1;
        public string udf2;
        public string udf3;
        public string productinfo;
        public string phone;
        public string url;

    }
    public class input
    {
        public string username;

    }

    public class InputParams
    {
        public int amount;
        public string type;
        public string orderid;
        public string customerMobile;
        public string accountLabel;
    }

    public class ReqBilldeskApi
    {
        public string consumer_id;
        public string amount;
        public string kiosk_machine_id;
        public string request_type;
        public string platform;
        public string surl;
        public string furl;

    }
    public class ResBilldeskApi
    {
        public string action { get; set; }
        public string value { get; set; }

    }

   

}
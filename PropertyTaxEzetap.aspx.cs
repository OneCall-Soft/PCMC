using System;
using WebSocketSharp;
using System.Security.Cryptography.X509Certificates;
using System.Timers;
using System.Web.UI;
using System.Threading;

public partial class PropertyTaxNew : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {        


        var jsonAbort = Session["JsonParamsAbort"];
        var jsonStringAbort = Newtonsoft.Json.JsonConvert.SerializeObject(jsonAbort);

        JsonDataAbort.Text = jsonStringAbort;

        var jsonss = Session["JsonParams"];
        var jsonString = Newtonsoft.Json.JsonConvert.SerializeObject(jsonss);
        ////   DataContractJsonSerializer objJsonSerSend = new DataContractJsonSerializer(typeof(ReceiptRequestDTO));
        ////   MemoryStream memStrToSend = new MemoryStream();
        ////   objJsonSerSend.WriteObject(memStrToSend, requestDTO);
        ////   string data = Encoding.Default.GetString(memStrToSend.ToArray());
        JsonData.Text = jsonString;

        // messages.Style.Add("color", "red");
        // messages.Attributes.Add("style", "color:Blue;");
        // messages.Text = "< font color = 'red' ></ font > ";
        //if (messages.ForeColor != System.Drawing.Color.Red) { messages.ForeColor = System.Drawing.Color.Red; } else { messages.ForeColor = new System.Drawing.Color(); }
        //JsonData.Text = "{\"username\": \"2222214001\",\"input\":{\"amount\": 1,\"type\":\"TXN_CARD_AUTH\",\"orderId\": \"111552\",\"customerMobile\":\"9468511848\"}}";


    }
     
 

    private void timer1_Tick(object sender, EventArgs e)
    {
       
    }
    public void InitTimer()
    {

    }

protected void BtnClose_Click(object sender, EventArgs e)
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


        //var wsClient = new WebSocket("ws://localhost:8080/pay");
        //wsClient.Connect();
        //wsClient.Send("{\"username\": \"2222214001\",\"input\":{\"amount\": 1,\"type\":\"TXN_CARD_AUTH\",\"orderId\": \"111535352\",\"customerMobile\":\"9468511848\",\"accountLabel\":\"PROPERTY\"}}");

    }
    
    protected void btn_Home(object sender, EventArgs e)
    {
        Response.Redirect("MainPage.aspx");
    }
    protected void btn_MakePayment(object sender, EventArgs e)
    {
        ////01) responseUrl = response return url
        ////02) device = KIOSK(Fixed)
        ////string url = "http://propertytax.pcmcindia.gov.in:8080/pcmc/onlinePay/OnlinePaymentRequest.jsp?txtCustomerID=1040200124.00&txtAdditionalInfo5=16082019&txtTxnAmount=11234&txtAdditionalInfo6=PCMC&txtConsessionAmount=3.0&txtAdditionalInfo1=PCMCLogIn&txtAdditionalInfo1=PCMC&txtAdditionalInfo4=1040200124.00&txtAdditionalInfo3=0402192000124";
        //string URL = "http://propertytax.pcmcindia.gov.in:8080/pcmc/onlinePay/OnlinePaymentRequest.jsp?";
        //URL += "txtCustomerID=" + Session["ConsumerID"].ToString() + "&";
        //URL += "txtAdditionalInfo5=" + DateTime.Now.ToString("ddMMyyyy") + "&";
        //URL += "txtTxnAmount=" + txtbalance.Text + "&";
        //URL += "txtAdditionalInfo6=" + "PCMC" + "&";
        //URL += "txtConsessionAmount=" + "3.0" + "&";
        //URL += "txtAdditionalInfo1=" + "PCMCLogIn" + "&";
        //URL += "txtAdditionalInfo1=" + "PCMC" + "&";
        //URL += "txtAdditionalInfo4=" + Session["ConsumerID"].ToString() + "&";
        //URL += "txtAdditionalInfo3=" + DateTime.Now.ToString("ddMMyyHHmmss") + "&";
        //      //URL += "responseUrl=" + "https://www.google.com" + "&";
        //      URL += "responseURL=" + "http://192.168.225.34/PCMC/PrintReceipt.aspx" + "&";
        //URL += "device=" + "KIOSK";


        //string OpenNewWindow = "window.open('" + URL + "', 'popup_window', 'width=1366,height=768,left=0,top=0,resizable=no,resizable=no, toolbar=no, scrollbars=no, menubar=no, status=no, directories=no');";
        //ClientScript.RegisterStartupScript(this.GetType(), "script", OpenNewWindow, true);
    }

    private static bool bypassAllCertificateStuff(object sender, X509Certificate cert, X509Chain chain, System.Net.Security.SslPolicyErrors error)
    {
        return true;
    }

    protected void Home_click(object sender, EventArgs e)
    {
        Response.Redirect("MainHome.aspx");
    }


    public class RequestPropertyTax
    {
        public string consumerID;
    }
    public class ResponsePropertyTax
    {
        public string propertyName;
        public string balance;
        public string propertyAddress;
        public string finalUseType;
        public string consumerID;
        public string gatName;
        public string zoneName;
    }



   
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
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

public partial class PropertyTaxNew : BasePage
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
       if (!IsPostBack)
        {
            divConsumerDetail.Visible = false;
            btnmakepayment.Visible = true;
            paymentdetails.Visible = false;
            //txtbalance.Visible = false;

            ddlzonename.Items.Clear();
            ddlzonename.Items.Add("Select");
            this.FillZoneNamesToDropDown();

            ddlzoneno.Items.Clear();
            ddlzoneno.Items.Add("Select");
            this.FillDropDown(1, 17, this.ddlzoneno);
            this.ddlzoneno.Items.Add("22");
            ddlgateno.Items.Clear();
        }

    }

    protected void btn_EditPayment(object sender, EventArgs e)
    {
        if (txtbalance.ReadOnly == true) {
            lblRupeeSymbol.Visible  = false;
            txtbalance.ReadOnly = false;
        } else {
            lblRupeeSymbol.Visible = true;
            txtbalance.ReadOnly = true;
        }
       
       
    }

    //protected void txtPropertyNo_TextChanged(object sender, EventArgs e)
    //{
    //	for (int i = 0; i < txtPropertyNo.Text.Length; i++)
    //	{
    //		int c = txtPropertyNo.Text[i];
    //		if (c < '0' || c > '9')
    //		{
    //			txtPropertyNo.Text = txtPropertyNo.Text.Remove(i, 1);
    //		}
    //	}
    //}
    
        //MARK:- PropertyTax btn show details method
    protected void btn_PropertyTax(object sender, EventArgs e)
    {
        //divConsumerDetail.Visible = true;
        //paymentdetails.Visible = true;

        //Session["ConsumerID"] = "132465";
        //Session["Consumer_PTname"] = "Ramesh";
        //Session["Consumer_PTaddress"] = "Udaipur";
        //Session["Consumer_PTbalance"] = "20";
        try
        {
            if (ddlzonename.SelectedIndex == 0 && ddlzoneno.SelectedIndex == 0)
            {
                lblErrorMsg.InnerText = "Please select valid zone number";
                return;
            }

            if (ddlgateno.SelectedIndex == 0)
            {
                lblErrorMsg.InnerText = "Please select valid gat number";
                return;
            }

            if (txtPropertyNo.Text.Length != 5 || txtPropertyNo.Text == "00000")
            {
                lblErrorMsg.InnerText = "Please enter valid property number";
                return;
            }

            if (txtExtra.Text.Length == 0)
            {
                lblErrorMsg.InnerText = "Please enter valid extra number";
                return;
            }

            lblErrorMsg.InnerText = "";
            //UAT string strURL = "http://103.224.247.136:8081/PropertyTaxServiceLokadalat/webapi/propertyTaxWebServiceController/getBalance";
            string strURL = URLS.url.allurls.getbalance;
            RequestPropertyTax ObjRequestPropertyTax = new RequestPropertyTax();

            //Make Consumer ID
            //First one digit is fixed  "1"
            //Zone number 2 digit Example : 01
            //Gat number 2 digit Example : 01
            //Property code is 5 digit Example : 00123
            //"." is fixed
            //Extra 2 digit Example : 00

            string strConsumerID = "1" + ddlzoneno.Text.PadLeft(2, '0') + ddlgateno.Text.PadLeft(2, '0') + txtPropertyNo.Text.PadLeft(5, '0') + "." + txtExtra.Text.PadLeft(2, '0');
            ObjRequestPropertyTax.consumerID = strConsumerID;

            DataContractJsonSerializer objRequestJsonSerializer = new DataContractJsonSerializer(typeof(RequestPropertyTax));
            MemoryStream objMemoryStream = new MemoryStream();
            objRequestJsonSerializer.WriteObject(objMemoryStream, ObjRequestPropertyTax);

            WebClient objWebClient = new WebClient();
            ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
            ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
            objWebClient.Headers[HttpRequestHeader.ContentType] = "application/json";
            string strResponse = objWebClient.UploadString(strURL, "POST", Encoding.Default.GetString(objMemoryStream.ToArray()));
            DataContractJsonSerializer objJsonSerializerRes = new DataContractJsonSerializer(typeof(ResponsePropertyTax));
            MemoryStream objMSRes = new MemoryStream(Encoding.Default.GetBytes(strResponse));
            ResponsePropertyTax objResponse = (ResponsePropertyTax)objJsonSerializerRes.ReadObject(objMSRes);
            lbladdress.InnerText = objResponse.propertyAddress;
            lblname.InnerText = objResponse.propertyName;
            // lblbalance.InnerText = objResponse.balance;
            txtbalance.Text = objResponse.balance;

            divConsumerDetail.Visible = true;
            paymentdetails.Visible = true;
            Session["ConsumerID"] = strConsumerID;
            Session["Consumer_PTname"] = objResponse.propertyName;
            Session["Consumer_PTaddress"] = objResponse.propertyAddress;
            Session["Consumer_PTbalance"] = objResponse.balance;
        }
        catch (Exception ex)
        {
            lblErrorMsg.InnerText = "No Connectivity or check Id and try again";
            //btnmakepayment.Visible = false;
            // txtbalance.Visible = false;
            // lblRupeeSymbol.Visible = lblbalance.Visible = false;
            // lbledit.Visible = false;
            lbladdress.InnerText = "";
            lblname.InnerText = "";
            lblbalance.InnerText = "";
            txtbalance.Text = "";
        }
    }
    protected void btn_Home(object sender, EventArgs e)
    {
        Response.Redirect("MainPage.aspx");
    }

    //MARK:- Card payment method
    protected void btn_MakePayment(object sender, EventArgs e)
    {
        //01) responseUrl = response return url
        //02) device = KIOSK(Fixed)
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

        if (TextBox1.Text.Substring(0,1) =="0" || TextBox1.Text == "0000000000")
        {
            lblErrorMsg.InnerText = "Please enter valid mobile number";
            return;
        }
        //if (TextBox1.Text != "")
        //{               

        //    input objAbortJsonParams = new input();
        //    objAbortJsonParams.username = "9922501200";
        //    objAbortJsonParams.Password = "123456Q";

        //    Session["JsonParamsAbort"] = objAbortJsonParams;

        //    JsonParams objJsonParams = new JsonParams();
        //    objJsonParams.username = "9922501200";
        //    objJsonParams.Password = "123456Q";
        //    objJsonParams.input = new InputParams();
        //    objJsonParams.input.amount = Convert.ToInt32(txtbalance.Text);
        //    Session["Consumer_PTbalance"] = Convert.ToInt32(txtbalance.Text);
        //    objJsonParams.input.type = "TXN_CARD_AUTH";
        //    objJsonParams.input.orderid = DateTime.Now.ToString("yyMMddHHmmss");
        //    objJsonParams.input.customerMobile = TextBox1.Text;
        //    objJsonParams.input.accountLabel = "PROPERTY";
        //    Session["WTCustomerName"] = lblname.InnerText;

        //    //Session["AccountLabel"] = objJsonParams.input.accountLabel;
        //    Session["AccountLabel"] = "PROPERTY";

        //    //string strJsonParams = "{ "username": "2222214001","input":{ "amount": 1,"type":"TXN_CARD_AUTH","orderId": "00055555677","customerMobile":"9694666132"} }";

        //    Session["JsonParams"] = objJsonParams;
        //    //Response.Redirect("PropertyTaxEzetap.aspx");
        //    Response.Redirect("paymentbycard.aspx");
        //}
        //else
        //{

        //}
        Session["BillerTxnID"]="";
        Session["Consumer_PTbalance"] = "";
        Session["AccountLabel"] = "PROPERTY";
        Session["ConsumerID"] = "132465";
        Response.Redirect("paymentbycard.aspx");

    }


    //MARK:- BillCloud payment method
    protected void btn_BillCloudPayment(object sender, EventArgs e)
    {
        if (TextBox1.Text.Substring(0, 1) == "0" || TextBox1.Text == "0000000000")
        {
            lblErrorMsg.InnerText = "Please enter valid mobile number";
            return;
        }

        Session["WTCustomerName"] = lblname.InnerText;
        string host = HttpContext.Current.Request.Url.Host;
        // 01) responseUrl = response return url
        ///  02) device = KIOSK(Fixed)
        //string URL = "http://propertytax.pcmcindia.gov.in:8080/pcmc/onlinePay/OnlinePaymentRequest.jsp?txtCustomerID=1040200124.00&txtAdditionalInfo5=16082019&txtTxnAmount=11234&txtAdditionalInfo6=PCMC&txtConsessionAmount=3.0&txtAdditionalInfo1=PCMCLogIn&txtAdditionalInfo1=PCMC&txtAdditionalInfo4=1040200124.00&txtAdditionalInfo3=0402192000124";

        // MARK:- Onlinepaymentrequest
        string URL = URLS.url.allurls.onlinepaymentrequest;
        //string URL = "http://103.224.247.136:8080/pcmc/onlinePay/OnlinePaymentRequest.jsp?";
        URL += "txtCustomerID=" + Session["ConsumerID"].ToString() + "&";
        URL += "txtAdditionalInfo5=" + DateTime.Now.ToString("ddMMyyyy") + "&";
        URL += "txtTxnAmount=" + txtbalance.Text + "&";
        URL += "txtAdditionalInfo6=" + "PCMC" + "&";
        URL += "txtConsessionAmount=" + "3.0" + "&";
        URL += "txtAdditionalInfo1=" + "PCMCLogIn" + "&";
        URL += "txtAdditionalInfo1=" + "PCMC" + "&";
        URL += "txtAdditionalInfo4=" + Session["ConsumerID"].ToString() + "&";
        URL += "txtAdditionalInfo3=" + DateTime.Now.ToString("ddMMyyHHmmss") + "&";
        // URL += "responseUrl=" + "https://www.google.com" + "&";
        //   URL += "responseURL=" + "http://" + host + ":57227/PrintReceiptNew.aspx" + "&";

        URL += "responseURL= " + ConfigurationManager.AppSettings["ProperttaxreturnurlBillCloud"].ToString() + "&";

        URL += "device=" + "KIOSK";


        string OpenNewWindow = "window.open('" + URL + "', 'popup_window', 'width=1366,height=768,left=0,top=0,resizable=no,resizable=no, toolbar=no, scrollbars=no, menubar=no, status=no, directories=no'); ";
        ClientScript.RegisterStartupScript(this.GetType(), "script", OpenNewWindow, true);

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

    protected void ddlzonename_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!ddlzonename.SelectedItem.Text.Contains("Select"))
        {
            lblErrorMsg.InnerText = "";

            ddlgateno.Items.Clear();
            ddlgateno.Items.Add("Select");
            ddlzoneno.SelectedIndex = ddlzonename.SelectedIndex;

            switch (Convert.ToInt32(ddlzonename.SelectedIndex))
            {
                case 1:
                    {
                        this.FillDropDown(1, 18, this.ddlgateno);
                    }
                    break;
                case 2:
                    {
                        this.FillDropDown(1, 7, this.ddlgateno);
                    }
                    break;
                case 3:
                    {
                        this.FillDropDown(1, 16, this.ddlgateno);
                    }
                    break;

                case 4:
                    {
                        this.FillDropDown(1, 12, this.ddlgateno);
                    }
                    break;
                case 5:
                    {
                        this.FillDropDown(0, 10, this.ddlgateno);
                    }
                    break;
                case 6:
                    {
                        this.FillDropDown(1, 5, this.ddlgateno);
                    }
                    break;

                case 7:
                    {
                        this.FillDropDown(1, 7, this.ddlgateno);
                    }
                    break;
                case 8:
                    {
                        this.FillDropDown(1, 13, this.ddlgateno);
                    }
                    break;
                case 9:
                    {
                        this.FillDropDown(1, 8, this.ddlgateno);
                        ddlgateno.Items.Add("99");
                    }
                    break;

                case 10:
                    {
                        this.FillDropDown(1, 17, this.ddlgateno);
                    }
                    break;
                case 11:
                    {
                        this.FillDropDown(1, 5, this.ddlgateno);
                    }
                    break;

                case 12:
                    {
                        this.FillDropDown(1, 14, this.ddlgateno);
                    }
                    break;
                case 13:
                    {
                        this.FillDropDown(1, 9, this.ddlgateno);
                    }
                    break;
                case 14:
                    {
                        this.FillDropDown(1, 5, this.ddlgateno);
                    }
                    break;
                case 15:
                    {
                        this.FillDropDown(1, 5, this.ddlgateno);
                    }
                    break;
                case 16:
                    {
                        this.FillDropDown(1, 4, this.ddlgateno);
                    }
                    break;
                case 17:
                    {
                        ddlgateno.Items.Add("02");
                    }
                    break;
                case 22:
                    {
                        ddlgateno.Items.Add("01");
                    }
                    break;
            }
        }
        else
        {
            ddlzoneno.SelectedIndex = 0;
            ddlgateno.SelectedIndex = 0;
            txtPropertyNo.Text = "";
            txtExtra.Text = "";
            lbladdress.InnerText = "";
            lblname.InnerText = "";
            lblbalance.InnerText = "";
            txtbalance.Text = "";
            txtbalance.Visible = false;
            lblRupeeSymbol.Visible = lblbalance.Visible = false;
            //  lbledit.Visible = false;
            //  btnmakepayment.Visible = false;
            lblErrorMsg.InnerText = "";
        }
    }
    protected void ddlzoneno_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!ddlzoneno.SelectedItem.Text.Contains("Select"))
        {
            lblErrorMsg.InnerText = "";
            ddlgateno.Items.Clear();
            ddlgateno.Items.Add("Select");
            ddlzonename.SelectedIndex = ddlzoneno.SelectedIndex;
            switch (Convert.ToInt32(ddlzoneno.SelectedItem.Text))
            {
                case 1:
                    {
                        this.FillDropDown(1, 18, this.ddlgateno);
                    }
                    break;
                case 2:
                    {
                        this.FillDropDown(1, 7, this.ddlgateno);
                    }
                    break;
                case 3:
                    {
                        this.FillDropDown(1, 16, this.ddlgateno);
                    }
                    break;

                case 4:
                    {
                        this.FillDropDown(1, 12, this.ddlgateno);
                    }
                    break;
                case 5:
                    {
                        this.FillDropDown(0, 10, this.ddlgateno);
                    }
                    break;
                case 6:
                    {
                        this.FillDropDown(1, 5, this.ddlgateno);
                    }
                    break;

                case 7:
                    {
                        this.FillDropDown(1, 7, this.ddlgateno);
                    }
                    break;
                case 8:
                    {
                        this.FillDropDown(1, 13, this.ddlgateno);
                    }
                    break;
                case 9:
                    {
                        this.FillDropDown(1, 8, this.ddlgateno);
                        ddlgateno.Items.Add("99");
                    }
                    break;

                case 10:
                    {
                        this.FillDropDown(1, 17, this.ddlgateno);
                    }
                    break;
                case 11:
                    {
                        this.FillDropDown(1, 5, this.ddlgateno);
                    }
                    break;

                case 12:
                    {
                        this.FillDropDown(1, 14, this.ddlgateno);
                    }
                    break;
                case 13:
                    {
                        this.FillDropDown(1, 9, this.ddlgateno);
                    }
                    break;
                case 14:
                    {
                        this.FillDropDown(1, 5, this.ddlgateno);
                    }
                    break;
                case 15:
                    {
                        this.FillDropDown(1, 5, this.ddlgateno);
                    }
                    break;
                case 16:
                    {
                        this.FillDropDown(1, 4, this.ddlgateno);
                    }
                    break;
                case 17:
                    {
                        ddlgateno.Items.Add("02");
                    }
                    break;
                case 22:
                    {
                        ddlgateno.Items.Add("01");
                    }
                    break;
            }
        }
        else
        {
            ddlzonename.SelectedIndex = 0;
            ddlgateno.SelectedIndex = 0;
            txtPropertyNo.Text = "";
            txtExtra.Text = "";
            lbladdress.InnerText = "";
            lblname.InnerText = "";
            lblbalance.InnerText = "";
            txtbalance.Text = "";
            txtbalance.Visible = false;
            lblRupeeSymbol.Visible = lblbalance.Visible = false;
            //lbledit.Visible = false;
            //  btnmakepayment.Visible = false;
            lblErrorMsg.InnerText = "";
        }
    }


    //MARK:- filling dropdown by looping
    private void FillDropDown(int startIndex, int endIndex, DropDownList ddl)
    {
        for (int i = startIndex; i <= endIndex; i++)
        {
            if (i > 9)
            {
                ddl.Items.Add((i.ToString()));
            }
            else
            {
                ddl.Items.Add(("0" + i.ToString()));
            }

        }
    }

    //MARK:- filling name to ddlzonename
    private void FillZoneNamesToDropDown()
    {
        ddlzonename.Items.Add("निगडी प्राधिकरण");
        ddlzonename.Items.Add("आकुर्डी");
        ddlzonename.Items.Add("चिंचवड");
        ddlzonename.Items.Add("थेरगाव");
        ddlzonename.Items.Add("सांगवी");
        ddlzonename.Items.Add("पिंपरी वाघेरे");
        ddlzonename.Items.Add("पिंपरी नगर");
        ddlzonename.Items.Add("मनपा भवन");
        ddlzonename.Items.Add("फ़ुगेवाडी दापोडी");
        ddlzonename.Items.Add("भोसरी");
        ddlzonename.Items.Add("चऱ्होली");
        ddlzonename.Items.Add("मोशी");
        ddlzonename.Items.Add("चिखली");
        ddlzonename.Items.Add("तळवडे");
        ddlzonename.Items.Add("किवळे");
        ddlzonename.Items.Add("दिघी बोपखेल");
        ddlzonename.Items.Add("ब प्रभाग");
        ddlzonename.Items.Add("अ प्रभाग");
    }
}

public class JsonParams
{
    public string username;
    public string Password;
    public InputParams input;
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
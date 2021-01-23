//using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Net.Http;
using System.Runtime.InteropServices;
using System.ComponentModel;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.IO;
using System.Security.Cryptography;
using System.Net;
using System.Runtime.Serialization.Json;
using Newtonsoft.Json;
using System.Security.Cryptography.X509Certificates;
using System.Net.NetworkInformation;

public class initialclass1
{
    public string @event { get; set; }
    public string param1 { get; set; }

    public param22 @param2 { get; set; }
}

public class param22
{
    public string reverseReferenceNumber { get; set; }
    public string rrNumber { get; set; }
    public string authCode { get; set; }
    public string tcMode { get; set; }
    public string displayPAN { get; set; }
    public string formattedPan { get; set; }
    public string invoiceNumber { get; set; }
    public string cardType { get; set; }
    public bool tipEnabled { get; set; }
    public bool callTC { get; set; }
    public string acquisitionId { get; set; }
    public string acquisitionKey { get; set; }
    public bool externalDevice { get; set; }
    public string deviceSerial { get; set; }
    public string cardLastFourDigit { get; set; }
    public string batchNumber { get; set; }
    public string mid { get; set; }
    public string paymentCardBin { get; set; }
    public string paymentCardBrand { get; set; }
    public string paymentCardType { get; set; }
    public string pgInvoiceNumber { get; set; }
    public string tid { get; set; }
    public string cardTxnTypeDesc { get; set; }
    public string issuerCode { get; set; }
    public string acquirerCode { get; set; }
    public bool dccOpted { get; set; }
    public string cardHolderCurrencyExponent { get; set; }
    public string conversionAmount { get; set; }
    public string totalAmount { get; set; }
    public string amount { get; set; }
    public string amountAdditional { get; set; }
    public string amountOriginal { get; set; }
    public string amountCashBack { get; set; }
    public string currencyCode { get; set; }
    public string customerMobile { get; set; }
    public string customerReceiptUrl { get; set; }
    public string externalRefNumber { get; set; }
    public string orderNumber { get; set; }
    public string txnId { get; set; }
    public string merchantName { get; set; }
    public string nonceStatus { get; set; }
    public string orgCode { get; set; }
    public string merchantCode { get; set; }
    public string paymentMode { get; set; }
    public string settlementStatus { get; set; }
    public string txnType { get; set; }
    public string userAgreement { get; set; }
    public string status { get; set; }
    public bool signable { get; set; }
    public bool voidable { get; set; }
    public bool refundable { get; set; }
    public string chargeSlipDate { get; set; }
    public string readableChargeSlipDate { get; set; }
    public bool signReqd { get; set; }
    public string receiptUrl { get; set; }
    public string postingDate { get; set; }
    public string serviceFeeAmount { get; set; }
    public bool isLocal { get; set; }
    public string username { get; set; }
    public bool success { get; set; }
    public Setting2 setting { get; set; }
    public string[] apps { get; set; }
    public bool isOfflineCache { get; set; }
}


public class Setting2
{
    public string settingVer { get; set; }
    public bool cnpEnabled { get; set; }
    public string merchantAddress { get; set; }

}
public partial class PayUWaterTax : System.Web.UI.Page
{
    initialclass1 objinitialclass1;
    String publicKeyFileName = "d:\\bc_public.der";
    String privateKeyFileName = "d:\\bc_private.der";
    List<String> cookieee = null;
    static bool verbose = false;
    public string AccountLblValue = null;
    public string sMacAddress1 = null;
    protected void Page_Load(object sender, EventArgs e)
    {
       // GetMACAddress();

        HttpCookie cookie = Request.Cookies["counter"];
        int arr = int.Parse(cookie.Value.ToString());

        cookieee = new List<string>();

        initialclass1 objinitialclass1 = new initialclass1();
        for (int i = 0; i < arr; i++)
        {
            String val = "name" + (i + 1).ToString();
            HttpCookie data = Request.Cookies[val];

            if (data == null)
                cookieee.Add("NA");
            else
                cookieee.Add(data.Value.ToString());
        }

        //initialclass objinitialclass;
        for (int k = 0; k < cookieee.Count; k++)
        {
            try
            {
                MemoryStream memstrToReceive1 = new MemoryStream(Encoding.Default.GetBytes(cookieee[k]));
                DataContractJsonSerializer objJsonSerRecv1 = new DataContractJsonSerializer(typeof(initialclass1));
                objinitialclass1 = (initialclass1)objJsonSerRecv1.ReadObject(memstrToReceive1);

            }
            catch (Exception)
            {
            }
        }

        AccountLblValue = Session["AccountLabel"].ToString();
       

        if (AccountLblValue.ToString() == "WATER")
        {
            if (objinitialclass1.@event == "TRANSACTION_RESULT" && objinitialclass1.param1 == "SUCCESS")
            {

                Session["EzeTapSerialNo"] = objinitialclass1.param2.deviceSerial;
                Session["customertxnname"] = objinitialclass1.param2.username;

                string StrbillerID = "PCMC";
                string StrAmount = objinitialclass1.param2.amount;
                string StrpaymentMode = objinitialclass1.param2.paymentCardType;
               // Session["WaterPaymentMode"] = objinitialclass1.param2.paymentCardType;
                string StrchannelID = "L&T";
                string StrchannelTransactionID = objinitialclass1.param2.txnId;
                string StrchannelBankRefenceNumber = objinitialclass1.param2.externalRefNumber;

                try
                {


                    WebClient objWebClient = new WebClient();
                    ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
                    ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
                    objWebClient.Headers[HttpRequestHeader.ContentType] = "application/json";
                    objWebClient.Headers["apikey"] = "U0ydhj7MnzXc4PfgIKs9NmcKSWQA7asOP";

                    ReqKioskCardReceipt cardPaymentreceipt = new ReqKioskCardReceipt{
                        consumer_id= "100", paid_amount="1", reference_id= "A45371", transaction_id= "WC00000433815"
                    };
                    Session["waterTxnID"] = StrchannelTransactionID;
                    Session["waterTxnAmount"] = StrAmount;

                    //C.consumerId = Session["ConsumerIDWater"].ToString();
                    //C.paid_amount = objinitialclass1.param2.amount;
                    //C.bank_reference_no = StrchannelBankRefenceNumber;
                    //C.transaction_id = StrchannelTransactionID;
                    //C.kiosk_id = sMacAddress1.ToString();


                    //C.consumerId = "1111";
                    //C.paid_amount = "2";
                    //C.bank_reference_no = "sfs4w45";
                    //C.transaction_id = "23434xvf";
                    //C.kiosk_id = "123455";

                    DataContractJsonSerializer objJsonSerSend = new DataContractJsonSerializer(typeof(ReqKioskCardReceipt));
                    MemoryStream memStrToSend = new MemoryStream();
                    objJsonSerSend.WriteObject(memStrToSend, cardPaymentreceipt);
                    string URL = URLS.url.allurls.kiosk_card_receipt;
                    
                    //ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
                    //ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
                    // string URL = "http://23.239.4.138:9001/v1/payment/online/kiosk_device_receipt?apikey=U0ydhj7MnzXc4PfgIKs9NmcKSWQA7asOP";
                    //string URL = "http://water.pcmcindia.gov.in:5004/v1/payment/online/kiosk_device_receipt?apikey=U0ydhj7MnzXc4PfgIKs9NmcKSWQA7asOP";    //Production
                    string data1 = Encoding.Default.GetString(memStrToSend.ToArray());
                    string result = objWebClient.UploadString(URL, "POST", data1);
                    if (result != null && result != "")
                    {
                        MemoryStream memstrToReceive = new MemoryStream(Encoding.UTF8.GetBytes(result));
                        DataContractJsonSerializer objJsonSerRecv = new DataContractJsonSerializer(typeof(ResKioskCardReceipt));
                        ResKioskCardReceipt objResCranberry = (ResKioskCardReceipt)objJsonSerRecv.ReadObject(memstrToReceive);

                        Session["ConsumerID1"] = Session["ConsumerIDWater"].ToString();
                        Session["paid_amount"] = objinitialclass1.param2.amount;
                        Session["cardType"] = objinitialclass1.param2.cardType;
                        Session["merchantName"] = objinitialclass1.param2.merchantName;
                        Session["paymentMode"] = objinitialclass1.param2.paymentMode;
                      
                        Session["TxnID"] = StrchannelTransactionID;

                        if (objResCranberry.receipt_status.Contains("Receipt Generated Successfully"))
                        {

                            var dt = DateTime.Now.Date.ToString("dd-MM-yy");
                            var hour = DateTime.Now.Hour.ToString();
                            var min = DateTime.Now.Minute.ToString();
                            var sec = DateTime.Now.Second.ToString();

                            string ndata = StrchannelTransactionID  + "_" + dt + "-" + hour + "-" + min + "-" + sec + "_" + objResCranberry.receipt_status + ".txt";

                            Session["Status"] = "Success";

                            StreamWriter sw = new StreamWriter(@"D:\EzyTap\Respo_"+ndata );
                            
                             string[] data = {"DATE : "+DateTime.Now.ToString(), "STATUS : "+objResCranberry.receipt_status,"TXN ID : "+ StrchannelTransactionID,
                                    "CONSUMER ID : " +Session["ConsumerIDWater"].ToString(),"AMOUNT : "+ objinitialclass1.param2.amount   };

                             foreach (var d in data)
                             {
                                 sw.WriteLine(d);
                             }
                             sw.Close();
                           
                           
                        }
                        else
                        {
                            StreamWriter sw = new StreamWriter(@"D:\EzyTap\Respo-" + StrchannelTransactionID + "-" + DateTime.Now.ToString("ddMMyyyyhhmmss") + "-" + "Failed" + ".txt");
                            string[] data = {"DATE : "+DateTime.Now.ToString(), "STATUS : "+objResCranberry.receipt_status,"TXN ID : "+ StrchannelTransactionID,
                                    "CONSUMER ID : " +Session["ConsumerIDWater"].ToString(),"AMOUNT : "+ objinitialclass1.param2.amount   };


                            foreach (var d in data)
                            {
                                sw.WriteLine(d);
                            }
                            sw.Close();

                            //Session["ConsumerID1"] = "";
                            //Session["paid_amount"] = "";
                            //Session["TxnID"] = "";
                            Session["Status"] = "Fail";

                        }
                        Response.Redirect("PrintReciptWaterTaxEzetap.aspx", false);
                    }
                }
                catch (Exception ex)
                {

                }
            }
            else if (objinitialclass1.@event == "TRANSACTION_RESULT" && objinitialclass1.param1.ToLower() == "DECLINED")
            {
                Session["ConsumerID1"] = "";
                Session["paid_amount"] = "";
                Session["TxnID"] = "";               
                Response.Redirect("WaterTax.aspx");
            }
            else if (objinitialclass1.@event == "TRANSACTION_RESULT" && objinitialclass1.param1.ToLower() == "TXN_DECLINED")
            {

                Session["ConsumerID1"] = "";
                Session["paid_amount"] = "";
                Session["TxnID"] = "";
                Response.Redirect("WaterTax.aspx");
            }
            else if (objinitialclass1.@event == "TRANSACTION_RESULT" && objinitialclass1.param1.ToLower() == "sdk busy")
            {
                Session["ConsumerID1"] = "";
                Session["paid_amount"] = "";
                Session["TxnID"] = "";
                Response.Redirect("WaterTax.aspx");
            }
            else if (objinitialclass1.@event == "TRANSACTION_RESULT" && objinitialclass1.param1 == "OPERATION_ABORTED")
            {
                Session["ConsumerID1"] = "";
                Session["paid_amount"] = "";
                Session["TxnID"] = "";
                Response.Redirect("WaterTax.aspx");
            }            
            else
            {
                Session["ConsumerID1"] = "";
                Session["paid_amount"] = "";
                Session["TxnID"] = "";
                Response.Redirect("WaterTax.aspx");
            }
        }
    }

    private static bool bypassAllCertificateStuff(object sender, X509Certificate cert, X509Chain chain, System.Net.Security.SslPolicyErrors error)
    {
        return true;
    }
    public string GetMACAddress()
    {
        try
        {
            NetworkInterface[] nics = NetworkInterface.GetAllNetworkInterfaces();
            String sMacAddress = string.Empty;
            foreach (NetworkInterface adapter in nics)
            {
                if (sMacAddress == String.Empty)// only return MAC Address from first card
                {
                    IPInterfaceProperties properties = adapter.GetIPProperties();
                    sMacAddress = adapter.GetPhysicalAddress().ToString();
                    sMacAddress1 = "KSK" + sMacAddress;
                }
            }
            return sMacAddress;
        }
        catch (Exception ex)
        {
            //objLog.WriteFile("Exception in GetMACAddress(): " + ex.Message);
            return "";
        }
    }

    public class Cranberry
    {
        public string consumerId { get; set; }
        public string paid_amount { get; set; }
        public string bank_reference_no { get; set; }
        public string transaction_id { get; set; }
        public string kiosk_id { get; set; }

    }

    public class ResCranberry
    {
        public string Status { get; set; }
        public string receipt_status { get; set; }

    }
    public class ReqKioskCardReceipt
    {
        public string transaction_id { get; set; }
        public string consumer_id { get; set; }
        public string paid_amount { get; set; }
        public string reference_id { get; set; }
    }

    public class ResKioskCardReceipt
    {
        public string receipt_status { get; set; }
    }
}
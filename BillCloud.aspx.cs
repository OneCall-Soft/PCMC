//using Newtonsoft.Json;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.IO;
using System.Net;
//using System.Net.Http;
using System.Runtime.InteropServices;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Runtime.Serialization.Json;
using System.Security.Cryptography;
using System.Text;
using System.Web;

public class initialclass
{
    public string @event { get; set; }
    public string param1 { get; set; }

    public param2 @param2 { get; set; }
}

public class param2
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
    public Setting setting { get; set; }
    public string[] apps { get; set; }
    public bool isOfflineCache { get; set; }
}


public class Setting
{
    public string settingVer { get; set; }
    public bool cnpEnabled { get; set; }
    public string merchantAddress { get; set; }

}


public partial class BillCloud : System.Web.UI.Page
{

    initialclass objinitialclass;
    String publicKeyFileName = "";
    String privateKeyFileName = "";

    List<String> cookieee = null;
    static bool verbose = false;
    public string AccountLblValue = null;


    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["counter"];
        int arr = int.Parse(cookie.Value.ToString());

        cookieee = new List<string>();



        //{ "username": "2222214001","input":{ "amount": 1,"type":"TXN_CARD_AUTH","orderId": "00055555677","customerMobile":"9694666132"} }


        //cookieee.Add("{\"event\":\"EVENT_NOTIFICATION\",\"param1\":\"IDENTIFYING_DEVICE\"}");
        //cookieee.Add("{\"event\":\"EVENT_NOTIFICATION\",\"param1\":\"PREPARING_FOR_TXN\"}");
        //cookieee.Add("{\"event\":\"EVENT_NOTIFICATION\",\"param1\":\"SWIPE_OR_INSERT_CARD\"}");
        //cookieee.Add("{\"event\":\"EVENT_NOTIFICATION\",\"param1\":\"CHIP_NOT_READ\"}");
        //cookieee.Add("{\"event\":\"EVENT_NOTIFICATION\",\"param1\":\"ENTER_PIN\"}");
        //cookieee.Add("{\"event\":\"EVENT_NOTIFICATION\",\"param1\":\"PIN_ENTERED\"}");
        //cookieee.Add("{\"event\":\"EVENT_NOTIFICATION\",\"param1\":\"TXN_IN_PROGRESS\"}");
        //cookieee.Add("{\"event\":\"EVENT_NOTIFICATION\",\"param1\":\"SERVER_AUTH_IN_PROGRESS\",\"param2\":0}");

        //cookieee.Add("{\"event\":\"TRANSACTION_RESULT\",\"param1\":\"SUCCESS\",\"param2\":{\"reverseReferenceNumber\":\"RREC9B00F4FF0D\",\"rrNumber\":\"RREC9B00F4FF0D\",\"authCode\":\"D12032\",\"tcMode\":\"NOT_REQD\",\"displayPAN\":\"2944\",\"formattedPan\":\"5419-19XX-XXXX-2944\",\"invoiceNumber\":\"9\",\"cardType\":\"MasterCard\",\"tipEnabled\":false,\"callTC\":false,\"acquisitionId\":\"\",\"acquisitionKey\":\"\",\"externalDevice\":false,\"deviceSerial\":\"310030185535\",\"cardLastFourDigit\":\"2944\",\"batchNumber\":\"2\",\"mid\":\"22214001\",\"paymentCardBin\":\"541919\",\"paymentCardBrand\":\"MASTER_CARD\",\"paymentCardType\":\"DEBIT\",\"pgInvoiceNumber\":\"9\",\"tid\":\"10000001\",\"cardTxnTypeDesc\":\"Fallback\",\"issuerCode\":\"NONE\",\"acquirerCode\":\"EZETAP\",\"dccOpted\":false,\"cardHolderCurrencyExponent\":\"0\",\"conversionAmount\":0.0,\"totalAmount\":1.00,\"amount\":1.00,\"amountAdditional\":0.00,\"amountOriginal\":1.00,\"amountCashBack\":0.00,\"currencyCode\":\"INR\",\"customerMobile\":\"9468511848\",\"customerReceiptUrl\":\"\",\"externalRefNumber\":\"11112\",\"orderNumber\":\"11112\",\"txnId\":\"190926060011764E020078859\",\"merchantName\":\"PCMC Demo Setup \",\"nonceStatus\":\"OPEN\",\"orgCode\":\"PCMC_DEMO_SETUP\",\"merchantCode\":\"PCMC_DEMO_SETUP\",\"paymentMode\":\"CARD\",\"settlementStatus\":\"PENDING\",\"txnType\":\"CHARGE\",\"userAgreement\":\"I agree to pay as per the card issuer agreement and receive chargeslip by electronic means.\",\"status\":\"AUTHORIZED\",\"signable\":true,\"voidable\":true,\"refundable\":false,\"chargeSlipDate\":\"2019-09-26T11:30:14+0530\",\"readableChargeSlipDate\":\"26/09/2019 11:30:14\",\"signReqd\":true,\"receiptUrl\":\"http://d.eze.cc/r/o/88CgFBQD/\",\"postingDate\":1569497414000,\"serviceFeeAmount\":0.0,\"isLocal\":false,\"username\":\"2222214001\",\"success\":true,\"setting\":{\"settingVer\":1.569474145748E12,\"cnpEnabled\":false,\"merchantAddress\":\"Pimpri Chinchwad Municipal Corporation Mumbai-Pune Road, Pimpri, |Pune\"},\"apps\":[],\"isOfflineCache\":false}}");
        //cookieee.Add("{\"event\":\"TRANSACTION_RESULT\",\"param1\":\"SUCCESS\",\"param2\":\"{\"reverseReferenceNumber\":\"RREC9B00F4FF0D\",\"rrNumber\":\"RREC9B00F4FF0D\",\"authCode\":\"D12032\",\"tcMode\":\"NOT_REQD\",\"displayPAN\":\"2944\",\"formattedPan\":\"5419-19XX-XXXX-2944\",\"invoiceNumber\":\"9\",\"cardType\":\"MasterCard\",\"tipEnabled\":false,\"callTC\":false,\"acquisitionId\":\"\",\"acquisitionKey\":\"\",\"externalDevice\":false,\"deviceSerial\":\"310030185535\",\"cardLastFourDigit\":\"2944\",\"batchNumber\":\"2\",\"mid\":\"22214001\",\"paymentCardBin\":\"541919\",\"paymentCardBrand\":\"MASTER_CARD\",\"paymentCardType\":\"DEBIT\",\"pgInvoiceNumber\":\"9\",\"tid\":\"10000001\",\"cardTxnTypeDesc\":\"Fallback\",\"issuerCode\":\"NONE\",\"acquirerCode\":\"EZETAP\",\"dccOpted\":false,\"cardHolderCurrencyExponent\":\"0\",\"conversionAmount\":0.0,\"totalAmount\":1.00,\"amount\":1.00,\"amountAdditional\":0.00,\"amountOriginal\":1.00,\"amountCashBack\":0.00,\"currencyCode\":\"INR\",\"customerMobile\":\"9468511848\",\"customerReceiptUrl\":\"\",\"externalRefNumber\":\"11112\",\"orderNumber\":\"11112\",\"txnId\":\"190926060011764E020078859\",\"merchantName\":\"PCMC Demo Setup \",\"nonceStatus\":\"OPEN\",\"orgCode\":\"PCMC_DEMO_SETUP\",\"merchantCode\":\"PCMC_DEMO_SETUP\",\"paymentMode\":\"CARD\",\"settlementStatus\":\"PENDING\",\"txnType\":\"CHARGE\",\"userAgreement\":\"I agree to pay as per the card issuer agreement and receive chargeslip by electronic means.\",\"status\":\"AUTHORIZED\",\"signable\":true,\"voidable\":true,\"refundable\":false,\"chargeSlipDate\":\"2019-09-26T11:30:14+0530\",\"readableChargeSlipDate\":\"26/09/2019 11:30:14\",\"signReqd\":true,\"receiptUrl\":\"http://d.eze.cc/r/o/88CgFBQD/\",\"postingDate\":1569497414000,\"serviceFeeAmount\":0.0,\"isLocal\":false,\"username\":\"2222214001\",\"success\":true,\"setting\":{\"settingVer\":1.569474145748E12,\"cnpEnabled\":false,\"merchantAddress\":\"Pimpri Chinchwad Municipal Corporation Mumbai-Pune Road, Pimpri, |Pune\"},\"apps\":[],\"isOfflineCache\":false}\"}");
        //cookieee.Add("{\"event\":\"TRANSACTION_RESULT\",\"param1\":\"SUCCESS\",\"param2\":{\"reverseReferenceNumber\":\"RREC9B00F4FF0D\"}}");

        //initialclass myObj = new initialclass();
        //myObj.@event = "TRANSACTION_RESULT";
        //myObj.param1 = "SUCCESS";
        //myObj.objparam2 = new param2();
        //myObj.objparam2.reverseReferenceNumber = "RREC9B00F4FF0D";

        //DataContractJsonSerializer objJsonSerRecv2 = new DataContractJsonSerializer(typeof(initialclass));
        //MemoryStream objMem = new MemoryStream();
        //objJsonSerRecv2.WriteObject(objMem, myObj);
        //string str2 = Encoding.Default.GetString(objMem.ToArray());

        initialclass objinitialclass = new initialclass();
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
                DataContractJsonSerializer objJsonSerRecv1 = new DataContractJsonSerializer(typeof(initialclass));
                objinitialclass = (initialclass)objJsonSerRecv1.ReadObject(memstrToReceive1);

            }
            catch (Exception)
            {

            }
        }

        AccountLblValue = Session["AccountLabel"].ToString();

        //string url = System.Configuration.ConfigurationManager.AppSettings["RMSSERVERURL"].ToString();
        //WebClient webClient = new WebClient();
        //webClient.Headers[HttpRequestHeader.ContentType] = "text/json";

        if (AccountLblValue.ToString() == "PROPERTY")
        {
            if (objinitialclass.@event == "TRANSACTION_RESULT" && objinitialclass.param1 == "SUCCESS")
            {
                string a = null;
                String Ivkey = "";

                Session["EzeTapSerialNo"] = objinitialclass.param2.deviceSerial;

                if (ConfigurationManager.AppSettings["Demo"].ToString().ToLower() == "yes")
                {
                     publicKeyFileName = "d:\\bc_public.der";
                     privateKeyFileName = "d:\\bc_private.der";
                    Ivkey = "testkiosk";
                }               
                else
                {
                     publicKeyFileName = "d:\\pcmc_public.der";
                     privateKeyFileName = "d:\\pcmc_private.der";
                    Ivkey = "PcMcpt@xk!osk";
                }
                    

                //UAT  String StrApiUrl = "http://103.224.241.94:8085/BillCloud/webapi/rainbowServiceController/v2/generateReceipt";

                string StrApiUrl = URLS.url.allurls.generatereceipt;
                string StrbillerID = "PCMC";
                string StrServiced = "PTAX";
                string StrfundID = "1";
                string StrconsumerID = (string)Session["ConsumerID"];
                string StrconsumerName = Session["Consumer_PTname"].ToString();
                string StrconsumerAddress = Session["Consumer_PTaddress"].ToString();
                string StrAmount = objinitialclass.param2.amount;
                string StrcounterID = "KISOK-001";
                string StruserID = "kisok@pcmc";
                string StrchannelID = "L&T";
                string StrchannelTransactionID = objinitialclass.param2.externalRefNumber;


                Session["cardType"]     = objinitialclass.param2.cardType;
                Session["paymentMode"]  = objinitialclass.param2.paymentMode;
                Session["merchantName"] = objinitialclass.param2.merchantName;
                Session["customertxnname"] = objinitialclass.param2.username;

                //  string StrpaymentMode = objinitialclass.param2.paymentCardType;
                if (objinitialclass.param2.paymentCardType == "CREDIT")
                {
                    a = "CreditCard";
                }
                else
                {
                    a = "DebitCard";
                }
                string StrpaymentMode = a;
                string strchecksum = Ivkey + "|" + StrbillerID + "|" + StrServiced + "|" + StrfundID + "|" + StrconsumerID + "|" + StrAmount + "|" + StrchannelTransactionID + "|" + DateTime.Now.ToString("yyyy-MM-dd") + "|" + StrcounterID + "|" + StrchannelID;


                ///////to generate the checksum value
                byte[] bytes;
                String input = strchecksum;
                bytes = System.Text.Encoding.UTF8.GetBytes(input);
                Adler32 generateCheckSum = new Adler32();
                generateCheckSum.Update(bytes);
                String checksum = (generateCheckSum.Value) + "";// checksum Value



                bc_SharedKeyEncryption ed = new bc_SharedKeyEncryption();
                List<ReceiptRequestDTO> requestDTO1 = new List<ReceiptRequestDTO>();// List to send data 
                ReceiptRequestDTO requestDTO = new ReceiptRequestDTO();
                // ReceiptRequestDTO requestDTO = new ReceiptRequestDTO();
                requestDTO.billerID = ed.EncryptUsernamePassword(StrbillerID, checksum);//StrbillerID;// encrypt using the checksum value
                requestDTO.serviceID = ed.EncryptUsernamePassword(StrServiced, checksum);//StrServiced;
                requestDTO.fundID = ed.EncryptUsernamePassword(StrfundID, checksum);//StrfundID;
                requestDTO.consumerID = ed.EncryptUsernamePassword(StrconsumerID, checksum);//StrconsumerID;
                requestDTO.consumerName = ed.EncryptUsernamePassword(StrconsumerName, checksum);//StrconsumerName;
                requestDTO.consumerAddress = ed.EncryptUsernamePassword(StrconsumerAddress, checksum);//StrconsumerAddress;
                requestDTO.amount = ed.EncryptUsernamePassword(StrAmount, checksum);//StrAmount;
                requestDTO.transactionDate = ed.EncryptUsernamePassword(DateTime.Now.ToString("yyyy-MM-dd"), checksum);//DateTime.Now.ToString("yyyy-MM-dd");
                requestDTO.counterID = ed.EncryptUsernamePassword(StrcounterID, checksum);//StrcounterID;
                requestDTO.userID = ed.EncryptUsernamePassword(StruserID, checksum);//StruserID;
                requestDTO.channelID = ed.EncryptUsernamePassword(StrchannelID, checksum);//StrchannelID;
                requestDTO.channelTransactionID = ed.EncryptUsernamePassword(StrchannelTransactionID, checksum); //StrchannelTransactionID;
                requestDTO.paymentMode = ed.EncryptUsernamePassword(StrpaymentMode, checksum);//StrpaymentMode;
                requestDTO.unitID = ed.EncryptUsernamePassword("NA", checksum);//"NA";
                requestDTO.locationID = ed.EncryptUsernamePassword("NA", checksum);//"NA";
                requestDTO.subUnitID = ed.EncryptUsernamePassword("NA", checksum);//"NA";
                                                                                  //requestDTO.setConsumerName = ed.EncryptUsernamePassword("NA", checksum);//"NA";
                                                                                  //requestDTO.setConsumerAddress = ed.EncryptUsernamePassword("NA", checksum);//"NA";
                requestDTO.email = ed.EncryptUsernamePassword("NA", checksum);//"NA";
                requestDTO.mobile = ed.EncryptUsernamePassword("NA", checksum);//"NA";
                requestDTO.customField1 = ed.EncryptUsernamePassword("NA", checksum);//"NA";
                requestDTO.customField2 = ed.EncryptUsernamePassword("NA", checksum);//"NA";
                requestDTO.customField3 = ed.EncryptUsernamePassword("NA", checksum);//"NA";
                requestDTO.customField4 = ed.EncryptUsernamePassword("NA", checksum);//"NA";
                requestDTO.customField5 = ed.EncryptUsernamePassword("NA", checksum);//"NA";
                requestDTO.customField6 = ed.EncryptUsernamePassword("NA", checksum);//"NA";
                requestDTO.billerTransactionID = ed.EncryptUsernamePassword("NA", checksum);//"NA";


                RSACryptoServiceProvider encryptionProvider = getPublicKeyProvider(publicKeyFileName);//Load the private key 
                RSACryptoServiceProvider decryptionProvider = getPrivateKeyProvider(privateKeyFileName);//load the public key         
                byte[] encryptedData, decryptedData;
                encryptedData = encryptionProvider.Encrypt(Encoding.UTF8.GetBytes(checksum), false);//Encrypt the checksum value
                string encryptedString = GetBytesToString(encryptedData);
                //decryptedData = decryptionProvider.Decrypt(encryptedData, false);
                //dest = Encoding.UTF8.GetString(decryptedData);
                requestDTO.checksum = encryptedString;

                List<ReceiptResponseDTO> WebApiResp = new List<ReceiptResponseDTO>();
                using (WebClient client = new WebClient())
                {

                    client.Headers[HttpRequestHeader.ContentType] = "application/json";
                    client.Headers[HttpRequestHeader.Accept] = "application/json";
                    client.Headers[HttpRequestHeader.AcceptCharset] = "UTF-8";
                    client.Headers["detail"] = "PCMC|PTAX|L&T";
                    var jsonObj = JsonConvert.SerializeObject(requestDTO);
                    var ResponseString = client.UploadString(StrApiUrl, jsonObj);


                    DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof(ReceiptResponseDTO));
                    MemoryStream stream1 = new MemoryStream(Encoding.Default.GetBytes(ResponseString));
                    ReceiptResponseDTO resUpdateChequeStatus = (ReceiptResponseDTO)ser.ReadObject(stream1);

                    if (decryptionProvider == null)
                        decryptionProvider = getPrivateKeyProvider(privateKeyFileName);
                    SoapHexBinary shb = SoapHexBinary.Parse(resUpdateChequeStatus.checksum);

                    decryptedData = decryptionProvider.Decrypt(shb.Value, false);
                    string BillCloud_ResCheckSumValue = Encoding.UTF8.GetString(decryptedData);

                    string BillerTxnId = ed.DecryptUsernamePassword(resUpdateChequeStatus.billerTransactionID, BillCloud_ResCheckSumValue);
                    string Status = ed.DecryptUsernamePassword(resUpdateChequeStatus.status, BillCloud_ResCheckSumValue);
                    string Reason = ed.DecryptUsernamePassword(resUpdateChequeStatus.reason, BillCloud_ResCheckSumValue);
                    string ReceiptID = ed.DecryptUsernamePassword(resUpdateChequeStatus.receiptID, BillCloud_ResCheckSumValue);
                    string TxnId_BillCloud = ed.DecryptUsernamePassword(resUpdateChequeStatus.transactionID, BillCloud_ResCheckSumValue);


                    JsonParams objJsonParams = new JsonParams();
                    objJsonParams.BillCloud_ResCheckSumValue = BillCloud_ResCheckSumValue;

                    objJsonParams.BillerTxnId = BillerTxnId;
                    objJsonParams.Status = Status;
                    objJsonParams.Reason = Reason;
                    objJsonParams.ReceiptID = ReceiptID;
                    objJsonParams.TxnId_BillCloud = TxnId_BillCloud;


                    Session["BillerTxnID"] = BillerTxnId;
                    //Session["BillCloud_ResCheckSumValue"] = BillCloud_ResCheckSumValue;// 
                    Session["Status"] = Status;
                    Session["Reason"] = Reason;
                    Session["ReceiptID"] = ReceiptID;
                    Session["TxnId_BillCloud"] = TxnId_BillCloud;
                    Response.Redirect("PrintReceiptNew.aspx");

                }
            }
            else if (objinitialclass.@event == "TRANSACTION_RESULT" && objinitialclass.param1.ToLower() == "DECLINED")
            {
                Session["EzeTapSerialNo"] = "";
                Session["BillerTxnID"] = "";
                Session["Status"] = "";
                Session["Reason"] = "";
                Session["ReceiptID"] = "";
                Session["TxnId_BillCloud"] = "";
                Response.Redirect("PropertyTaxNew.aspx");
            }
            else if (objinitialclass.@event == "TRANSACTION_RESULT" && objinitialclass.param1.ToLower() == "TXN_DECLINED")
            {
                Session["EzeTapSerialNo"] = "";
                Session["BillerTxnID"] = "";
                Session["Status"] = "";
                Session["Reason"] = "";
                Session["ReceiptID"] = "";
                Session["TxnId_BillCloud"] = "";
                Response.Redirect("PropertyTaxNew.aspx");
            }
            else if (objinitialclass.@event == "TRANSACTION_RESULT" && objinitialclass.param1.ToLower() == "sdk busy")
            {
                Session["EzeTapSerialNo"] = "";
                Session["BillerTxnID"] = "";
                Session["Status"] = "";
                Session["Reason"] = "";
                Session["ReceiptID"] = "";
                Session["TxnId_BillCloud"] = "";
                Response.Redirect("PropertyTaxNew.aspx");
            }
            else
            {

                Session["EzeTapSerialNo"] = "";
                Session["BillerTxnID"] = "";
                Session["Status"] = "";
                Session["Reason"] = "";
                Session["ReceiptID"] = "";
                Session["TxnId_BillCloud"] = "";
                Response.Redirect("PropertyTaxNew.aspx");
            }
        }
        else if (AccountLblValue == "WATER")
        {

        }



    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //String Ivkey = "testkiosk";
        //String StrApiUrl = "http://103.224.241.94:8085/BillCloud/webapi/rainbowServiceController/v2/generateReceipt";
        //string StrbillerID = "PCMC";
        //string StrServiced = "PTAX";
        //string StrfundID = "1";
        //string StrconsumerID = "1020301025.00";
        //string StrconsumerName = "mukesh dangi";
        //string StrconsumerAddress = "chirag complex";
        //string StrAmount = "515";
        //string StrcounterID = "KISOK-001";
        //string StruserID = "kisok@pcmc";
        //string StrchannelID = "L&T";
        //string StrchannelTransactionID = "000001";
        //string StrpaymentMode = "Cash";
        //string strchecksum = Ivkey + "|" + StrbillerID + "|" + StrServiced + "|" + StrfundID + "|" + StrconsumerID + "|" + StrAmount + "|" + StrchannelTransactionID + "|" + DateTime.Now.ToString("yyyy-MM-dd") + "|" + StrcounterID + "|" + StrchannelID;

        /////////to generate the checksum value
        //byte[] bytes;
        //String input = strchecksum;
        //bytes = System.Text.Encoding.UTF8.GetBytes(input);
        //Adler32 generateCheckSum = new Adler32();
        //generateCheckSum.Update(bytes);
        //String checksum = (generateCheckSum.Value) + "";// checksum Value

        //bc_SharedKeyEncryption ed = new bc_SharedKeyEncryption();
        //List<ReceiptRequestDTO> requestDTO1 = new List<ReceiptRequestDTO>();// List to send data 
        //ReceiptRequestDTO requestDTO = new ReceiptRequestDTO();
        //// ReceiptRequestDTO requestDTO = new ReceiptRequestDTO();
        //requestDTO.billerID = ed.EncryptUsernamePassword(StrbillerID, checksum);//StrbillerID;// encrypt using the checksum value
        //requestDTO.serviceID = ed.EncryptUsernamePassword(StrServiced, checksum);//StrServiced;
        //requestDTO.fundID = ed.EncryptUsernamePassword(StrfundID, checksum);//StrfundID;
        //requestDTO.consumerID = ed.EncryptUsernamePassword(StrconsumerID, checksum);//StrconsumerID;
        //requestDTO.consumerName = ed.EncryptUsernamePassword(StrconsumerName, checksum);//StrconsumerName;
        //requestDTO.consumerAddress = ed.EncryptUsernamePassword(StrconsumerAddress, checksum);//StrconsumerAddress;
        //requestDTO.amount = ed.EncryptUsernamePassword(StrAmount, checksum);//StrAmount;
        //requestDTO.transactionDate = ed.EncryptUsernamePassword(DateTime.Now.ToString("yyyy-MM-dd"), checksum);//DateTime.Now.ToString("yyyy-MM-dd");
        //requestDTO.counterID = ed.EncryptUsernamePassword(StrcounterID, checksum);//StrcounterID;
        //requestDTO.userID = ed.EncryptUsernamePassword(StruserID, checksum);//StruserID;
        //requestDTO.channelID = ed.EncryptUsernamePassword(StrchannelID, checksum);//StrchannelID;
        //requestDTO.channelTransactionID = ed.EncryptUsernamePassword(StrchannelTransactionID, checksum); //StrchannelTransactionID;
        //requestDTO.paymentMode = ed.EncryptUsernamePassword(StrpaymentMode, checksum);//StrpaymentMode;
        //requestDTO.unitID = ed.EncryptUsernamePassword("NA", checksum);//"NA";
        //requestDTO.locationID = ed.EncryptUsernamePassword("NA", checksum);//"NA";
        //requestDTO.subUnitID = ed.EncryptUsernamePassword("NA", checksum);//"NA";
        ////requestDTO.setConsumerName = ed.EncryptUsernamePassword("NA", checksum);//"NA";
        ////requestDTO.setConsumerAddress = ed.EncryptUsernamePassword("NA", checksum);//"NA";
        //requestDTO.email = ed.EncryptUsernamePassword("NA", checksum);//"NA";
        //requestDTO.mobile = ed.EncryptUsernamePassword("NA", checksum);//"NA";
        //requestDTO.customField1 = ed.EncryptUsernamePassword("NA", checksum);//"NA";
        //requestDTO.customField2 = ed.EncryptUsernamePassword("NA", checksum);//"NA";
        //requestDTO.customField3 = ed.EncryptUsernamePassword("NA", checksum);//"NA";
        //requestDTO.customField4 = ed.EncryptUsernamePassword("NA", checksum);//"NA";
        //requestDTO.customField5 = ed.EncryptUsernamePassword("NA", checksum);//"NA";
        //requestDTO.customField6 = ed.EncryptUsernamePassword("NA", checksum);//"NA";
        //requestDTO.billerTransactionID = ed.EncryptUsernamePassword("NA", checksum);//"NA";


        //RSACryptoServiceProvider encryptionProvider = getPublicKeyProvider(publicKeyFileName);//Load the private key 
        //RSACryptoServiceProvider decryptionProvider = getPrivateKeyProvider(privateKeyFileName);//load the public key         
        //byte[] encryptedData, decryptedData;
        //encryptedData = encryptionProvider.Encrypt(Encoding.UTF8.GetBytes(checksum), false);//Encrypt the checksum value
        //string encryptedString = GetBytesToString(encryptedData);
        ////decryptedData = decryptionProvider.Decrypt(encryptedData, false);
        ////dest = Encoding.UTF8.GetString(decryptedData);
        //requestDTO.checksum = encryptedString;

        //List<ReceiptResponseDTO> WebApiResp = new List<ReceiptResponseDTO>();
        //using (WebClient client = new WebClient())
        //{

        //    client.Headers[HttpRequestHeader.ContentType] = "application/json";
        //    client.Headers[HttpRequestHeader.Accept] = "application/json";
        //    client.Headers[HttpRequestHeader.AcceptCharset] = "UTF-8";
        //    client.Headers["detail"] = "PCMC|PTAX|L&T";
        //    var jsonObj = JsonConvert.SerializeObject(requestDTO);
        //    var ResponseString = client.UploadString(StrApiUrl, jsonObj);


        //    DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof(ReceiptResponseDTO));
        //    MemoryStream stream1 = new MemoryStream(Encoding.Default.GetBytes(ResponseString));
        //    ReceiptResponseDTO resUpdateChequeStatus = (ReceiptResponseDTO)ser.ReadObject(stream1);

        //    if(decryptionProvider==null)
        //        decryptionProvider = getPrivateKeyProvider(privateKeyFileName);
        //    SoapHexBinary shb = SoapHexBinary.Parse(resUpdateChequeStatus.checksum);

        //    decryptedData = decryptionProvider.Decrypt(shb.Value, false);
        //  string   BillCloud_ResCheckSumValue = Encoding.UTF8.GetString(decryptedData);

        //    string BillerTxnId = ed.DecryptUsernamePassword(resUpdateChequeStatus.billerTransactionID, BillCloud_ResCheckSumValue);
        //    string Status = ed.DecryptUsernamePassword(resUpdateChequeStatus.status, BillCloud_ResCheckSumValue);
        //    string Reason = ed.DecryptUsernamePassword(resUpdateChequeStatus.reason, BillCloud_ResCheckSumValue);
        //    string ReceiptID = ed.DecryptUsernamePassword(resUpdateChequeStatus.receiptID, BillCloud_ResCheckSumValue);
        //    string TxnId_BillCloud = ed.DecryptUsernamePassword(resUpdateChequeStatus.transactionID, BillCloud_ResCheckSumValue);

        //}

        ////  requestDTO.checksum = checksum;
        ////var DATA = JsonConvert.SerializeObject(requestDTO);


        ////RSACryptoServiceProvider encryptionProvider = getPublicKeyProvider(publicKeyFileName);
        ////RSACryptoServiceProvider decryptionProvider = getPrivateKeyProvider(privateKeyFileName);
        ////string source = checksum, dest = "";
        ////byte[] encryptedData, decryptedData;
        ////encryptedData = encryptionProvider.Encrypt(Encoding.UTF8.GetBytes(source), false);
        //////  encryptedData = encryptionProvider.Encrypt(Encoding.UTF8.GetBytes(requestDTO), false);
        ////requestDTO.checksum = checksum;
        ////string encryptedString = GetBytesToString(encryptedData);
        ////decryptedData = decryptionProvider.Decrypt(encryptedData, false);
        ////dest = Encoding.UTF8.GetString(decryptedData);

        ////   WebClient webClient = new WebClient();
        ////   webClient.Headers[HttpRequestHeader.ContentType] = "application/json";
        ////   webClient.Headers[HttpRequestHeader.Accept] = "application/json";
        ////   webClient.Headers[HttpRequestHeader.AcceptCharset] = "UTF-8";
        ////   webClient.Headers["detail"] = "PCMC|PTAX|L&T";
        ////   DataContractJsonSerializer objJsonSerSend = new DataContractJsonSerializer(typeof(ReceiptRequestDTO));
        ////   MemoryStream memStrToSend = new MemoryStream();
        ////   objJsonSerSend.WriteObject(memStrToSend, requestDTO);
        ////   string data = Encoding.Default.GetString(memStrToSend.ToArray());
        ////   string result = webClient.UploadString(StrApiUrl, "POST", data);

        ////   DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof(ReceiptResponseDTO));
        ////   MemoryStream stream1 = new MemoryStream(Encoding.Default.GetBytes(result));
        ////   ReceiptResponseDTO resUpdateChequeStatus = (ReceiptResponseDTO)ser.ReadObject(stream1);

        ////   byte[] bytes1 = Encoding.ASCII.GetBytes(resUpdateChequeStatus.billerTransactionID);

        //// decryptedData = decryptionProvider.Decrypt(bytes1, false);
        ////string    dest1 = Encoding.UTF8.GetString(decryptedData);

        //// WebClient objWebClient = new WebClient();
        //// objWebClient.Headers[HttpRequestHeader.ContentType] = "application/json";
        //// objWebClient.Headers[HttpRequestHeader.Accept] = "application/json";
        //// objWebClient.Headers["detail"] = "PCMC|PTAX|L&T";

        //// // string strResponse = objWebClient.UploadString(StrApiUrl, "POST", encryptedString);
        ////string strResponse = objWebClient.UploadString(StrApiUrl, encryptedString);
        ////var res =  objWebClient.UploadData(StrApiUrl, encryptedData);


        ////HttpContent content = new StringContent(encryptedString, UTF8Encoding.UTF8, "application/json");
        ////HttpResponseMessage messge = client.PostAsync(StrApiUrl, content).Result;

        ////if (messge.IsSuccessStatusCode)
        ////{
        ////    string result = messge.Content.ReadAsStringAsync().Result;
        ////}


    }

    public class ReceiptResponseDTO
    {
        public string transactionID { get; set; }
        public string billerTransactionID { get; set; }
        public string receiptID { get; set; }
        public string status { get; set; }
        public string reason { get; set; }
        public string checksum { get; set; }


    }

    public class ReceiptRequestDTO
    {
        public string billerID { get; set; }
        public string serviceID { get; set; }
        public string fundID { get; set; }
        public string consumerID { get; set; }
        //public string consumerName { get; set; }
        public string consumerAddress { get; set; }
        public string amount { get; set; }
        public string transactionDate { get; set; }
        public string counterID { get; set; }
        public string userID { get; set; }
        public string channelID { get; set; }
        public string channelTransactionID { get; set; }
        public string paymentMode { get; set; }
        public string checksum { get; set; }

        public string unitID { get; set; }
        public string locationID { get; set; }
        public string subUnitID { get; set; }
        public string consumerName { get; set; }
        //public string consumerAddress { get; set; }
        public string email { get; set; }
        public string mobile { get; set; }
        public string customField1 { get; set; }
        public string customField2 { get; set; }
        public string customField3 { get; set; }
        public string customField4 { get; set; }
        public string customField5 { get; set; }
        public string customField6 { get; set; }
        public string billerTransactionID { get; set; }
    }


    private String generateChecksum(String input)
    {
        //byte[] bytes;

        //bytes = System.Text.Encoding.UTF8.GetBytes(input);
        //Adler32 generateCheckSum = new Adler32();
        //generateCheckSum.Update(bytes);
        //String checksum = (generateCheckSum.Value) + "";
        //return checksum;
        return "";
    }



    public static RSACryptoServiceProvider getPublicKeyProvider(String filename)
    {
        RSACryptoServiceProvider rsa = null;
        byte[] keyblob = GetFileBytes(filename);
        if (keyblob == null)
            return null;

        rsa = DecodeX509PublicKey(keyblob);
        //if (rsa != null)
        //{
        //                String xmlpublickey = rsa.ToXmlString(false);
        //                Console.WriteLine("\nXML RSA public key:  {0} bits\n{1}\n", rsa.KeySize, xmlpublickey);
        //}

        return rsa;
    }

    public static RSACryptoServiceProvider getPrivateKeyProvider(String filename)
    {
        RSACryptoServiceProvider rsa = null;
        byte[] keyblob = GetFileBytes(filename);
        if (keyblob == null)
            return null;

        rsa = DecodePrivateKeyInfo(keyblob);    //PKCS #8 unencrypted
                                                //if (rsa != null)
                                                //{
                                                //                String xmlprivatekey = rsa.ToXmlString(true);
                                                //                Console.WriteLine("\nXML RSA private key:  {0} bits\n{1}\n", rsa.KeySize, xmlprivatekey);
                                                //}

        return rsa;
    }


    //------- Parses binary asn.1 X509 SubjectPublicKeyInfo; returns RSACryptoServiceProvider ---
    public static RSACryptoServiceProvider DecodeX509PublicKey(byte[] x509key)
    {
        // encoded OID sequence for  PKCS #1 rsaEncryption szOID_RSA_RSA = "1.2.840.113549.1.1.1"
        byte[] SeqOID = { 0x30, 0x0D, 0x06, 0x09, 0x2A, 0x86, 0x48, 0x86, 0xF7, 0x0D, 0x01, 0x01, 0x01, 0x05, 0x00 };
        byte[] seq = new byte[15];
        // ---------  Set up stream to read the asn.1 encoded SubjectPublicKeyInfo blob  ------
        MemoryStream mem = new MemoryStream(x509key);
        BinaryReader binr = new BinaryReader(mem);    //wrap Memory Stream with BinaryReader for easy reading
        byte bt = 0;
        ushort twobytes = 0;

        try
        {

            twobytes = binr.ReadUInt16();
            if (twobytes == 0x8130) //data read as little endian order (actual data order for Sequence is 30 81)
                binr.ReadByte();    //advance 1 byte
            else if (twobytes == 0x8230)
                binr.ReadInt16();   //advance 2 bytes
            else
                return null;

            seq = binr.ReadBytes(15);       //read the Sequence OID
            if (!CompareBytearrays(seq, SeqOID))    //make sure Sequence for OID is correct
                return null;

            twobytes = binr.ReadUInt16();
            if (twobytes == 0x8103) //data read as little endian order (actual data order for Bit String is 03 81)
                binr.ReadByte();    //advance 1 byte
            else if (twobytes == 0x8203)
                binr.ReadInt16();   //advance 2 bytes
            else
                return null;

            bt = binr.ReadByte();
            if (bt != 0x00)     //expect null byte next
                return null;

            twobytes = binr.ReadUInt16();
            if (twobytes == 0x8130) //data read as little endian order (actual data order for Sequence is 30 81)
                binr.ReadByte();    //advance 1 byte
            else if (twobytes == 0x8230)
                binr.ReadInt16();   //advance 2 bytes
            else
                return null;

            twobytes = binr.ReadUInt16();
            byte lowbyte = 0x00;
            byte highbyte = 0x00;

            if (twobytes == 0x8102) //data read as little endian order (actual data order for Integer is 02 81)
                lowbyte = binr.ReadByte();  // read next bytes which is bytes in modulus
            else if (twobytes == 0x8202)
            {
                highbyte = binr.ReadByte(); //advance 2 bytes
                lowbyte = binr.ReadByte();
            }
            else
                return null;
            byte[] modint = { lowbyte, highbyte, 0x00, 0x00 };   //reverse byte order since asn.1 key uses big endian order
            int modsize = BitConverter.ToInt32(modint, 0);

            byte firstbyte = binr.ReadByte();
            binr.BaseStream.Seek(-1, SeekOrigin.Current);

            if (firstbyte == 0x00)
            {   //if first byte (highest order) of modulus is zero, don't include it
                binr.ReadByte();    //skip this null byte
                modsize -= 1;   //reduce modulus buffer size by 1
            }

            byte[] modulus = binr.ReadBytes(modsize);   //read the modulus bytes

            if (binr.ReadByte() != 0x02)            //expect an Integer for the exponent data
                return null;
            int expbytes = (int)binr.ReadByte();        // should only need one byte for actual exponent data (for all useful values)
            byte[] exponent = binr.ReadBytes(expbytes);


            if (verbose)
            {
                showBytes("\nExponent", exponent);
                showBytes("\nModulus", modulus);
            }

            // ------- create RSACryptoServiceProvider instance and initialize with public key -----
            RSACryptoServiceProvider RSA = new RSACryptoServiceProvider();
            RSAParameters RSAKeyInfo = new RSAParameters();
            RSAKeyInfo.Modulus = modulus;
            RSAKeyInfo.Exponent = exponent;
            RSA.ImportParameters(RSAKeyInfo);
            return RSA;
        }
        catch (Exception)
        {
            return null;
        }

        finally { binr.Close(); }

    }

    //------- Parses binary asn.1 PKCS #8 PrivateKeyInfo; returns RSACryptoServiceProvider ---
    public static RSACryptoServiceProvider DecodePrivateKeyInfo(byte[] pkcs8)
    {
        // encoded OID sequence for  PKCS #1 rsaEncryption szOID_RSA_RSA = "1.2.840.113549.1.1.1"
        // this byte[] includes the sequence byte and terminal encoded null 
        byte[] SeqOID = { 0x30, 0x0D, 0x06, 0x09, 0x2A, 0x86, 0x48, 0x86, 0xF7, 0x0D, 0x01, 0x01, 0x01, 0x05, 0x00 };
        byte[] seq = new byte[15];
        // ---------  Set up stream to read the asn.1 encoded SubjectPublicKeyInfo blob  ------
        MemoryStream mem = new MemoryStream(pkcs8);
        int lenstream = (int)mem.Length;
        BinaryReader binr = new BinaryReader(mem);    //wrap Memory Stream with BinaryReader for easy reading
        byte bt = 0;
        ushort twobytes = 0;

        try
        {

            twobytes = binr.ReadUInt16();
            if (twobytes == 0x8130) //data read as little endian order (actual data order for Sequence is 30 81)
                binr.ReadByte();    //advance 1 byte
            else if (twobytes == 0x8230)
                binr.ReadInt16();   //advance 2 bytes
            else
                return null;


            bt = binr.ReadByte();
            if (bt != 0x02)
                return null;

            twobytes = binr.ReadUInt16();

            if (twobytes != 0x0001)
                return null;

            seq = binr.ReadBytes(15);       //read the Sequence OID
            if (!CompareBytearrays(seq, SeqOID))    //make sure Sequence for OID is correct
                return null;

            bt = binr.ReadByte();
            if (bt != 0x04) //expect an Octet string 
                return null;

            bt = binr.ReadByte();       //read next byte, or next 2 bytes is  0x81 or 0x82; otherwise bt is the byte count
            if (bt == 0x81)
                binr.ReadByte();
            else
                if (bt == 0x82)
                binr.ReadUInt16();
            //------ at this stage, the remaining sequence should be the RSA private key

            byte[] rsaprivkey = binr.ReadBytes((int)(lenstream - mem.Position));
            RSACryptoServiceProvider rsacsp = DecodeRSAPrivateKey(rsaprivkey);
            return rsacsp;
        }

        catch (Exception)
        {
            return null;
        }

        finally { binr.Close(); }

    }
    //------- Parses binary ans.1 RSA private key; returns RSACryptoServiceProvider  ---
    public static RSACryptoServiceProvider DecodeRSAPrivateKey(byte[] privkey)
    {
        byte[] MODULUS, E, D, P, Q, DP, DQ, IQ;

        // ---------  Set up stream to decode the asn.1 encoded RSA private key  ------
        MemoryStream mem = new MemoryStream(privkey);
        BinaryReader binr = new BinaryReader(mem);    //wrap Memory Stream with BinaryReader for easy reading
        byte bt = 0;
        ushort twobytes = 0;
        int elems = 0;
        try
        {
            twobytes = binr.ReadUInt16();
            if (twobytes == 0x8130) //data read as little endian order (actual data order for Sequence is 30 81)
                binr.ReadByte();    //advance 1 byte
            else if (twobytes == 0x8230)
                binr.ReadInt16();   //advance 2 bytes
            else
                return null;

            twobytes = binr.ReadUInt16();
            if (twobytes != 0x0102) //version number
                return null;
            bt = binr.ReadByte();
            if (bt != 0x00)
                return null;


            //------  all private key components are Integer sequences ----
            elems = GetIntegerSize(binr);
            MODULUS = binr.ReadBytes(elems);

            elems = GetIntegerSize(binr);
            E = binr.ReadBytes(elems);

            elems = GetIntegerSize(binr);
            D = binr.ReadBytes(elems);

            elems = GetIntegerSize(binr);
            P = binr.ReadBytes(elems);

            elems = GetIntegerSize(binr);
            Q = binr.ReadBytes(elems);

            elems = GetIntegerSize(binr);
            DP = binr.ReadBytes(elems);

            elems = GetIntegerSize(binr);
            DQ = binr.ReadBytes(elems);

            elems = GetIntegerSize(binr);
            IQ = binr.ReadBytes(elems);

            if (verbose)
            {
                showBytes("\nModulus", MODULUS);
                showBytes("\nExponent", E);
                showBytes("\nD", D);
                showBytes("\nP", P);
                showBytes("\nQ", Q);
                showBytes("\nDP", DP);
                showBytes("\nDQ", DQ);
                showBytes("\nIQ", IQ);
            }

            // ------- create RSACryptoServiceProvider instance and initialize with public key -----
            RSACryptoServiceProvider RSA = new RSACryptoServiceProvider();
            RSAParameters RSAparams = new RSAParameters();
            RSAparams.Modulus = MODULUS;
            RSAparams.Exponent = E;
            RSAparams.D = D;
            RSAparams.P = P;
            RSAparams.Q = Q;
            RSAparams.DP = DP;
            RSAparams.DQ = DQ;
            RSAparams.InverseQ = IQ;
            RSA.ImportParameters(RSAparams);
            return RSA;
        }
        catch (Exception e)
        {
            Console.Write(e.StackTrace);
            return null;
        }
        finally { binr.Close(); }
    }
    private static int GetIntegerSize(BinaryReader binr)
    {
        byte bt = 0;
        byte lowbyte = 0x00;
        byte highbyte = 0x00;
        int count = 0;
        bt = binr.ReadByte();
        if (bt != 0x02)     //expect integer
            return 0;
        bt = binr.ReadByte();

        if (bt == 0x81)
            count = binr.ReadByte();    // data size in next byte
        else
            if (bt == 0x82)
        {
            highbyte = binr.ReadByte(); // data size in next 2 bytes
            lowbyte = binr.ReadByte();
            byte[] modint = { lowbyte, highbyte, 0x00, 0x00 };
            count = BitConverter.ToInt32(modint, 0);
        }
        else
        {
            count = bt;     // we already have the data size
        }



        while (binr.ReadByte() == 0x00)
        {   //remove high order zeros in data
            count -= 1;
        }
        binr.BaseStream.Seek(-1, SeekOrigin.Current);       //last ReadByte wasn't a removed zero, so back up a byte
        return count;
    }


    private static bool CompareBytearrays(byte[] a, byte[] b)
    {
        if (a.Length != b.Length)
            return false;
        int i = 0;
        foreach (byte c in a)
        {
            if (c != b[i])
                return false;
            i++;
        }
        return true;
    }



    private static void showBytes(String info, byte[] data)
    {
        Console.WriteLine("{0}  [{1} bytes]", info, data.Length);
        for (int i = 1; i <= data.Length; i++)
        {
            Console.Write("{0:X2}  ", data[i - 1]);
            if (i % 16 == 0)
                Console.WriteLine();
        }
        Console.WriteLine("\n\n");
    }


    private static byte[] GetFileBytes(String filename)
    {
        if (!File.Exists(filename))
            return null;
        Stream stream = new FileStream(filename, FileMode.Open);
        int datalen = (int)stream.Length;
        byte[] filebytes = new byte[datalen];
        stream.Seek(0, SeekOrigin.Begin);
        stream.Read(filebytes, 0, datalen);
        stream.Close();
        return filebytes;
    }

    public static byte[] GetStringToBytes(string value)
    {
        SoapHexBinary shb = SoapHexBinary.Parse(value);
        return shb.Value;
    }

    public static string GetBytesToString(byte[] value)
    {
        SoapHexBinary shb = new SoapHexBinary(value);
        return shb.ToString();
    }


    private static void showWin32Error(int errorcode)
    {
        Win32Exception myEx = new Win32Exception(errorcode);
        Console.ForegroundColor = ConsoleColor.Red;
        Console.WriteLine("Error code:\t 0x{0:X}", myEx.ErrorCode);
        Console.WriteLine("Error message:\t {0}\n", myEx.Message);
        Console.ForegroundColor = ConsoleColor.Gray;
    }




    [StructLayout(LayoutKind.Sequential)]
    public struct CRYPT_KEY_PROV_INFO
    {
        [MarshalAs(UnmanagedType.LPWStr)]
        public String pwszContainerName;
        [MarshalAs(UnmanagedType.LPWStr)]
        public String pwszProvName;
        public uint dwProvType;
        public uint dwFlags;
        public uint cProvParam;
        public IntPtr rgProvParam;
        public uint dwKeySpec;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct CERT_NAME_BLOB
    {
        public int cbData;
        public IntPtr pbData;
    }
    public class Win32
    {

        [DllImport("crypt32.dll", SetLastError = true)]
        public static extern IntPtr CertCreateSelfSignCertificate(
        IntPtr hProv,
        ref CERT_NAME_BLOB pSubjectIssuerBlob,
        uint dwFlagsm,
        ref CRYPT_KEY_PROV_INFO pKeyProvInfo,
        IntPtr pSignatureAlgorithm,
        IntPtr pStartTime,
        IntPtr pEndTime,
        IntPtr other);


        [DllImport("crypt32.dll", SetLastError = true)]
        public static extern bool CertStrToName(
         uint dwCertEncodingType,
         String pszX500,
         uint dwStrType,
         IntPtr pvReserved,
         [In, Out] byte[] pbEncoded,
         ref uint pcbEncoded,
         IntPtr other);

        [DllImport("crypt32.dll", SetLastError = true)]
        public static extern bool CertFreeCertificateContext(
        IntPtr hCertStore);

    }

    public class JsonParams
    {
        public string BillCloud_ResCheckSumValue;
        public string BillerTxnId;
        public string Status;
        public string Reason;
        public string ReceiptID;
        public string TxnId_BillCloud;

    }
}
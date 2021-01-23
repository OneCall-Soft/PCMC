using Newtonsoft.Json;
using System;
using System.IO;
using System.IdentityModel.Tokens.Jwt;
using System.Web;
using System.Net;
using System.Configuration;

public class ResWaterTaxPayments
{
    public string status { get; set; }
    public string amount { get; set; }
    public string consumer_id { get; set; }
    public string mihpayid { get; set; }
    public string txnid { get; set; }
    public int iat { get; set; }
    public int exp { get; set; }
}
public partial class PropertyTax : BasePage
{
    string TransactionID = "";
    string BillerTransactionID = "";
    string BillerReceiptNumber = "";
    string TransactionDate = "";
    string Amount = "";
    string NetAmount = "";
    string ServiceTax = "";
    string ConsumerID = "";
    string ServiceID = "";
    string ChannelTransactionID = "";
    string ChannelID = "";
    string PaymentMode = "";
    string Mobile = "";
    string Email = "";
    string CustomField1 = "";
    string CustomField2 = "";
    string CustomField3 = "";
    string CustomField4 = "";
    string CustomField5 = "";
    string Status = "";
    string Reason = "";
    string Checksum = "";
    bool isSucceded = false;
    ResWaterTaxPayments objResWaterTaxPayments;
    URLS urls;
    IniFile objINI;
    string ini_path, kioskID = "";

    protected void Page_Load(object sender, EventArgs e)
    {
       
        try
        {
            //EssentialInfo.GetMacAddress();
            //EssentialInfo._GetIP();
            IniFile objINI;
            string ini_path, kioskID,paymentMode,cardType = "";

            string url = ConfigurationManager.AppSettings["RMSSERVERURL"].ToString();
            WebClient webClient = new WebClient();
            webClient.Headers[HttpRequestHeader.ContentType] = "text/json";

            this.hdnaddress.InnerText = System.Configuration.ConfigurationManager.AppSettings["OfficeAddress"].ToString();
            string Token = HttpUtility.UrlDecode(Request.QueryString["token"]);
            var handler = new JwtSecurityTokenHandler();
            var jsonToken = handler.ReadToken(Token);
            var tokenS = handler.ReadToken(Token) as JwtSecurityToken;
            string Temp = Convert.ToString(tokenS);
            Temp = Temp.Substring(Temp.LastIndexOf('{'), Temp.Length - Temp.LastIndexOf('{'));
            objResWaterTaxPayments = JsonConvert.DeserializeObject<ResWaterTaxPayments>(Convert.ToString(Temp));

            ini_path = "C:\\RMS\\KioskClientConfig.ini";
            objINI = new IniFile(ini_path);
            kioskID = objINI.IniReadValue("Kiosk_Details", "Kiosk_ID");



            if (Session["paymentMode"] != null && Session["paymentMode"].ToString() != "")
                paymentMode = Session["paymentMode"].ToString();
            else
                paymentMode = "card";

            if (Session["CardType"] != null && Session["CardType"].ToString() != "")
                cardType = Session["CardType"].ToString();
            else
                cardType = "N/A";

            if (objResWaterTaxPayments.status == "Fail")
            {

                Txn txndata = new Txn() { TxnID = objResWaterTaxPayments.txnid.ToString(),BillerID= objResWaterTaxPayments.consumer_id,MerchantName= "N/A", Amount = objResWaterTaxPayments.amount, Status = "fail", TxnType = "watertax", Datetime = DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss"), KioskIP = kioskID,CustomerName = Session["WTCustomer_Name"].ToString()};
                string jsondata = JsonConvert.SerializeObject(txndata);

                string result = webClient.UploadString(url + "/SaveTxn", "POST", jsondata);

                //MARK:- Creating transaction history in txt file
                Directory.CreateDirectory(@"D:\EzyTap");
                var dt = DateTime.Now.Date.ToString("dd-MM-yy");
                    var hour = DateTime.Now.Hour.ToString();
                    var min = DateTime.Now.Minute.ToString();
                    var sec = DateTime.Now.Second.ToString();

                    string ndata = objResWaterTaxPayments.txnid.ToString() + "_" + dt + "-" + hour + "-" + min + "-" + sec + "_" + objResWaterTaxPayments.status.ToString() + ".txt";

                    StreamWriter sw = new StreamWriter(@"D:\EzyTap\Response_" + ndata);
                    string[] data = { "STATUS : "+objResWaterTaxPayments.status.ToString(),"TXN ID : "+objResWaterTaxPayments.txnid.ToString(),
                                       "CONSUMER ID : "+ Session["ConsumerIDWater"].ToString()};

                    foreach (var d in data)
                    {
                        sw.WriteLine(d);
                    }
                    sw.Close();

               

                string html = "<html>" + Environment.NewLine;
                html += "<head>" + Environment.NewLine;
                html += "<script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js \" integrity = \"sha384 - wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6\" crossorigin = \"anonymous\" > </script>" + Environment.NewLine;
                html += "<link rel=\"stylesheet\" href=\" https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css \"  integrity = \"sha384 - Vkoo8x4CGsO3 + Hhxv8T / Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh\" crossorigin = \"anonymous\"  >" + Environment.NewLine;
                html += "</head>" + Environment.NewLine;

                //Adding HeaderRow.
                html += "<body>" + Environment.NewLine;
                html += "<form action=\'' method='post'>" + Environment.NewLine;
                html += "<div style=\"width:100%;align-text:center; border:1; \">" + Environment.NewLine;
                html += "<center><h1 style=\"color:red;margin-top:150px; \">Transaction Failed!</h1></center><br/>" + Environment.NewLine;
                html += "<center><button type=\"button\" class=\"btn btn-primary\" style=\"width:150px;\"  onclick = \"window.location.href='"+URLS.url.allurls.watertaxHome +"\'\" > Ok </ button ></center>" + Environment.NewLine;

                html += "</div></form>" + Environment.NewLine;
                html += "</body></html>";


                if (File.Exists(Server.MapPath("JSP/modal.html")))
                    File.Delete(Server.MapPath("JSP/modal.html"));

                File.WriteAllText(Server.MapPath("JSP/modal.html"), html);

                Response.Redirect("~/JSP/modal.html");

            }
            else
            {


                //MARK:- Creating transaction history in txt file

                Txn txndata = new Txn() { TxnID = objResWaterTaxPayments.txnid.ToString(), Amount = objResWaterTaxPayments.amount, Status = "success", TxnType = "watertax", Datetime = DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss"), KioskIP = kioskID, CustomerName = Session["WTCustomer_Name"].ToString(),CardType=cardType,PaymentMode=paymentMode };
                string jsondata = JsonConvert.SerializeObject(txndata);

                string result = webClient.UploadString(url + "/SaveTxn", "POST", jsondata);

                Directory.CreateDirectory(@"D:\EzyTap");
                var dt = DateTime.Now.Date.ToString("dd-MM-yy");
                var hour = DateTime.Now.Hour.ToString();
                var min = DateTime.Now.Minute.ToString();
                var sec = DateTime.Now.Second.ToString();

                string ndata = objResWaterTaxPayments.txnid.ToString() + "_" + dt + "-" + hour + "-" + min + "-" + sec + "_" + objResWaterTaxPayments.status.ToString() + ".txt";

                StreamWriter sw = new StreamWriter(@"D:\EzyTap\Response_" + ndata);
                string[] data = { "STATUS : "+objResWaterTaxPayments.status.ToString(),"TXN ID : "+objResWaterTaxPayments.txnid.ToString(),
                                       "CONSUMER ID : "+ Session["ConsumerIDWater"].ToString()};

                foreach (var d in data)
                {
                    sw.WriteLine(d);
                }

                sw.Close();
                
                Status = objResWaterTaxPayments.status;
                Reason = objResWaterTaxPayments.mihpayid;
                TransactionID = objResWaterTaxPayments.txnid;
                NetAmount = objResWaterTaxPayments.amount;
                PaymentMode = "Card";
                Session["ConsumerIDWater"] = objResWaterTaxPayments.consumer_id;
                lblTxnID.InnerText = TransactionID;
                lblTxnDate.InnerText = DateTime.Now.ToString("dd-MM-yyyy");
                lblTxnAmount.InnerText = NetAmount;

                lblConsumerID.InnerText = Session["ConsumerIDWater"].ToString();
                lblPaymentMode.InnerText = PaymentMode;
                lblStatus.InnerText = Status;

            }
        }
        catch (Exception ex)
        {

        }


    }

    protected void openWindow()
    {
        // ClientScript.RegisterStartupScript(this.GetType(), "popup", "var win = window.open(_self,); win.focus();", true);
    }

    protected void Page_LoadComplete(object sender, EventArgs e)
    {


        string CompleteData = "";
        string HeaderData = "";
        string ReceiptData = "";

        HeaderData = "Pimpri-Chinchwad Smart City Kiosk";
        HeaderData += "\r\n";
        HeaderData += "KioskID: LIPI00001";
        HeaderData += "\r\n";
        HeaderData += "Address: PCMC Road";
        HeaderData += "\r\n";

        //ReceiptData = "Consumer ID: ";
        //ReceiptData += ConsumerID + "\r\n";
        ReceiptData = "Consumer Name: ";
        ReceiptData += "Mukesh \r\n";
        ReceiptData += "Transaction Date: ";
        ReceiptData += DateTime.Now + "\r\n";
        ReceiptData += "Transaction ID: ";
        ReceiptData += "1111111111\r\n";
        ReceiptData += "Amount: ";
        ReceiptData += "500\r\n";
        ReceiptData += "PaymentMode: Card ";
        ReceiptData += "\r\n";
        ReceiptData += "***********Thank You**********\r\n";
        ReceiptData += "\r\n";
        ReceiptData += "\r\n";

        CompleteData = HeaderData + "$" + ReceiptData;




    }

    protected void btn_EditPayment(object sender, EventArgs e)
    {
        
    }
    protected void btn_PrintRecipt(object sender, EventArgs e)
    {


    }
    protected void btn_PropertyTax(object sender, EventArgs e)
    {

    }

    protected void btn_MakePayment(object sender, EventArgs e)
    {

    }
}
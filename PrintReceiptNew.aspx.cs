using System;
using System.IO;
using System.Net;
using System.Configuration;


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
    string paymentMode = "";
    string cardType = "";

    URLS urls;

    protected void Page_Load(object sender, EventArgs e)
    {
        string url = ConfigurationManager.AppSettings["RMSSERVERURL"].ToString();
        WebClient webClient = new WebClient();
        webClient.Headers[HttpRequestHeader.ContentType] = "text/json";

        EssentialInfo.GetMacAddress();
        EssentialInfo._GetIP();
        IniFile objINI;
        string ini_path,kioskID,customerID, customerName = "";
        

        if (Session["paymentMode"] != null && Session["paymentMode"].ToString() != "") 
            paymentMode = Session["paymentMode"].ToString();
        else 
            paymentMode = "card";

        if (Session["CardType"] != null && Session["CardType"].ToString() != "")
            cardType = Session["CardType"].ToString();
        else
            cardType = "N/A";


        if (Session["ConsumerIDWater"] != null && Session["ConsumerIDWater"].ToString() != "")
            customerID = Session["ConsumerIDWater"].ToString();
        else
            customerID = "0000";

        if (Session["Consumer_PTname"] != null && Session["Consumer_PTname"].ToString() != "")
            customerName = Session["Consumer_PTname"].ToString();
        else
            customerName = "N/A";

        if (Session["Status"].ToString() != "")
        {
            ini_path = "C:\\RMS\\KioskClientConfig.ini";
            objINI = new IniFile(ini_path);
            kioskID = objINI.IniReadValue("Kiosk_Details", "Kiosk_ID");

            // hdnaddress.Visible = false;
            this.hdnaddress.InnerText = System.Configuration.ConfigurationManager.AppSettings["OfficeAddress"].ToString();
            //MARK:- Creating transaction history in txt file
            //MARK:- Preparing file name
            var dt = DateTime.Now.Date.ToString("dd-MM-yy");
            var hour = DateTime.Now.Hour.ToString();
            var min = DateTime.Now.Minute.ToString();
            var sec = DateTime.Now.Second.ToString();

            string ndata = Session["ConsumerIDWater"].ToString() + "_" + dt + "-" + hour + "-" + min + "-" + sec + "_" + Session["Status"].ToString() + ".txt";  //Transaction details file name

            Directory.CreateDirectory(@"D:\EzyTap");
            StreamWriter sw = new StreamWriter(@"D:\EzyTap\Respo_" + ndata);

            string[] data = {"DATE : "+DateTime.Now.ToString(), "STATUS : Success","TXN ID : "+ Session["urnnumber"].ToString(),
                                    "CONSUMER ID : " +Session["ConsumerID"].ToString(),"AMOUNT : "+ Session["Consumer_PTbalance"].ToString() };



            Txn txndata = new Txn() { BillerID = Session["ConsumerIDWater"].ToString(), TxnID = Session["urnnumber"].ToString(), PaymentMode = paymentMode, MerchantName = "", CardType = cardType, Amount = Session["Consumer_PTbalance"].ToString(), Status = "success", TxnType = "propertytax", Datetime = DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss"), KioskIP = kioskID, CustomerName = customerName };
            string jsondata = Newtonsoft.Json.JsonConvert.SerializeObject(txndata);

            string result = webClient.UploadString(url + "/SaveTxn", "POST", jsondata);

            foreach (var d in data)
            {
                sw.WriteLine(d);
            }

            sw.Close();

            lblTxnID.InnerText = Session["urnnumber"].ToString();
            lblTxnAmount.InnerText = Session["Consumer_PTbalance"].ToString();

            lblTxnDate.InnerText = DateTime.Now.ToString("dd-MM-yyyy");

            string Time1 = DateTime.Now.ToString("HH:mm:ss");

            lblConsumerID.InnerText = Session["ConsumerID"].ToString();
            lblPaymentMode.InnerText = "Card";
            lblStatus.InnerText = "";//Session["Status"].ToString();
        }
        else
        {
            ini_path = "C:\\RMS\\KioskClientConfig.ini";
            objINI = new IniFile(ini_path);
            kioskID = objINI.IniReadValue("Kiosk_Details", "Kiosk_ID");


            //MARK:- Creating transaction history in txt file
            Directory.CreateDirectory(@"D:\EzyTap");
            var dt = DateTime.Now.Date.ToString("dd-MM-yy");
            var hour = DateTime.Now.Hour.ToString();
            var min = DateTime.Now.Minute.ToString();
            var sec = DateTime.Now.Second.ToString();

            string ndata = "Consu_" + Session["ConsumerID"].ToString() + "_" + dt + "-" + hour + "-" + min + "-" + sec + "_ Failed.txt";

            StreamWriter sw = new StreamWriter(@"D:\EzyTap\Respo_" + ndata);

            string[] data = {"DATE : "+DateTime.Now.ToString(), "STATUS : Fail","TXN ID : "+ Session["urnnumber"].ToString(),
                                    "CONSUMER ID : " +Session["ConsumerID"].ToString(),"AMOUNT : "+ Session["Consumer_PTbalance"].ToString() };


            Txn txndata = new Txn() { BillerID = Session["ConsumerID"].ToString(), TxnID = Session["urnnumber"].ToString(), PaymentMode = paymentMode, MerchantName = "", CardType = cardType, Amount = Session["Consumer_PTbalance"].ToString(), Status = "fail", TxnType = "propertytax", Datetime = DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss"), KioskIP = kioskID, CustomerName = customerName };
            string jsondata = Newtonsoft.Json.JsonConvert.SerializeObject(txndata);

            string result = webClient.UploadString(url + "/SaveTxn", "POST", jsondata);

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


            html += "<body>" + Environment.NewLine;
            html += "<form action=\'' method='post'>" + Environment.NewLine;
            html += "<div style=\"width:100%;align-text:center; border:1; \">" + Environment.NewLine;
            html += "<center><h1 style=\"color:red;margin-top:150px; \">Transaction Failed!</h1></center><br/>" + Environment.NewLine;
            html += "<center><button type=\"button\" class=\"btn btn-primary\" style=\"width:150px;\"  onclick = \"window.location.href=localhost:57227:PropertyTaxNew.aspx\" > Ok </ button ></center>" + Environment.NewLine;

            html += "</div></form>" + Environment.NewLine;
            html += "</body></html>";

            //if (File.Exists(Server.MapPath("~/JSP/Modal.html")))
            //{
            //    File.Delete(Server.MapPath("~/JSP/Modal.html"));
            //    File.WriteAllText(Server.MapPath("~/JSP/Modal.html"), html);
            //   // Response.Redirect("~/JSP/Modal.html");
            //}
        }

    }


    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        string CompleteData = "";
        string HeaderData = "";
        string ReceiptData = "";

        HeaderData = "Pimpri-Chinchwad Smart City Kiosk";
        HeaderData += "\r\n";
        //HeaderData += "KioskID: LIPI00001";
        //HeaderData += "\r\n";
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
        Response.Redirect("PaymentServices1.aspx");
    }

    protected void btn_MakePayment(object sender, EventArgs e)
    {

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
}

using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Text;
using System.Web;

public partial class PrintReciptWaterTaxEzetap : System.Web.UI.Page
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
    IniFile objINI;
    string ini_path, kioskID,paymentMode,cardType,billerTxnID,customerName = "";
    

    [DllImport("kernel32.dll")]
    private static extern int GetPrivateProfileSection(string lpAppName, byte[] lpszReturnBuffer, int nSize, string lpFileName);

    public List<string> ReadConfigSection(string iniFilePath, string sectionName)
    {
        List<string> result = new List<string>();
        byte[] buffer = new byte[4096];
        GetPrivateProfileSection(sectionName, buffer, 4096, iniFilePath);
        String[] tmp = Encoding.ASCII.GetString(buffer).Trim('\0').Split('\0');
        foreach (String entry in tmp)
        {
            string[] parts = entry.Split('=');
            if (parts.Length == 2)
            {
                result.Add(parts[0]);
            }
        }
        return result;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //hdnAddress.Visible = false;
        //MARK:- getting address from webcofig 
        //EssentialInfo.GetMacAddress();  //after this you can get MAC Address from the variable MACADDRESS in this static class
        //EssentialInfo._GetIP();

        this.hdnAddress.InnerText = System.Configuration.ConfigurationManager.AppSettings["OfficeAddress"].ToString();
        string url = System.Configuration.ConfigurationManager.AppSettings["RMSSERVERURL"].ToString();
        WebClient webClient = new WebClient();
        webClient.Headers[HttpRequestHeader.ContentType] = "text/json";


        ini_path = "C:\\RMS\\KioskClientConfig.ini";
        objINI = new IniFile(ini_path);
        kioskID = objINI.IniReadValue("Kiosk_Details", "Kiosk_ID");

        if (Session["paymentMode"] != null && Session["paymentMode"].ToString() != "")
            paymentMode = Session["paymentMode"].ToString();
        else
            paymentMode = "card";

        //if (Session["CardType"] != null && Session["CardType"].ToString() != "")
        //    cardType = Session["CardType"].ToString();
        //else
        //    cardType = "N/A";


        if (Session["WTCustomerName"] != null && Session["WTCustomerName"].ToString() != "")
            customerName = Convert.ToBase64String(Encoding.UTF8.GetBytes(Session["WTCustomerName"].ToString()));
        else
            customerName = "N/A";

        if(!object.ReferenceEquals(Session["Status"],null))
        if (Session["Status"].ToString().ToLower() != "")
        {
            Txn txndata = new Txn() { CardType = cardType, BillerID = Session["ConsumerIDWater"].ToString(), PaymentMode = paymentMode, TxnID = Session["urnnumber"].ToString(), Amount = Session["Consumer_WTbalance"].ToString(), Status = "success", TxnType = "watertax", Datetime = DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss"), KioskIP = kioskID, CustomerName = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(customerName)) };
            string jsondata = Newtonsoft.Json.JsonConvert.SerializeObject(txndata);

            string result = webClient.UploadString(url + "/SaveTxn", "POST", jsondata); //inserting transaction status to rms

            lblTxnID.InnerText = Session["urnnumber"].ToString();
            lblTxnAmount.InnerText = Session["Consumer_WTbalance"].ToString();
            lblTxnDate.InnerText = DateTime.Now.ToString("dd-MM-yyyy");
            string Time1 = DateTime.Now.ToString("HH:mm:ss");

            lblConsumerID.InnerText = Session["ConsumerIDWater"].ToString();
            lblPaymentMode.InnerText = "Card";
            lblStatus.InnerText = Session["Status"].ToString();
        }
        else
        {

            Txn txndata = new Txn() { CardType = cardType, BillerID = Session["ConsumerIDWater"].ToString(), PaymentMode = paymentMode, TxnID = Session["urnnumber"].ToString(), Amount = Session["Consumer_WTbalance"].ToString(), Status = "fail", TxnType = "watertax", Datetime = DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss"), KioskIP = kioskID, CustomerName = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(customerName)) };
            string jsondata = Newtonsoft.Json.JsonConvert.SerializeObject(txndata);

            Log.Write("Json data being sent is =" + jsondata, "");

            string result = webClient.UploadString(url + "/SaveTxn", "POST", jsondata);  //inserting transaction status to rms

            Log.Write("data received =" + result, "");

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
            html += "<center><button type=\"button\" class=\"btn btn-primary\" style=\"width:150px;\"  onclick = \"window.location.href='"+URLS.url.allurls.watertaxHome+"\'\" > Ok </ button ></center>" + Environment.NewLine;

            html += "</div></form>" + Environment.NewLine;
            html += "</body></html>";

            if (File.Exists(Server.MapPath("~/JSP/Modal.html")))
            {
                File.Delete(Server.MapPath("~/JSP/Modal.html"));
                File.WriteAllText(Server.MapPath("~/JSP/Modal.html"), html);
                Response.Redirect("~/JSP/Modal.html");
            }
        }
    }

   // protected void Page_LoadComplete(object sender, EventArgs e)
   // {
        //string CompleteData = "";
        //string HeaderData = "";
        //string ReceiptData = "";

        //HeaderData = "Pimpri-Chinchwad Smart City Kiosk";
        //HeaderData += "\r\n";
        //HeaderData += "KioskID: LIPI00001";
        //HeaderData += "\r\n";
        //HeaderData += "Address: PCMC Road";
        //HeaderData += "\r\n";

        ////ReceiptData = "Consumer ID: ";
        ////ReceiptData += ConsumerID + "\r\n";
        //ReceiptData = "Consumer Name: ";
        //ReceiptData += "Mukesh \r\n";
        //ReceiptData += "Transaction Date: ";
        //ReceiptData += DateTime.Now + "\r\n";
        //ReceiptData += "Transaction ID: ";
        //ReceiptData += "1111111111\r\n";
        //ReceiptData += "Amount: ";
        //ReceiptData += "500\r\n";
        //ReceiptData += "PaymentMode: Card ";
        //ReceiptData += "\r\n";
        //ReceiptData += "***********Thank You**********\r\n";
        //ReceiptData += "\r\n";
        //ReceiptData += "\r\n";

        //CompleteData = HeaderData + "$" + ReceiptData;


  //  }

    protected void btn_EditPayment(object sender, EventArgs e)
    {


    }
    protected void btn_PrintRecipt(object sender, EventArgs e)
    {


    }
    protected void btn_PropertyTax(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }

    protected void btn_MakePayment(object sender, EventArgs e)
    {

    }
}
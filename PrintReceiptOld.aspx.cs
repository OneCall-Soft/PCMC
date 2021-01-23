using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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

	protected void Page_Load(object sender, EventArgs e)
	{
        try
        {
            if (!Directory.Exists("D:\\ReceiptData"))
            {
                Directory.CreateDirectory("D:\\ReceiptData");
            }

            using (StreamWriter objSW = new StreamWriter("D:\\ReceiptData\\" + DateTime.Now.ToString("ddMMyy") + ".txt", true))
            {
                objSW.WriteLine("***** Data Received *****");

                string[] allkeys1 = HttpContext.Current.Request.Form.AllKeys;

                for (int iKeyIndex = 0; iKeyIndex < allkeys1.Count(); iKeyIndex++)
                {
                    objSW.WriteLine(iKeyIndex + "- Value- " + HttpContext.Current.Request.Form[allkeys1[iKeyIndex]].ToString());
                }
                objSW.Close();
            }

            //Post Method Response Parameters Bill Cloud
            string[] allkeys = HttpContext.Current.Request.Form.AllKeys;

            if (allkeys.Count() > 0)
            {
                TransactionID = HttpContext.Current.Request.Form[allkeys[0]].ToString();
                BillerTransactionID = HttpContext.Current.Request.Form[allkeys[1]].ToString();
                BillerReceiptNumber = HttpContext.Current.Request.Form[allkeys[2]].ToString();
                TransactionDate = HttpContext.Current.Request.Form[allkeys[3]].ToString();
                Amount = HttpContext.Current.Request.Form[allkeys[4]].ToString();
                NetAmount = HttpContext.Current.Request.Form[allkeys[5]].ToString();
                ServiceTax = HttpContext.Current.Request.Form[allkeys[6]].ToString();
                ConsumerID = HttpContext.Current.Request.Form[allkeys[7]].ToString();
                ServiceID = HttpContext.Current.Request.Form[allkeys[8]].ToString();
                ChannelTransactionID = HttpContext.Current.Request.Form[allkeys[9]].ToString();
                ChannelID = HttpContext.Current.Request.Form[allkeys[10]].ToString();
                PaymentMode = HttpContext.Current.Request.Form[allkeys[11]].ToString();
                Mobile = HttpContext.Current.Request.Form[allkeys[12]].ToString();
                Email = HttpContext.Current.Request.Form[allkeys[13]].ToString();
                CustomField1 = HttpContext.Current.Request.Form[allkeys[14]].ToString();
                CustomField2 = HttpContext.Current.Request.Form[allkeys[15]].ToString();
                CustomField3 = HttpContext.Current.Request.Form[allkeys[16]].ToString();
                CustomField4 = HttpContext.Current.Request.Form[allkeys[17]].ToString();
                CustomField5 = HttpContext.Current.Request.Form[allkeys[18]].ToString();
                Status = HttpContext.Current.Request.Form[allkeys[19]].ToString();
                Reason = HttpContext.Current.Request.Form[allkeys[20]].ToString();
                Checksum = HttpContext.Current.Request.Form[allkeys[21]].ToString();
            }
        }
        catch (Exception)
        {

            throw;
        }
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
               
        ReceiptData = "Consumer ID: ";
        ReceiptData += ConsumerID + "\r\n";
        ReceiptData += "Transaction Date: ";
        ReceiptData += TransactionDate + "\r\n";
        ReceiptData += "Transaction ID: ";
        ReceiptData += TransactionID + "\r\n";
        ReceiptData += "Amount: ";
        ReceiptData += Amount + "\r\n";
        ReceiptData += "PaymentMode: ";
        ReceiptData += PaymentMode + "\r\n";
        ReceiptData += "*************Thank You*************\r\n";
        ReceiptData += "\r\n";
        ReceiptData += "\r\n";

        CompleteData = HeaderData + "$" + ReceiptData;


    }

	protected void btn_EditPayment(object sender, EventArgs e)
	{
		

	}
	protected void btn_PropertyTax(object sender, EventArgs e)
	{
		
	}

	protected void btn_MakePayment(object sender, EventArgs e)
	{
        
    }
}
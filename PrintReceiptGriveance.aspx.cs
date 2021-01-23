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
		lblTxnDate.InnerText = DateTime.Now.ToString("dd-MM-yyyy");
		lblPaymentMode.InnerText = Session["GriveanceToken"].ToString();
	}


	protected void Page_LoadComplete(object sender, EventArgs e)
    {    }

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
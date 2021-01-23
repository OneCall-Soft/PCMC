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


public partial class PreventiveMaintaince : System.Web.UI.Page
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

    private IniFile objINI = null;
    private string ini_path = "";
    protected void Page_Load(object sender, EventArgs e)
    {
       

    }

    

  

    protected void btnPrintReceipt_Click(object sender, EventArgs e)
    {
        ini_path = "C:\\RMS\\KioskClientConfig.ini";
        objINI = new IniFile(ini_path);

        if (id1.Checked == true)
        {
            objINI.IniWriteValue("PM_Activities", "PM01", "Touch Screen Cleaned and calibration done");
        }
        else
        {
            objINI.IniWriteValue("PM_Activities", "PM01", "No Touch Screen Cleaned and calibration done");
        }

        if (id2.Checked == true)
        {
           objINI.IniWriteValue("PM_Activities", "PM02", "Removed paper dust from the printer ");
        }
        else
        {
             objINI.IniWriteValue("PM_Activities", "PM02", "No Removed paper dust from the printer ");
        }

        if (id3.Checked == true)
        {
            objINI.IniWriteValue("PM_Activities", "PM03", "Cleaned CIS Scanners of the printer");
        }
        else
        {
            objINI.IniWriteValue("PM_Activities", "PM03", "Not Cleaned CIS Scanners of the printer");
        }

        if (id4.Checked == true)
        {
            objINI.IniWriteValue("PM_Activities", "PM04", "Cleaned RAM/Mother Board/Cooling Fan/SMPS");
        }
        else
        {
            objINI.IniWriteValue("PM_Activities", "PM04", "Not Cleaned RAM/Mother Board/Cooling Fan/SMPS");
        }

        if (id5.Checked == true)
        {
            objINI.IniWriteValue("PM_Activities", "PM05", "Cleaned exterior of the KIOSK");
        }
        else
        {
             objINI.IniWriteValue("PM_Activities", "PM05", "Not Cleaned exterior of the KIOSK");
        }

        if (id6.Checked == true)
        {
             objINI.IniWriteValue("PM_Activities", "PM06", "Checked alignment of the Printer tray and service door");
        }
        else
        {
            objINI.IniWriteValue("PM_Activities", "PM06", "Not Checked alignment of the Printer tray and service door");
        }

        if (id7.Checked == true)
        {
             objINI.IniWriteValue("PM_Activities", "PM07", "Application Version is Latest ");
        }
        else
        {
              objINI.IniWriteValue("PM_Activities", "PM07", "No Application Version is Not Latest ");
        }

        if (id8.Checked == true)
        {
             objINI.IniWriteValue("PM_Activities", "PM08", "RMS Client Version is running and showing connected");
        }
        else
        {
             objINI.IniWriteValue("PM_Activities", "PM08", "No RMS Client Version is not running and showing Not connected");
        }



       
        IniFile objHealthIni = new IniFile("C:\\RMS\\KioskClientHealth.ini");
        objHealthIni.IniWriteValue("Health_Details", "LastPMActivity", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));

        objINI.IniWriteValue("PM_Activities", "PM_DONE", "1");
        Label1.Text = "PM Activities Submitted Successfully";
    }
}
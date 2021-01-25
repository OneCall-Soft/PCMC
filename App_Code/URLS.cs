using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Net.NetworkInformation;
using System.Net;
using System.IO;
using System.Runtime.Serialization.Json;
using System.Data;
using System.Text;
using System.Web.UI;
using System.Runtime.InteropServices;
using System.Threading;
using System.Net.Sockets;
/// <summary>
/// Summary description for URLS
/// </summary>
///

namespace System
{
    public static class EssentialInfo
    {
        private static string macAddress { get; set; }
        /// <summary>
        /// It contains all services and it's status 
        /// </summary>
        public static Dictionary<string, string> SERVICELIST { get; set; }
        /// <summary>
        /// It stores MacAddress of current machine
        /// </summary>
        public static string MACADDRESS { get { return macAddress; } }

        private static string ipAddress { get; set; }
        public static string CLIENTIPADDRESS { get { return ipAddress; } }

        public static string sMacAddress1 = null;
        public static string sIPAddress1 = null;

        public static void _GetIP()
        {
            string strHostName = "";
            strHostName = System.Net.Dns.GetHostName();

            IPHostEntry ipEntry = System.Net.Dns.GetHostEntry(strHostName);

            IPAddress[] addr = ipEntry.AddressList;

            ipAddress= addr[addr.Length - 1].ToString();

        }

        public static void GetMacAddress()
        {
            foreach (NetworkInterface nic in NetworkInterface.GetAllNetworkInterfaces())
            {
                // Only consider Ethernet network interfaces
                if (nic.NetworkInterfaceType == NetworkInterfaceType.Ethernet &&
                    nic.OperationalStatus == OperationalStatus.Up)
                {
                    macAddress = nic.GetPhysicalAddress().ToString();
                    sMacAddress1 = "LIPI" + macAddress;
                }
            }
        }

        public static string LocalIPAddress()
        {
            IPHostEntry host;
            string localIP = "";
            host = Dns.GetHostEntry(Dns.GetHostName());
            foreach (IPAddress ip in host.AddressList)
            {
                if (ip.AddressFamily == AddressFamily.InterNetwork)
                {
                    localIP = ip.ToString();
                    sIPAddress1 = localIP;
                }
            }
            //Add[Lokesh 21 May 2013] V1.0.0.2
            //if (localIP == "127.0.0.1")
            //    localIP = objClientConfigINI.Read("Kiosk_Details", "Kiosk_IP", "");
            //else if (localIP != objClientConfigINI.Read("Kiosk_Details", "Kiosk_IP", ""))
            //    objClientConfigINI.Write("Kiosk_Details", "Kiosk_IP", localIP);

            return localIP;
        }

        /// <summary>
        /// run this once to get macaddress in MACADDRESS instance
        /// </summary>
        public static void GetServiceList()
        {
            try
            {
                SERVICELIST = new Dictionary<string, string>();

                  LocalIPAddress();

                WebClient client = new WebClient();
                client.Headers[HttpRequestHeader.ContentType] = "text/json";

                string url = ConfigurationManager.AppSettings["RMSSERVERURL"].ToString();
                Log.Write("Server url: -",url);

                string jsonstring = Newtonsoft.Json.JsonConvert.SerializeObject(sIPAddress1);

                string res = client.UploadString(url + "/GetDataIndividual", "POST", jsonstring);
                Log.Write("response url: -", res);

                MemoryStream ms = new MemoryStream(Encoding.Default.GetBytes(res));
                DataContractJsonSerializer jsonObj = new DataContractJsonSerializer(typeof(Reply));
                Reply objResponse = (Reply)jsonObj.ReadObject(ms);

                Log.Write("Response: -",objResponse.ToString());


                if (objResponse.res)
                {
                    foreach (DataRow item in objResponse.DS.Tables[0].Rows)
                    {
                        SERVICELIST.Add(item["SERVICE"].ToString().ToLower(), item["STATUS"].ToString().ToLower());
                    }
                }
                else
                {
                    SERVICELIST.Add("N/A", "N/A");
                }
            }
            catch (Exception me)
            {
                throw me;
            }

        }
    }

  public  class INIFile
    {
        private string filePath;
        [DllImport("Kernel32.dll", CallingConvention = CallingConvention.StdCall, CharSet = CharSet.Ansi)]
        private static extern UInt32 GetPrivateProfileSection
            (
                [In] [MarshalAs(UnmanagedType.LPStr)] string strSectionName,
                // Note that because the key/value pars are returned as null-terminated
                // strings with the last string followed by 2 null-characters, we cannot
                // use StringBuilder.
                [In] IntPtr pReturnedString,
                [In] UInt32 nSize,
                [In] [MarshalAs(UnmanagedType.LPStr)] string strFileName
            );

        [DllImport("kernel32")]
        private static extern long WritePrivateProfileString(string section, string key, string val, string filePath);
        [DllImport("kernel32")]
        private static extern int GetPrivateProfileString(string section, string key, string def, StringBuilder retVal, int size, string filePath);

        public INIFile(string filePath)
        {
            this.filePath = filePath;
        }

        public void Write(string section, string key, string value)
        {
            long a = WritePrivateProfileString(section, key, value, this.filePath);
            Thread.Sleep(60);
        }

        public string Read(string section, string key, string def)
        {
            string strReturnVal = "";
            try
            {
                StringBuilder SB = new StringBuilder(255);
                int i = GetPrivateProfileString(section, key, def, SB, 255, this.filePath);
                strReturnVal = SB.ToString();
            }
            catch (Exception)
            {
                strReturnVal = "";
            }
            return strReturnVal;
        }

        public int ReadIntValue(string section, string key, string def)
        {
            int iReturnVal = 0;
            try
            {
                StringBuilder SB = new StringBuilder(255);
                int i = GetPrivateProfileString(section, key, def, SB, 255, this.filePath);
                if (SB.ToString() != "")
                    iReturnVal = Convert.ToInt32(SB.ToString());
            }
            catch (Exception)
            {
                iReturnVal = 0;
            }
            return iReturnVal;
        }

        public bool IniReadDateValue(string Section, string Key, out DateTime objDT, out string strExcp)
        {
            try
            {
                StringBuilder temp = new StringBuilder(25);
                int i = GetPrivateProfileString(Section, Key, "", temp, 255, this.filePath);

                objDT = new DateTime(Convert.ToInt32(temp.ToString().Substring(0, 4)), Convert.ToInt32(temp.ToString().Substring(5, 2)), Convert.ToInt32(temp.ToString().Substring(8, 2)), Convert.ToInt32(temp.ToString().Substring(11, 2)), Convert.ToInt32(temp.ToString().Substring(14, 2)), Convert.ToInt32(temp.ToString().Substring(17, 2)));
                strExcp = "";   //Added [Shubhit 03May13]
                return true;
            }
            catch (Exception excp)
            {
                objDT = DateTime.Now;
                strExcp = excp.Message.ToString();  //Added [Shubhit 03May13]
                return false;
            }
        }

        public double IniReadDoubleValue(string Section, string Key)
        {
            StringBuilder temp = new StringBuilder(255);
            int i = GetPrivateProfileString(Section, Key, "", temp, 255, this.filePath);
            double dRes;
            Double.TryParse(temp.ToString(), out dRes);
            return dRes;
        }

        public string[] GetAllKeysInIniFileSection(string strSectionName)
        {
            string[] strArray = null;
            try
            {

                // Allocate in unmanaged memory a buffer of suitable size.
                // I have specified here the max size of 32767 as documentated 
                // in MSDN.
                IntPtr pBuffer = Marshal.AllocHGlobal(32767);
                // Start with an array of 1 string only. 
                // Will embellish as we go along.

                strArray = new string[0];
                UInt32 uiNumCharCopied = 0;

                uiNumCharCopied = GetPrivateProfileSection(strSectionName, pBuffer, 32767, this.filePath);

                // iStartAddress will point to the first character of the buffer,
                int iStartAddress = pBuffer.ToInt32();
                // iEndAddress will point to the last null char in the buffer.
                int iEndAddress = iStartAddress + (int)uiNumCharCopied;

                // Navigate through pBuffer.
                while (iStartAddress < iEndAddress)
                {
                    // Determine the current size of the array.
                    int iArrayCurrentSize = strArray.Length;
                    // Increment the size of the string array by 1.
                    Array.Resize<string>(ref strArray, iArrayCurrentSize + 1);
                    // Get the current string which starts at "iStartAddress".
                    string strCurrent = Marshal.PtrToStringAnsi(new IntPtr(iStartAddress));
                    // Insert "strCurrent" into the string array.
                    strArray[iArrayCurrentSize] = strCurrent;
                    // Make "iStartAddress" point to the next string.
                    iStartAddress += (strCurrent.Length + 1);
                }

                Marshal.FreeHGlobal(pBuffer);
                pBuffer = IntPtr.Zero;
                for (int i = 0; i < strArray.Length; i++)
                {
                    strArray[i] = strArray[i].Substring(strArray[i].LastIndexOf('=') + 1).ToLower();
                }
            }
            catch (Exception) { }//EventLog.WriteEntry("LipiWhiteListing", "Exception Message: " + ex.Message, //EventLogEntryType.Error); }

            return strArray;
        }
        public string FilePath
        {
            get { return this.filePath; }
            set { this.filePath = value; }
        }
    }

    public class Reply
    {
        public DataSet DS { get; set; }

        public bool res { get; set; }

        public int DeviceCount { get; set; }
        public string strError { get; set; }
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
    public class Txn
    {
        public string TxnType { get; set; }

        public string Status { get; set; }

        public string Datetime { get; set; }

        public string TxnID { get; set; }
        public string BillerID { get; set; }
        public string CardType { get; set; }
        public string PaymentMode { get; set; }
        public string MerchantName { get; set; }
        public string Amount { get; set; }
        public string KioskIP { get; set; }
        public string CustomerName { get; set; }
    }

    public class AllURLS
    {

        public string watertaxHome { get; set; }
        public string gotoPropertyTaxNew { get; set; }
        public string surl { get; set; }
        public string furl { get; set; }
        public string getbalance { get; set; }
        public string kisokrequest { get; set; }
        public string getcusumer { get; set; }
        public string kiosk_card_request { get; set; }
        public string kiosk_card_receipt { get; set; }
        public string withoutcard_kiosk_request { get; set; }
        public string generatereceipt { get; set; }
        //public string proptaxgetbalance { get; set; }
        public string onlinepaymentrequest { get; set; }
        public string checkworldlinestatus { get; set; }
        public string watertaxpcmc { get; set; }

        public string payuPaymnet { get; set; }
    }

    public sealed class URLS
    {

        /*  This class is singleton which shares only one instance of it
         *  do not try to make it's instance */
        string DEMOURLS { get; set; }
        string PRODUCTIONURLS { get; set; }

        string[] DemoKeys { get; set; }
        string[] PRODUCTIONKeys { get; set; }

        public AllURLS allurls { get; set; }
        private static URLS singleton = null;


        // This instance can directly be used after classname 
        public static URLS url { get { if (singleton == null) { singleton = new URLS(); } return singleton; } }

        private URLS()
        {
            //MARK:- Fetching YES and NO values of demo and uat element in web.config
            this.DEMOURLS = ConfigurationManager.AppSettings["Demo"].ToString();
            this.PRODUCTIONURLS = ConfigurationManager.AppSettings["Production"].ToString();
            this.allurls = new AllURLS();

            this.setUrl();
        }



        //MARK:- Setting up all url data member from web.config
        private void setUrl()
        {
            if (DEMOURLS.ToUpper().Equals("YES"))
            {
                this.DemoKeys = ConfigurationManager.AppSettings["DEMOURLS"].ToString().Split('|');

                foreach (var d in DemoKeys)
                {
                    switch (d)
                    {

                        case "Demoonlinepaymentrequest":
                            this.allurls.onlinepaymentrequest = ConfigurationManager.AppSettings[d].ToString();
                            break;
                        case "Demoproptaxgetbalance":
                            this.allurls.getbalance = ConfigurationManager.AppSettings[d].ToString();
                            break;
                        case "DemoWaterTaxPayU_Payment":
                            this.allurls.kisokrequest = ConfigurationManager.AppSettings[d].ToString();
                            break;
                        case "Demosurl":
                            this.allurls.surl = ConfigurationManager.AppSettings[d].ToString();
                            break;
                        case "DemoReceipt_BillCloudUrl":
                            this.allurls.generatereceipt = ConfigurationManager.AppSettings[d].ToString();
                            break;
                        case "Demofurl":
                            this.allurls.furl = ConfigurationManager.AppSettings[d].ToString();
                            break;
                        case "DemowatertaxHome":
                            this.allurls.watertaxHome = ConfigurationManager.AppSettings[d].ToString();
                            break;
                        case "DemogotoPropertyTaxNew":
                            this.allurls.gotoPropertyTaxNew = ConfigurationManager.AppSettings[d].ToString();
                            break;
                        case "Demowatertaxpcmc":
                            this.allurls.watertaxpcmc = ConfigurationManager.AppSettings[d].ToString();
                            break;
                        case "DemoPayPaymentApi":
                            this.allurls.payuPaymnet = ConfigurationManager.AppSettings[d].ToString();
                            break;

                        case "Demokiosk_card_request":
                            this.allurls.kiosk_card_request = ConfigurationManager.AppSettings[d].ToString();
                            break;
                        case "Demokiosk_card_receipt":
                            this.allurls.kiosk_card_receipt = ConfigurationManager.AppSettings[d].ToString();
                            break;
                        case "democheckworldlinestatus":
                            this.allurls.checkworldlinestatus = ConfigurationManager.AppSettings[d].ToString();
                            break;
                        case "Demowithoutcard_kiosk_Request":
                            this.allurls.withoutcard_kiosk_request = ConfigurationManager.AppSettings[d].ToString();
                            break;

                        default: break;
                    }
                }

            }
            else
            {
                this.PRODUCTIONKeys = ConfigurationManager.AppSettings["PRODUCTIONURLS"].ToString().Split('|');

                foreach (var u in PRODUCTIONKeys)
                {
                    switch (u)
                    {

                        case "proptaxgetbalance":
                            this.allurls.getbalance = ConfigurationManager.AppSettings[u].ToString();
                            break;
                        case "WaterTaxPayU_Payment":
                            this.allurls.kisokrequest = ConfigurationManager.AppSettings[u].ToString();
                            break;
                        case "Receipt_BillCloudUrl":
                            this.allurls.generatereceipt = ConfigurationManager.AppSettings[u].ToString();
                            break;
                        case "onlinepaymentrequest":
                            this.allurls.onlinepaymentrequest = ConfigurationManager.AppSettings[u].ToString();
                            break;
                        case "UgotoPropertyTaxNew":
                            this.allurls.gotoPropertyTaxNew = ConfigurationManager.AppSettings[u].ToString();
                            break;
                        case "checkworldlinestatus":
                            this.allurls.checkworldlinestatus = ConfigurationManager.AppSettings[u].ToString();
                            break;
                        case "Usurl":
                            this.allurls.surl = ConfigurationManager.AppSettings[u].ToString();
                            break;
                        case "Ufurl":
                            this.allurls.furl = ConfigurationManager.AppSettings[u].ToString();
                            break;
                        case "UwatertaxHome":
                            this.allurls.watertaxHome = ConfigurationManager.AppSettings[u].ToString();
                            break;
                        case "getconsumer":
                            this.allurls.getcusumer = ConfigurationManager.AppSettings[u].ToString();
                            break;
                        case "watertaxpcmc":
                            this.allurls.watertaxpcmc = ConfigurationManager.AppSettings[u].ToString();
                            break;
                        case "PayPaymentApi":
                            this.allurls.payuPaymnet = ConfigurationManager.AppSettings[u].ToString();
                            break;
                        case "kiosk_card_request":
                            this.allurls.kiosk_card_request = ConfigurationManager.AppSettings[u].ToString();
                            break;
                        case "kiosk_card_receipt":
                            this.allurls.kiosk_card_receipt = ConfigurationManager.AppSettings[u].ToString();
                            break;
                        case "withoutcard_kiosk_Request":
                            this.allurls.withoutcard_kiosk_request = ConfigurationManager.AppSettings[u].ToString();
                            break;
                        default: break;
                    }
                }
            }
        }
    }
}

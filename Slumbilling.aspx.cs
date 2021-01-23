using System;
using System.IO;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web.UI.HtmlControls;


public partial class Slumbilling : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public class SlumBillData
    {
        public string name { get; set; }
        public string hutNo { get; set; }
        public string areaName { get; set; }
        public string zone { get; set; }
        public string hutArea { get; set; }
        public string usage { get; set; }
        public string previousDemand { get; set; }
        public string paidAmount { get; set; }
        public string payableAmount { get; set; }


    }

    public class ResponseHutOwnerData
    {
        public string code { get; set; }
        public string message { get; set; }
        public SlumBillData[] SlumBillData { get; set; }
    }

    private static bool bypassAllCertificateStuff(object sender, System.Security.Cryptography.X509Certificates.X509Certificate cert, System.Security.Cryptography.X509Certificates.X509Chain chain, System.Net.Security.SslPolicyErrors error)
    {
        return true;
    }

    protected void btn_Show(object sender, EventArgs e)
    {
        string strDataResponse = string.Empty;
        try
        {
            if (txtOwner.Text.Length == 0)
            {
                lblErrorMsg.InnerHtml = "Please Enter Slum Details.";
                lblErrorMsg.Visible = true;
            }
            else
            {
                lblErrorMsg.Visible = false;
                if (txtOwner.Text.Length <= 13)
                {
                    string strOwnerURL = "http://103.224.247.137:8085/SlumBilling/rest/service/getBillDetailsByHutNumber?hutNumber=" + txtOwner.Text;
                    WebClient objWebClient = new WebClient();
                    ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
                    ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
                    strDataResponse = objWebClient.DownloadString(strOwnerURL);
                    DataContractJsonSerializer objJsonSerializerRes = new DataContractJsonSerializer(typeof(ResponseHutOwnerData));
                    MemoryStream objMSRes = new MemoryStream(Encoding.Default.GetBytes(strDataResponse));
                    ResponseHutOwnerData objResponse = (ResponseHutOwnerData)objJsonSerializerRes.ReadObject(objMSRes);
                    if (objResponse.code == "200")
                    {
                        foreach (var item in objResponse.SlumBillData)
                        {
                            HtmlTableRow tr = new HtmlTableRow();
                            HtmlTableCell tc1 = new HtmlTableCell();
                            HtmlTableCell tc2 = new HtmlTableCell();
                            HtmlTableCell tc3 = new HtmlTableCell();
                            HtmlTableCell tc4 = new HtmlTableCell();
                            HtmlTableCell tc5 = new HtmlTableCell();
                            HtmlTableCell tc6 = new HtmlTableCell();
                            HtmlTableCell tc7 = new HtmlTableCell();
                            HtmlTableCell tc8 = new HtmlTableCell();
                            HtmlTableCell tc9 = new HtmlTableCell();
                            tc1.InnerText = item.name;
                            tc2.InnerText = item.hutNo;
                            tc3.InnerText = item.areaName;
                            tc4.InnerText = item.zone;
                            tc5.InnerText = item.hutArea;
                            tc6.InnerText = item.usage;
                            tc7.InnerText = item.previousDemand;
                            tc8.InnerText = item.paidAmount;
                            tc9.InnerText = item.payableAmount;
                            tr.Cells.Add(tc1);
                            tr.Cells.Add(tc2);
                            tr.Cells.Add(tc3);
                            tr.Cells.Add(tc4);
                            tr.Cells.Add(tc5);
                            tr.Cells.Add(tc6);
                            tr.Cells.Add(tc7);
                            tr.Cells.Add(tc8);
                            tr.Cells.Add(tc9);
                            TblOwner.Rows.Add(tr);

                        }

                    }
                    else
                    {
                        lblErrorMsg.InnerText = objResponse.message;
                    }
                }
            }
        }
        catch (Exception)
        {
            lblErrorMsg.InnerHtml = "Invalid Number";
        }
    }
}
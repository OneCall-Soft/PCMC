using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web.UI.HtmlControls;

public partial class DeathCertificate : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public class DeathData
    {
        public string deceasedName { get; set; }
        public string gender { get; set; }
        public string deathDate { get; set; }
        public string registrationDate { get; set; }
        public string registrationNo { get; set; }
        public string fatherName { get; set; }
        public string motherName { get; set; }
        public string permanentAddress { get; set; }

    }

    public class ResponseDeathCertificate
    {
        public string code { get; set; }
        public string message { get; set; }
        public DeathData[] DeathData { get; set; }
    }

    private static bool bypassAllCertificateStuff(object sender, System.Security.Cryptography.X509Certificates.X509Certificate cert, System.Security.Cryptography.X509Certificates.X509Chain chain, System.Net.Security.SslPolicyErrors error)
    {
        return true;
    }

    protected void btn_Show(object sender, EventArgs e)
    {

        string strDataResponse = string.Empty;


       
        if ((txtRegNo.Text.Length == 0 && txtDate.Text.Length == 0)||(txtRegNo.Text.Length > 0 && txtDate.Text.Length > 0))
        {

            lblErrorMsg.InnerHtml = "Please fill only one field between the Registration Number / Date Of Birth.";
            lblErrorMsg.Visible = true;
            return;
        }      
        else
        {

            if (txtRegNo.Text.Length == 13)
            {
                lblErrorMsg.Visible = false;
                string strDeathRegURL = "http://103.224.247.116:8080/BND/rest/webservice/getDeathInfoByRegistrionNo?registrationNo=" + txtRegNo.Text;
                WebClient objWebClient = new WebClient();
                ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
                ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
                strDataResponse = objWebClient.DownloadString(strDeathRegURL);
            }

            if (txtDate.Text.Length == 10)
            {
                lblErrorMsg.Visible = false;
                string strDOD = "http://103.224.247.116:8080/BND/rest/webservice/getDeathRecordsByDeathDate?deathDate=" + txtDate.Text;
                WebClient objWebClient = new WebClient();
                ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
                ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
                strDataResponse = objWebClient.DownloadString(strDOD);
            }
        }

        if (strDataResponse != "" || strDataResponse.Length != 0)
        {
            DataContractJsonSerializer objJsonSerializerRes = new DataContractJsonSerializer(typeof(ResponseDeathCertificate));
            MemoryStream objMSRes = new MemoryStream(Encoding.Default.GetBytes(strDataResponse));
            ResponseDeathCertificate objResponse = (ResponseDeathCertificate)objJsonSerializerRes.ReadObject(objMSRes);

            if (objResponse.code == "200")
            {
                foreach (var item in objResponse.DeathData)
                {
                    HtmlTableRow tr = new HtmlTableRow();
                    HtmlTableCell tc1 = new HtmlTableCell();
                    HtmlTableCell tc2 = new HtmlTableCell();
                    HtmlTableCell tc3 = new HtmlTableCell();
                    HtmlTableCell tc4 = new HtmlTableCell();
                    tc1.InnerText = item.deceasedName;
                    tc2.InnerText = item.gender;
                    tc3.InnerText = item.deathDate;
                    tc4.InnerText = item.permanentAddress;
                    tr.Cells.Add(tc1);
                    tr.Cells.Add(tc2);
                    tr.Cells.Add(tc3);
                    tr.Cells.Add(tc4);
                    tblDOD.Rows.Add(tr);

                }

            }
            else
            {
                lblErrorMsg.InnerText = objResponse.message;
            }
        }
        else {
            lblErrorMsg.InnerText = "Invalid input data!";
        }
    }
}

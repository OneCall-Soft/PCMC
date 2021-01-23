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

public partial class BNDCertificate : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public class BirthData
    {
        public string childName { get; set; }
        public string gender { get; set; }
        public string birthDate { get; set; }
        public string registrationDate { get; set; }
        public string registrationNo { get; set; }
        public string fatherName { get; set; }
        public string motherName { get; set; }
        public string permanentAddress { get; set; }

    }

    public class ResponseBirthCertificate
    {
        public string code { get; set; }
        public string message { get; set; }
        public BirthData[] BirthData { get; set; }
    }

    private static bool bypassAllCertificateStuff(object sender, System.Security.Cryptography.X509Certificates.X509Certificate cert, System.Security.Cryptography.X509Certificates.X509Chain chain, System.Net.Security.SslPolicyErrors error)
    {
        return true;
    }

    protected void btn_Show(object sender, EventArgs e)
    {
        string strDataResponse = string.Empty;


        if ((txtRegNo.Text.Length == 0 && txtDate.Text.Length == 0) || (txtRegNo.Text.Length > 0 && txtDate.Text.Length > 0))
        {

            lblErrorMsg.InnerHtml = "Please fill only one field between the Registration Number / Date Of Birth.";
            lblErrorMsg.Visible = true;
            return;
        }
        else
        {
            if (txtRegNo.Text.Length == 13 && txtDate.Text.Length == 0)
            {
                lblErrorMsg.Visible = false;
                string strBirthRegURL = "http://103.224.247.116:8080/BND/rest/webservice/getBirthInfoByRegistrionNo?registrationNo=" + txtRegNo.Text;
                WebClient objWebClient = new WebClient();
                ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
                ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
                strDataResponse = objWebClient.DownloadString(strBirthRegURL);


            }
            else if (txtDate.Text.Length == 10 && txtRegNo.Text.Length == 0)
            {
                lblErrorMsg.Visible = false;
                string strDOB = "http://103.224.247.116:8080/BND/rest/webservice/getBirthRecordsByBirthDate?birthDate=" + txtDate.Text;
                WebClient objWebClient = new WebClient();
                ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
                ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
                strDataResponse = objWebClient.DownloadString(strDOB);

            }

            else
            {
                lblErrorMsg.InnerHtml = "Please Enter Valid Details!";
                lblErrorMsg.Visible = true;
                return;
            }
        }

        DataContractJsonSerializer objJsonSerializerRes = new DataContractJsonSerializer(typeof(ResponseBirthCertificate));
        MemoryStream objMSRes = new MemoryStream(Encoding.Default.GetBytes(strDataResponse));
        ResponseBirthCertificate objResponse = (ResponseBirthCertificate)objJsonSerializerRes.ReadObject(objMSRes);
        if (objResponse.code == "200")
        {
            foreach (var item in objResponse.BirthData)
            {
                HtmlTableRow tr = new HtmlTableRow();
                HtmlTableCell tc1 = new HtmlTableCell();
                HtmlTableCell tc2 = new HtmlTableCell();
                HtmlTableCell tc3 = new HtmlTableCell();
                HtmlTableCell tc4 = new HtmlTableCell();
                tc1.InnerText = item.childName;
                tc2.InnerText = item.gender;
                tc3.InnerText = item.birthDate;
                tc4.InnerText = item.permanentAddress;
                tr.Cells.Add(tc1);
                tr.Cells.Add(tc2);
                tr.Cells.Add(tc3);
                tr.Cells.Add(tc4);
                tblDOB.Rows.Add(tr);

            }

        }
        else
        {
            lblErrorMsg.InnerText = objResponse.message;
            lblErrorMsg.Visible = true;
        }
    }
}

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
    public class GrievanceStatusResponse
    {
        public string tokenNumber;
        public string citizenName;
        public string subject;
        public string remark;
        public string subDept;
        public string stage1;
        public string user;
    }

    protected void Page_Load(object sender, EventArgs e)
	{
        try
        {
            if (!IsPostBack)
            {
                //btnmakepayment.Visible = true;
                //txtbalance.Visible = false;

                //string strAreaListURL = "http://103.224.247.131:8085/Grievance/rest/service/area";

                //WebClient objWebClient = new WebClient();

                //ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
                //ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
                //objWebClient.Headers[HttpRequestHeader.ContentType] = "application/json";
                //string strAreaResponse = objWebClient.DownloadString(strAreaListURL);

                //DataContractJsonSerializer objJsonSerializerRes = new DataContractJsonSerializer(typeof(ResponseAreaList[]));
                //MemoryStream objMSRes = new MemoryStream(Encoding.Default.GetBytes(strAreaResponse));
                //ResponseAreaList[] objAreaResponse = (ResponseAreaList[])objJsonSerializerRes.ReadObject(objMSRes);

                //ddlAreaList.Items.Clear();
                //ddlAreaList.Items.Add("Select");
                //for (int iAreaListIndex = 0; iAreaListIndex < objAreaResponse.Count(); iAreaListIndex++)
                //{
                //    ddlAreaList.Items.Add(objAreaResponse[iAreaListIndex].areaName);
                //}

                //string strSubjectListURL = "http://103.224.247.131:8085/Grievance/rest/service/subject";                
                
                //ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
                //ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
                //objWebClient.Headers[HttpRequestHeader.ContentType] = "application/json";
                //string strSubjectListResponse = objWebClient.DownloadString(strSubjectListURL);

                //objJsonSerializerRes = new DataContractJsonSerializer(typeof(ResponseSubjectList[]));
                //objMSRes = new MemoryStream(Encoding.Default.GetBytes(strSubjectListResponse));
                //ResponseSubjectList[] objSubjectListResponse = (ResponseSubjectList[])objJsonSerializerRes.ReadObject(objMSRes);

                //ddlSubjectList.Items.Clear();
                //ddlSubjectList.Items.Add("Select");
                //for (int iSubjectListIndex = 0; iSubjectListIndex < objSubjectListResponse.Count(); iSubjectListIndex++)
                //{
                //    if(Session["language"] != null && Session["language"].ToString() == "en-us")
                //        ddlSubjectList.Items.Add(objSubjectListResponse[iSubjectListIndex].subjectNameEng);
                //    else
                //        ddlSubjectList.Items.Add(objSubjectListResponse[iSubjectListIndex].subjectNameMar);
                //}                
            }
        }
        catch (Exception ex)
        {

            throw;
        }
    }
	
	protected void btn_PropertyTax(object sender, EventArgs e)
	{
        try
        {
            //if (ddlzonename.SelectedIndex == 0 && ddlzoneno.SelectedIndex == 0)
            //{
            //    lblErrorMsg.InnerText = "Please select valid zone number";
            //    return;
            //}

            //if (ddlgateno.SelectedIndex == 0)
            //{
            //    lblErrorMsg.InnerText = "Please select valid gat number";
            //    return;
            //}

            //if (txtPropertyNo.Text.Length != 5 || txtPropertyNo.Text == "00000")
            //{
            //    lblErrorMsg.InnerText = "Please enter valid property number";
            //    return;
            //}

            //if (txtExtra.Text.Length == 0)
            //{
            //    lblErrorMsg.InnerText = "Please enter valid extra number";
            //    return;
            //}

            //lblErrorMsg.InnerText = "";

            //string strURL = "http://103.224.247.141:8081/PropertyTaxService/webapi/propertyTaxWebServiceController/getBalance";
            //RequestPropertyTax ObjRequestPropertyTax = new RequestPropertyTax();

            //Make Consumer ID
            //First one digit is fixed  "1"
            //Zone number 2 digit Example : 01
            //Gat number 2 digit Example : 01
            //Property code is 5 digit Example : 00123
            //"." is fixed
            //Extra 2 digit Example : 00

            //string strConsumerID = "1" + ddlzoneno.Text.PadLeft(2, '0') + ddlgateno.Text.PadLeft(2, '0') + txtPropertyNo.Text.PadLeft(5, '0') + "." + txtExtra.Text.PadLeft(2, '0');
            //ObjRequestPropertyTax.consumerID = strConsumerID;

            //DataContractJsonSerializer objRequestJsonSerializer = new DataContractJsonSerializer(typeof(RequestPropertyTax));
            //MemoryStream objMemoryStream = new MemoryStream();
            //objRequestJsonSerializer.WriteObject(objMemoryStream, ObjRequestPropertyTax);

            //WebClient objWebClient = new WebClient();
            //ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
            //ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
            //objWebClient.Headers[HttpRequestHeader.ContentType] = "application/json";
            //string strResponse = objWebClient.UploadString(strURL, "POST", Encoding.Default.GetString(objMemoryStream.ToArray()));
            //DataContractJsonSerializer objJsonSerializerRes = new DataContractJsonSerializer(typeof(ResponsePropertyTax));
            //MemoryStream objMSRes = new MemoryStream(Encoding.Default.GetBytes(strResponse));
            //ResponsePropertyTax objResponse = (ResponsePropertyTax)objJsonSerializerRes.ReadObject(objMSRes);
            //lbladdress.InnerText = objResponse.propertyAddress;
            //lblname.InnerText = objResponse.propertyName;
            //lblbalance.InnerText = objResponse.balance;
            //txtbalance.Text = objResponse.balance;

            //btnmakepayment.Visible = true;
            //txtbalance.Visible = false;
            //lblRupeeSymbol.Visible = lblbalance.Visible = true;
            //lbledit.Visible = true;
			divConsumerDetail.Visible = true;
			//Session["ConsumerID"] = strConsumerID;
        }
        catch (Exception ex)
        {
            //if (ex.Message == "Unable to connect to the remote server")
                //lblErrorMsg.InnerText = "No Connectivity At the Moment. Please Try After Some Time";
			//else
			//{
			//	lblErrorMsg.InnerText = "No Connectivity At the Moment.Please Try After Some Time";
			//}

			//btnmakepayment.Visible = false;
   //         txtbalance.Visible = false;
   //         lblRupeeSymbol.Visible = lblbalance.Visible = false;
   //         lbledit.Visible = false;

   //         lbladdress.InnerText = "";
   //         lblname.InnerText = "";
   //         lblbalance.InnerText = "";
   //         txtbalance.Text = "";
        }
    }
    protected void btn_Home(object sender, EventArgs e)
    {
        Response.Redirect("MainPage.aspx");
    }

    protected void btnGetGrievanceStatus_Click(object sender, EventArgs e)
	{
        try
        {
            string strStatusURL = "http://103.224.247.131:8085/Grievance/rest/service/tokendetails?token=" + txtTokenNo.Text;

            WebClient objWebClient = new WebClient();

            ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
            ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
            objWebClient.Headers[HttpRequestHeader.ContentType] = "application/json";
            string strResponseStatus = objWebClient.DownloadString(strStatusURL);

            DataContractJsonSerializer objJsonSerializerRes = new DataContractJsonSerializer(typeof(GrievanceStatusResponse));
            MemoryStream objMSRes = new MemoryStream(Encoding.Default.GetBytes(strResponseStatus));
            GrievanceStatusResponse objResponseStatus = (GrievanceStatusResponse)objJsonSerializerRes.ReadObject(objMSRes);

            lblName.InnerText = objResponseStatus.citizenName;
            lblMobileNo.InnerText = objResponseStatus.user;
            lblSubject.InnerText = objResponseStatus.subject;
            lblDept.InnerText = objResponseStatus.subDept;
            lblRemark.InnerText = objResponseStatus.remark;
            lblStatus.InnerText = objResponseStatus.stage1;
        }
        catch (Exception)
        {

            throw;
        }
		////01) responseUrl = response return url
		////02) device = KIOSK(Fixed)
		////string url = "http://propertytax.pcmcindia.gov.in:8080/pcmc/onlinePay/OnlinePaymentRequest.jsp?txtCustomerID=1040200124.00&txtAdditionalInfo5=16082019&txtTxnAmount=11234&txtAdditionalInfo6=PCMC&txtConsessionAmount=3.0&txtAdditionalInfo1=PCMCLogIn&txtAdditionalInfo1=PCMC&txtAdditionalInfo4=1040200124.00&txtAdditionalInfo3=0402192000124";
		//string URL = "http://propertytax.pcmcindia.gov.in:8080/pcmc/onlinePay/OnlinePaymentRequest.jsp?";
		//URL += "txtCustomerID=" + Session["ConsumerID"].ToString() + "&";
		//URL += "txtAdditionalInfo5=" + DateTime.Now.ToString("ddMMyyyy") + "&";
		//URL += "txtTxnAmount=" + txtbalance.Text + "&";
		//URL += "txtAdditionalInfo6=" + "PCMC" + "&";
		//URL += "txtConsessionAmount=" + "3.0" + "&";
		//URL += "txtAdditionalInfo1=" + "PCMCLogIn" + "&";
		//URL += "txtAdditionalInfo1=" + "PCMC" + "&";
		//URL += "txtAdditionalInfo4=" + Session["ConsumerID"].ToString() + "&";
		//URL += "txtAdditionalInfo3=" + DateTime.Now.ToString("ddMMyyHHmmss") + "&";
		//URL += "responseUrl=" + "https://www.google.com" + "&";
		//URL += "device=" + "KIOSK";


		//string OpenNewWindow = "window.open('" + URL + "', 'popup_window', 'width=1366,height=768,left=0,top=0,resizable=no,resizable=no, toolbar=no, scrollbars=no, menubar=no, status=no, directories=no');";
		//ClientScript.RegisterStartupScript(this.GetType(), "script", OpenNewWindow, true);
	}

	private static bool bypassAllCertificateStuff(object sender, X509Certificate cert, X509Chain chain, System.Net.Security.SslPolicyErrors error)
	{
		return true;
	}

	protected void Home_click(object sender, EventArgs e)
	{
		Response.Redirect("MainHome.aspx");
	}


	

    protected void ddlSubjectList_SelectedIndexChanged(object sender, EventArgs e)
	{
        //if (!ddlzonename.SelectedItem.Text.Contains("Select"))
        //{
        //    lblErrorMsg.InnerText = "";

        //    ddlgateno.Items.Clear();
        //    ddlgateno.Items.Add("Select");
        //    ddlzoneno.SelectedIndex = ddlzonename.SelectedIndex;
        //    switch (Convert.ToInt32(ddlzonename.SelectedIndex))
        //    {
        //        case 1:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //                ddlgateno.Items.Add("06");
        //                ddlgateno.Items.Add("07");
        //                ddlgateno.Items.Add("08");
        //                ddlgateno.Items.Add("09");
        //                ddlgateno.Items.Add("10");
        //                ddlgateno.Items.Add("11");
        //                ddlgateno.Items.Add("12");
        //                ddlgateno.Items.Add("13");
        //                ddlgateno.Items.Add("14");
        //                ddlgateno.Items.Add("15");
        //                ddlgateno.Items.Add("16");
        //                ddlgateno.Items.Add("17");
        //                ddlgateno.Items.Add("18");
        //            }
        //            break;
        //        case 2:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //                ddlgateno.Items.Add("06");
        //                ddlgateno.Items.Add("07");
        //            }
        //            break;
        //        case 3:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //                ddlgateno.Items.Add("06");
        //                ddlgateno.Items.Add("07");
        //                ddlgateno.Items.Add("08");
        //                ddlgateno.Items.Add("09");
        //                ddlgateno.Items.Add("10");
        //                ddlgateno.Items.Add("11");
        //                ddlgateno.Items.Add("12");
        //                ddlgateno.Items.Add("13");
        //                ddlgateno.Items.Add("14");
        //                ddlgateno.Items.Add("15");
        //                ddlgateno.Items.Add("16");
        //            }
        //            break;

        //        case 4:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //                ddlgateno.Items.Add("06");
        //                ddlgateno.Items.Add("07");
        //                ddlgateno.Items.Add("08");
        //                ddlgateno.Items.Add("09");
        //                ddlgateno.Items.Add("10");
        //                ddlgateno.Items.Add("11");
        //                ddlgateno.Items.Add("12");
        //            }
        //            break;
        //        case 5:
        //            {
        //                ddlgateno.Items.Add("00");
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //                ddlgateno.Items.Add("06");
        //                ddlgateno.Items.Add("07");
        //                ddlgateno.Items.Add("08");
        //                ddlgateno.Items.Add("09");
        //                ddlgateno.Items.Add("10");
        //            }
        //            break;
        //        case 6:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //            }
        //            break;

        //        case 7:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //                ddlgateno.Items.Add("06");
        //                ddlgateno.Items.Add("07");
        //            }
        //            break;
        //        case 8:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //                ddlgateno.Items.Add("06");
        //                ddlgateno.Items.Add("07");
        //                ddlgateno.Items.Add("08");
        //                ddlgateno.Items.Add("09");
        //                ddlgateno.Items.Add("10");
        //                ddlgateno.Items.Add("11");
        //                ddlgateno.Items.Add("12");
        //                ddlgateno.Items.Add("13");

        //            }
        //            break;
        //        case 9:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //                ddlgateno.Items.Add("06");
        //                ddlgateno.Items.Add("07");
        //                ddlgateno.Items.Add("08");
        //                ddlgateno.Items.Add("99");
        //            }
        //            break;

        //        case 10:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //                ddlgateno.Items.Add("06");
        //                ddlgateno.Items.Add("07");
        //                ddlgateno.Items.Add("08");
        //                ddlgateno.Items.Add("09");
        //                ddlgateno.Items.Add("10");
        //                ddlgateno.Items.Add("11");
        //                ddlgateno.Items.Add("12");
        //                ddlgateno.Items.Add("13");
        //                ddlgateno.Items.Add("14");
        //                ddlgateno.Items.Add("15");
        //                ddlgateno.Items.Add("16");
        //                ddlgateno.Items.Add("17");
        //            }
        //            break;
        //        case 11:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //            }
        //            break;

        //        case 12:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //                ddlgateno.Items.Add("06");
        //                ddlgateno.Items.Add("07");
        //                ddlgateno.Items.Add("08");
        //                ddlgateno.Items.Add("09");
        //                ddlgateno.Items.Add("10");
        //                ddlgateno.Items.Add("11");
        //                ddlgateno.Items.Add("12");
        //                ddlgateno.Items.Add("13");
        //                ddlgateno.Items.Add("14");
        //            }
        //            break;
        //        case 13:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //                ddlgateno.Items.Add("06");
        //                ddlgateno.Items.Add("07");
        //                ddlgateno.Items.Add("08");
        //                ddlgateno.Items.Add("09");

        //            }
        //            break;
        //        case 14:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //            }
        //            break;
        //        case 15:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //            }
        //            break;
        //        case 16:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //            }
        //            break;
        //        case 17:
        //            {
        //                ddlgateno.Items.Add("02");

        //            }
        //            break;
        //        case 22:
        //            {
        //                ddlgateno.Items.Add("01");

        //            }
        //            break;
        //    }
        //}
        //else
        //{
        //    ddlzoneno.SelectedIndex = 0;
        //    ddlgateno.SelectedIndex = 0;
        //    txtPropertyNo.Text = "";
        //    txtExtra.Text = "";
        //    lbladdress.InnerText = "";
        //    lblname.InnerText = "";
        //    lblbalance.InnerText = "";
        //    txtbalance.Text = "";
        //    txtbalance.Visible = false;
        //    lblRupeeSymbol.Visible = lblbalance.Visible = false;
        //    lbledit.Visible = false;
        //    btnmakepayment.Visible = false;
        //    lblErrorMsg.InnerText = "";
        //}
    }
	protected void ddlzoneno_SelectedIndexChanged(object sender, EventArgs e)
	{
        //if (!ddlzoneno.SelectedItem.Text.Contains("Select"))
        //{
        //    lblErrorMsg.InnerText = "";
        //    ddlgateno.Items.Clear();
        //    ddlgateno.Items.Add("Select");
        //    ddlzonename.SelectedIndex = ddlzoneno.SelectedIndex;
        //    switch (Convert.ToInt32(ddlzoneno.SelectedItem.Text))
        //    {
        //        case 1:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //                ddlgateno.Items.Add("06");
        //                ddlgateno.Items.Add("07");
        //                ddlgateno.Items.Add("08");
        //                ddlgateno.Items.Add("09");
        //                ddlgateno.Items.Add("10");
        //                ddlgateno.Items.Add("11");
        //                ddlgateno.Items.Add("12");
        //                ddlgateno.Items.Add("13");
        //                ddlgateno.Items.Add("14");
        //                ddlgateno.Items.Add("15");
        //                ddlgateno.Items.Add("16");
        //                ddlgateno.Items.Add("17");
        //                ddlgateno.Items.Add("18");
        //            }
        //            break;
        //        case 2:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //                ddlgateno.Items.Add("06");
        //                ddlgateno.Items.Add("07");
        //            }
        //            break;
        //        case 3:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //                ddlgateno.Items.Add("06");
        //                ddlgateno.Items.Add("07");
        //                ddlgateno.Items.Add("08");
        //                ddlgateno.Items.Add("09");
        //                ddlgateno.Items.Add("10");
        //                ddlgateno.Items.Add("11");
        //                ddlgateno.Items.Add("12");
        //                ddlgateno.Items.Add("13");
        //                ddlgateno.Items.Add("14");
        //                ddlgateno.Items.Add("15");
        //                ddlgateno.Items.Add("16");
        //            }
        //            break;

        //        case 4:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //                ddlgateno.Items.Add("06");
        //                ddlgateno.Items.Add("07");
        //                ddlgateno.Items.Add("08");
        //                ddlgateno.Items.Add("09");
        //                ddlgateno.Items.Add("10");
        //                ddlgateno.Items.Add("11");
        //                ddlgateno.Items.Add("12");
        //            }
        //            break;
        //        case 5:
        //            {
        //                ddlgateno.Items.Add("00");
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //                ddlgateno.Items.Add("06");
        //                ddlgateno.Items.Add("07");
        //                ddlgateno.Items.Add("08");
        //                ddlgateno.Items.Add("09");
        //                ddlgateno.Items.Add("10");
        //            }
        //            break;
        //        case 6:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //            }
        //            break;

        //        case 7:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //                ddlgateno.Items.Add("06");
        //                ddlgateno.Items.Add("07");
        //            }
        //            break;
        //        case 8:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //                ddlgateno.Items.Add("06");
        //                ddlgateno.Items.Add("07");
        //                ddlgateno.Items.Add("08");
        //                ddlgateno.Items.Add("09");
        //                ddlgateno.Items.Add("10");
        //                ddlgateno.Items.Add("11");
        //                ddlgateno.Items.Add("12");
        //                ddlgateno.Items.Add("13");

        //            }
        //            break;
        //        case 9:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //                ddlgateno.Items.Add("06");
        //                ddlgateno.Items.Add("07");
        //                ddlgateno.Items.Add("08");
        //                ddlgateno.Items.Add("99");
        //            }
        //            break;

        //        case 10:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //                ddlgateno.Items.Add("06");
        //                ddlgateno.Items.Add("07");
        //                ddlgateno.Items.Add("08");
        //                ddlgateno.Items.Add("09");
        //                ddlgateno.Items.Add("10");
        //                ddlgateno.Items.Add("11");
        //                ddlgateno.Items.Add("12");
        //                ddlgateno.Items.Add("13");
        //                ddlgateno.Items.Add("14");
        //                ddlgateno.Items.Add("15");
        //                ddlgateno.Items.Add("16");
        //                ddlgateno.Items.Add("17");
        //            }
        //            break;
        //        case 11:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //            }
        //            break;

        //        case 12:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //                ddlgateno.Items.Add("06");
        //                ddlgateno.Items.Add("07");
        //                ddlgateno.Items.Add("08");
        //                ddlgateno.Items.Add("09");
        //                ddlgateno.Items.Add("10");
        //                ddlgateno.Items.Add("11");
        //                ddlgateno.Items.Add("12");
        //                ddlgateno.Items.Add("13");
        //                ddlgateno.Items.Add("14");
        //            }
        //            break;
        //        case 13:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //                ddlgateno.Items.Add("06");
        //                ddlgateno.Items.Add("07");
        //                ddlgateno.Items.Add("08");
        //                ddlgateno.Items.Add("09");

        //            }
        //            break;
        //        case 14:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //            }
        //            break;
        //        case 15:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //                ddlgateno.Items.Add("05");
        //            }
        //            break;
        //        case 16:
        //            {
        //                ddlgateno.Items.Add("01");
        //                ddlgateno.Items.Add("02");
        //                ddlgateno.Items.Add("03");
        //                ddlgateno.Items.Add("04");
        //            }
        //            break;
        //        case 17:
        //            {
        //                ddlgateno.Items.Add("02");

        //            }
        //            break;
        //        case 22:
        //            {
        //                ddlgateno.Items.Add("01");

        //            }
        //            break;
        //    }
        //}
        //else
        //{
        //    ddlzonename.SelectedIndex = 0;
        //    ddlgateno.SelectedIndex = 0;
        //    txtPropertyNo.Text = "";
        //    txtExtra.Text = "";
        //    lbladdress.InnerText = "";
        //    lblname.InnerText = "";
        //    lblbalance.InnerText = "";
        //    txtbalance.Text = "";
        //    txtbalance.Visible = false;
        //    lblRupeeSymbol.Visible = lblbalance.Visible = false;
        //    lbledit.Visible = false;
        //    btnmakepayment.Visible = false;
        //    lblErrorMsg.InnerText = "";
        //}
    }
}
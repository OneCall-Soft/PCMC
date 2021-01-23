using System;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Security.Cryptography.X509Certificates;
using System.Text;

public partial class PropertyTax : BasePage
{
	public class RequestNewGrievance
	{
		public string citizenname;
		public string mobilenumber;
		public string email;
		public string date;
		public string description;
		public string subject;
		public string location;
		public string userName;
		public string image;
		public string latLong;
	}

	public class ResponsePropertyTax
	{
		public string propertyName;
		public string balance;
		public string propertyAddress;
		public string finalUseType;
		public string consumerID;
		public string gatName;
		public string zoneName;
	}

	public class ResponseNewGreviance
	{
		public string code;
		public string message;
		public Res[] Data;
	}

	public class Res
	{
		public string Token;
	}

	public class ResponseSubjectList
	{
		public string subjectNameEng;
		public string subjectNameMar;
	}

	public class ResponseAreaList
	{
		public string areaName;
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		try
		{
			if (!IsPostBack)
			{
				string strAreaListURL = "http://103.224.247.131:8085/Grievance/rest/service/area";
				WebClient objWebClient = new WebClient();
				ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
				ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
				objWebClient.Headers[HttpRequestHeader.ContentType] = "application/json";
				string strAreaResponse = objWebClient.DownloadString(strAreaListURL);
				DataContractJsonSerializer objJsonSerializerRes = new DataContractJsonSerializer(typeof(ResponseAreaList[]));
				MemoryStream objMSRes = new MemoryStream(Encoding.Default.GetBytes(strAreaResponse));
				ResponseAreaList[] objAreaResponse = (ResponseAreaList[])objJsonSerializerRes.ReadObject(objMSRes);
				ddlAreaList.Items.Clear();
				ddlAreaList.Items.Add("Select");
				for (int iAreaListIndex = 0; iAreaListIndex < objAreaResponse.Count(); iAreaListIndex++)
				{
					ddlAreaList.Items.Add(objAreaResponse[iAreaListIndex].areaName);
				}
				string strSubjectListURL = "http://103.224.247.131:8085/Grievance/rest/service/subject";
				ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
				ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
				objWebClient.Headers[HttpRequestHeader.ContentType] = "application/json";
				string strSubjectListResponse = objWebClient.DownloadString(strSubjectListURL);
				objJsonSerializerRes = new DataContractJsonSerializer(typeof(ResponseSubjectList[]));
				objMSRes = new MemoryStream(Encoding.Default.GetBytes(strSubjectListResponse));
				ResponseSubjectList[] objSubjectListResponse = (ResponseSubjectList[])objJsonSerializerRes.ReadObject(objMSRes);
				ddlSubjectList.Items.Clear();
				ddlSubjectList.Items.Add("Select");
				ddlSubjectList.Items.Add("test");
				for (int iSubjectListIndex = 0; iSubjectListIndex < objSubjectListResponse.Count(); iSubjectListIndex++)
				{
					if (Session["language"] != null && Session["language"].ToString() == "en-us")
						ddlSubjectList.Items.Add(objSubjectListResponse[iSubjectListIndex].subjectNameEng);
					else
						ddlSubjectList.Items.Add(objSubjectListResponse[iSubjectListIndex].subjectNameMar);
				}
			}
		}
		catch (Exception ex)
		{
			throw;
		}
	}

	protected void btnShow_Click(object sender, EventArgs e)
	{
		try
		{
			string strURL = "http://103.224.247.131:8085/Grievance/rest/service/GrievanceRegistration";
			RequestNewGrievance objRequestNewGrievance = new RequestNewGrievance();
			objRequestNewGrievance.citizenname = "pimpri";

            lblErrorMsg.InnerText = "";

            //if (txtExtra.Text.Length < 1)
            //{
            //    lblErrorMsg.InnerText = "Please enter mobile number!";
            //    return;
            //}
            //else if (TextBox1.Text.Length < 1)
            //{
            //    lblErrorMsg.InnerText = "Please enter email!";
            //    return;
            //}
            //else {
            //    lblErrorMsg.InnerText = "";
            //}

			objRequestNewGrievance.mobilenumber = txtExtra.Text;
			objRequestNewGrievance.email = TextBox1.Text;
			objRequestNewGrievance.date = DateTime.Now.ToString("dd-MM-yyyy");
			objRequestNewGrievance.description = TextBox2.Text;
			objRequestNewGrievance.subject = ddlSubjectList.SelectedItem.ToString();
			objRequestNewGrievance.location = "pune";
			objRequestNewGrievance.image = "123.png";
			objRequestNewGrievance.latLong = "1234567890";
			objRequestNewGrievance.userName = txtPropertyNo.Text;
			DataContractJsonSerializer objRequestJsonSerializer = new DataContractJsonSerializer(typeof(RequestNewGrievance));
			MemoryStream objMemoryStream = new MemoryStream();
			objRequestJsonSerializer.WriteObject(objMemoryStream, objRequestNewGrievance);
			WebClient objWebClient = new WebClient();
			ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
			ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
			objWebClient.Headers[HttpRequestHeader.ContentType] = "application/json";
			string strResponse = objWebClient.UploadString(strURL, "POST", Encoding.Default.GetString(objMemoryStream.ToArray()));
			DataContractJsonSerializer objJsonSerializerRes = new DataContractJsonSerializer(typeof(ResponseNewGreviance));
			MemoryStream objMSRes1 = new MemoryStream(Encoding.Default.GetBytes(strResponse));
			ResponseNewGreviance objResponse = (ResponseNewGreviance)objJsonSerializerRes.ReadObject(objMSRes1);
			Session["GriveanceToken"] = objResponse.Data[0].Token.ToString();
			Response.Redirect("PrintReceiptGriveance.aspx");
		}
		catch (Exception ex)
		{ }
	}
	protected void btn_Home(object sender, EventArgs e)
	{
		Response.Redirect("MainPage.aspx");
	}

	protected void btn_MakePayment(object sender, EventArgs e)
	{
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
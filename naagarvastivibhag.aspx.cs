using System;
using System.IO;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web.UI.HtmlControls;

public partial class BSUP : BasePage
{

    public string btnShowText { get { return Resources.Resource.Show; } set { value= Resources.Resource.Show; } }
    protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			GetPrabhagDetails();
			GetSchemeDetailes();
		}
	}

	private void GetPrabhagDetails()
	{
		string strAreaListURL = "http://103.224.247.133:8085/BSUPN/rest/service/regionalOfficeWardAreaDetails";
		WebClient objWebClient = new WebClient();
		ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
		ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
		string strAreaResponse = objWebClient.DownloadString(strAreaListURL);
		DataContractJsonSerializer objJsonSerializerRes = new DataContractJsonSerializer(typeof(PrabhagData));
		MemoryStream objMSRes = new MemoryStream(Encoding.Default.GetBytes(strAreaResponse));
		PrabhagData objPrabhagDataResponse = (PrabhagData)objJsonSerializerRes.ReadObject(objMSRes);
		Session.Add("objPrabhagDataSession", objPrabhagDataResponse);

		ddlRegionalOffice.Items.Clear();
		ddlRegionalOffice.Items.Add(Resources.Resource.Select);
		foreach (var item in objPrabhagDataResponse.allPrabhag)
		{
			ddlRegionalOffice.Items.Add(item.prabhagName);
		}
	}

	private void GetSchemeDetailes()
	{
		string strSchemeDetailsUrl = "http://103.224.247.133:8085/BSUPN/rest/service/schemeAndsubschemeDetails";
		WebClient objWebClient1 = new WebClient();
		ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
		ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
		objWebClient1.Headers[HttpRequestHeader.ContentType] = "application/json";
		string strSchemeDetailsResponse = objWebClient1.DownloadString(strSchemeDetailsUrl);
		DataContractJsonSerializer objJsonSerializerRes1 = new DataContractJsonSerializer(typeof(SchemeDetails));
		MemoryStream objMSRes1 = new MemoryStream(Encoding.Default.GetBytes(strSchemeDetailsResponse));
		SchemeDetails objSchemeDetailsResponse = (SchemeDetails)objJsonSerializerRes1.ReadObject(objMSRes1);
		Session.Add("objSchemeDetailsSession", objSchemeDetailsResponse);
		ddlMainScheme.Items.Clear();
		ddlMainScheme.Items.Add(Resources.Resource.Select);
		foreach (var item in objSchemeDetailsResponse.mainScheme)
		{
			ddlMainScheme.Items.Add(item.mainschemName);
		}
	}

	#region Classes

	public class ResponseBSUPData
	{
		public string code { get; set; }
		public string message { get; set; }
		public AllData[] allData { get; set; }
	}

	public class AllData
	{
		public string applicationNumber { get; set; }
		public string adharNo { get; set; }
		public string cfcavakNo { get; set; }
		public string prabhagnameEng { get; set; }
		public string wardId { get; set; }
		public string areanameMar { get; set; }
		public string schemename { get; set; }
		public string subschemename { get; set; }
		public string eligibel { get; set; }
		public string aptrareason { get; set; }
		public string applicantNameinEng { get; set; }
		public string applicantNameinMar { get; set; }
		public string parentName { get; set; }
		public string dateofBirth { get; set; }
		public string age { get; set; }
		public string mobileNo { get; set; }
		public string religonName { get; set; }
		public string castName { get; set; }
		public string bankName { get; set; }
		public string branchName { get; set; }
		public string accountholderName { get; set; }
		public string accountNumber { get; set; }
		public string ifscCode { get; set; }
		public string micrCode { get; set; }
		public Detail[] detail { get; set; }
	}

	public class Detail
	{
		public string Name { get; set; }
		public string Value { get; set; }
	}

	public class SchemeDetails
	{
		public string code { get; set; }
		public string message { get; set; }
		public MainScheme[] mainScheme { get; set; }
	}

	public class MainScheme
	{
		public string mid { get; set; }
		public string mainschemName { get; set; }
		public Subscheme[] subscheme { get; set; }
	}

	public class Subscheme
	{
		public string subid { get; set; }
		public string subchcemeName { get; set; }
	}

	public class PrabhagData
	{
		public string code { get; set; }
		public string message { get; set; }
		public allPrabhag[] allPrabhag { get; set; }
	}

	public class allPrabhag
	{
		public string prabhagID { get; set; }
		public string prabhagName { get; set; }
		public Ward[] ward { get; set; }
	}

	public class Ward
	{
		public string wardNo { get; set; }
		public Area[] area { get; set; }
	}

	public class Area
	{
		public string areaID { get; set; }
		public string area { get; set; }
	}

	#endregion

	private static bool bypassAllCertificateStuff(object sender, System.Security.Cryptography.X509Certificates.X509Certificate cert, System.Security.Cryptography.X509Certificates.X509Chain chain, System.Net.Security.SslPolicyErrors error)
	{
		return true;
	}

	protected void btn_Show(object sender, EventArgs e)
	{
		string strDataResponse = string.Empty;
		bool RecivedData = false;
		if (txtAadhaarNo.Text.Length == 12)
		{
			string strAadhaarNoURL = "http://103.224.247.133:8085/BSUPN/rest/service/getsearchbyAadharNumber?aadharnumber=" + txtAadhaarNo.Text;
			WebClient objWebClient = new WebClient();
			ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
			ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
			strDataResponse = objWebClient.DownloadString(strAadhaarNoURL);
			RecivedData = true;
		}
		if (txtCFCNo.Text.Length != 0 && !RecivedData)
		{
			string strApplictionNo = "http://103.224.247.133:8085/BSUPN/rest/service/getdetailsbysearchNumber?number=" + txtCFCNo.Text;
			WebClient objWebClient = new WebClient();
			ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
			ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
			strDataResponse = objWebClient.DownloadString(strApplictionNo);
			RecivedData = true;
		}
		if (txtMobileNo.Text.Length == 10 && !RecivedData)
		{
			string strMobileNo = "http://103.224.247.133:8085/BSUPN/rest/service/getsearchbyMobileNumber?mobilenumber=" + txtMobileNo.Text;
			WebClient objWebClient = new WebClient();
			ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
			ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
			strDataResponse = objWebClient.DownloadString(strMobileNo);
			RecivedData = true;
		}
		if (ddlMainScheme.SelectedIndex != 0 && ddlSubScheme.SelectedIndex != 0 && txtFirstName.Text != string.Empty && txtMidalName.Text != string.Empty
			&& txtLastName.Text != string.Empty && !RecivedData)
		{
			string MainSchemeId = (string)Session["MainSchemeId"];
			string SubSchemeId = (string)Session["SubSchemeId"];
			//string strSeachByAreaAndScheme = "http://103.224.247.133:8085/BSUPN/rest/service/getsearchParameters?mainScheme=2&subScheme=2&fname="
			//	+ txtFirstName.Text + "&mname=" + txtMidalName.Text + "&lname=" + txtLastName.Text;
			string strSeachByAreaAndScheme = "http://103.224.247.133:8085/BSUPN/rest/service/getsearchParameters?mainScheme=" +
				MainSchemeId + "&subScheme=" + SubSchemeId + "&fname=" + txtFirstName.Text + "&mname=" + txtMidalName.Text +
				"&lname=" + txtLastName.Text;
			WebClient objWebClient = new WebClient();
			ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
			ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
			strDataResponse = objWebClient.DownloadString(strSeachByAreaAndScheme);
			int a = strDataResponse.Length;
		}
		if (ddleligibleStatus.SelectedIndex != 0 && ddlElectionDivison.SelectedIndex != 0 && ddlArea.SelectedIndex != 0
			&& ddlMainScheme.SelectedIndex != 0 && ddlSubScheme.SelectedIndex != 0 && ddleligibleStatus.SelectedIndex != 0 && !RecivedData)
		{
			string ReginalOfficeId, WardId, AreaId, MainSchemeId, SubSchemeId, EligibleOrNot;
			ReginalOfficeId = (string)Session["RegionalOfficeId"];
			WardId = (string)Session["WardId"];
			AreaId = (string)Session["AreaId"];
			MainSchemeId = (string)Session["MainSchemeId"];
			SubSchemeId = (string)Session["SubSchemeId"];
			EligibleOrNot = (string)Session["EligibleOrNot"];
			string strSeachByAreaAndScheme = "http://103.224.247.133:8085/BSUPN/rest/service/getParameters?regionalOffice=" + ReginalOfficeId + "&ward=" +
				WardId + "&area=" + AreaId + "&mainScheme=" + MainSchemeId + "&subScheme=" + SubSchemeId + "&eligibleStatus=" + EligibleOrNot;
			WebClient objWebClient = new WebClient();
			ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(bypassAllCertificateStuff);
			ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
			strDataResponse = objWebClient.DownloadString(strSeachByAreaAndScheme);
			RecivedData = true;
		}
		if (RecivedData)
		{
			DataContractJsonSerializer objJsonSerializerRes = new DataContractJsonSerializer(typeof(ResponseBSUPData));
			MemoryStream objMSRes = new MemoryStream(Encoding.Default.GetBytes(strDataResponse));
			ResponseBSUPData objResponse = (ResponseBSUPData)objJsonSerializerRes.ReadObject(objMSRes);
			Session["strDataResponse"] = strDataResponse;
			if (objResponse.code.Equals("200"))
			{
				foreach (var item in objResponse.allData)
				{
					HtmlTableRow tr = new HtmlTableRow();
					HtmlTableCell tc1 = new HtmlTableCell();
					HtmlTableCell tc2 = new HtmlTableCell();
					HtmlTableCell tc3 = new HtmlTableCell();
					HtmlTableCell tc4 = new HtmlTableCell();
					HtmlTableCell tc5 = new HtmlTableCell();
					HtmlTableCell tc6 = new HtmlTableCell();
					tc1.InnerText = item.applicationNumber;
					tr.Cells.Add(tc1);
					tc2.InnerText = item.applicantNameinMar;
					tr.Cells.Add(tc2);
					tc3.InnerText = item.schemename;
					tr.Cells.Add(tc3);
					tc4.InnerText = item.subschemename;
					tr.Cells.Add(tc4);
					tc5.InnerText = item.eligibel;
					tr.Cells.Add(tc5);
					tc6.InnerHtml = "<a href=\"BSUPApplicationDetails.aspx?applicationno="+item.applicationNumber+"\">View</a>";
					tr.Cells.Add(tc6);
					BsupDetailsTable.Rows.Add(tr);
				}
				divApplicationDetails.Visible = true;
			}
			else
			{
				lblErrorMsgForDataNotFound.InnerText = objResponse.message.ToString();
				divErrorMsg.Visible = true;
			}
		}
		else
		{
			lblErrorMsgForDataNotFound.InnerText = "Data Not Found";
		}
	}

	protected void ddlRegionalOffice_SelectedIndexChanged(object sender, EventArgs e)
	{
		PrabhagData objPrabhagDataSession = (PrabhagData)Session["objPrabhagDataSession"];
		ddlElectionDivison.Items.Clear();
		ddlArea.Items.Clear();
		ddlElectionDivison.Items.Add(Resources.Resource.Select);
		foreach (var ReginalOffice in objPrabhagDataSession.allPrabhag)
		{
			if (ReginalOffice.prabhagName == ddlRegionalOffice.SelectedValue)
			{
				Session["RegionalOfficeId"] = ReginalOffice.prabhagID;
				foreach (var Ward in ReginalOffice.ward)
				{
					ddlElectionDivison.Items.Add(Ward.wardNo);
				}
				break;
			}
		}
	}

	protected void ddlElectionDivison_SelectedIndexChanged(object sender, EventArgs e)
	{
		ddlArea.Items.Clear();
		ddlArea.Items.Add(Resources.Resource.Select);
		PrabhagData objPrabhagDataSession = (PrabhagData)Session["objPrabhagDataSession"];
		foreach (var ReginalOffice in objPrabhagDataSession.allPrabhag)
		{
			if (ReginalOffice.prabhagName == ddlRegionalOffice.SelectedValue)
			{
				foreach (var Ward in ReginalOffice.ward)
				{
					if (Ward.wardNo == ddlElectionDivison.SelectedValue)
					{
						Session["WardId"] = Ward.wardNo;
						foreach (var area in Ward.area)
						{
							ddlArea.Items.Add(area.area);
						}
						break;
					}
				}
			}
		}
	}

	protected void ddlArea_SelectedIndexChanged(object sender, EventArgs e)
	{
		PrabhagData objPrabhagDataSession = (PrabhagData)Session["objPrabhagDataSession"];
		foreach (var ReginalOffice in objPrabhagDataSession.allPrabhag)
		{
			if (ReginalOffice.prabhagName == ddlRegionalOffice.SelectedValue)
			{
				foreach (var Ward in ReginalOffice.ward)
				{
					if (Ward.wardNo == ddlElectionDivison.SelectedValue)
					{
						foreach (var area in Ward.area)
						{
							if (area.area == ddlArea.SelectedValue)
							{
								Session["AreaId"] = area.areaID;
								break;
							}
						}
					}
				}
			}
		}
	}

	protected void ddlMainScheme_SelectedIndexChanged(object sender, EventArgs e)
	{
		ddlSubScheme.Items.Clear();
		ddleligibleStatus.Items.Clear();
		ddlSubScheme.Items.Add(Resources.Resource.Select);
		SchemeDetails objSchemeDetailsSession = (SchemeDetails)Session["objSchemeDetailsSession"];
		foreach (var MainScheme in objSchemeDetailsSession.mainScheme)
		{
			if (MainScheme.mainschemName == ddlMainScheme.SelectedValue)
			{
				Session["MainSchemeId"] = MainScheme.mid;
				foreach (var SubScheme in MainScheme.subscheme)
				{
					ddlSubScheme.Items.Add(SubScheme.subchcemeName);
				}
			}
		}
	}

	protected void ddlSubScheme_SelectedIndexChanged(object sender, EventArgs e)
	{
		SchemeDetails objSchemeDetailsSession = (SchemeDetails)Session["objSchemeDetailsSession"];
		foreach (var MainScheme in objSchemeDetailsSession.mainScheme)
		{
			if (MainScheme.mainschemName == ddlMainScheme.SelectedValue)
			{
				foreach (var SubScheme in MainScheme.subscheme)
				{
					if (SubScheme.subchcemeName == ddlSubScheme.SelectedValue)
					{
						Session["SubSchemeId"] = SubScheme.subid;
						break;
					}
				}
			}
		}
		ddleligibleStatus.Items.Clear();
		ddleligibleStatus.Items.Add(Resources.Resource.Select);
		ddleligibleStatus.Items.Add(Resources.Resource.eligible);
		ddleligibleStatus.Items.Add(Resources.Resource.Ineligible);
	}

	protected void ddleligibleStatus_SelectedIndexChanged(object sender, EventArgs e)
	{
		if (ddleligibleStatus.SelectedIndex == 1)
			Session["EligibleOrNot"] = "पात्र";
		else
		{
			Session["EligibleOrNot"] = "अपात्र";
		}
	}

}
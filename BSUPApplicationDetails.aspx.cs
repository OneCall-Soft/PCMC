using System;
using System.IO;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web.UI.HtmlControls;

public partial class BSUPApplicationDetails : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		string applicationno = Request.QueryString["applicationno"];
		string strDataResponse = (string)Session["strDataResponse"];
		DataContractJsonSerializer objJsonSerializerRes = new DataContractJsonSerializer(typeof(ResponseBSUPData));
		MemoryStream objMSRes = new MemoryStream(Encoding.Default.GetBytes(strDataResponse));
		ResponseBSUPData objResponse = (ResponseBSUPData)objJsonSerializerRes.ReadObject(objMSRes);
		foreach (var Applicationdetail in objResponse.allData)
		{
			if (Applicationdetail.applicationNumber == applicationno)
			{
				tdapplicationno.InnerText = Applicationdetail.applicationNumber;
				tdhadharno.InnerText = Applicationdetail.adharNo;
				tdcfcno.InnerText = Applicationdetail.cfcavakNo;
				tdprabhagname.InnerText = Applicationdetail.prabhagnameEng;
				tdwardid.InnerText = Applicationdetail.wardId;
				tdarea.InnerText = Applicationdetail.areanameMar;
				tdmainscheme.InnerText = Applicationdetail.schemename;
				tdsubscheme.InnerText = Applicationdetail.subschemename;
				tdeligible.InnerText = Applicationdetail.eligibel;
				tdreason.InnerText = Applicationdetail.aptrareason;
				tdnameMarathi.InnerText = Applicationdetail.applicantNameinMar;
				tdnameEng.InnerText = Applicationdetail.applicantNameinEng;
				tdParentName.InnerText = Applicationdetail.parentName;
				tdBirthDate.InnerText = Applicationdetail.dateofBirth;
				tdAge.InnerText = Applicationdetail.age;
				tdMobileNo.InnerText = Applicationdetail.mobileNo;
				tdReligon.InnerText = Applicationdetail.religonName;
				tdCast.InnerText = Applicationdetail.castName;

				foreach (var Details in Applicationdetail.detail)
				{
					HtmlTableRow tr = new HtmlTableRow();
					HtmlTableCell tc1 = new HtmlTableCell();
					HtmlTableCell tc2 = new HtmlTableCell();
					tc1.InnerText = Details.Name;
					
					tr.Cells.Add(tc1);
					tc2.InnerText = Details.Value;
					tr.Cells.Add(tc2);

					tblDetails.Rows.Add(tr);
				}
				

				tdBankName.InnerText = Applicationdetail.bankName;
				tdBranchName.InnerText = Applicationdetail.branchName;
				tdSavingAccountNo.InnerText = Applicationdetail.accountNumber;
				tdifccode.InnerText = Applicationdetail.ifscCode;
				tdmicrCode.InnerText = Applicationdetail.micrCode;
				tdAccountHolderName.InnerText = Applicationdetail.accountholderName;
				break;
			}
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

	#endregion

}
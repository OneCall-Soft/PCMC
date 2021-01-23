using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FireBrigde1 : BasePage
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	protected void btn_Home(object sender, EventArgs e)
	{
		//  Session["language"] = "mr";
		Response.Redirect("Default.aspx");

	}
}
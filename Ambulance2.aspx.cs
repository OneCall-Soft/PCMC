using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ambulance2 : BasePage
{
    public static int i = 0;
    protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			//	Marathi_click(sender, e);
		}
	}
	protected void btn_Home(object sender, EventArgs e)
	{
		// Session["language"] = "mr";
		Response.Redirect("Default.aspx");

	}

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

      
        ++i;
        if(i == 5)
        {
            i = 0;
            Response.Redirect("PreventiveMaintaince.aspx");  
        }
    }
}
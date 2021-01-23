using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        EssentialInfo.GetServiceList();
        SetServices();
    }

    private void SetServices()
    {
        try
        {
            if (EssentialInfo.SERVICELIST.Count > 0)
            {
                foreach (KeyValuePair<string, string> item in EssentialInfo.SERVICELIST)
                {
                    if (!item.Key.Contains("N/A"))
                    {
                        if (item.Key.ToLower().Trim().Contains("watertax"))
                        {
                            if (item.Value.Trim() == "disable")
                            {
                                watertax.Attributes.Add("disabled", "disabled");
                                watertax.Style.Add("background-color", "lightpink");
                                watertax.Style.Add("opacity", "0.6");
                                watertax.Attributes.Add("title", "SERVICE IS DISABLED");
                            }
                        }
                        else if (item.Key.ToLower().Trim().Contains("propertytax"))
                        {
                            if (item.Value.Trim() == "disable")
                            {
                                propertytax.Attributes.Add("disabled", "disabled");
                                propertytax.Style.Add("background-color", "lightpink");
                                propertytax.Style.Add("opacity", "0.6");
                                propertytax.Attributes.Add("title", "SERVICE IS DISABLED");
                            }
                        }
                        else if (item.Key.ToLower().Trim().Contains("slumbilling")) {
                            if (item.Value.Trim() == "disable")
                            {
                                slumbilling.Attributes.Add("disabled", "disabled");
                                slumbilling.Style.Add("background-color", "lightpink");
                                slumbilling.Style.Add("opacity", "0.6");
                                slumbilling.Attributes.Add("title", "SERVICE IS DISABLED");
                            }
                        }                     
                    }
                }
            }
        }
        catch (Exception me)
        {
            throw me;
        }
    }

    protected void btnFbSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("~/ProperTaxNew.aspx");
        }
        catch (Exception ex)
        {

            throw;
        }
    }
}
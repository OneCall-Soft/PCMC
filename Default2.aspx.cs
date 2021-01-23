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

                        if (item.Key.ToLower().Contains("birthcertificate"))
                        {
                            if (item.Value.Trim() == "disable")
                            {
                                birthcertificate.Attributes.Add("disabled", "disabled");
                                birthcertificate.Style.Add("background-color", "lightpink");
                                birthcertificate.Style.Add("opacity", "0.6");
                                birthcertificate.Attributes.Add("title", "SERVICE IS DISABLED");
                            }
                        }
                        else if (item.Key.ToLower().Contains("deathcertificate")) {
                            if (item.Value.Trim() == "disable")
                            {
                                deathcertificate.Attributes.Add("disabled", "disabled");
                                deathcertificate.Style.Add("background-color", "lightpink");
                                deathcertificate.Style.Add("opacity", "0.6");
                                deathcertificate.Attributes.Add("title", "SERVICE IS DISABLED");
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
}
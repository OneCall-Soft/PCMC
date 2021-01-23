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
                        if (item.Key.ToLower().Contains("grievancefeedback") || item.Key.ToLower().Contains("gvfeedback")) {
                            if (item.Value.Trim() == "disable")
                            {
                                gvfeedback.Attributes.Add("disabled", "disabled");
                                gvfeedback.Style.Add("background-color", "lightpink");
                                gvfeedback.Style.Add("opacity", "0.6");
                                gvfeedback.Attributes.Add("title", "SERVICE IS DISABLED");
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
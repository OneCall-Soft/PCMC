using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MainPage : BasePage
{
	protected void Page_Load(object sender, EventArgs e)
	{
        if (!IsPostBack)
        {
            //	Marathi_click(sender, e);
            
        }
        
      
    }

   
    protected void Marathi_click(object sender, EventArgs e)
	{
		//Response.Redirect("MainPage.aspx");
	}
    [WebMethod]
    public static string GetBlock()
    {
        string re = "";
        if (File.Exists(@"C:\Users\dfdev13\Desktop\NewForm.html")) {
            re =   "C:\\Users\\dfdev13\\Desktop\\NewForm.html";
        }

        return re;

    }

    [WebMethod]
    public static List<Services> GetServiceList(string ip) {

        

        List<Services> services = new List<Services>();
        try
        {
            EssentialInfo.GetServiceList();  //Retriving services list

            if (EssentialInfo.SERVICELIST.Count > 0)
            {
                foreach (KeyValuePair<string, string> item in EssentialInfo.SERVICELIST)
                {
                    services.Add(new Services { service = item.Key, status = item.Value });

                }
            }
            else
            {
                services.Add(new Services { service = "N/A", status = "N/A" });
            }

            var dt = DateTime.Now.Date.ToString("dd-MM-yy");
            var hour = DateTime.Now.Hour.ToString();
            var min = DateTime.Now.Minute.ToString();
            var sec = DateTime.Now.Second.ToString();
        }
        catch (Exception)
        {

            throw;
        }

        return services;
    }
  


    public class Services {
        public string service{ get; set; }
        public string status { get; set; }
    }
}
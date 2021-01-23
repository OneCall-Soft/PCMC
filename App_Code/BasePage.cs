using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading;
using System.Globalization;

/// <summary>
/// Summary description for BasePage
/// </summary>
public class BasePage : System.Web.UI.Page
{

    protected override void InitializeCulture()
    {
        
        if (Session["language"] == null)
        {
			 // Session["language"] = "en-Us";
			Session["language"] = "mr";
		}
        else
        {
            if (HttpContext.Current.Request.Form["__EVENTTARGET"] != null && HttpContext.Current.Request.Form["__EVENTTARGET"].Contains("btnEnglish"))
            {               
                Session["language"] = "en-us";
            }
            else if (HttpContext.Current.Request.Form["__EVENTTARGET"] != null && HttpContext.Current.Request.Form["__EVENTTARGET"].Contains("btnHindi"))
            {
                Session["language"] = "hi";
            }
            else if (HttpContext.Current.Request.Form["__EVENTTARGET"] != null && HttpContext.Current.Request.Form["__EVENTTARGET"].Contains("btnMarathi"))
            {
                Session["language"] = "mr";
            }

            SetSessionCulture();
        }

        SetSessionCulture();
    }

    private void SetSessionCulture()
    {
        Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Session["language"].ToString());
        Thread.CurrentThread.CurrentUICulture = new CultureInfo(Session["language"].ToString());
        base.InitializeCulture();
    }
}
// Poojan Patel
// Urja Tamboli
// Nil Meruliya 
// Utsav Patel
// Yathart Shah

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group2_FinalProject
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Session["User_Name"] as String))
            {
                Response.Redirect("Login.aspx");
                return;
            }

        }
    }
}
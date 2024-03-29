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
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Session["User_Name"] as String))
            {
                Response.Redirect("Login.aspx");
                return;
            }
            lblUserName.Text = "Welcome to the Best Buy, " + Session["User_Name"].ToString();


        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedCategory = ddlCategory.SelectedValue;
            if (selectedCategory == "")
            {
                SqlDataSource1.SelectCommand = "SELECT * FROM [Product]";
            }
            else
            {
                SqlDataSource1.SelectCommand = "SELECT * FROM [Product] WHERE [Product_Categori] = @Product_Categori";
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("Product_Categori", selectedCategory);
            }
            Repeater1.DataBind();
        }
    }
}
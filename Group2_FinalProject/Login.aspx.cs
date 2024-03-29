// Poojan Patel
// Urja Tamboli
// Nil Meruliya 
// Utsav Patel
// Yathart Shah

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group2_FinalProject
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Group2_bestbuys"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Session["User_Name"] as String))
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string User_Name = txtUsername.Text.Trim();
            string User_Password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(User_Name) || string.IsNullOrEmpty(User_Password))
            {
                lblWarning.Text = "Please enter User_Name and User_Password";
                return;
            }

            SqlCommand cmd = new SqlCommand("SELECT User_ID, User_Password, User_Type from Users where User_Name = @User_Name", conn);
            cmd.Parameters.AddWithValue("@User_Name", User_Name);

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                string storedPassword = dt.Rows[0]["User_Password"].ToString();

                if (storedPassword == User_Password)
                {
                    if (dt.Rows[0]["User_Type"].ToString() == "Admin")
                    {
                        Session["admin"] = User_Name;
                        Response.Redirect("Admin.aspx");
                    }
                    else
                    {
                        Session["User_Name"] = User_Name;
                        Session["User_ID"] = dt.Rows[0]["User_ID"].ToString();
                        Response.Redirect("Home.aspx");
                    }
                }
                else
                {
                    lblWarning.Text = "Invalid User_Password. Please try again.";
                }
            }
            else
            {
                lblWarning.Text = "User_Name doesn't exist.";
            }
        }
    }
}
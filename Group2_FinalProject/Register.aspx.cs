// Poojan Patel
// Urja Tamboli
// Nil Meruliya 
// Utsav Patel
// Yathart Shah

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group2_FinalProject
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string User_Name = txtuName.Text.Trim();
                string User_Email = txtuEmail.Text.Trim();
                string User_Password = txtupassword.Text.Trim();
                string User_Type = ddluType.SelectedValue;


                // Check if user with the same username or email already exists
                bool userExists = CheckUserExists(User_Name, User_Email);

                if (userExists)
                {
                    lblWarning.Text = "User with the same username or email already exists.";
                    return;
                }

                string connectionString = ConfigurationManager.ConnectionStrings["Group2_bestbuys"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    try
                    {
                        conn.Open();
                        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE User_Name = @User_Name", conn);
                        cmd.Parameters.AddWithValue("@User_Name", User_Name);
                        int userCount = (int)cmd.ExecuteScalar();

                        if (userCount == 0)
                        {
                            string query = "INSERT INTO Users (User_Name, User_Email, User_Password, User_Type) VALUES (@User_Name, @User_Email, @User_Password, @User_Type)";
                            SqlCommand insertCmd = new SqlCommand(query, conn);
                            insertCmd.Parameters.AddWithValue("@User_Name", User_Name);
                            insertCmd.Parameters.AddWithValue("@User_Email", User_Email);
                            insertCmd.Parameters.AddWithValue("@User_Password", User_Password);
                            insertCmd.Parameters.AddWithValue("@User_Type", User_Type);
                            insertCmd.ExecuteNonQuery();
                            Response.Redirect("Login.aspx");
                        }
                        else
                        {
                            lblWarning.Text = "User Already exists";
                        }
                    }
                    catch (Exception ex)
                    {
                        lblWarning.Text = "An error occurred: " + ex.Message;
                    }
                }                // Redirect to a success page or perform other actions

            }
        }

        private bool CheckUserExists(string User_Name, string User_Email)
        {

            string connectionString = ConfigurationManager.ConnectionStrings["Group2_bestbuys"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Users WHERE User_Name = @User_Name OR User_Email = @User_Email";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@User_Name", User_Name);
                    command.Parameters.AddWithValue("@User_Email", User_Email);

                    connection.Open();
                    int count = (int)command.ExecuteScalar();

                    return count > 0;
                }
            }
        }

    }
}
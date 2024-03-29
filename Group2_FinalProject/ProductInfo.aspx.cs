// Poojan Patel
// Urja Tamboli
// Nil Meruliya 
// Utsav Patel
// Yathart Shah

using Group2_FinalProject.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group2_FinalProject
{
    public partial class ProductInfo : System.Web.UI.Page
    {
        List<myModel> clsItems = new List<myModel>();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Group2_bestbuys"].ConnectionString);
        string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Session["User_Name"] as String))
            {
                Response.Redirect("Login.aspx");

            }

            id = Request.QueryString["ID"].ToString();
            if (!IsPostBack)
            {
                var listcls = Session["cartItems"] as List<myModel>;
                if (listcls == null || listcls.Count == 0)
                {
                    Session["cartItems"] = clsItems;
                }

            }
            if (id == null)
            {
                //  Response.Redirect("Homepage.aspx");
            }
            SqlCommand cmd = new SqlCommand("SELECT * from Product where Product_ID =" + id, conn);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            conn.Open();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                string imageFilename = dt.Rows[0]["Product_Image"].ToString(); // This is the image filename from the database
                string imageFilePath = "~/Image/" + imageFilename;
                lblName.Text = dt.Rows[0]["Product_Name"].ToString();
                lblPrice.Text = dt.Rows[0]["Product_Price"].ToString();
                lblSize.Text = dt.Rows[0]["Product_Size"].ToString();
                lblDescription.Text = dt.Rows[0]["Product_Description"].ToString();

                imgProduct.ImageUrl = imageFilePath;



            }
            conn.Close();
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }



        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }

        protected void btnColor_Click(object sender, EventArgs e)
        {

        }

        protected void btnAddtoCart_Click(object sender, EventArgs e)
        {
            List<myModel> cartItem = (List<myModel>)Session["cartItems"];
            myModel item = new myModel();
            item.Product_Name = lblName.Text;
            item.Product_Price = lblPrice.Text;
            item.Product_Quantity = txtQuantity.Text;
            item.Product_Image = imgProduct.ImageUrl;
            item.Product_Total = double.Parse(lblPrice.Text) * double.Parse(txtQuantity.Text);
            item.Product_ID = cartItem.Count + 1;
            cartItem.Add(item);
            Session["cartItems"] = cartItem;

            txtQuantity.Text = "1";
        }
    }
}
// Poojan Patel
// Urja Tamboli
// Nil Meruliya 
// Utsav Patel
// Yathart Shah

using Group2_FinalProject.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group2_FinalProject
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_Name"] == null || string.IsNullOrEmpty(Session["User_Name"].ToString()))
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                BindCartData();
            }
        }

        protected void BindCartData()
        {
            var cartData = Session["cartItems"] as List<myModel> ?? new List<myModel>();

            Repeater1.DataSource = cartData;
            Repeater1.DataBind();

            double total = cartData.Sum(item => Convert.ToDouble(item.Product_Total));
            lblTot.Text = total.ToString();
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            if (sender is Button button)
            {
                if (int.TryParse((button.Parent.FindControl("HiddenField1") as HiddenField)?.Value, out int ind))
                {
                    var cartData = Session["cartItems"] as List<myModel> ?? new List<myModel>();

                    if (ind > 0 && ind <= cartData.Count)
                    {
                        cartData.RemoveAt(ind - 1);
                        Session["cartItems"] = cartData;
                    }
                }
            }

            Response.Redirect("Cart.aspx");
        }

        protected void btnGoToCheckout_Click(object sender, EventArgs e)
        {
            var cartData = Session["cartItems"] as List<myModel> ?? new List<myModel>();

            if (cartData.Count > 0)
            {
                Response.Redirect("Checkout.aspx");
            }
            else
            {
                lblErrorMessage.Text = "Your cart is empty. Please add items to your cart.";
                lblErrorMessage.Visible = true;
            }
        }
    }
}
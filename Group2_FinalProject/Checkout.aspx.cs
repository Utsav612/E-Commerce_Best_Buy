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
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            ClearCheckoutForm();
            ClearCart(); // Clear the cart items
            Response.Redirect("~/ThankYou.aspx");
        }

        private void ClearCheckoutForm()
        {
            // Clear the textboxes and other form fields in the checkout form
            txtFname.Text = "";
            txtLname.Text = "";
            txtEmail.Text = "";
            txtConformEmail.Text = "";
            txtPhonenumber.Text = "";
            txtAddress.Text = "";
            txtCity.Text = "";
            DDLState.SelectedIndex = 0;
            txtZipCode.Text = "";
        }

        private void ClearCart()
        {
            // Clear the cart items from the session
            Session["cartItems"] = new List<myModel>();
        }

        protected void GenderValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = RbMale.Checked || RbFemale.Checked || RbOthers.Checked;
        }

    }
}
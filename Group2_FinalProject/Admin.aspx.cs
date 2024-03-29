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
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Session["admin"] as String))
            {
                Response.Redirect("Login.aspx");

            }
        }
        protected void grdCategories_PreRender(object sender, EventArgs e)
        {
            grdCategories.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var parameters = SqlDataSource3.InsertParameters;
                parameters["Category_ID"].DefaultValue = txtCategory_ID.Text;
                parameters["category_Title"].DefaultValue = txtcategory_Title.Text;

                try
                {
                    SqlDataSource3.Insert();
                    txtCategory_ID.Text = "";
                    txtcategory_Title.Text = "";
                }
                catch (Exception ex)
                {
                    lblError.Text = DatabaseErrorMessage(ex.Message);
                }
            }
        }

        protected void grdCategories_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = ConcurrencyErrorMessage();
            }
        }

        protected void grdCategories_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = ConcurrencyErrorMessage();
            }
        }

        private string DatabaseErrorMessage(string errorMsg)
        {
            return $"<b>A database error has occurred:</b> {errorMsg}";
        }
        private string ConcurrencyErrorMessage()
        {
            return "Another user may have updated that category. Please try again";
        }




        protected void grdProducts_PreRender(object sender, EventArgs ev)
        {
            grdProducts.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void dvProduct_ItemUpdated(object sender, DetailsViewUpdatedEventArgs ev)
        {
            if (ev.Exception != null)
            {
                Label11.Text = PDatabaseErrorMessage(ev.Exception.Message);
                ev.ExceptionHandled = true;
                ev.KeepInEditMode = true;
            }
            else if (ev.AffectedRows == 0)
            {
                Label11.Text = PConcurrencyErrorMessage();
            }
            else
            {
                grdProducts.DataBind();
            }
        }

        protected void dvProduct_ItemDeleted(object sender, DetailsViewDeletedEventArgs ev)
        {
            if (ev.Exception != null)
            {
                Label11.Text = PDatabaseErrorMessage(ev.Exception.Message);
                ev.ExceptionHandled = true;
            }
            else if (ev.AffectedRows == 0)
            {
                Label11.Text = PConcurrencyErrorMessage();
            }
            else
            {
                grdProducts.DataBind();
            }
        }

        protected void dvProduct_ItemInserted(object sender, DetailsViewInsertedEventArgs ev)
        {
            if (ev.Exception != null)
            {
                Label11.Text = PDatabaseErrorMessage(ev.Exception.Message);
                ev.ExceptionHandled = true;
                ev.KeepInInsertMode = true;
            }
            else
            {
                grdProducts.DataBind();
            }

        }

        protected void dvProduct_ItemDeleting(object sender, DetailsViewDeleteEventArgs ev)
        {
            if (ev.Values["Product_Price"] != null)
            {
                ev.Values["Product_Price"] =
                    ev.Values["Product_Price"].ToString().Substring(1);
            }
        }

        private string PDatabaseErrorMessage(string errorMsgs)
        {
            return $"<b>A database error has occurred:</b> {errorMsgs}";
        }
        private string PConcurrencyErrorMessage()
        {
            return "Another user may have updated that category. Please try again";
        }

    }
}
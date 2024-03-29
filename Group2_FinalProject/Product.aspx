<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Group2_FinalProject.Product" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
 /* Stylish and Classy Styling for the Product Page */

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 10px;
}

.row {
    margin: 20px 0;
}

.details-card {
    background-color: #fff;
    border: none;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s ease-in-out;
}

.details-card:hover {
    transform: translateY(-10px);
}

.card-img-top {
    height: 250px;
    width: 100%;
    object-fit: cover;
    border-radius: 10px 10px 0 0;
}

.card-body {
    padding: 20px;
}

.card-title {
    font-size: 18px;
    margin-bottom: 10px;
}

.card-text {
    font-size: 16px;
    color: #555;
    margin-bottom: 15px;
}

.btn-outline-danger {
    background-color: #0046BE;
    color: #fff;
    border: none;
    border-radius: 5px;
    padding: 5px 10px;
    text-decoration: none;
    transition: background-color 0.3s, color 0.3s;
}

.btn-outline-danger:hover {
    background-color: #0C134F;
    color: #fff;
}

.cat{
    font-size: 25px;
    font-weight: bold
}

.cardInfo{
    
        box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
}

/* Animation for the card */
@keyframes fadeIn {
    0% {
        opacity: 0;
        transform: translateY(-20px);
    }
    100% {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Apply fadeIn animation to card */
.card {
    animation: fadeIn 0.5s ease-in-out;
}

.n{
    text-align: center
}

.username{
    width: 100%;
    padding: 20px;
    background-color:#0046BE;
    color: #FFEF00;
    border-radius: 10px

}

    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:Group2_bestbuys %>"
            SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>
        <br />
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="row mt-1 align-items-center justify-content-center">
                        <div class="col-md-6 d-flex align-items-center justify-content-center">
                    <h2 class="username">
                        <asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label>
                    </h2>
                             </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <div class="row mt-1 align-items-center justify-content-center">
                        <div class="col-md-6 d-flex align-items-center justify-content-center">
                        <label class="cat" for="ddlCategory">Select Category : </label>
                        <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True"
                            OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"
                            CssClass="form-control">
                            <asp:ListItem Text="All Categories" Value=""></asp:ListItem>
                            <asp:ListItem Text="Mobile" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Laptop" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Headphone" Value="3"></asp:ListItem>
                         
                        </asp:DropDownList>
                            </div>
                    </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" EnableTheming="True">
                    <ItemTemplate>
                        <div class="col-md-4">
                            <div class="card details-card mb-4 cardInfo" style="padding:20px;">
                                <img class="card-img-top" src='<%# ResolveUrl("~/Image/") + Eval("Product_Image") %>'
                                    alt="Product Image" style="height: 400px; width: auto; object-fit: contain;" />
                                <div class="card-body">
                                    <h5 class="card-title"><asp:Label runat="server" Text='<%# Eval("Product_Name") %>' ID="lblroductName"></asp:Label></h5>
                                    <p class="card-text">$<asp:Label runat="server" Text='<%# Eval("Product_Price") %>' ID="lblPrice"></asp:Label></p>
                                    <div class="n">
                                        <asp:HyperLink ID="HyperLink1"
                                            NavigateUrl='<%# Eval("Product_ID", "~/ProductInfo.aspx?Id={0}") %>' runat="server" CssClass="btn btn-outline-danger">
                                            Details
                                        </asp:HyperLink>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
</asp:Content>

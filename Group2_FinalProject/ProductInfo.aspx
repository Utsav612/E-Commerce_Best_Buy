<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductInfo.aspx.cs" Inherits="Group2_FinalProject.ProductInfo" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       
/* Stylish Styling for the Product View Page */
.container {
    margin-top: 30px;
}

.card.details {
    border-radius: 10px;
      box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
    padding: 30px;
    margin-bottom: 20px
}

.row {
    margin: 0 -15px;
}

.nn {
    flex-basis: 50%;
    padding: 0 15px;
}

.nn1 {
    flex-basis: 50%;
    padding: 0 15px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.product-image {
 
    max-width: 100%;
    height: auto;
    border-radius: 10px;

}

.product-category {
    color: #0046BE;
    font-weight: bold;
    margin-top: 10px;
}

.product-price {
    font-size: 24px;
    font-weight: bold;
    color: #0046BE;
    margin-top: 5px;
}

.subtitle {
    font-weight: bold;
    font-size: 18px;
    color: #555;
    margin-top: 15px;
}

.theme-text {
    color: #0046BE;
}

.product-title {
    font-size: 20px;
    font-weight: bold;
    margin-top: 20px;
}

.product-description {
    font-size: 16px;
    color: #555;
    line-height: 1.5;
}

.form-control {
    border-radius: 5px;
    padding: 8px;
    width: 60px;
}

.btnn {
    background-color: #0046BE;
    color: #fff;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    cursor: pointer;
    transition: background-color 0.3s;
    text-transform: uppercase;
    font-weight: bold;
    margin-top: 15px;
}

.btnn:hover {
    background-color: #0046BE;
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



    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  
         <form id="form1" runat="server" class="form-horizontal">
        <div class="container">
            <div class="card details">
                <div class="row">
                    <div class="nn">
                        <asp:Image ID="imgProduct" ImageUrl="Image/banner.jpg" CssClass="img-fluid product-image" runat="server" />
                    </div>
                    <div class="nn1">
                        <div class="main-description">
                            <p class="product-category mb-0">Product</p>
                            <h3><asp:Label ID="lblName" runat="server" Text=""></asp:Label></h3>
                            <hr />
                            <p class="product-price">$<asp:Label ID="lblPrice" runat="server" Text=""></asp:Label></p>
                            <div style="clear: both"></div>
                            <hr />                       
                           
                            <div>
                                <div class="subtitle my-3 theme-text">Size: <asp:Label ID="lblSize" runat="server" Text=""></asp:Label> </div>
                            </div>
                            <p class="product-title ">Description</p>
                            <p class="product-description ">
                                <asp:Label ID="lblDescription" runat="server" Text=""></asp:Label>
                            </p>

                            <div class="subtitle theme-text">Qty:
                                <asp:TextBox ID="txtQuantity" CssClass="form-control" type="number" Text="1" Width="100" min="1" runat="server"></asp:TextBox>
                            </div>
                            <p class="product-description">
                                <asp:Button ID="btnAddtoCart" class="btnn " runat="server" Text="Add to Cart" OnClick="btnAddtoCart_Click" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button2" runat="server" class="btnn" Text="Go to Cart" OnClick="Button2_Click" />
                            </p>
                            <p class="product-description mb-4">&nbsp;</p>
                        </div>
                    </div>
                </div>
                <!-- End row -->
            </div>
        </div>
    </form>


</asp:Content>

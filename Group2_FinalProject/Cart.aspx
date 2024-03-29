<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Group2_FinalProject.Cart" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
 /* Stylish Styling for the Cart Details Page */
.container {
    margin-top: 30px;
}

.cols {
    text-align: center;
}

.n {
    background-color: #0046BE;
    padding: 20px;
    border-radius: 10px;
    color: #fff;
    font-weight: bold;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.n h1 {
    margin: 0;
}

.nnn {
    margin-top: 30px;
    padding: 10px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    background-color: #fff;
}

.nnnn {
    position: relative;
    overflow: hidden;
}

.card-img-top {
    width: 100%;
    height: 300px;
    object-fit: cover;
}

.card-body {
    padding: 15px;
}

.card-title {
    font-size: 18px;
    font-weight: bold;
    margin: 5px 0;
}

.card-text {
    font-size: 16px;
    color: #555;
    margin-bottom: 5px;
}

.buttn {
    background-color: #0046BE;
    color: #fff;
    border: none;
    border-radius: 5px;
    padding: 5px 10px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.buttn:hover {
    background-color: #0046BE;
}

.c2 {
    display: flex;
    justify-content: flex-end;
    margin-top: 20px;
}

.c {
    padding: 10px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.btnm {
    background-color: #0046BE;
    color: #fff;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    cursor: pointer;
    transition: background-color 0.3s;
    text-transform: uppercase;
    font-weight: bold;
}

.btnm:hover {
    background-color: #0046BE;
}

.t {
    color: #dc3545;
    font-weight: bold;
}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <form id="form1" runat="server" class="form-horizontal">
            <div class="container">
                <br />
                <div class="row">
                    <div class="cols">
                        <div class="n">
                        <div class="nn">
                        <h1>Cart Details</h1>
                            </div>
                            </div>
                    </div>
                </div>
                <br />

                <div class="row">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>

                            <div class="nnn">
                                <div class="nnnn">
                                    <asp:Image ID="imgProduct" ImageUrl='<%# Eval("Product_Image") %>' runat="server" CssClass="card-img-top" style="height: 400px; width: auto; object-fit: contain;" />
                                    
                                    <div class="card-body">
                                        <h5 class="card-title"><asp:Label ID="lblpName" runat="server" Text='<%# Eval("Product_Name") %>'></asp:Label></h5>
                                        <p class="card-text">$<asp:Label ID="lblPprice" runat="server" Text='<%# Eval("Product_Price") %>'></asp:Label></p>
                                        <asp:HiddenField ID="HiddenField1" Value='<%# Eval("Product_ID") %>' runat="server" />
                                        <div>
                                            <h6>Qty: <asp:Label type="number" ID="txtPQuantity" Text='<%# Eval("Product_Quantity") %>' runat="server"></asp:Label></h6>
                                            <h6>Total: $<asp:Label type="number" ID="Ptotal" Text='<%# Eval("Product_Total") %>' runat="server"></asp:Label></h6>
                                        </div>
                                        <asp:Button ID="btnRemove" CssClass="buttn" runat="server" Text="Remove" OnClick="btnRemove_Click" />
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="row">
                    <div class="c2">
                        <div class="c" >
                            
                        <h2>Total: $<asp:Label ID="lblTot" runat="server" Text=""></asp:Label></h2>
                        <asp:Button ID="btnGoToCheckout" runat="server" Text="Go to Checkout" OnClick="btnGoToCheckout_Click" CssClass="btnm" />
                            </div>
                        
                        </div>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="co">
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="t" Visible="false"></asp:Label>
                    </div>
                </div>
        </form>
    </main>
</asp:Content>

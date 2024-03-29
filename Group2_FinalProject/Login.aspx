<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Group2_FinalProject.Login" %>



 <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
/* New styling for the login page */
main{
     background-image: url('../Image/h12.jpg');
     background-repeat: no-repeat;
}
.container {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f5f5f5;
    border-radius: 10px;
     box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
}

main{
    padding:17px 0;
    
}

.card {
    border-radius: 10px;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 20px;
    animation: fadeIn 0.5s ease-in-out;
}

.card h1 {
    font-size: 24px;
    margin-bottom: 20px;
    text-align: center;
}

.form-label, .n3 {
    display: block;
    font-weight: bold;
    margin-bottom: 8px;
}

.form-control {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-bottom: 15px;
}


.nn1 {
    display: block;
    width: 100%;
    padding: 10px;
    background-color: rgb(0,70,190);
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
    text-transform: uppercase;
    font-weight: bold;
}

.nn1:hover {
    background-color: #0D1282;
}

.nn input{
    margin: 0 auto;
}

.text-center {
    text-align: center;
    margin-top: 15px;
    font-size: 14px;
}

.text-center a {
    color: rgb(0,70,190);
    text-decoration: none;
    transition: color 0.3s;
}

.text-center a:hover {
    color: #0D1282;
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

h1{
    font-weight:bold;
}

        </style>
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <main>
            <form id="form1" runat="server">
                <div class="container ">
                    <div class="card details">
                        <br />
                        <div class="rows">
                            <div class="colm">
                                <div class="justify">
                                    <div class="alignr">
                                        <h1>Login</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <asp:Label ID="lblWarning" runat="server" ForeColor="Red"></asp:Label>
                        <div class="n1">
                            <div class="n2">
                                <label class="n3" for="txtUsername">User Name:</label>
                                <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="n4">
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername"
                                ErrorMessage="Email address is required" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div class="n5">
                            <div class="n6">
                                <label class="form-label" for="txtPassword">Password:</label>
                                <asp:TextBox type="password" ID="txtPassword" CssClass="form-control" runat="server">
                                </asp:TextBox>
                            </div>
                        </div>
                        <div class="n7">
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                                ErrorMessage="Password is required" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>

                        <br />

                       
                        <div class="nn">
                            <asp:Button ID="btnLogin" CssClass="nn1"
                                style="width :30%" runat="server" Text="Login" OnClick="btnLogin_Click" />
                        </div>
                        <div class="text-center">
                            <p>
                                Not a member? <a href="#!">
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx">Create new
                                        Account
                                    </asp:HyperLink>
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </form>
        </main>
    </asp:Content>

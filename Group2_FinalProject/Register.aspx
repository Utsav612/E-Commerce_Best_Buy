<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Group2_FinalProject.Register" %>



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
            <form id="form1" runat="server" class="form-horizontal">
                <div class="container ">
                    <div class="card details">
                        <br />
                        <div class="rows">
                            <div class="colm">
                                <div class="justify">
                                    <div class="align">
                                        <h1>Signup</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                    <asp:Label ID="lblWarning" runat="server" ForeColor="Red"></asp:Label>
                    <div class="n1">
                        <div class="n2">
                            <label class="n3" for="txtuName">Name:</label>
                            <asp:TextBox ID="txtuName" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="n4">
                            <asp:RequiredFieldValidator ID="rfvuName" ControlToValidate="txtuName" runat="server"
                                ErrorMessage="Username is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div> 
                    <br />
                    <div class="n5">
                        <div class="n6">
                            <label class="n7" for="txtuEmail">Email ID:</label>
                            <asp:TextBox ID="txtuEmail" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="n8">
                        <asp:RequiredFieldValidator ID="rfvuEmail" ControlToValidate="txtuEmail" runat="server"
                            ErrorMessage="Email address is required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revuEmail" ControlToValidate="txtuEmail" runat="server"
                            ErrorMessage="Invalid email format" ForeColor="Red"
                            ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$">
                        </asp:RegularExpressionValidator>
                    </div>
                    <br />
                    <div class="n8">
                        <div class="n9">
                            <label class="mr-1" for="txtupassword">Password:</label>
                            <asp:TextBox ID="txtupassword" CssClass="form-control" TextMode="Password" runat="server">
                            </asp:TextBox>
                        </div>
                    </div>
                    <div class="n10">
                            <asp:RequiredFieldValidator ID="rfvupassword" ControlToValidate="txtupassword"
                                runat="server" ErrorMessage="Password is required" ForeColor="Red">
                            </asp:RequiredFieldValidator>
                    </div>
                    <br />
                    <div class="a">
                        <div class="aa">
                            <label class="aaa" for="ddlUserType">User Type:</label>
                            <asp:DropDownList ID="ddluType" CssClass="form-control" runat="server">
                                <asp:ListItem>Select...</asp:ListItem>
                                <asp:ListItem>User</asp:ListItem>
                                <asp:ListItem>Admin</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="aaaa">
                            <asp:RequiredFieldValidator ID="rfvuType" ControlToValidate="ddluType" runat="server"
                                ErrorMessage="User Type is required" ForeColor="Red" InitialValue="Select...">
                            </asp:RequiredFieldValidator>
                    </div>  
                    <br />
                    <div class="nn">
                    <asp:Button ID="btnRegister" runat="server" CssClass="nn1" style="width :30%"
                        Text="Register" OnClick="btnRegister_Click" />
                        </div>
                    <div class="text-center">
                        <p>
                            Already a member? <a href="#!">
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Login
                                </asp:HyperLink>
                            </a>
                        </p>
                    </div>
                </div>
                    </div>
            </form>

        </main>
    </asp:Content>

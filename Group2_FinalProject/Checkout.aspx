<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Group2_FinalProject.Checkout" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
        <style>
            /* Contact Form Styling */

/* Container Styles */
.container {
    margin-top: 30px;
}

/* Alert Styles */
.a {
    margin-bottom: 20px;
}

/* Contact Information Styles */
.b {
    background-color: #f8f9fa;
    padding: 20px;
    margin-bottom: 15px;
    border-radius: 10px;
    box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
}

.c {
    display: flex;
    gap: 20px;
}

.d{
    flex:1;
}


/* Gender Styles */
.aa {
    margin-top: 20px;
}

.bb {
    display: flex;
    gap: 20px;
}

.cc {
    flex: 1;
}

/* Email Address Styles */
.nn {
    margin-top: 20px;
}

/* Phone Number Styles */
.n {
    margin-top: 20px;
}

.nn {
    display: flex;
    gap: 20px;
}

/* Billing Address Styles */
.m {
    margin-top: 30px;
    font-weight: bold;
}

.mm,
.xx,
.xxx,
.zz {
    margin-top: 20px;
}

/* Button Styles */
.e {
    margin: 20px;
    display: flex;
    justify-content: space-between;
    flex-direction: row;

}

.ee {
    background-color: #5D9C59;
    color: #fff;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.btnblue{
     background-color: #0046BE;
   color: #fff;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.eee {
    background-color: #DF2E38;
    color: #fff;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    cursor: pointer;
    transition: background-color 0.3s;
}

/* Form Validation Message Styles */
.text-danger {
    color: #dc3545;
    font-weight: bold;
}

/* Radio Button Styles */
.form-input {
    margin-right: 5px;
}

/* Animation Styles */
.needs-validation input:invalid {
    border-color: #dc3545;
    animation: shake 0.5s;
}

@keyframes shake {
    0%,
    100% {
        transform: translateX(0);
    }
    10%,
    30%,
    50%,
    70%,
    90% {
        transform: translateX(-5px);
    }
    20%,
    40%,
    60%,
    80% {
        transform: translateX(5px);
    }
}

.dem{
    flex:1;
}

.em{
    margin-right: 450px
}
       
.dd{
    margin-right: 260px
}
        </style>
    </asp:Content>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container mt-5">
            <main>
                <form id="form1" runat="server" defaultfocus="txtFirstName" class="needs-validation" novalidate>
                   
                    
                    <div class="a">
                        <div class="alert alert-dismissible" role="alert">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                                ValidationGroup="checkoutValidationGroup" />
                        </div>
                    </div>

                    <div class="b">
                        <h3>Contact Information</h3>
                        <div class="c">
                            <div class="dem">
                                <label for="txtFname" class="form-label">First Name:</label>
                                <asp:TextBox ID="txtFname" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="FnameError" runat="server"
                                    ErrorMessage="Please Enter First Name" Display="Dynamic"
                                    ControlToValidate="txtFname" CssClass="text-danger"></asp:RequiredFieldValidator>
                            </div>
                            <div class="em">
                                <label for="txtLname" class="form-label">Last Name:</label>
                                <asp:TextBox ID="txtLname" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="LnameError" runat="server"
                                    ErrorMessage="Please Enter Last Name " Display="Dynamic"
                                    ControlToValidate="txtLname" CssClass="text-danger"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label>Gender:</label>
                            <div class="form-check">
                                <asp:RadioButton ID="RbMale" runat="server" GroupName="genderGroup"
                                    CssClass="form-input"></asp:RadioButton>
                                <label class="form-check-label">Male</label>
                            </div>
                            <div class="form-check">
                                <asp:RadioButton ID="RbFemale" runat="server" GroupName="genderGroup"
                                    CssClass="form-input"></asp:RadioButton>
                                <label class="form-check-label">Female</label>
                            </div>
                            <div class="form-check">
                                <asp:RadioButton ID="RbOthers" runat="server" GroupName="genderGroup"
                                    CssClass="form-input"></asp:RadioButton>
                                <label class="form-check-label">Others</label>
                            </div>
                            <asp:CustomValidator ID="GenderValidator" runat="server"
                                ErrorMessage="Please select a gender" ClientValidationFunction="validateGender"
                                OnServerValidate="GenderValidator_ServerValidate" CssClass="text-danger">
                            </asp:CustomValidator>
                        </div>
                   



                    <div class="aa">
                        <div class="bb">
                            <div class="cc">
                                <label for="txtEmail" class="form-label">Email Address:</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailError" runat="server"
                                    ErrorMessage="Please Enter Email" Display="Dynamic" ControlToValidate="txtEmail"
                                    CssClass="text-danger">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="InvalidEmail" runat="server"
                                    ControlToValidate="txtEmail" ErrorMessage="Invalid email format"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    CssClass="text-danger"></asp:RegularExpressionValidator>
                            </div>
                            <div class="dd">
                                <label for="txtConformEmail" class="form-label">Confirm Email:</label>
                                <asp:TextBox ID="txtConformEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ErrorMessage="Please Confirm Email" ControlToValidate="txtConformEmail"
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="ReemailError" runat="server"
                                    ErrorMessage="Error!!! Email Does Not Match!!!!" ControlToCompare="txtEmail"
                                    ControlToValidate="txtConformEmail" CssClass="text-danger"></asp:CompareValidator>
                            </div>
                        </div>
                    </div>

                    <div class="n">
                        <label for="txtPhonenumber" class="form-label">Phone Number:</label>
                        <asp:TextBox ID="txtPhonenumber" runat="server" CssClass="form-control"></asp:TextBox>
                        <div class="nn">
                            <asp:RequiredFieldValidator ID="PhonenumberError" runat="server"
                                ErrorMessage="Please Enter Phone Number" Display="Dynamic"
                                ControlToValidate="txtPhonenumber" CssClass="text-danger"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="InvalidPhonenumber" runat="server"
                                ControlToValidate="txtPhonenumber"
                                ErrorMessage="Use this format: 123-456-7890"
                                ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
                                CssClass="text-danger"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                         </div>
                    <div class="b">

                    <div class="m">
                        <h3>Billing Address</h3>
                    </div>

                    <div class="mm">
                        <label for="txtAddress" class="form-label">Address:</label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                        <div class="mmm">
                            <asp:RequiredFieldValidator ID="AddressError" runat="server"
                                ErrorMessage="Please Enter Address." Display="Dynamic" ControlToValidate="txtAddress"
                                CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="xx">
                        <label for="txtCity" class="form-label">City:</label>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                        <div class="x">
                            <asp:RequiredFieldValidator ID="CityError" runat="server"
                                ErrorMessage="Please Enter City Name" Display="Dynamic" ControlToValidate="txtCity"
                                CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="xxx">
                        <label for="DDLState" class="form-label">State:</label>
                        <asp:DropDownList ID="DDLState" runat="server" CssClass="form-select">
                            <asp:ListItem>Ontario</asp:ListItem>
                            <asp:ListItem>Alberta</asp:ListItem>
                            <asp:ListItem>Nova Scotia</asp:ListItem>
                            <asp:ListItem>British Columbia</asp:ListItem>
                            <asp:ListItem>Quebec</asp:ListItem>
                            <asp:ListItem>Manitoba</asp:ListItem>
                        </asp:DropDownList>
                        <div class="z">
                            <asp:RequiredFieldValidator ID="StateError" runat="server"
                                ErrorMessage="Please Select The State." Display="Dynamic" ControlToValidate="DDLState"
                                CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="zz">
                        <label for="txtZipCode" class="form-label">Zip code:</label>
                        <asp:TextBox ID="txtZipCode" runat="server" CssClass="form-control"></asp:TextBox>
                        <div class="zzz">
                            <asp:RequiredFieldValidator ID="ZipCodeError" runat="server"
                                ErrorMessage="Please Enter Zip Code" Display="Dynamic" ControlToValidate="txtZipCode"
                                CssClass="text-danger"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                ControlToValidate="txtZipCode" ErrorMessage="Please Enter Valid Zip code"
                                Display="Dynamic" ValidationExpression="^\d{5}-\d{4}|\d{5}|[A-Z]\d[A-Z] \d[A-Z]\d$"
                                CssClass="text-danger">Zip code must be in format of ***** or *****-*****
                            </asp:RegularExpressionValidator>
                        </div>
                    </div>
                        </div>

                    <div class="e">

                            <asp:Button ID="btncheckout" runat="server" Text="Place Order" CssClass="ee"
                                OnClick="btnCheckOut_Click" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel Order" CssClass="eee"
                                CausesValidation="False" PostBackUrl="~/Products.aspx" />
                            <asp:Button ID="btnGoBack" runat="server" Text="Go Back To Cart"
                                CssClass="btnblue" CausesValidation="False" PostBackUrl="~/Cart.aspx" />
                       
                    </div>

                </form>
            </main>
        </div>
    </asp:Content>

    <asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
        <script type="text/javascript">
            function validateGender(source, args) {
                var RbMale = document.getElementById('<%= RbMale.ClientID %>');
                var RbFemale = document.getElementById('<%= RbFemale.ClientID %>');
                var RbOthers = document.getElementById('<%= RbOthers.ClientID %>');
                args.IsValid = RbMale.checked || RbFemale.checked || RbOthers.checked;
            }
        </script>
    </asp:Content>
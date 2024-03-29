<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ThankYou.aspx.cs" Inherits="Group2_FinalProject.ThankYou" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title>Thank You Page</title>
    <style>
      
        .btncontainer {
            max-width: 600px;
            margin: 0 auto;
            padding: 40px;
            background-color: #eaf3fa;
            border-radius: 4px;
            box-shadow: 0 2px 5px #808080;
            text-align: center;
        }
        
        h1 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }
         .btn {
            background-color: #2d3091;
            color: #f3eedc;
            font-weight: 500;
            margin-left:20px;
            padding: 10px;
            margin-bottom:10px;
            font-size: 16px;
            border-radius: 5px;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {

           background-color: #e9a047;
           color: #2d3091;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <div class="btncontainer">
            <h1>Thank You for shopping at Best Buy</h1>
            <asp:Button ID="s1" runat="server" Text="Go back to Home page" CssClass="btn" OnClick="success_Click" />
        </div>
    </form>
</asp:Content>
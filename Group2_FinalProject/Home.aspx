<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Group2_FinalProject.Home" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f2f2f2;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

/* Header styles */
header {
    background-color: #333;
    padding: 20px;
    color: #fff;
    text-align: center;
}

/* Main content styles */
.main-content {
    max-width: 1200px;
    margin: 0 auto;
    padding: 40px;
    flex: 1;
   
}

.banner {
    text-align: center;
    margin-bottom: 40px;
}

    .banner h1 {
        font-size: 36px;
        color: #333;
        margin-bottom: 10px;
    }

    .banner p {
        font-size: 18px;
        color: #666;
    }

/* Book grid */
.book-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    grid-gap: 30px;
    margin-bottom: 30px;
}

.book {
    background-color: #fff;
    border-radius: 5px;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

    .book img {
        max-width: 100%;
        margin-bottom: 10px;
    }

    .book h3 {
        font-size: 20px;
        color: #333;
        margin-bottom: 5px;
    }

    .book p {
        font-size: 16px;
        color: #666;
        margin-bottom: 10px;
    }

    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
       <link href="Css/Home.css" rel="stylesheet" />
     <header>
    <h1>Welcome to Best Buy</h1>
    <p>Discover a world of Electronics!</p>
  </header>

  <div class="main-content">
    <div class="banner">
      <h1>New Releases</h1>
      <p>Check out the latest gadgets in our store.</p>
    </div>

    <div class="book-grid">
      <div class="book">
        <img src="/Image/M4.jpg" alt="Book 1">
   
     
      </div>
      <div class="book">
        <img src="/Image/H1.jpg" alt="Book 2">
   
  
      </div>
      <div class="book">
        <img src="/Image/M1.jpg" alt="Book 3">
    
 
      </div>
    </div>
  </div>

</asp:Content>
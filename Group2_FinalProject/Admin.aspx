<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Group2_FinalProject.Admin" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Head" runat="server">

     <style>
.container {
  margin-top: 50px;
  background-color: #f7f7f7;
  padding: 20px;
  border-radius: 10px;
   box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
}

.cat{
    text-align:center;
    margin-left: 500px;
         background-color: #0046BE;
   color: #fff;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    cursor: pointer;
    transition: background-color 0.3s;
}

/* Style the dropdown and align it with the label */
#userlist {
  width: 100%;
  max-width: 200px;
  margin-right: 10px;
}

/* Style the table */
.table {
  width: 100%;
  margin-top: 20px;
  border-collapse: collapse;
}

/* Header row styles */
.table th {
  background-color: #f2f2f2;
  padding: 10px;
  text-align: left;
  font-weight: bold;
  border-bottom: 2px solid #ddd;
}

/* Table row styles */
.table td {
  padding: 10px;
  border-bottom: 1px solid #ddd;
}

/* Alternating row background */
.table tr:nth-child(even) {
  background-color: #f7f7f7;
}

/* Style labels in the table */
.table label {
  display: block;
  margin: 0;
  padding: 0;
  font-size: 14px;
  color: #333;
}

/* Add some space between table cells */
.table td, .table th {
  padding: 10px 15px;
}

/* Style the dropdown container */
.row.mt-1 {
  display: flex;
  align-items: center;
}

/* Center the dropdown */
.col-md-6 {
  display: flex;
  align-items: center;
  justify-content: center;
}

/* Add margin to the top of the table */
.row.mt-3 {
  margin-top: 20px;
}
   </style>

    </asp:Content>

 <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <main>

            <form id="form1" runat="server" class="form-horizontal">

                <div class="container mt-5">
                    <div class="row">
                        <div class="row mt-1 align-items-center justify-content-center">
                            <div class="col-md-6 d-flex align-items-center justify-content-center">
                                <label for="userlist" class="mr-1">User Data:</label>
                                <asp:DropDownList ID="userlist" runat="server" AutoPostBack="True"
                                    CssClass="form-control" DataSourceID="SqlDataSource22" DataTextField="User_Type"
                                    DataValueField="User_Type">
                                </asp:DropDownList>
                            </div>
                            <asp:SqlDataSource ID="SqlDataSource22" runat="server"
                                ConnectionString="<%$ ConnectionStrings:Group2_bestbuys %>"
                                SelectCommand="SELECT DISTINCT [User_Type] FROM [Users]">
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <asp:DataList ID="ulist" runat="server" DataKeyField="User_ID" DataSourceID="SqlDataSource23"
                                CssClass="table table-striped">
                                <HeaderTemplate>
                                    <tr>
                                        <th>User ID</th>
                                        <th>User Name</th>
                                        <th>User Email</th>
                                        <th>User Type</th>
                                    </tr>
                                </HeaderTemplate>
                                <ItemStyle />
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:Label ID="txtUser_ID" runat="server" Text='<%# Eval("User_ID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="txtUser_Name" runat="server" Text='<%# Eval("User_Name") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="txtUser_Email" runat="server" Text='<%# Eval("User_Email") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="txtUser_Type" runat="server" Text='<%# Eval("User_Type") %>' />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <AlternatingItemStyle />
                                <FooterStyle Font-Bold="True" />
                                <HeaderStyle Font-Bold="True" />
                                <SelectedItemStyle Font-Bold="True" />
                            </asp:DataList>
                            <asp:SqlDataSource ID="SqlDataSource23" runat="server"
                                ConnectionString="<%$ ConnectionStrings:Group2_bestbuys %>"
                                SelectCommand="SELECT [User_ID], [User_Name], [User_Email], [User_Type] FROM [Users] WHERE [User_Type] = @User_Type">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="userlist" Name="User_Type" PropertyName="SelectedValue"
                                        Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>



                <!-- ===========  -->
                <div class="container mt-5">
                    <div class="row">
                        <div class="row mt-1 align-items-center justify-content-center">
                            <div class="col-md-6 d-flex align-items-center justify-content-center">
                                <label for="Categorylist">Choose Category:</label>
                                <asp:DropDownList ID="Categorylist" runat="server" AutoPostBack="True"
                                    CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="category_Title"
                                    DataValueField="Category_ID">
                                </asp:DropDownList>
                            </div>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:Group2_bestbuys %>"
                                SelectCommand="SELECT [Category_ID], [category_Title] FROM [Category] ORDER BY [category_Title]">
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <asp:DataList ID="plist" runat="server" DataKeyField="Product_ID" DataSourceID="SqlDataSource2"
                                CssClass="table table-striped">
                                <HeaderTemplate>
                                    <tr>
                                        <th>ID</th>
                                        <th>Product Name</th>
                                        <th>Product Price</th>
                                        <th>Product Quantity</th>
                                    </tr>
                                </HeaderTemplate>
                                <ItemStyle />
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:Label ID="txtProduct_ID" runat="server" Text='<%# Eval("Product_ID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="txtProduct_Name" runat="server" Text='<%# Eval("Product_Name") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="txtProduct_Price" runat="server"
                                                Text='<%# Eval("Product_Price", "{0:C}") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="txtProduct_Quantity" runat="server"
                                                Text='<%# Eval("Product_Quantity") %>' />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <AlternatingItemStyle />
                                <FooterStyle Font-Bold="True" />
                                <HeaderStyle Font-Bold="True" />
                                <SelectedItemStyle Font-Bold="True" />
                            </asp:DataList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                ConnectionString="<%$ ConnectionStrings:Group2_bestbuys %>" SelectCommand="SELECT [Product_ID], [Product_Name], [Product_Price], [Product_Quantity]
                        FROM [Product] WHERE ([Product_Categori] = @Category_ID)
                        ORDER BY [Product_ID]">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Categorylist" Name="Category_ID"
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>


                <div class="container mt-5">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="mb-4 text-center">Category Data</h1>
                            <asp:GridView ID="grdCategories" runat="server" AutoGenerateColumns="False"
                                DataKeyNames="Category_ID" DataSourceID="SqlDataSource3"
                                CssClass="table table-bordered table-condensed table-hover"
                                OnPreRender="grdCategories_PreRender" OnRowDeleted="grdCategories_RowDeleted"
                                OnRowUpdated="grdCategories_RowUpdated" CellPadding="4" ForeColor="#333333"
                                GridLines="None">
                                <Columns>
                                    <asp:BoundField DataField="Category_ID" HeaderText="Category ID" ReadOnly="True">
                                        <ItemStyle CssClass="d-none d-sm-table-cell" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="category_Title" HeaderText="Short Name" SortExpression="category_Title">
                                        <ItemStyle CssClass="col-md-4" />
                                    </asp:BoundField>
                                    <asp:CommandField CausesValidation="False" HeaderText="Edit" ShowEditButton="True">
                                        <ItemStyle CssClass="col-md-2 text-center" />
                                    </asp:CommandField>
                                    <asp:CommandField CausesValidation="False" HeaderText="Delete"
                                        ShowDeleteButton="True">
                                        <ItemStyle CssClass="col-md-2 text-center" />
                                    </asp:CommandField>
                                </Columns>
                                <AlternatingRowStyle CssClass="table-secondary" />
                                <EditRowStyle CssClass="table-warning" />
                                <FooterStyle Font-Bold="True" CssClass="table-info" />
                                <HeaderStyle Font-Bold="True" CssClass="table-striped" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle />
                                <SelectedRowStyle Font-Bold="True" CssClass="table-success" />
                                <SortedAscendingCellStyle CssClass="table-light" />
                                <SortedAscendingHeaderStyle CssClass="table-light" />
                                <SortedDescendingCellStyle CssClass="table-light" />
                                <SortedDescendingHeaderStyle CssClass="table-light" />

                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                ConnectionString="<%$ ConnectionStrings:Group2_bestbuys %>"
                                ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}"
                                SelectCommand="SELECT [Category_ID], [category_Title] 
                        FROM [Category]" DeleteCommand="DELETE FROM [Category] 
                        WHERE [Category_ID] = @original_Category_ID
                          AND [category_Title] = @original_category_Title" InsertCommand="INSERT INTO [Category] 
                        ([Category_ID], [category_Title]) 
                        VALUES (@Category_ID, @category_Title)" UpdateCommand="UPDATE [Category] 
                          SET [category_Title] = @category_Title        
                        WHERE [Category_ID] = @original_Category_ID 
                          AND [category_Title] = @original_category_Title">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_Category_ID"></asp:Parameter>
                                    <asp:Parameter Name="original_category_Title"></asp:Parameter>
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Category_ID" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="category_Title" Type="String"></asp:Parameter>
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="category_Title" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="original_Category_ID"></asp:Parameter>
                                    <asp:Parameter Name="original_category_Title"></asp:Parameter>
                                </UpdateParameters>

                            </asp:SqlDataSource>
                            <div class="col-sm-12">

                                <h3 class="text-center">Add New Category</h3>
                                <p>
                                    <asp:Label ID="lblError" runat="server" EnableViewState="false"
                                        CssClass="text-danger"></asp:Label>
                                </p>
                                    <div class="row mt-1 align-items-center justify-content-center">
                                        <div class="col-md-6 ms-4 d-flex align-items-center justify-content-center">
                                            <label for="txtCategory_ID">ID : </label>
                                            <asp:TextBox ID="txtCategory_ID" runat="server" MaxLength="30"
                                                CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row ms-3 d-flex justify-content-center">
                                        <asp:RequiredFieldValidator ID="rfvID" runat="server" ControlToValidate="txtCategory_ID"
                                            CssClass="text-danger " ErrorMessage="Category's ID is required."
                                            ValidationGroup="ct">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <br />
                                        <div class="row mt-1 align-items-center justify-content-center">
                                            <div class="col-md-6 d-flex me-5 align-items-center justify-content-center">
                                                <label for="txtcategory_Title">Category Title : </label>
                                                <asp:TextBox ID="txtcategory_Title" runat="server" MaxLength="15"
                                                    CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row ms-3 d-flex justify-content-center">
                                            <asp:RequiredFieldValidator ID="rfvcategory_Title" runat="server"
                                                ControlToValidate="txtcategory_Title" CssClass="text-danger"
                                                ValidationGroup="ct" ErrorMessage="Title is required">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                <br />
                                <asp:Button ID="btnAdd" runat="server" Text="Add New Category" ValidationGroup="ct"
                                    CssClass="cat" style="width :30%" OnClick="btnAdd_Click" />
                            </div>
                        </div>
                    </div>
                      </div>
                <br />

                <br />
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <h1 class=" text-centre">Products Data</h1>

                        <asp:GridView ID="grdProducts" runat="server" SelectedIndex="0" AutoGenerateColumns="False"
                            DataKeyNames="Product_ID" DataSourceID="SqlDataSource7" AllowPaging="True"
                            CssClass="table table-bordered table-condensed table-hover"
                            OnPreRender="grdProducts_PreRender" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle CssClass="table-secondary" />
                            <Columns>
                                <asp:BoundField DataField="Product_ID" HeaderText="Product ID" ReadOnly="True">
                                    <ItemStyle CssClass="d-none d-sm-table-cell" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Product_Name" HeaderText="Book Name">
                                    <ItemStyle CssClass="col-md-4" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Product_Categori" HeaderText="Category">
                                    <ItemStyle CssClass="col-md-2 text-center" />
                                </asp:BoundField>
                                <asp:CommandField ButtonType="Link" ShowSelectButton="true">
                                    <ItemStyle CssClass="col-md-2 text-center" />
                                </asp:CommandField>
                            </Columns>

                            <EditRowStyle CssClass="table-warning" />
                                <FooterStyle Font-Bold="True" CssClass="table-info" />
                                <HeaderStyle Font-Bold="True" CssClass="table-striped" />
                                <PagerStyle BackColor="#e0e2e4" HorizontalAlign="Center" />
                                <RowStyle />
                            <SelectedRowStyle Font-Bold="True" CssClass="table-success" />
                                <SortedAscendingCellStyle CssClass="table-light" />
                                <SortedAscendingHeaderStyle CssClass="table-light" />
                                <SortedDescendingCellStyle CssClass="table-light" />
                                <SortedDescendingHeaderStyle CssClass="table-light" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource7" runat="server"
                            ConnectionString="<%$ ConnectionStrings:Group2_bestbuys %>" SelectCommand="SELECT [Product_ID], [Product_Name],[Product_Description], [Product_Categori], 
                        [Product_Price],[Product_Size] [Product_Quantity] FROM [Product] ORDER BY [Product_Name]">
                        </asp:SqlDataSource>
                    </div>

                    <div class="col-sm-12">
                        <asp:DetailsView ID="dvProduct" runat="server" DataSourceID="SqlDataSource8" DataKeyNames="Product_ID"
                            AutoGenerateRows="False" CssClass="table table-bordered table-condensed table-hover"
                            OnItemDeleted="dvProduct_ItemDeleted" OnItemDeleting="dvProduct_ItemDeleting"
                            OnItemInserted="dvProduct_ItemInserted" OnItemUpdated="dvProduct_ItemUpdated"
                            CellPadding="4" ForeColor="#333333" GridLines="None">
                            <EditRowStyle BackColor="#7C6F57" />
                            <FieldHeaderStyle BackColor="#e0e2e4" Font-Bold="True" />
                            <Fields>
                                <asp:TemplateField HeaderText="Product ID">
                                    <EditItemTemplate>
                                        <asp:Label runat="server" ID="lblProduct_ID" Text='<%# Eval("Product_ID") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="col-xs-11 col-insert">
                                            <asp:TextBox runat="server" ID="txtProduct_ID" Text='<%# Bind("Product_ID") %>'
                                                MaxLength="10" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="rfvProduct_ID" runat="server"
                                            ControlToValidate="txtProduct_ID" CssClass="text-danger"
                                            ErrorMessage="ID is a required." Text="*">
                                        </asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblProduct_ID" Text='<%# Bind("Product_ID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="col-xs-4" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Product_Name">
                                    <EditItemTemplate>
                                        <div class="col-xs-11 col-edit">
                                            <asp:TextBox runat="server" ID="txtProduct_Name" Text='<%# Bind("Product_Name") %>'
                                                MaxLength="50" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="rfvProduct_Name" runat="server"
                                            ControlToValidate="txtProduct_Name" CssClass="text-danger"
                                            ErrorMessage="Product Name is a required." Text="*">
                                        </asp:RequiredFieldValidator>
                                    </EditItemTemplate>

                                    <InsertItemTemplate>
                                        <div class="col-xs-11 col-insert">
                                            <asp:TextBox runat="server" ID="txtProduct_Name" Text='<%# Bind("Product_Name") %>'
                                                MaxLength="50" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="rfvProduct_Name" runat="server"
                                            ControlToValidate="txtProduct_Name" CssClass="text-danger"
                                            ErrorMessage="Product_Name is a required." Text="*">
                                        </asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblProduct_Name" Text='<%# Bind("Product_Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Product Description">
                                    <EditItemTemplate>
                                        <div class="col-xs-11 col-edit">
                                            <asp:TextBox runat="server" ID="txtProduct_Description"
                                                Text='<%# Bind("Product_Description") %>' MaxLength="2000" TextMode="MultiLine"
                                                Rows="4" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="rfvProduct_Description" runat="server"
                                            ControlToValidate="txtProduct_Description" CssClass="text-danger"
                                            ErrorMessage="PRODUCT Description is needed." Text="*">
                                        </asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="col-xs-11 col-insert">
                                            <asp:TextBox runat="server" ID="txtProduct_Description"
                                                Text='<%# Bind("Product_Description") %>' MaxLength="2000" TextMode="MultiLine"
                                                Rows="4" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="rfvProduct_Description" runat="server"
                                            ControlToValidate="txtProduct_Description" CssClass="text-danger"
                                            ErrorMessage="PRODUCT Description needed." Text="*">
                                        </asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblProduct_Description"
                                            Text='<%# Bind("Product_Description") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Category">
                                    <EditItemTemplate>
                                        <div class="col-xs-11 col-edit">
                                            <asp:DropDownList runat="server" ID="ddlProduct_Categori"
                                                DataSourceID="SqlDataSource9" DataTextField="Category_ID" DataValueField="Category_ID"
                                                SelectedValue='<%# Bind("Product_Categori") %>' CssClass="form-control">
                                            </asp:DropDownList>
                                        </div>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="col-xs-11 col-insert">
                                            <asp:DropDownList runat="server" ID="ddlProduct_Categori"
                                                DataSourceID="SqlDataSource9" DataTextField="Category_ID" DataValueField="Category_ID"
                                                SelectedValue='<%# Bind("Product_Categori") %>' CssClass="form-control">
                                            </asp:DropDownList>
                                        </div>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblProduct_Categori" Text='<%# Bind("Product_Categori") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Product_Size">
                                    <EditItemTemplate>
                                        <div class="col-xs-11 col-edit">
                                            <asp:TextBox runat="server" ID="txtProduct_Size" Text='<%# Bind("Product_Size") %>'
                                                MaxLength="50" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="rfvProduct_Size" runat="server"
                                            ControlToValidate="txtProduct_Size" CssClass="text-danger"
                                            ErrorMessage="Product Size is a required." Text="*">
                                        </asp:RequiredFieldValidator>
                                    </EditItemTemplate>

                                    <InsertItemTemplate>
                                        <div class="col-xs-11 col-insert">
                                            <asp:TextBox runat="server" ID="txtProduct_Size" Text='<%# Bind("Product_Size") %>'
                                                MaxLength="50" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="rfvProduct_Size" runat="server"
                                            ControlToValidate="txtProduct_Size" CssClass="text-danger"
                                            ErrorMessage="Product_Size is a required." Text="*">
                                        </asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblProduct_Size" Text='<%# Bind("Product_Size") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Image File">
                                    <EditItemTemplate>
                                        <div class="col-xs-11 col-edit">
                                            <asp:TextBox runat="server" ID="txtProduct_Image" Text='<%# Bind("Product_Image") %>'
                                                MaxLength="30" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="col-xs-11 col-insert">
                                            <asp:TextBox runat="server" ID="txtProduct_Image" Text='<%# Bind("Product_Image") %>'
                                                MaxLength="30" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblProduct_Image" Text='<%# Bind("Product_Image") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Product Unit Price">
                                    <EditItemTemplate>
                                        <div class="col-xs-11 col-edit">
                                            <asp:TextBox runat="server" ID="txtProduct_Price" Text='<%# Bind("Product_Price") %>'
                                                CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="rfvProduct_Price" runat="server"
                                            ControlToValidate="txtProduct_Price" CssClass="text-danger"
                                            ErrorMessage=" Price is a required ." Text="*">
                                        </asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="cvProduct_Price" runat="server" ControlToValidate="txtProduct_Price"
                                            Type="Double" Operator="GreaterThan"
                                            ErrorMessage="Price must be a decimal value greater than 0." Text="*"
                                            CssClass="text-danger" ValueToCompare="0.00"></asp:CompareValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="col-xs-11 col-insert">
                                            <asp:TextBox runat="server" ID="txtProduct_Price" Text='<%# Bind("Product_Price") %>'
                                                CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="rfvProduct_Price" runat="server"
                                            ControlToValidate="txtProduct_Price" CssClass="text-danger"
                                            ErrorMessage="Price is a required field." Text="*">
                                        </asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="cvProduct_Price" runat="server" ControlToValidate="txtProduct_Price"
                                            CssClass="text-danger" Type="Currency" Operator="DataTypeCheck"
                                            ErrorMessage="Price must be numeric." Text="*">
                                        </asp:CompareValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblProduct_Price" Text='<%# Bind("Product_Price", "{0:C}") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Quantity">
                                    <EditItemTemplate>
                                        <div class="col-xs-11 col-edit">
                                            <asp:TextBox runat="server" ID="txtProduct_Quantity"
                                                Text='<%# Bind("Product_Quantity") %>' CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="rfvProduct_Quantity" runat="server"
                                            ControlToValidate="txtProduct_Quantity" CssClass="text-danger"
                                            ErrorMessage="Quantity is a requireD." Text="*">
                                        </asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="cvProduct_Quantity" runat="server"
                                            ControlToValidate="txtProduct_Quantity" CssClass="text-danger" Type="Integer"
                                            Operator="DataTypeCheck" ErrorMessage="Quantity must be numeric." Text="*">
                                        </asp:CompareValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="col-xs-6 col-insert">
                                            <asp:TextBox runat="server" ID="txtProduct_Quantity"
                                                Text='<%# Bind("Product_Quantity") %>' CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="rfvProduct_Quantity" runat="server"
                                            ControlToValidate="txtProduct_Quantity" CssClass="text-danger"
                                            ErrorMessage="Quantity is a required field." Text="*">
                                        </asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="cvProduct_Quantity" runat="server"
                                            ControlToValidate="txtProduct_Quantity" CssClass="text-danger" Type="Integer"
                                            Operator="DataTypeCheck" ErrorMessage="Quantity must be numeric." Text="*">
                                        </asp:CompareValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblProduct_Quantity" Text='<%# Bind("Product_Quantity") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ButtonType="Link" ShowDeleteButton="true" ShowEditButton="true"
                                    ShowInsertButton="true" />
                            </Fields>
                            <AlternatingRowStyle CssClass="table-secondary" />
                             <EditRowStyle CssClass="table-warning" />
                                <FooterStyle Font-Bold="True" CssClass="table-info" />
                                <HeaderStyle Font-Bold="True" CssClass="table-striped" />
                                <PagerStyle BackColor="#666666" HorizontalAlign="Center" />
                                <RowStyle />
                            <CommandRowStyle BackColor="#e0e2e4" Font-Bold="True" />
                        </asp:DetailsView>
                        <asp:SqlDataSource ID="SqlDataSource8" runat="server"
                            ConnectionString="<%$ ConnectionStrings:Group2_bestbuys %>"
                            ConflictDetection="CompareAllValues" OldValuesParameterFormatString="org_{0}" SelectCommand="SELECT [Product_ID], [Product_Name], 
                            [Product_Description], [Product_Categori],[Product_Size], [Product_Image], 
                            [Product_Price], [Product_Quantity] 
                       FROM [Product] 
                       WHERE ([Product_ID] = @Product_ID)" DeleteCommand="DELETE FROM [Product] 
                        WHERE [Product_ID] = @org_Product_ID 
                          AND [Product_Name] = @org_Product_Name  
                          AND [Product_Description] = @org_Product_Description 
                          AND [Product_Categori] = @org_Product_Categori 
                          AND [Product_Size] = @org_Product_Size 
                          AND (([Product_Image] = @org_Product_Image) 
                           OR ([Product_Image] IS NULL AND @org_Product_Image IS NULL))
                          AND [Product_Price] = @org_Product_Price                         
                          AND [Product_Quantity] = @org_Product_Quantity" InsertCommand="INSERT INTO [Product] ([Product_ID], [Product_Name], 
                          [Product_Description], [Product_Categori],[Product_Size], 
                          [Product_Image], [Product_Price], [Product_Quantity]) 
                        VALUES (@Product_ID, @Product_Name,@Product_Description, @Product_Categori,@Product_Size, @Product_Image,  
                          @Product_Price, @Product_Quantity)" UpdateCommand="UPDATE [Product] SET [Product_Name] = @Product_Name, 
                          [Product_Description] = @Product_Description, 
                          [Product_Categori] = @Product_Categori, 
                          [Product_Size] = @Product_Size, 
                          [Product_Image] = @Product_Image, 
                          [Product_Price] = @Product_Price, 
                          [Product_Quantity] = @Product_Quantity 
                        WHERE [Product_ID] = @org_Product_ID 
                          AND [Product_Name] = @org_Product_Name 
                          AND [Product_Description] = @org_Product_Description
                          AND [Product_Categori] = @org_Product_Categori 
                          AND [Product_Size] = @org_Product_Size 
                          AND (([Product_Image] = @org_Product_Image) 
                           OR ([Product_Image] IS NULL AND @org_Product_Image IS NULL))
                          AND [Product_Price] = @org_Product_Price 
                          AND [Product_Quantity] = @org_Product_Quantity">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="grdProducts" Name="Product_ID" PropertyName="SelectedValue"
                                    Type="String" />
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="org_Product_ID" Type="String" />
                                <asp:Parameter Name="org_Product_Name" Type="String" />
                                <asp:Parameter Name="org_Product_Description" Type="String" />
                                <asp:Parameter Name="org_Product_Categori" Type="String" />
                                <asp:Parameter Name="org_Product_Size" Type="String" />
                                <asp:Parameter Name="org_Product_Image" Type="String" />
                                <asp:Parameter Name="org_Product_Price" Type="Decimal" />
                                <asp:Parameter Name="org_Product_Quantity" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Product_Name" Type="String" />
                                <asp:Parameter Name="Product_Description" Type="String" />
                                <asp:Parameter Name="Product_Categori" Type="String" />
                                <asp:Parameter Name="Product_Size" Type="String" />
                                <asp:Parameter Name="Product_Image" Type="String" />
                                <asp:Parameter Name="Product_Price" Type="Decimal" />
                                <asp:Parameter Name="Product_Quantity" Type="Int32" />
                                <asp:Parameter Name="org_Product_ID" Type="String" />
                                <asp:Parameter Name="org_Product_Name" Type="String" />
                                <asp:Parameter Name="org_Product_Description" Type="String" />
                                <asp:Parameter Name="org_Product_Categori" Type="String" />
                                <asp:Parameter Name="org_Product_Size" Type="String" />
                                <asp:Parameter Name="org_Product_Image" Type="String" />
                                <asp:Parameter Name="org_Product_Price" Type="Decimal" />
                                <asp:Parameter Name="org_Product_Quantity" Type="Int32" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Product_ID" Type="String" />
                                <asp:Parameter Name="Product_Name" Type="String" />
                                <asp:Parameter Name="Product_Description" Type="String" />
                                <asp:Parameter Name="Product_Categori" Type="String" />
                                <asp:Parameter Name="Product_Size" Type="String" />
                                <asp:Parameter Name="Product_Image" Type="String" />
                                <asp:Parameter Name="Product_Price" Type="Decimal" />
                                <asp:Parameter Name="Product_Quantity" Type="Int32" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource9" runat="server"
                            ConnectionString='<%$ ConnectionStrings:Group2_bestbuys %>' SelectCommand="SELECT [Category_ID],[category_Title] 
                        FROM [Category] ORDER BY [category_Title]">
                        </asp:SqlDataSource>

                        <p>
                            <asp:ValidationSummary ID="ValidationSummary11" runat="server"
                                HeaderText="Please correct errors:" CssClass="text-danger" />
                        </p>
                        <p>
                            <asp:Label ID="Label11" runat="server" EnableViewState="false" CssClass="text-danger">
                            </asp:Label>
                        </p>
                    </div>
                </div>
                    </div>
                  
            </form>
        </main>


    </asp:Content>
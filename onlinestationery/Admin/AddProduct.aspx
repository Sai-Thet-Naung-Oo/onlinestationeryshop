<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Bootstrap.master" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="Admin_AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    


        <div class="col-lg-8 col-lg-offset-2">
        <div class="panel panel-primary " style="margin-top: 50px">
            <div class="panel-heading">
                <asp:Label ID="lblID" runat="server" Text="Add New Product" Style="text-align: center" Font-Size="18px"></asp:Label>


            </div>

            <div class="panel-body" style="text-align: left">

                <asp:Label ID="lblError" runat="server" Font-Size="18px" ForeColor="#CC3300"></asp:Label>
                <br />

                <div class="col-lg-6">


                    <asp:Label ID="labproduct" runat="server" Text="Product Name"></asp:Label>
                    <asp:TextBox placeholder="Product Name" ID="txtProductName" class="form-control" runat="server" autocomplete="Off" MaxLength="21"></asp:TextBox>
                    <br />
                    <asp:Label ID="labcategory" runat="server" Text="Category"></asp:Label>
                    <asp:DropDownList ID="ddlCategoryName" class="form-control" runat="server"></asp:DropDownList>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Brand"></asp:Label>
                    <asp:DropDownList ID="ddlBrandName" class="form-control" runat="server"></asp:DropDownList>



                </div>

                <div class="col-lg-6">

                    <asp:Label ID="Label3" runat="server" Text="Price"></asp:Label>
                    <asp:TextBox placeholder="Price" ID="txtPrice" class="form-control" runat="server" autocomplete="Off" MaxLength="21"></asp:TextBox>
                    <br />

                    <asp:Label ID="Label4" runat="server" Text="Quantity"></asp:Label>
                    <asp:TextBox placeholder="Quantity" ID="txtQuantity" class="form-control" runat="server" autocomplete="Off" MaxLength="21"></asp:TextBox>
                    <br />

                    <asp:Label ID="Label5" runat="server" Text="Image"></asp:Label>
                    <asp:TextBox ID="txtImage" runat="server" autocomplete="Off" Visible="false"></asp:TextBox>
                    <asp:FileUpload ID="FileUploadImage" runat="server" />


                    <br />
                    <asp:Button ID="btnSave" runat="server" Text="Add Product" CssClass="btn btn-success form-control" OnClick="btnSave_Click" />

                </div>
            </div>
        </div>
    </div>



        


   












</asp:Content>


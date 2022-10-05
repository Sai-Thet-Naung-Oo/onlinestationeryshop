<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/navplusphotoshop.master" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="User_ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        .tablehead {
            font-size: 20px;
            text-align: center;
            font-weight: bold;
        }

        .col {
            width: 150px;
            height: 40px;
            text-align: right;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

  <%--  <h2>Shopping cart</h2>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>--%>

    <div class="container-fluid" style="background-color:#eee">

        <div class="row">

            <div class="col-lg-1"></div>

            <div class="col-lg-10">

                <table style="margin-top:50px;margin-bottom:50px;margin-left:70px">
                    <tr>
                        <th style="text-align:center;font-size:20px">Shopping Card
            <asp:TextBox ID="txtLoad" runat="server" Visible="False"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridView1" runat="server"
                                AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px"
                                CellPadding="5" CellSpacing="1" DataKeyNames="ProID" Width="900px"
                                PageSize="6">
                                <Columns>
                                    <asp:BoundField DataField="No" HeaderText="No"></asp:BoundField>
                                    <asp:BoundField DataField="ProID" HeaderText="ProID" Visible="False" />
                                    <asp:BoundField DataField="ProName" HeaderText="Product Name" />
                                    <asp:BoundField DataField="CatName" HeaderText="Category Name" />
                                    <asp:BoundField DataField="BrandName" HeaderText="Brand Name" />
                                    <asp:BoundField DataField="Price" HeaderText="Price" />
                                    <asp:BoundField DataField="Qty" HeaderText="Qty" />

                                    <asp:TemplateField HeaderText="ChangeQty">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtNewQty" runat="server" Text='<%# Bind("Qty") %>'></asp:TextBox>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnContinue" runat="server" Text="Continue"
                                OnClick="btnContinue_Click" CssClass="btn btn-primary" Width="110px" />
                            &nbsp;<asp:Button ID="btnCheckOut" runat="server" Text="Check Out"
                                OnClick="btnCheckOut_Click" CssClass="btn btn-primary" Width="110px" />
                            &nbsp;<asp:Button ID="btnCancleShopping" runat="server" Text="Cancle Shopping"
                                OnClick="btnCancleShopping_Click" CssClass="btn btn-danger"/>
                        </td>
                    </tr>
                </table>


            </div>
            <div class="col-lg-1"></div>
        </div>


    </div>














</asp:Content>


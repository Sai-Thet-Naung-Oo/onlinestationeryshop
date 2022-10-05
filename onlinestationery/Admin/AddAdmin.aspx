<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Bootstrap.master" AutoEventWireup="true" CodeFile="AddAdmin.aspx.cs" Inherits="Admin_AddAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <br /> <br /> <br />
            <asp:Panel ID="pnlpopupEditView" class="panel panel-primary" runat="server" BackColor="White"  Width="300px" DefaultButton="btnSave" HorizontalAlign="Center" >

                <div class="panel-heading">
                    <asp:Label ID="lblID" runat="server" Text="Add New Admin" Font-Size="18px"></asp:Label>


                </div>

                <div class="panel-body" style="text-align: left">

                    <asp:TextBox ID="Adminid" Width="275px" Visible="false" runat="server"></asp:TextBox>
                    <asp:Label ID="lblError" runat="server" Font-Size="18px" ForeColor="#CC3300"></asp:Label>
                    <br />

                    <asp:Label ID="Label1" runat="server" Font-Size="18px" Text="Admin Name"></asp:Label><br />
                    <asp:TextBox ID="txtAdminName"   AutoComplet="false" Width ="275px" runat="server"  class="form-control"  placeholder="Enter Admin Name"></asp:TextBox><br />

                    <asp:Label ID="Label4" runat="server" Font-Size="18px" Text="Password"></asp:Label><br />
                    <asp:TextBox ID="txtPassword" Width="275px" TextMode="Password" runat="server"  class="form-control"  placeholder="Enter Password"></asp:TextBox><br />

                    <asp:Label ID="Label2" runat="server" Font-Size="18px" Text="Confirm Password"></asp:Label><br />
                    <asp:TextBox ID="txtConfirmPassword" Width="275px" TextMode="Password" runat="server"  class="form-control"  placeholder="Enter Confirm Password"></asp:TextBox><br />

                   


                </div>
                <div class="panel-footer">
                    <asp:Button ID="btnSave" class="btn btn-success btn-sm" runat="server" Text="Add" OnClick="btnSave_Click" Width="219px" />
                </div>


            </asp:Panel>


</asp:Content>


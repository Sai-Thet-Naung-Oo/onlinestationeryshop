<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Bootstrap.master" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="Admin_test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
   
      <div>
         <h3> File Upload:</h3>
         <br />

          <asp:FileUpload ID="FileUpload1" runat="server" />
         <br /><br />
         <asp:Button ID="btnsave" runat="server" onclick="btnsave_Click"  Text="Save" style="width:85px" />
         <br /><br />
         <asp:Label ID="lblmessage" runat="server" />
      </div>
      
   


</asp:Content>


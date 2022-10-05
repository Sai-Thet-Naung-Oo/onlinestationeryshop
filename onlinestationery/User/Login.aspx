<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/navplusphotologin.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="User_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link rel="stylesheet" href="../BootStrapFiles/bootswatch.css" type="text/css">
    <link href="../Styles/tooltipsCSS.css" rel="stylesheet" type="text/css" />
    <link href="../BootStrapFiles/bootstrap_cerulean.css" rel="stylesheet" type="text/css" />
    <%-- <link href="../BootStrapFiles/all.min.css" rel="stylesheet" type="text/css" />--%>

    <link href="../Styles/style.css" rel="stylesheet" type="text/css" />

    <style>
        body {
            padding-top: 0px;
            
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="container-fluid" style="background-color:#eee">


       


         <div class="col-lg-4 col-lg-offset-4">
            <div class="panel panel-primary"style="margin-top:50px;margin-bottom:50px">
                <div class="panel-heading">
                    <h3 class="panel-title" style="text-align: center">Customer Log In                 
                    </h3>
                </div>
                <div class="panel-body" >


                  

                     <asp:Label ID="lblError" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="Red"></asp:Label>
                    <br />

                    <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" type="text" class="form-control" placeholder="Enter Email"></asp:TextBox>
                   <br />
                    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                     <asp:TextBox ID="txtPassword" runat="server" class="form-control"
                        placeholder="Enter Password"  TextMode="Password"></asp:TextBox>

                   <br />
  
                    

                </div>
                <div class="panel-footer">
                    <asp:Button ID="btnSubmit" runat="server" Text="Sign in"
                        class="btn btn-primary form-control" OnClick="btnSubmit_Click" />
                </div>

            </div>





        </div>

  

    </div>

   

       


    


</asp:Content>


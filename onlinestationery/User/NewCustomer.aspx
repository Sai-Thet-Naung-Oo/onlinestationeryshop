<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/navplusphoto.master" AutoEventWireup="true" CodeFile="NewCustomer.aspx.cs" Inherits="User_NewCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <link rel="stylesheet" href="../BootStrapFiles/bootswatch.css" type="text/css">
    <link href="../Styles/tooltipsCSS.css" rel="stylesheet" type="text/css" />
    <link href="../BootStrapFiles/bootstrap_cerulean.css" rel="stylesheet" type="text/css" />
   <%-- <link href="../BootStrapFiles/all.min.css" rel="stylesheet" type="text/css" />--%>

   <link href="../Styles/style.css" rel="stylesheet" type="text/css" />

    <style>
        body {
        padding-top:0px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">




    <div class="container-fluid" style="background-color:#eee">

         <div class="col-lg-8 col-lg-offset-2">
        <div class="panel panel-primary " style="margin-top: 50px">
            <div class="panel-heading" style="text-align: center">
                <asp:Label ID="lblID" runat="server" Text="Add New Customer"  Font-Size="18px"></asp:Label>


            </div>

            <div class="panel-body" style="text-align: left">

                <asp:Label ID="lblError" runat="server" Font-Size="18px" ForeColor="#CC3300"></asp:Label>
                <br />

                <div class="col-lg-6">


                    <asp:Label ID="labproduct" runat="server" Text="Customer Name"></asp:Label>
                    <asp:TextBox placeholder="Enter Customer Name" ID="txtCustomerName" class="form-control" runat="server" autocomplete="Off" ></asp:TextBox>
                    <br />

                     <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
                    <asp:TextBox placeholder="Enter Email" ID="txtEmail" class="form-control" runat="server" autocomplete="Off" ></asp:TextBox>
                    <br />

                     <asp:Label ID="Label6" runat="server" Text="Password"></asp:Label>
                    <asp:TextBox placeholder="Enter Password" ID="txtPassword" TextMode="Password"  class="form-control" runat="server" autocomplete="Off" ></asp:TextBox>
                    <br />

                     <asp:Label ID="Label7" runat="server" Text="ConfirmPassword"></asp:Label>
                    <asp:TextBox placeholder="Enter ConfirmPassword" ID="txtConfirmPassword" TextMode="Password"  class="form-control" runat="server" autocomplete="Off" ></asp:TextBox>
                    <br />


                   
                    
                   



                </div>

                <div class="col-lg-6">

                   <asp:Label ID="Label2" runat="server" Text="Phone Number"></asp:Label>
                    <asp:TextBox placeholder="Enter Phone Number" ID="txtPhone" class="form-control" runat="server" autocomplete="Off" ></asp:TextBox>
                    <br />
                     <asp:Label ID="Label3" runat="server" Text="Address"></asp:Label>
                    <asp:TextBox placeholder="Enter Address" ID="txtAddress" class="form-control" runat="server" autocomplete="Off" ></asp:TextBox>
                    <br />

                   
                     
                  

                    <asp:Label ID="labcategory" runat="server" Text="Card Type">
                    </asp:Label>
                    <asp:DropDownList ID="ddlCType" class="form-control" runat="server">
                         <asp:ListItem >-------Select--------</asp:ListItem>
                            <asp:ListItem  >Visa</asp:ListItem>
                    <asp:ListItem >Master</asp:ListItem>
                    </asp:DropDownList>
                     

                    <br />
                   
                   
                    
                     <asp:Label ID="Label4" runat="server" Text="Account Number"></asp:Label>
                    <asp:TextBox placeholder="Enter Account Number" ID="txtANo" class="form-control" runat="server" autocomplete="Off" ></asp:TextBox>
                    <br />
                   


                  
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success form-control" OnClick="btnSave_Click" />

                </div>
            </div>
        </div>
    </div>


    </div>




     







</asp:Content>


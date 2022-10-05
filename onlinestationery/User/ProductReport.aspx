<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/navplusphotodetail.master" AutoEventWireup="true" CodeFile="ProductReport.aspx.cs" Inherits="User_ProductReport" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">


       <header class="header">

                <div class="container">
                    <div class="row">

                        <div class="col-lg-2">
                            <div class="header__logo">
                                <a href="Home.aspx">
                                    <img src="../img/stationero-logo.jpg" alt="" /></a>
                            </div>
                        </div>
                        <div class="col-lg-8" style="padding-left: 100px">
                            <nav class="header__menu">
                                <ul>
                                    <li><a href="Home.aspx">Home</a></li>

                                    <li ><a href="Product.aspx">Shop</a></li>

                                    <li ><a href="NewCustomer.aspx">Register</a></li>
                                    <li class="active"><a href="ProductReport.aspx">ProductList</a></li>
                                    <li><a href="OrderList.aspx">
                                        <asp:ImageButton ID="btnMessage" runat="server" ImageUrl="~/Images/shad.ico" Height="13px" Visible="false" />Order List
                                    </a>
                                    </li>
                                    <%-- <li><a href="#">Pages</a>
                                        <ul class="header__menu__dropdown">
                                            <li><a href="./shop-details.html">Shop Details</a></li>
                                            <li><a href="./shoping-cart.html">Shoping Cart</a></li>

                                        </ul>
                                    </li>--%>
                                </ul>
                            </nav>
                        </div>
                        <div class="col-lg-2">
                            <div class="header__cart">
                                <ul>

                                    <li><a href="ShoppingCart.aspx"><i class="fa fa-shopping-cart fa-2xl" style="font-size: 30px;"></i>
                                       
                                    <asp:Label ID="txtcart" runat="server" Text="0"></asp:Label>
                                          </a>

                                    </li>
                                </ul>
                                <div class="header__top__right__auth">
                                   


                                      <asp:Label ID="showlogin" runat="server" Text="Label" Visible="false">
                                         <a href="Login.aspx" style="font-size: 16px;" visible="false"><i class="fa fa-user" style="font-size: 30px;"></i>Login</a>

                                    </asp:Label>

                                     <asp:Label ID="showlogout" runat="server" Text="Label" Visible="false">
                                         <a href="Logout.aspx" style="font-size: 16px;" visible="false"><i class="fa fa-sign-out" style="font-size: 30px;"></i>Logout</a>

                                    </asp:Label>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="humberger__open">
                        <i class="fa fa-bars"></i>
                    </div>
                </div>
            </header>
            <!-- Header Section End -->



    </asp:Content>





<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


   <center>
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true"  ReportSourceID="CrystalReportSource1" HasRefreshButton="True" ToolPanelView="None" />
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="crptProductReport.rpt">
        </Report>
    </CR:CrystalReportSource>
   </center>
  
</asp:Content>


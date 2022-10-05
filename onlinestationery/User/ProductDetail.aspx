<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/navplusphotodetail.master" AutoEventWireup="true" CodeFile="ProductDetail.aspx.cs" Inherits="User_ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     

    <style>
        .tablehead
{
	font-size:20px;	
	text-align:center;
	font-weight:bold;
}

        .col
{
	width:150px;
	height:40px;
	text-align:right;
}


    </style>

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

                                    <li class="active"><a href="Product.aspx">Shop</a></li>

                                    <li ><a href="NewCustomer.aspx">Register</a></li>
                                    <li><a href="ProductReport.aspx">ProductList</a></li>
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

  


  
    <div class="container-fluid" style="background-color:#eee;">

        <div class="row">

            <div class="col-lg-3"></div>
             <div class="col-lg-8">


                 <table style="color: #000000; border: 1px solid #000000;margin-top:50px;margin-bottom:50px">
        <tr>
            <th colspan="3" class="tablehead">Product Detail</th>
        </tr>
        <tr>
            <td rowspan="4">
                <asp:Image ID="imgProduct" Width="250" Height="250" runat="server"  />
            </td>
            <td class="col">Product Name:</td>
            <td>
                <asp:Label ID="lblProductName" Width="200" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="col">
                Category Name:
            </td>
            <td>
                <asp:Label ID="lblCategoryName" Width="200" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
          <tr>
            <td class="col">
                Brand Name:
            </td>
            <td>
                <asp:Label ID="lblBrandName" Width="200" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="col">Price:</td>
            <td>
                <asp:Label ID="lblPrice" Width="200" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="btnContinue" CssClass="btn btn-primary" runat="server" Text="Continue Shopping" OnClick="btnContinue_Click" />
            </td>
            <td>
                <asp:Button ID="btnAdd" CssClass="btn btn-primary" Width="130" runat="server" Text="Add to Cart" OnClick="btnAdd_Click" />
            </td>
        </tr>

    </table>


             </div>

             <div class="col-lg-3"></div>


        </div>
    </div>
    

        

     



</asp:Content>



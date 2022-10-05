<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/navplusphotodetail.master" AutoEventWireup="true" CodeFile="OrderList.aspx.cs" Inherits="User_OrderList1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="../BootStrapFiles/bootstrap_cerulean.css" rel="stylesheet" type="text/css" />


    <script src="../BootStrapFiles/jquery-1.8.2.js" type="text/javascript"></script>

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
                                    <li ><a href="ProductReport.aspx">ProductList</a></li>
                                    <li class="active"><a href="OrderList.aspx">
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



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="container-fluid" style="background-color: #eee">

        <center>
            <div class="container">
                <div class="row" style="margin-top: 20px">
                    <div class="col-lg-4">
                        <asp:Button ID="btnAll" runat="server" Text=" << All " CssClass="btn btn-primary "
                            OnClick="btnAll_Click" />
                    </div>


                </div>



                <asp:DataList ID="DataList1" runat="server" OnPreRender="DataList1_PreRender"
                    Width="800px">
                    <ItemTemplate>

                        <div class="panel panel-info" style="margin-top: 20px">
                            <div class="panel-heading">
                            </div>
                            <div class="panel-body" style="Font-Size: 18px">




                                <div class="row">
                                    <div class="col-lg-6">

                                        <div class="row">

                                            <div class="col-lg-5">Order Date</div>
                                            <div class="col-lg-7">
                                                :    
                                        <asp:Label ID="lblNo" runat="server" Text='<%# Eval("OrderDate") %>'></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row">

                                            <div class="col-lg-5">Total</div>

                                            <div class="col-lg-7">
                                                :   
                                                <asp:Label ID="lblCustName" runat="server" Text='<%# Eval("Total") %>'> </asp:Label>
                                            </div>
                                        </div>


                                    </div>

                                    <div class="col-lg-6">
                                        <div class="row">

                                            <div class="col-lg-5">Shipping Address</div>

                                            <div class="col-lg-7">
                                                :   
                                                <asp:Label ID="lblOrderDate" runat="server" Text='<%# Eval("ShippingAdd") %>'></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row">

                                            <div class="col-lg-5">Status</div>

                                            <div class="col-lg-7">
                                                : 
                                                <asp:Label ID="lblShippingAdd" runat="server" Text='<%# Eval("DeliverStatus") %>'></asp:Label>
                                            </div>
                                        </div>



                                    </div>

                                </div>



                                <asp:Panel ID="Panel1" runat="server">

                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" class="table table-striped" Font-Size="18px"
                                        CellPadding="5" CellSpacing="1" Width="800">
                                        <Columns>
                                            <asp:BoundField DataField="No" HeaderText="No" />
                                            <asp:BoundField DataField="ProName" HeaderText="Product Name" />
                                            <asp:BoundField DataField="CatName" HeaderText="Category Name" />
                                            <asp:BoundField DataField="BrandName" HeaderText="Brand Name" />
                                            <asp:BoundField DataField="UnitPrice" HeaderText="Price" />
                                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                        </Columns>
                                    </asp:GridView>

                                </asp:Panel>
                            </div>
                        </div>



                    </ItemTemplate>
                </asp:DataList>


            </div>

        </center>

    </div>





</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/UsermasterOnlynav.master" AutoEventWireup="true" CodeFile="ProductByBrand.aspx.cs" Inherits="User_ProductByBrand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


    <link rel="stylesheet" href="../BootStrapFiles/bootswatch.css" type="text/css">
    <link href="../Styles/tooltipsCSS.css" rel="stylesheet" type="text/css" />
    <%-- <link href="../BootStrapFiles/bootstrap_cerulean.css" rel="stylesheet" type="text/css" />--%>
    <%-- <link href="../BootStrapFiles/all.min.css" rel="stylesheet" type="text/css" />--%>

    <link href="../Styles/style.css" rel="stylesheet" type="text/css" />


    <style type="text/css">
        .lista > li:hover {
            background-color: aquamarine;
        }

        .sidebar__item ul li:hover {
            background-color: aquamarine;
        }

        .style1 {
            width: 100%;
        }

        .style2 {
            width: 102px;
        }

        body {
            padding-top: 0px;
        }
    </style>



</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

     <!-- Hero Section Begin -->
            <section class="hero hero-normal">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="hero__categories">
                                <div class="hero__categories__all">
                                    <i class="fa fa-bars"></i>
                                    <span>Search By</span>
                                </div>
                                <ul class="lista">
                                    <li><a href="../User/Product.aspx">Category</a></li>
                                    <li><a href="../User/ProductByBrand.aspx">Brand</a></li>

                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <div class="hero__search">
                                <div class="hero__search__form" style="height: 40px">

                                    <div class="input-group mb-3">
                                       <asp:TextBox ID="txtSearch" class="form-control" placeholder="Enter Product Name" runat="server" autocomplete="Off"></asp:TextBox>
                                        <div class="input-group-append">
                                           <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" Text="SEARCH"  OnClick="btnSearch_Click" />
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Hero Section End -->


</asp:Content>






<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <section class="product spad" style="BACKGROUND-COLOR: #EEE">
        <div class="container">
            <div class="row">
                <div class="col-lg-2 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>Brand</h4>


                            <ul>




                                <asp:DataList ID="CatNameList" runat="server" DataKeyField="BrandID" OnSelectedIndexChanged="CatNameList_SelectedIndexChanged">


                                    <ItemTemplate>



                                        <li>

                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/favs.png" />
                                            <asp:LinkButton ID="btnCategoryName" CommandName="Select" runat="server" Text='<%# Eval("BrandName") %>' class="list" Style="display: inline;"> LinkButton</asp:LinkButton>
                                        </li>




                                    </ItemTemplate>


                                </asp:DataList>




                            </ul>

                        </div>


                    </div>
                </div>

                <div class="col-lg-10 col-md-7">



                    <asp:DataList ID="Productlist" runat="server" DataKeyField="ProID" Font-Names="Verdana" CellPadding="5" CellSpacing="3" RepeatColumns="4" RepeatDirection="Horizontal" OnSelectedIndexChanged="Productlist_SelectedIndexChanged">
                        <ItemStyle ForeColor="Black" />
                        <ItemTemplate>
                            <div id="pricePlans">
                                <ul id="plans">
                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Select" OnClick="LinkToDetail">

                                        <li class="plan" style="width: 220px;">
                                            <ul class="planContainer">
                                                <li class="title">
                                                    <asp:Label ID="LblID" Visible="false" runat="server" Text='<%# Eval("ProID")  %>'></asp:Label>
                                                    <asp:Label ID="LblCode" Visible="false" runat="server" Text='<%# Eval("ProID")  %>'></asp:Label>
                                                    <asp:Label ID="LblItemName" Visible="false" runat="server" Text='<%# Eval("ProID")  %>'></asp:Label>
                                                    <asp:Label ID="LblQty" Visible="false" runat="server" Text='<%# Eval("ProID")  %>'></asp:Label>

                                                    <asp:Label ID="LblPrice" Visible="false" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                                    <asp:Label ID="LblDisc" Visible="false" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                                    <asp:Label ID="LblTotal" Visible="false" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                                    <br />
                                                </li>
                                                <li class="title">
                                                    <asp:Image ID="imgPhoto" class="img-circle" runat="server" Width="170px" Height="150px" ImageUrl='<%# Eval("Image")%>' />
                                                </li>
                                                <li class="title">

                                                    <h4>
                                                        <asp:Label ID="lblitemNametop" Font-Size="18px" runat="server" Text='<%# Bind("ProName") %>'></asp:Label></h4>
                                                </li>
                                                <li>
                                                    <ul class="options">
                                                        <li><span>Price:
                                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                                                            (<asp:Label ID="Label8" ForeColor="Black" Font-Size="14px" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>)</span>  </li>
                                                    </ul>
                                                </li>


                                                <asp:LinkButton ID="LinkAddtoCart" runat="server" class="btn btn-primary" CommandName="Select" OnClick="LinkAddToCart"> <i class="fa fa-plus "></i> Add To Cart</asp:LinkButton>

                                            </ul>

                                            <br />
                                        </li>


                                    </asp:LinkButton>




                                </ul>
                            </div>

                        </ItemTemplate>
                    </asp:DataList>



                </div>
            </div>
        </div>
    </section>



</asp:Content>


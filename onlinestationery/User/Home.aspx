<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/UserMasterNavwithHero.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="User_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style  type="text/css">

        ul.lista li:hover {
            background-color: aquamarine;
        }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



     


    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All Categories</span>
                        </div>


                        <ul class="lista">

                            <asp:DataList ID="CatNameList" runat="server" DataKeyField="CatID" OnSelectedIndexChanged="CatNameList_SelectedIndexChanged">


                                <ItemTemplate>



                                    <li >
                                          <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/favs.png" />
                                       
                                        <asp:LinkButton ID="btnCategoryName" CommandName="Select" runat="server" Text='<%# Eval("CatName") %>' class="list" Style="display: inline;"> LinkButton</asp:LinkButton>
                                    </li>




                                </ItemTemplate>


                            </asp:DataList>



                        </ul>






                        <%--  <ul>
                                <li><a href="#">Fresh Meat</a></li>
                                <li><a href="#">Vegetables</a></li>
                                <li><a href="#">Fruit & Nut Gifts</a></li>
                                <li><a href="#">Fresh Berries</a></li>
                                <li><a href="#">Ocean Foods</a></li>
                                <li><a href="#">Butter & Eggs</a></li>
                                <li><a href="#">Fastfood</a></li>
                                <li><a href="#">Fresh Onion</a></li>
                                <li><a href="#">Papayaya & Crisps</a></li>
                               
                            </ul>--%>
                    </div>
                </div>
                <div class="col-lg-9">

                    <div class="hero__item set-bg" data-setbg="../img/a.jpg">
                        <div class="hero__text">

                            <h2 style="color: white;">Online
                                    <br />
                                Stationery Shop</h2>
                            <p style="color: #000000;">Free Pickup and Delivery Available</p>
                            <a href="Product.aspx" class="primary-btn">SHOP NOW</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>


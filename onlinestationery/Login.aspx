<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <link href="css/elegant-icons.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/nice-select.css" rel="stylesheet" type="text/css" />
    <link href="css/owl.carousel.min.css" rel="stylesheet" type="text/css" />
    <link href="css/slicknav.min.css" rel="stylesheet" type="text/css" />

       <link href="BootStrapFiles/bootstrap_cerulean.css" rel="stylesheet" type="text/css" />
  

    <script src="../BootStrapFiles/jquery-1.8.2.js" type="text/javascript"></script>

       <link href="css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
    <div>



        
            <header class="header">

                <div class="container">
                    <div class="row">

                        <div class="col-lg-2">
                            <div class="header__logo">
                                <a href="Login.aspx">
                                    <img src="img/stationero-logo.jpg" alt="" /></a>
                            </div>
                        </div>
                        <div class="col-lg-8" style="padding-left: 100px">
                            <nav class="header__menu">
                                <ul>
                                    <li><a href="User/Home.aspx">Home</a></li>

                                    <li class="active"><a href="Login.aspx">Admin Login</a></li>

                                 
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
                               
                               
                            </div>
                        </div>

                    </div>
                    <div class="humberger__open">
                        <i class="fa fa-bars"></i>
                    </div>
                </div>
            </header>
            <!-- Header Section End -->

            <section class="breadcrumb-section set-bg" data-setbg="img/resizestation.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-left">
                            <div class="breadcrumb__text">
                                <h2>Online Stationery Shop</h2>
                                <div class="breadcrumb__option">
                                    <a href="User/Home.aspx">Home</a>
                                 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Breadcrumb Section End -->



       


              <div class="container-fluid" style="background-color:#eee">


       <center>

             <div class="col-lg-4 col-lg-offset-4">
            <div class="panel panel-primary"style="margin-top:50px;margin-bottom:50px">
                <div class="panel-heading">
                    <h3 class="panel-title" style="text-align: center">Admin Log In                 
                    </h3>
                </div>
                <div class="panel-body" style="text-align: left" >


                  

                     <asp:Label ID="lblError" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="Red"></asp:Label>
                    <br />

                    <asp:Label ID="Label1" runat="server" Text="Admin Name"  ></asp:Label>
                    <asp:TextBox ID="txtAdminName" runat="server" type="text" class="form-control" placeholder="Enter Admin Name"></asp:TextBox>
                   <br />
                    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                     <asp:TextBox ID="txtPassword" runat="server" class="form-control"
                        placeholder="Enter Password"  TextMode="Password"></asp:TextBox>

                   <br />
  
                    

                </div>
                <div class="panel-footer">
                    <asp:Button ID="btnSubmit" runat="server" Text="Log in"
                        class="btn btn-primary form-control" OnClick="btnSubmit_Click" />
                </div>

            </div>





        </div>

       </center>


       

  

    </div>





      









           <footer class="footer" style="padding-top: 0px; margin-top: 0px">
                <div class="container">

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="footer__copyright">
                                <div class="footer__copyright__text">
                                    <p>
                                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                        Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                                        All rights reserved | Copy Design from internet <i class="fa fa-heart" aria-hidden="true"></i>by Sai Thet Naung Oo
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                    </p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </footer>
    
    </div>
    </form>






        <script src="../BootStrapFiles/jquery-1.js"></script>
    <script src="../BootStrapFiles/bootstrap.js"></script>
    <script src="../BootStrapFiles/bootswatch.js"></script>
    <script type="text/javascript">
        /* <![CDATA[ */
        (function () { try { var s, a, i, j, r, c, l = document.getElementsByTagName("a"), t = document.createElement("textarea"); for (i = 0; l.length - i; i++) { try { a = l[i].getAttribute("href"); if (a && "www.cloudflare.com/email-protection" == a.substr(7, 35)) { s = ''; j = 43; r = parseInt(a.substr(j, 2), 16); for (j += 2; a.length - j && a.substr(j, 1) != 'X'; j += 2) { c = parseInt(a.substr(j, 2), 16) ^ r; s += String.fromCharCode(c); } j += 1; s += a.substr(j, a.length - j); t.innerHTML = s.replace(/</g, "&lt;").replace(/>/g, "&gt;"); l[i].setAttribute("href", "mailto:" + t.value); } } catch (e) { } } } catch (e) { } })();
        /* ]]> */
    </script>
    <script>       $("div.navbar-fixed-top").autoHidingNavbar();</script>





    <script src="../js/jquery-3.3.1.min.js" type="text/javascript"></script>

    <script src="../js/jquery-ui.min.js" type="text/javascript"></script>

    <script src="../js/jquery.nice-select.min.js" type="text/javascript"></script>

    <script src="../js/jquery.slicknav.js" type="text/javascript"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../js/mixitup.min.js"></script>
    <script src="../js/owl.carousel.min.js" type="text/javascript"></script>


    <script src="../js/main.js" type="text/javascript"></script>



</body>
</html>

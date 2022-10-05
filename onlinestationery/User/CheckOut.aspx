<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/navplusphoto.master" AutoEventWireup="true" CodeFile="CheckOut.aspx.cs" Inherits="User_CheckOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="../BootStrapFiles/bootswatch.css" type="text/css">
    <link href="../Styles/tooltipsCSS.css" rel="stylesheet" type="text/css" />
    <link href="../BootStrapFiles/bootstrap_cerulean.css" rel="stylesheet" type="text/css" />
    <%-- <link href="../BootStrapFiles/all.min.css" rel="stylesheet" type="text/css" />--%>

    <link href="../Styles/style.css" rel="stylesheet" type="text/css" />


    <style>

        body {
       
            padding-top:0px;
             }

        .GridItemright {
        text-align:right;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-fluid" style="background-color: #eee">


        <div class="container">


            <h2 style="text-align: center">Check Out</h2>
            <div class="row" style="color: #000000; border: 1px solid #000000">



                <div class="col-lg-8 " style="margin-top: 10px; margin-bottom: 10px">

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        DataKeyNames="ProID" Width="760px" Font-Size="Large" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="No" HeaderText="No"></asp:BoundField>
                            <asp:BoundField DataField="ProID" HeaderText="ProID" Visible="False" />
                            <asp:BoundField DataField="ProName" HeaderText="Product Name" />
                            <asp:BoundField DataField="CatName" HeaderText="Category Name" />
                            <asp:BoundField DataField="BrandName" HeaderText="Brand Name" />
                            <asp:BoundField DataField="Price" HeaderText="Price" HeaderStyle-CssClass="GridItemright" >
                          

                            <HeaderStyle HorizontalAlign="Center"  />
                            <ItemStyle HorizontalAlign="Right" />
                          

                            </asp:BoundField>
                            <asp:BoundField DataField="Qty" HeaderText="Qty"  HeaderStyle-CssClass="GridItemright" >
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>

                    <br />

                      <div class="row">
                        <div class="col-lg-6"></div>
                          <div class="col-lg-6">
                                  
                              <div class="row">
                                  <div class="col-lg-6">
                                     
                           <h4 style="text-align:right;margin-top:5px;color:black;">Deliver Fee:</h4>
                                  </div>
                                  <div class="col-lg-6">
                                       <asp:TextBox ID="txtdeliverfee" runat="server" type="text" class="form-control" Enabled="False" style="text-align:right" text="0" ></asp:TextBox>
                                  </div>

                              </div>

                          </div>
                    </div>
                   <div class="row">
                        <div class="col-lg-6"></div>
                          <div class="col-lg-6">
                                  
                              <div class="row">
                                  <div class="col-lg-6">
                                     
                           <h4 style="text-align:right;margin-top:5px;color:black;">Total:</h4>
                                  </div>
                                  <div class="col-lg-6">
                                       <asp:TextBox ID="txttotal" runat="server" type="text" class="form-control" Enabled="False" style="text-align:right"></asp:TextBox>
                                  </div>

                              </div>

                          </div>
                    </div>

                </div>


                <div class="col-lg-4">

                    <div class="panel panel-primary" style="margin-top: 10px; margin-bottom: 10px">
                        <div class="panel-heading">
                            <h3 class="panel-title" style="text-align: center">Customer Information                 
                            </h3>
                        </div>
                        <div class="panel-body">




                            <asp:Label ID="lblError" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="Red"></asp:Label>
                            <br />

                            <asp:Label ID="Label1" runat="server" Text="Customer Name"></asp:Label>
                            <asp:TextBox ID="txtCustomerName" runat="server" type="text" CssClass="form-control"  Enabled="False" ></asp:TextBox>
                            <br />
                            <asp:Label ID="Label2" runat="server" Text="Card Name"></asp:Label>
                            <asp:TextBox ID="txtCardType" runat="server" CssClass="form-control" 
                                Enabled="False" ></asp:TextBox>

                            <br />

                            <asp:Label ID="Label4" runat="server" Text="Account Number"></asp:Label>
                            <asp:TextBox ID="txtAccountNo" runat="server" type="text" CssClass="form-control"  Enabled="False" ></asp:TextBox>
                            <br />

                            <asp:Label ID="Label3" runat="server" Text="Shipped Address"></asp:Label>
                            <asp:TextBox ID="txtShipAdd" runat="server" type="text" CssClass="form-control"  TextMode="MultiLine"></asp:TextBox>
                            <br />
                            

                            <asp:Label ID="labcategory" runat="server" Text="Deliver Township"> </asp:Label>
                            <asp:DropDownList ID="ddltownship" class="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddltownship_SelectedIndexChanged">
                           


                                 </asp:DropDownList>


                            <br />


                        </div>
                        <div class="panel-footer">
                            <div class="row">
                                <div class="col-lg-6">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Confirm"
                                        class="btn btn-primary form-control" OnClick="btnSubmit_Click" />
                                </div>
                                <div class="col-lg-6">
                                    <asp:Button ID="Button1" runat="server" Text="Cancel Shopping"
                                        class="btn btn-danger form-control" OnClick="Button1_Click" />
                                </div>


                            </div>
                        </div>

                    </div>


                </div>




            </div>


        </div>

    </div>






</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Bootstrap.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Admin_Product" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="atk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">





    <asp:MultiView ID="MultiView1" runat="server">



        <asp:View ID="View1" runat="server">

            <div class="col-lg-10 col-lg-offset-1">
                <div class="well well-sm">
                    <asp:Button ID="btnAdduser" CssClass="btn btn-warning btn-sm" runat="server" Text="Add Product" PostBackUrl="~/Admin/AddProduct.aspx" />
                    <asp:Button ID="Button1" CssClass="btn btn-warning btn-sm" runat="server" Text="Print" OnClick="btnPrint_Click" />
                </div>

                <div class="panel panel-info">
                    <div class="panel-heading" style="font-size:20px"><span class="glyphicon glyphicon-list"></span> Product list </div>
                    <div class="panel-body">
                        <asp:Label ID="lbtotalRow" runat="server" Text="------"></asp:Label>

                        <div class="input-group">
                          <span class="input-group-addon">Search By</span>
                         
                            <div class="col-sm-6" style="padding-left:0px" >
                                 
                                  <asp:DropDownList ID="ddlSearchType"  class="form-control" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" >
                                      <asp:ListItem>ProductName</asp:ListItem>
                                      <asp:ListItem>CategoryName</asp:ListItem>
                                      <asp:ListItem>BrandName</asp:ListItem>
                                      <asp:ListItem>Price</asp:ListItem>
                                      <asp:ListItem>Quantity</asp:ListItem>
                                  </asp:DropDownList>
                            </div>

                            <div class="col-sm-6" style="padding-left:0px"  >

                                 <asp:TextBox ID="txtSearch" class="form-control" placeholder="Type here..." runat="server" autocomplete="Off" OnTextChanged="txtSearch_TextChanged" AutoPostBack="true"></asp:TextBox>
                            </div>

                              
                               
                                
                            
                           

                           

                        </div>
                        <%-- class="table table-bordered table-striped table-hover table-heading table-datatable"--%>
                        <asp:Label ID="lblNoRecords" runat="server" Text="Label" Visible="false"></asp:Label>
                        <asp:Label ID="error" runat="server" Font-Size="18px" ForeColor="#CC3300"></asp:Label>
                        <br />


                        <asp:Panel ID="Panel1" runat="server" >
                            <asp:GridView ID="grdVcustomersList" runat="server" data-search="true" class="table table-striped" Font-Size="18px" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%">
                                <Columns>
                                    <asp:BoundField DataField="No" HeaderText="No" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="ProID" HeaderText="ProID" Visible="false" />


                                    <asp:BoundField DataField="ProName" HeaderText="Product Name" HeaderStyle-HorizontalAlign="Center">

                                        <HeaderStyle HorizontalAlign="Center" />

                                    </asp:BoundField>

                                    <asp:BoundField DataField="CatName" HeaderText="Category Name" />
                                    <asp:BoundField DataField="BrandName" HeaderText="Brand Name" />
                                    <asp:BoundField DataField="Price" HeaderText="Price" >
                                    <ItemStyle HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" >



                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>



                                    <asp:TemplateField HeaderText="Image">

                                        <ItemTemplate>
                                            <asp:Image ID="imgProduct" runat="server" ImageUrl='<%#Bind ("Image") %>' Width="50" Height="50" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <%--   <button type="button" id="btnEdit" runat="server" class="btn btn-primary btn-sm "  commandname="Select" ><i class="glyphicon glyphicon-edit"></i>Edit</button>--%>


                                            <asp:LinkButton ID="btnEdit" runat="server" class="btn btn-primary btn-sm" CommandName="Select" OnClick="LinkEdit_Click"> <i class="glyphicon glyphicon-edit"></i>Edit</asp:LinkButton>
                                            |   

                                   <%--  <button type="button" id="LinkbanCustomer" runat="server" class="btn btn-danger btn-sm " onserverclick="LinkDeleteAdmin"><i class="glyphicon glyphicon-trash"></i>Delete</button>--%>
                                            <%-- <asp:LinkButton ID="LinkbanCustomer" runat="server" ForeColor="Red" Font-Size="15px" OnClick="LinkbanCustomer_Click" ToolTip="Ban or Inactive Customer" class="glyphicon glyphicon-ban-circle" />--%>
                                            <asp:LinkButton ID="LinkbanCustomer" runat="server" class="btn btn-danger btn-sm" CommandName="Select" OnClick="LinkDeleteProduct"> <i class="glyphicon glyphicon-trash"></i>Delete</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:GridView>
                        </asp:Panel>
                    </div>
                </div>

            </div>



        </asp:View>





        <asp:View ID="View2" runat="server">

          
            <asp:Panel ID="pnlpopupEditView"  runat="server" BackColor="White"  DefaultButton="btnSave">


                <div class="col-lg-8 col-lg-offset-2">
                    <div class="panel panel-primary " style="margin-top: 50px">
                        <div class="panel-heading">
                            <asp:Label ID="lblID" runat="server" Text="Edit Product" Style="text-align: center" Font-Size="18px"></asp:Label>


                        </div>

                        <div class="panel-body" style="text-align: left">
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                            <asp:TextBox ID="Productid" Width="275px" Visible="false" runat="server"></asp:TextBox>
                         



                            <asp:Label ID="lblError" runat="server" Font-Size="18px" ForeColor="#CC3300"></asp:Label>
                            <br />

                            <div class="col-lg-6">


                                <asp:Label ID="labproduct" runat="server" Text="Product Name"></asp:Label>
                                <asp:TextBox placeholder="Product Name" ID="txtProductName" class="form-control" runat="server" autocomplete="Off" MaxLength="21"></asp:TextBox>
                                <br />
                                <asp:Label ID="labcategory" runat="server" Text="Category"></asp:Label>
                                <asp:DropDownList ID="ddlCategoryName" class="form-control" runat="server"></asp:DropDownList>
                                <br />
                                <asp:Label ID="Label2" runat="server" Text="Brand"></asp:Label>
                                <asp:DropDownList ID="ddlBrandName" class="form-control" runat="server"></asp:DropDownList>



                            </div>

                            <div class="col-lg-6">

                                <asp:Label ID="Label3" runat="server" Text="Price"></asp:Label>
                                <asp:TextBox placeholder="Price" ID="txtPrice" class="form-control" runat="server" autocomplete="Off" MaxLength="21"></asp:TextBox>
                                <br />

                                <asp:Label ID="Label4" runat="server" Text="Quantity"></asp:Label>
                                <asp:TextBox placeholder="Quantity" ID="txtQuantity" class="form-control" runat="server" autocomplete="Off" MaxLength="21"></asp:TextBox>
                                <br />

                                <asp:Label ID="Label5" runat="server" Text="Image"></asp:Label>
                                <asp:TextBox ID="txtImage" runat="server" autocomplete="Off" Visible="false"></asp:TextBox>
                                <asp:FileUpload ID="FileUploadImage" runat="server" />


                              
                              

                            </div>
                        </div>
                        <div class="panel-footer">
                            <asp:Button ID="btnSave" class="btn btn-success " runat="server" Text="Save" OnClick="btnSave_Click" />
                            <asp:Button ID="btnClose" class="btn btn-danger " runat="server" Text="Close" OnClick="btnClose_Click" />
                        </div>



                    </div>
                </div>




            </asp:Panel>



        </asp:View>




    </asp:MultiView>





    <%--<<<<<<<<<<<<<<<<<<<<<END --------------- Edit   Popup -------------- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>--%>

    <asp:Button ID="btnShowPopupInAct" runat="server" Style="display: none" />
    <atk:ModalPopupExtender ID="ModalPopupInactive" runat="server" TargetControlID="btnShowPopupInAct"
        PopupControlID="pnlpopupInactive" CancelControlID="btnCloseInactive" BackgroundCssClass="modalBackground">
    </atk:ModalPopupExtender>

    <asp:Panel ID="pnlpopupInactive" class="panel panel-primary" runat="server" BackColor="White" Style="display: none" Width="300px" DefaultButton="btnInactive">
        <asp:Label ID="lblProductID" runat="server" Text="0"></asp:Label>. 
    <asp:Label ID="lblProductName" runat="server" Text="0"></asp:Label>
        <hr />
        <asp:Label ID="Label7" runat="server" class="label label-info" Text="Do you want to Delete this user ???"></asp:Label>
        <br />
        <br />
        <div class="panel-footer">
            <asp:Button ID="btnInactive" class="btn btn-success btn-sm" runat="server" Text="Yes" OnClick="DeleteProduct" />
            <asp:Button ID="btnCloseInactive" class="btn btn-danger btn-sm" runat="server" Text="No" />
        </div>
    </asp:Panel>











</asp:Content>


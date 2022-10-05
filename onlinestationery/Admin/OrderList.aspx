<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Bootstrap.master" AutoEventWireup="true" CodeFile="OrderList.aspx.cs" Inherits="Admin_OrderList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">

        <div class="row" style="margin-top: 20px">
            <div class="col-lg-2"></div>
            <div class="col-lg-7">
                <div class="row">
                    <div class="col-lg-3">
                        <h4>Search Type :</h4>
                    </div>
                    <div class="col-lg-4">
                        <asp:DropDownList ID="ddlSearchType" runat="server" AutoPostBack="True"
                            OnSelectedIndexChanged="ddlSearchType_SelectedIndexChanged" class="form-control">
                            <asp:ListItem>OrderDate</asp:ListItem>
                            <asp:ListItem>CustomerName</asp:ListItem>
                            <asp:ListItem>ShippAddress</asp:ListItem>
                            <asp:ListItem>Total</asp:ListItem>
                            <asp:ListItem>Status</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-lg-4">
                        <asp:TextBox ID="txtOrderDate" autocomplete="off" runat="server"
                            OnTextChanged="txtOrderDate_TextChanged" AutoPostBack="True" class="form-control"></asp:TextBox>

                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtOrderDate" Format="dd/MM/yyyy" />


                        <asp:TextBox ID="txtSearchData" autocomplete="off" runat="server" class="form-control"
                            Visible="False" AutoPostBack="True"
                            OnTextChanged="txtSearchData_TextChanged"></asp:TextBox>

                    </div>
                    <div class="col-lg-1">
                        <asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="btn btn-primary"
                            OnClick="btnPrint_Click" />
                    </div>

                </div>
            </div>
            <div class="col-lg-2"></div>
        </div>


















        <asp:DataList ID="DataList1" runat="server" OnPreRender="DataList1_PreRender"
            Width="800px" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
            <ItemTemplate>

                <div class="panel panel-info" style="margin-top: 20px">
                    <div class="panel-heading">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("No") %>'></asp:Label>
                    </div>
                    <div class="panel-body" style="Font-Size: 18px">




                        <div class="row">
                            <div class="col-lg-6">

                                <div class="row">
                                   
                                    <div class="col-lg-5">NO</div>
                                    <div class="col-lg-7">
                                        :    
                                        <asp:Label ID="lblNo" runat="server" Text='<%# Eval("No") %>'></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                
                                    <div class="col-lg-5">Customer Name</div>

                                    <div class="col-lg-7">
                                        :    <asp:Label ID="lblCustName" runat="server" Text='<%# Eval("CustName") %>'> </asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                               
                                    <div class="col-lg-5">Total</div>


                                    <div class="col-lg-7">
                                        :      <asp:Label ID="lblTotal" runat="server" Text='<%# Eval("Total") %>'></asp:Label>
                                    </div>
                                </div>

                            </div>

                            <div class="col-lg-6">
                                <div class="row">
                                    
                                    <div class="col-lg-5">Order Date</div>

                                    <div class="col-lg-7">
                                       :    <asp:Label ID="lblOrderDate" runat="server" Text='<%# Eval("OrderDate") %>'></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                  
                                    <div class="col-lg-5">Shipping Address</div>

                                    <div class="col-lg-7">
                                         :  <asp:Label ID="lblShippingAdd" runat="server" Text='<%# Eval("ShippingAdd") %>'></asp:Label></div>
                                </div>
                                <div class="row">
                                 
                                    <div class="col-lg-5">Status</div>

                                    <div class="col-lg-7">
                                         :  <asp:Label ID="lblDeliverStatus" runat="server" Text='<%# Eval("DeliverStatus") %>'></asp:Label>
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




</asp:Content>


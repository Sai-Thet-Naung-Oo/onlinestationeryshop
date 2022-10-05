<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Bootstrap.master" AutoEventWireup="true" CodeFile="Deliver.aspx.cs" Inherits="Admin_Deliver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <div class="container-fluid">

        <div class="row">

            <div class="col-lg-1"></div>
            <div class="col-lg-10">

                <div class="panel panel-info" style="margin-top: 40px">
                    <div class="panel-heading" style="font-size:20px"><span class="glyphicon glyphicon-list"></span> Deliver Status</div>

                    <div class="panel-body">

                        <div class="row" style="margin-bottom:10px">
                            <div class="col-lg-4">
                                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>


                            </div>
                            <div class="col-lg-8">
                                <div class="row">
                                    <div class="col-lg-2">
                                        <asp:TextBox ID="txtOrderID" runat="server" Visible="False"></asp:TextBox>

                                        <asp:RadioButton ID="rdoDel" runat="server" Text="Deliver" style="font-size:15px" GroupName="OrderStatus" />
                                    </div>
                                    <div class="col-lg-3">
                                        <asp:RadioButton ID="rdoCCE" runat="server" GroupName="OrderStatus" style="font-size:15px"  Text="Credit Card Error" />
                                    </div>
                                    <div class="col-lg-3">
                                        <asp:RadioButton ID="rdoNEQ" runat="server" Text="Not Enough Qty" style="font-size:15px"  GroupName="OrderStatus" />
                                    </div>
                                    <div class="col-lg-3">
                                        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary btn-sm" style="width:100px"
                                            OnClick="btnUpdate_Click" />

                                    </div>

                                </div>








                            </div>

                        </div>







                        <asp:Panel ID="Panel1" runat="server" ScrollBars="Vertical" Height="380px">

                            <asp:GridView ID="GridView1" runat="server" CellPadding="5" class="table table-striped" Font-Size="18px"
                                CellSpacing="1" Width="900px" AutoGenerateColumns="False"
                                DataKeyNames="OrderID"
                                OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField DataField="No" HeaderText="No" />
                                    <asp:BoundField DataField="OrderID" HeaderText="OrderID" Visible="False" />
                                    <asp:BoundField DataField="OrderDate" HeaderText="Order Date" />
                                    <asp:BoundField DataField="CustName" HeaderText="Customer Name" />
                                    <asp:BoundField DataField="ShippingAdd" HeaderText="Shipp Address" >
                                    <ItemStyle Width="180px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Total" HeaderText="Total" />
                                    <asp:BoundField DataField="DeliverStatus" HeaderText="DeliverStatus" />
                                    <asp:TemplateField HeaderText="Select">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="Select">
                                                <asp:CheckBox ID="chkSelect" runat="server" />Select
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>




                        </asp:Panel>



                    </div>

                </div>

                <%--     <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtOrderID" runat="server" Visible="False"></asp:TextBox>
                            <asp:RadioButton ID="rdoDel" runat="server" Text="Deliver" GroupName="OrderStatus" />
                            <asp:RadioButton ID="rdoCCE" runat="server" GroupName="OrderStatus" Text="Credit Card Error" />
                            <asp:RadioButton ID="rdoNEQ" runat="server" Text="Not Enough Qty" GroupName="OrderStatus" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="button"
            OnClick="btnUpdate_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridView1" runat="server" CellPadding="5"
                                CellSpacing="1" Width="900px" AutoGenerateColumns="False"
                                DataKeyNames="OrderID"
                                OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField DataField="No" HeaderText="No" />
                                    <asp:BoundField DataField="OrderID" HeaderText="OrderID" Visible="False" />
                                    <asp:BoundField DataField="OrderDate" HeaderText="Order Date" />
                                    <asp:BoundField DataField="CustName" HeaderText="Customer Name" />
                                    <asp:BoundField DataField="ShippingAdd" HeaderText="Shipp Address" />
                                    <asp:BoundField DataField="Total" HeaderText="Total" />
                                    <asp:BoundField DataField="DeliverStatus" HeaderText="DeliverStatus" />
                                    <asp:TemplateField HeaderText="Select">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="Select">
                                                <asp:CheckBox ID="chkSelect" runat="server" />
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>--%>
            </div>
            <div class="col-lg-1"></div>


        </div>
    </div>



</asp:Content>


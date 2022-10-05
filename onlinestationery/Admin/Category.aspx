<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Bootstrap.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="Admin_Category" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="atk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
     <asp:MultiView ID="MultiView1" runat="server">



        <asp:View ID="View1" runat="server">

            <div class="col-lg-10 col-lg-offset-1">
                <div class="well well-sm">
                    <asp:Button ID="btnAdduser" CssClass="btn btn-warning btn-sm" runat="server" Text="Add Category" OnClick="btnAdduser_Click" />
                    <asp:Button ID="Button1" CssClass="btn btn-warning btn-sm" runat="server" Text="Print" OnClick="btnPrint_Click" />
                </div>

                <div class="panel panel-info">
                    <div class="panel-heading" style="font-size:20px" ><span class="glyphicon glyphicon-list"> </span> Category list </div>
                    <div class="panel-body">
                        <asp:Label ID="lbtotalRow" runat="server" Text="------"></asp:Label>

                        <div class="input-group">
                            <span class="input-group-addon">Filter</span>
                            <asp:TextBox ID="txtSearch" class="form-control" placeholder="Type here..." runat="server"  autocomplete="Off" OnTextChanged="txtSearch_TextChanged"  AutoPostBack="true" ></asp:TextBox>

                        </div>
                        <%-- class="table table-bordered table-striped table-hover table-heading table-datatable"--%>
                        <asp:Label ID="lblNoRecords" runat="server" Text="Label" Visible="false"></asp:Label>
                        <asp:Label ID="error" runat="server" Font-Size="18px" ForeColor="#CC3300"></asp:Label>
                        
                        <br />


                        <asp:Panel ID="Panel1" runat="server">
                            <asp:GridView ID="grdVcustomersList" runat="server" data-search="true" class="table table-striped" Font-Size="18px" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%">
                                <Columns>
                                    <asp:BoundField DataField="No" HeaderText="No" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="CatID" HeaderText="CatID" Visible="false" />


                                    <asp:BoundField DataField="CatName" HeaderText="Category Name" HeaderStyle-HorizontalAlign="Center">

                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:BoundField>

                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <%--   <button type="button" id="btnEdit" runat="server" class="btn btn-primary btn-sm "  commandname="Select" ><i class="glyphicon glyphicon-edit"></i>Edit</button>--%>


                                            <asp:LinkButton ID="btnEdit" runat="server" class="btn btn-primary btn-sm" CommandName="Select" OnClick="LinkEdit_Click"> <i class="glyphicon glyphicon-edit"></i>Edit</asp:LinkButton>
                                            |   

                                   <%--  <button type="button" id="LinkbanCustomer" runat="server" class="btn btn-danger btn-sm " onserverclick="LinkDeleteAdmin"><i class="glyphicon glyphicon-trash"></i>Delete</button>--%>
                                            <%-- <asp:LinkButton ID="LinkbanCustomer" runat="server" ForeColor="Red" Font-Size="15px" OnClick="LinkbanCustomer_Click" ToolTip="Ban or Inactive Customer" class="glyphicon glyphicon-ban-circle" />--%>
                                            <asp:LinkButton ID="LinkbanCustomer" runat="server" class="btn btn-danger btn-sm" CommandName="Select" OnClick="LinkDeleteAdmin"> <i class="glyphicon glyphicon-trash"></i>Delete</asp:LinkButton>
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

            <br />
            <br />
            <br />
            <asp:Panel ID="pnlpopupEditView" class="panel panel-primary" runat="server" BackColor="White" Width="300px" DefaultButton="btnSave" HorizontalAlign="Center">

                <div class="panel-heading" >
                    <asp:Label ID="lblName" runat="server" Text="Edit Category" Font-Size="18px"></asp:Label>


                </div>

                <div class="panel-body" style="text-align: left">

                    <asp:TextBox ID="Catid" Width="275px" Visible="false" runat="server"></asp:TextBox>
                    <asp:Label ID="lblError" runat="server" Font-Size="18px" ForeColor="#CC3300"></asp:Label>
                    <br />

                    <asp:Label ID="Label1" runat="server" Font-Size="18px" Text="Category Name"></asp:Label><br />
                    <asp:TextBox ID="txtCategoryName" Width="275px" runat="server"  class="form-control" placeholder="Enter Category Name"></asp:TextBox><br />

                   

                    

                  


                </div>
                <div class="panel-footer">
                    <asp:Button ID="btnSave" class="btn btn-success btn-sm" runat="server" Text="Save" OnClick="btnSave_Click" />
                    <asp:Button ID="btnClose" class="btn btn-danger btn-sm" runat="server" Text="Close" OnClick="btnClose_Click" />
                </div>


            </asp:Panel>



        </asp:View>




    </asp:MultiView>





    <%--<<<<<<<<<<<<<<<<<<<<<END --------------- Edit   Popup -------------- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>--%>

    <asp:Button ID="btnShowPopupInAct" runat="server" Style="display: none" />
    <atk:modalpopupextender ID="ModalPopupInactive" runat="server" TargetControlID="btnShowPopupInAct"
        PopupControlID="pnlpopupInactive" CancelControlID="btnCloseInactive" BackgroundCssClass="modalBackground">
    </atk:modalpopupextender>

    <asp:Panel ID="pnlpopupInactive" class="panel panel-primary" runat="server" BackColor="White" Style="display: none" Width="300px" DefaultButton="btnInactive">
        <asp:Label ID="lblCatID" runat="server" Text="0"></asp:Label>. 
    <asp:Label ID="lblCatName" runat="server" Text="0"></asp:Label>
        <hr />
        <asp:Label ID="Label7" runat="server" class="label label-info" Text="Do you want to Delete this Category ???"></asp:Label>
        <br />
        <br />
        <div class="panel-footer">
            <asp:Button ID="btnInactive" class="btn btn-success btn-sm" runat="server" Text="Yes" OnClick="DeleteCategory" />
            <asp:Button ID="btnCloseInactive" class="btn btn-danger btn-sm" runat="server" Text="No" />
        </div>
    </asp:Panel>






</asp:Content>


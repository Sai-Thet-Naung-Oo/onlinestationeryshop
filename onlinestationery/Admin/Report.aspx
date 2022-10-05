<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Bootstrap.master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="Admin_Report" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" ReportSourceID="CrystalReportSource1" HasRefreshButton="True" ToolPanelView="None" />
    <CR:CrystalReportViewer ID="CrystalReportViewer2" runat="server" AutoDataBind="true" ReportSourceID="CrystalReportSource2" HasRefreshButton="True" ToolPanelView="None" />
    <CR:CrystalReportViewer ID="CrystalReportViewer3" runat="server" AutoDataBind="true" ReportSourceID="CrystalReportSource3" HasRefreshButton="True" ToolPanelView="None" />
    <CR:CrystalReportViewer ID="CrystalReportViewer4" runat="server" AutoDataBind="true" ReportSourceID="CrystalReportSource4" HasRefreshButton="True" ToolPanelView="None" />
     <CR:CrystalReportViewer ID="CrystalReportViewer5" runat="server" AutoDataBind="true" ReportSourceID="CrystalReportSource5" HasRefreshButton="True" ToolPanelView="None" />
     <CR:CrystalReportViewer ID="CrystalReportViewer6" runat="server" AutoDataBind="true" ReportSourceID="CrystalReportSource6" HasRefreshButton="True" ToolPanelView="None" />

    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">

        <Report FileName="crptAdmin.rpt">
        </Report>

    </CR:CrystalReportSource>

    <CR:CrystalReportSource ID="CrystalReportSource2" runat="server">

        <Report FileName="crptCategory.rpt">
        </Report>

    </CR:CrystalReportSource>
    <CR:CrystalReportSource ID="CrystalReportSource3" runat="server">

        <Report FileName="crptOrder.rpt">
        </Report>

    </CR:CrystalReportSource>
     <CR:CrystalReportSource ID="CrystalReportSource4" runat="server">

        <Report FileName="crptProduct.rpt">
        </Report>

    </CR:CrystalReportSource>

      <CR:CrystalReportSource ID="CrystalReportSource5" runat="server">

        <Report FileName="crptDeliverfee.rpt">
        </Report>

    </CR:CrystalReportSource>
        <CR:CrystalReportSource ID="CrystalReportSource6" runat="server">

        <Report FileName="crptBrand.rpt">
        </Report>

    </CR:CrystalReportSource>


</asp:Content>


using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_ProductReport : System.Web.UI.Page
{
    MainDatasetTableAdapters.ProductTableAdapter ProTbl = new MainDatasetTableAdapters.ProductTableAdapter();
    DataTable Dt = new DataTable();

    MainDatasetTableAdapters.OrderTableAdapter OrderTbl = new
MainDatasetTableAdapters.OrderTableAdapter();
    DataTable D1 = new DataTable();
    DataTable D2 = new DataTable();


    protected void Page_Load(object sender, EventArgs e)
    {

        showlogin.Visible = false;
        showlogout.Visible = false;

        if (Session["LogInCustomer"] != null)
        {

            showlogout.Visible = true;
        }
        else
        {
            showlogin.Visible = true;
        }



        if (Session["LogInCustomer"] != null)
        {
            D1 =
           OrderTbl.Order_Select_By_NotiStatus(Convert.ToInt32(Session["LogInCustomer"]));
            if (D1.Rows.Count > 0)
                Session["NotiStatus"] = "Y";
        }
        if (Session["NotiStatus"] != null)
        {
            if (Session["NotiStatus"].ToString() == "Y")
                btnMessage.Visible = true;
            else
                btnMessage.Visible = false;

        }

        if (Session["TempTbl"] != null)
        {

            D2 = (DataTable)Session["TempTbl"];
            txtcart.Text = D2.Rows.Count.ToString();
        }






        Dt = ProTbl.GetData();
        ReportDocument report = new ReportDocument();
        report.Load(Server.MapPath("crptProductReport.rpt"));
        report.SetDataSource(Dt);

        CrystalReportViewer1.ReportSource = report;
        CrystalReportViewer1.DataBind();

    }
}
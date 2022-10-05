using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_DeliverFee : System.Web.UI.Page
{

    MainDatasetTableAdapters.DeliverfeeTableAdapter DeliverfeeTbl = new MainDatasetTableAdapters.DeliverfeeTableAdapter();
    MainDatasetTableAdapters.OrderTableAdapter OrderTbl = new MainDatasetTableAdapters.OrderTableAdapter();

    DataTable Dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            DisplayDeliverfee();
            MultiView1.ActiveViewIndex = 0;

            Debug.WriteLine("first page load" + Dt.Rows.Count);
        }

        error.Text = "";
        error.Visible = false;


        Dt = (DataTable)Session["deliverfeedatatable"];  // maintain state in session

        Debug.WriteLine("outer page load" + Dt.Rows.Count);


    }


    public void DisplayDeliverfee()
    {
        Dt = DeliverfeeTbl.GetData();

        grdVcustomersList.DataSource = Dt;
        grdVcustomersList.EmptyDataText = "No Records Found";
        grdVcustomersList.DataBind();

        lbtotalRow.Text = "Total : " + Convert.ToString(grdVcustomersList.Rows.Count) + " Records found" + "<br />";

        Session["deliverfeedatatable"] = Dt;

    }


    public void DisplaySearchDeliverfee()
    {


        grdVcustomersList.DataSource = Dt;
        grdVcustomersList.EmptyDataText = "No Records Found";
        grdVcustomersList.DataBind();

        lbtotalRow.Text = "Total : " + Convert.ToString(grdVcustomersList.Rows.Count) + " Records found" + "<br />";

        Session["deliverfeedatatable"] = Dt;

    }


    protected void btnAdduser_Click(object sender, EventArgs e)
    {

        lblError.Text = "";

        DeliverID.Text = "";
        txttownship.Text = "";
        txtfee.Text = "";

        MultiView1.ActiveViewIndex = 1;
        btnSave.Text = "Save";
        lblName.Text = "Add New DeliverFee";
    }

    protected void LinkEdit_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
        btnSave.Text = "Update";
        lblName.Text = "Edit DeliverFee";


    }


    protected void btnPrint_Click(object sender, EventArgs e)
    {

        if (txtSearch.Text == "")
        {
            if (txtSearch.Text.Trim().ToString() == string.Empty)
                Dt = DeliverfeeTbl.GetData();
        }
        else
        {
            Dt = DeliverfeeTbl.DeliverFee_Select_By_Search_township(txtSearch.Text.Trim().ToString());

        }

        Session["ReportDt"] = Dt;
        Session["ReportName"] = "crptDeliverfee.rpt";
        Response.Redirect("Report.aspx");

    
    }


    protected void DeleteDeliverfee(object sender, EventArgs e) {


        if (OrderTbl.Order_Select_By_DeliverID(Convert.ToInt32(DeliverID.Text)).Rows.Count > 0)
        {
            error.Text = "This Township Is Already Use In Order Table";
            error.Visible = true;

        }
        else
        {
            DeliverfeeTbl.DeliverFee_Delete(Convert.ToInt32(DeliverID.Text.ToString()));
            Response.Redirect("DeliverFee.aspx");
        
        }


      

    }

    protected void LinkDeleteAdmin(object sender, EventArgs e)
    {


        this.ModalPopupInactive.Show();

    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        Debug.WriteLine("heleo");

        Dt = DeliverfeeTbl.DeliverFee_Select_By_Search_township(txtSearch.Text);

        DisplaySearchDeliverfee();


    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        int RowIndex = grdVcustomersList.SelectedIndex;

        DeliverID.Text = Dt.Rows[RowIndex][1].ToString();

        txttownship.Text = Dt.Rows[RowIndex][2].ToString();
        txtfee.Text = Dt.Rows[RowIndex][3].ToString();

        lbldeliverID.Text = DeliverID.Text;
        lbltownship.Text = txttownship.Text;


    }




    protected void btnSave_Click(object sender, EventArgs e)
    {


        if (txttownship.Text.Trim().ToString() == string.Empty)
        {
            lblError.Text = "Please Enter Township Name";
            txttownship.Focus();
            MultiView1.ActiveViewIndex = 1;
        }
        else if (txtfee.Text.Trim().ToString() == string.Empty)
        {
            lblError.Text = "Please Enter Fee";
            txtfee.Focus();
            MultiView1.ActiveViewIndex = 1;
        }
        else
        {
            Dt = DeliverfeeTbl.Deliverfee_Select_By_township(txttownship.Text);
            if (Dt.Rows.Count > 0)
            {
                if (Dt.Rows[0][1].ToString() != DeliverID.Text)
                {
                    lblError.Text = "This Township Is Already Exist";
                    txttownship.Focus();
                    MultiView1.ActiveViewIndex = 1;
                    return;
                }
            }
            if (btnSave.Text == "Save")
            {
                DeliverfeeTbl.DeliverFee_Insert(txttownship.Text,Convert.ToInt32(txtfee.Text.Trim().ToString()));
            }
            else
            {
                DeliverfeeTbl.DeliverFee_Update(Convert.ToInt32(DeliverID.Text), txttownship.Text, Convert.ToInt32(txtfee.Text));
            }



            DeliverID.Text = "";


            btnSave.Text = "Save";



            ClearData();
            Dt = DeliverfeeTbl.GetData();
            DisplayDeliverfee();
            MultiView1.ActiveViewIndex = 0;

        }







    }



    protected void ClearData()
    {

        txtSearch.Text = "";
        lblError.Text = "";

        DeliverID.Text = "";
        txttownship.Text = "";
        txtfee.Text = "";


    }

    protected void btnClose_Click(object sender, EventArgs e)
    {
        Response.Redirect("DeliverFee.aspx");
    }


}
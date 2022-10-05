using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Brand : System.Web.UI.Page
{

    MainDatasetTableAdapters.BrandTableAdapter BrandTbl = new MainDatasetTableAdapters.BrandTableAdapter();
    MainDatasetTableAdapters.ProductTableAdapter ProductTbl = new MainDatasetTableAdapters.ProductTableAdapter();
    DataTable Dt = new DataTable();


    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            DisplayBrand();
            MultiView1.ActiveViewIndex = 0;

            Debug.WriteLine("first page load" + Dt.Rows.Count);
        }

        error.Text = "";
        error.Visible = false;

        Dt = (DataTable)Session["branddatatable"];  // maintain state in session

        Debug.WriteLine("outer page load" + Dt.Rows.Count);


    }

    public void DisplayBrand()
    {
        Dt = BrandTbl.GetData();

        grdVcustomersList.DataSource = Dt;
        grdVcustomersList.EmptyDataText = "No Records Found";
        grdVcustomersList.DataBind();

        lbtotalRow.Text = "Total : " + Convert.ToString(grdVcustomersList.Rows.Count) + " Records found" + "<br />";

        Session["branddatatable"] = Dt;

    }

    public void DisplaySearchBrand()
    {


        grdVcustomersList.DataSource = Dt;
        grdVcustomersList.EmptyDataText = "No Records Found";
        grdVcustomersList.DataBind();

        lbtotalRow.Text = "Total : " + Convert.ToString(grdVcustomersList.Rows.Count) + " Records found" + "<br />";

        Session["branddatatable"] = Dt;

    }

    protected void LinkEdit_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
        btnSave.Text = "Update";
        lblName.Text = "Edit Brand";


    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int RowIndex = grdVcustomersList.SelectedIndex;

        Brandid.Text = Dt.Rows[RowIndex][1].ToString();

        txtBrandName.Text = Dt.Rows[RowIndex][2].ToString();

        lblBrandID.Text = Brandid.Text;
        lblBrandName.Text = txtBrandName.Text;

    }

    protected void DeleteBrand(object sender, EventArgs e)
    {

        if (ProductTbl.Product_Select_By_BrandID(Convert.ToInt32(Brandid.Text)).Rows.Count > 0)
        {
            error.Text = "This Brand Is Already Use In Product Table";
            error.Visible = true;

        }
        else {
            BrandTbl.Brand_Delete(Convert.ToInt32(Brandid.Text));
            Response.Redirect("Brand.aspx");
        
        }

       

    }



    protected void btnAdduser_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
        btnSave.Text = "Save";
        lblName.Text = "Add Brand";
    }

    protected void btnPrint_Click(object sender, EventArgs e)
    {
        if (txtSearch.Text == "")
        {
            if (txtSearch.Text.Trim().ToString() == string.Empty)
                Dt = BrandTbl.GetData();
        }
        else
        {
            Dt = BrandTbl.Brand_Select_By_Search_BrandName(txtSearch.Text.Trim().ToString());

        }

        Session["ReportDt"] = Dt;
        Session["ReportName"] = "crptBrand.rpt";
        Response.Redirect("Report.aspx");
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        Debug.WriteLine("heleo");

        Dt = BrandTbl.Brand_Select_By_Search_BrandName(txtSearch.Text);

        DisplaySearchBrand();
    }

    protected void LinkDeleteAdmin(object sender, EventArgs e)
    {


        this.ModalPopupInactive.Show();

    }

    protected void ClearData()
    {

        txtSearch.Text = "";
        lblError.Text = "";
        Brandid.Text = "";
        txtBrandName.Text = "";


    }

    protected void btnSave_Click(object sender, EventArgs e)
    {

        if (txtBrandName.Text.Trim().ToString() == string.Empty)
        {
            lblError.Text = "Please Enter Category Name";
            txtBrandName.Focus();
            MultiView1.ActiveViewIndex = 1;
        }
        else
        {
            Dt = BrandTbl.Brand_Select_By_BrandName(txtBrandName.Text);
            if (Dt.Rows.Count > 0)
            {
                if (Dt.Rows[0][1].ToString() != Brandid.Text)
                {
                    lblError.Text = "This Category Is Already Exist";
                    txtBrandName.Focus();
                    MultiView1.ActiveViewIndex = 1;
                    return;
                }
            }
            if (btnSave.Text == "Save")
            {
                BrandTbl.Brand_Insert(txtBrandName.Text);
            }
            else
            {
                BrandTbl.Brand_Update(Convert.ToInt32(Brandid.Text),
               txtBrandName.Text);
            }



            Brandid.Text = "";


            btnSave.Text = "Save";



            ClearData();
            Dt = BrandTbl.GetData();
            DisplayBrand();
            MultiView1.ActiveViewIndex = 0;

        }


    }
    protected void btnClose_Click(object sender, EventArgs e)
    {
        Response.Redirect("Brand.aspx");
    }
}
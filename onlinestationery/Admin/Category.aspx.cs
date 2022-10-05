using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Category : System.Web.UI.Page
{

    MainDatasetTableAdapters.CategoryTableAdapter CatTbl = new MainDatasetTableAdapters.CategoryTableAdapter();
    MainDatasetTableAdapters.ProductTableAdapter ProductTbl = new MainDatasetTableAdapters.ProductTableAdapter();
    DataTable Dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DisplayCategory();
            MultiView1.ActiveViewIndex = 0;

            Debug.WriteLine("first page load" + Dt.Rows.Count);
        }

        error.Text = "";
        error.Visible = false;


        Dt = (DataTable)Session["categorydatatable"];  // maintain state in session

        Debug.WriteLine("outer page load" + Dt.Rows.Count);

    }



    public void DisplayCategory()
    {
        Dt = CatTbl.GetData();

        grdVcustomersList.DataSource = Dt;
        grdVcustomersList.EmptyDataText = "No Records Found";
        grdVcustomersList.DataBind();

        lbtotalRow.Text = "Total : " + Convert.ToString(grdVcustomersList.Rows.Count) + " Records found" + "<br />";

        Session["categorydatatable"] = Dt;

    }


    public void DisplaySearchCategory()
    {


        grdVcustomersList.DataSource = Dt;
        grdVcustomersList.EmptyDataText = "No Records Found";
        grdVcustomersList.DataBind();

        lbtotalRow.Text = "Total : " + Convert.ToString(grdVcustomersList.Rows.Count) + " Records found" + "<br />";

        Session["categorydatatable"] = Dt;

    }


    protected void LinkEdit_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
        btnSave.Text = "Update";
        lblName.Text = "Edit Category";


    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int RowIndex = grdVcustomersList.SelectedIndex;

        Catid.Text = Dt.Rows[RowIndex][1].ToString();

        txtCategoryName.Text = Dt.Rows[RowIndex][2].ToString();

        lblCatID.Text = Catid.Text;
        lblCatName.Text = txtCategoryName.Text;

    }


    protected void DeleteCategory(object sender, EventArgs e)
    {

        if (ProductTbl.Product_Select_By_CatID(Convert.ToInt32(Catid.Text)).Rows.Count > 0)
        {
            error.Text = "This Category Is Already Use In Product Table";
            error.Visible = true;
            
        }
        else
        {
            CatTbl.Category_Delete(Convert.ToInt32(Catid.Text));
            Response.Redirect("Category.aspx");

        }



    }




    protected void btnAdduser_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
        btnSave.Text = "Save";
        lblName.Text = "Add Category";

    }


    protected void btnPrint_Click(object sender, EventArgs e)
    {
        if (txtSearch.Text == "")
        {
            if (txtSearch.Text.Trim().ToString() == string.Empty)
                Dt = CatTbl.GetData();
        }
        else
        {
            Dt = CatTbl.Category_Select_By_Search_CatName(txtSearch.Text.Trim().ToString());

        }

        Session["ReportDt"] = Dt;
        Session["ReportName"] = "crptCategory.rpt";
        Response.Redirect("Report.aspx");
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        Debug.WriteLine("heleo");

        Dt = CatTbl.Category_Select_By_Search_CatName(txtSearch.Text);

        DisplaySearchCategory();
    }


    protected void LinkDeleteAdmin(object sender, EventArgs e)
    {


        this.ModalPopupInactive.Show();

    }

    protected void ClearData()
    {

        txtSearch.Text = "";
        lblError.Text = "";
        Catid.Text = "";
        txtCategoryName.Text = "";


    }

    protected void btnSave_Click(object sender, EventArgs e)
    {


        if (txtCategoryName.Text.Trim().ToString() == string.Empty)
        {
            lblError.Text = "Please Enter Category Name";
            txtCategoryName.Focus();
            MultiView1.ActiveViewIndex = 1;
        }
        else
        {
            Dt = CatTbl.Category_Select_By_CatName(txtCategoryName.Text);
            if (Dt.Rows.Count > 0)
            {
                if (Dt.Rows[0][1].ToString() != Catid.Text)
                {
                    lblError.Text = "This Category Is Already Exist";
                    txtCategoryName.Focus();
                    MultiView1.ActiveViewIndex = 1;
                    return;
                }
            }
            if (btnSave.Text == "Save")
            {
                CatTbl.Category_Insert(txtCategoryName.Text);
            }
            else
            {
                CatTbl.Category_Update(Convert.ToInt32(Catid.Text),
               txtCategoryName.Text);
            }



            Catid.Text = "";


            btnSave.Text = "Save";



            ClearData();
            Dt = CatTbl.GetData();
            DisplayCategory();
            MultiView1.ActiveViewIndex = 0;

        }



    }



    protected void btnClose_Click(object sender, EventArgs e)
    {
        Response.Redirect("Category.aspx");
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Admin_Admin : System.Web.UI.Page
{

    MainDatasetTableAdapters.AdminTableAdapter AdminTbl = new MainDatasetTableAdapters.AdminTableAdapter();
    DataTable Dt = new DataTable();

    // start
    protected void Page_Load(object sender, EventArgs e)
    {



        if (!IsPostBack)
        {

            if (Session["LogInAdmin"] == null)
            {
                Response.Redirect("../Login.aspx");
            }

            DisplayAdmin();
            MultiView1.ActiveViewIndex = 0;

            Debug.WriteLine("first page load" + Dt.Rows.Count);



        }



        Dt = (DataTable)Session["datatable"];  // maintain state in session

        Debug.WriteLine("outer page load" + Dt.Rows.Count);



    }


    //display for all
    public void DisplayAdmin()
    {
        Dt = AdminTbl.GetData();

        grdVcustomersList.DataSource = Dt;
        grdVcustomersList.EmptyDataText = "No Records Found";
        grdVcustomersList.DataBind();

        lbtotalRow.Text = "Total : " + Convert.ToString(grdVcustomersList.Rows.Count) + " Records found" + "<br />";

        Session["datatable"] = Dt;

    }

    // display for search
    public void DisplaySearchAdmin()
    {

        grdVcustomersList.DataSource = Dt;
        grdVcustomersList.EmptyDataText = "No Records Found";
        grdVcustomersList.DataBind();

        lbtotalRow.Text = "Total : " + Convert.ToString(grdVcustomersList.Rows.Count) + " Records found" + "<br />";

        Session["datatable"] = Dt;

    }

    // show edit view
    protected void LinkEdit_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;

    }

    // click edit and delete button
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int RowIndex = grdVcustomersList.SelectedIndex;

        Adminid.Text = Dt.Rows[RowIndex][1].ToString();

        txtAdminName.Text = Dt.Rows[RowIndex][2].ToString();

        lblAdminID.Text = Adminid.Text;
        lblAdminName.Text = txtAdminName.Text;

    }

    // comfirm delete yes
    protected void DeleteAdmin(object sender, EventArgs e)
    {

        AdminTbl.Admin_Delete(Convert.ToInt32(Adminid.Text));
        Response.Redirect("~/Admin/Admin.aspx");

    }

    // search box
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        Debug.WriteLine("heleo");

        Dt = AdminTbl.Admin_Select_By_SearchAdminName(txtSearch.Text);

        DisplaySearchAdmin();
    }

    // print report
    protected void btnPrint_Click(object sender, EventArgs e)
    {

        if (txtSearch.Text == "")
        {
            if (txtSearch.Text.Trim().ToString() == string.Empty)
                Dt = AdminTbl.GetData();
        }
        else
        {
            Dt = AdminTbl.Admin_Select_By_SearchAdminName(txtSearch.Text.Trim().ToString());

        }

        Session["ReportDt"] = Dt;
        Session["ReportName"] = "crptAdmin.rpt";
        Response.Redirect("Report.aspx");
    }

    // Delete confirm dialog
    protected void LinkDeleteAdmin(object sender, EventArgs e)
    {


        this.ModalPopupInactive.Show();

    }

    // reset view data
    protected void ClearData()
    {

        txtSearch.Text = "";
        lblError.Text = "";
        Adminid.Text = "";
        txtAdminName.Text = "";
        txtConfirmPassword.Text = "";
        txtPassword.Text = "";

    }


    // save and update data to database
    protected void btnSave_Click(object sender, EventArgs e)
    {


        if (txtAdminName.Text.Trim().ToString() == string.Empty)
        {
            lblError.Text = "Please Type AdminName";
            txtAdminName.Focus();
            MultiView1.ActiveViewIndex = 1;
        }
        else if (txtPassword.Text.Trim().ToString() == string.Empty)
        {
            lblError.Text = "Please Type Password";
            txtPassword.Focus();
            MultiView1.ActiveViewIndex = 1;
        }
        else if (txtConfirmPassword.Text.Trim().ToString() == string.Empty)
        {
            lblError.Text = "Please Type ConfirmPassword";
            txtConfirmPassword.Focus();
            MultiView1.ActiveViewIndex = 1;
        }
        else if (txtPassword.Text.Trim() != txtConfirmPassword.Text.Trim())
        {
            lblError.Text = "Password And ConfirmPassword Should Be Match";
            txtPassword.Focus();
            MultiView1.ActiveViewIndex = 1;
        }
        else
        {
            Dt = AdminTbl.Admin_Select_By_AdminNamePassword(txtAdminName.Text.Trim().ToString(), txtPassword.Text.Trim().ToString());
            if (Dt.Rows.Count > 0)
            {
                if (Dt.Rows[0][1].ToString() != Adminid.Text)
                {
                    lblError.Text = "This Admin Is Already Exist";
                    MultiView1.ActiveViewIndex = 1;
                    return;
                }
            }

            AdminTbl.Admin_Update(Convert.ToInt32(Adminid.Text), txtAdminName.Text.Trim(), txtPassword.Text.Trim());

            ClearData();
            Dt = AdminTbl.GetData();
            DisplayAdmin();
            MultiView1.ActiveViewIndex = 0;







        }
    }

    // close button in edit view
    protected void btnClose_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin.aspx");
    }
}


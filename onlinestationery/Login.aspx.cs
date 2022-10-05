using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    MainDatasetTableAdapters.AdminTableAdapter AdminTbl = new MainDatasetTableAdapters.AdminTableAdapter();
    DataTable Dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {


        if (txtAdminName.Text.Trim() == string.Empty)
        {
            lblError.Text = "Please Type AdminName";
            txtAdminName.Focus();
        }
        else if (txtPassword.Text.Trim() == string.Empty)
        {
            lblError.Text = "Please Type Password";
            txtPassword.Focus();
        }
        else
        {
            Dt = AdminTbl.Admin_Select_By_AdminNamePassword(txtAdminName.Text, txtPassword.Text);
            if (Dt.Rows.Count > 0)
            {
                Session["LogInAdmin"] = Dt.Rows[0][1];
                Response.Redirect("Admin/Admin.aspx");
            }
            else
            {
                lblError.Text = "Please Retype AdminName And Password";
            }
        }


    }
}
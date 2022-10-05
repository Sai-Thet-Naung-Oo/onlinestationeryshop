using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AddAdmin : System.Web.UI.Page
{

    MainDatasetTableAdapters.AdminTableAdapter AdminTbl = new MainDatasetTableAdapters.AdminTableAdapter();
    DataTable Dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {



        if (txtAdminName.Text.Trim().ToString() == string.Empty)
        {
            lblError.Text = "Please Type AdminName";
            txtAdminName.Focus();

        }
        else if (txtPassword.Text.Trim().ToString() == string.Empty)
        {
            lblError.Text = "Please Type Password";
            txtPassword.Focus();
        }
        else if (txtConfirmPassword.Text.Trim().ToString() == string.Empty)
        {
            lblError.Text = "Please Type ConfirmPassword";
            txtConfirmPassword.Focus();

        }
        else if (txtPassword.Text.Trim() != txtConfirmPassword.Text.Trim())
        {
            lblError.Text = "Password And ConfirmPassword Should Be Match";
            txtPassword.Focus();

        }
        else
        {
            Dt = AdminTbl.Admin_Select_By_AdminNamePassword(txtAdminName.Text.Trim().ToString(), txtPassword.Text.Trim().ToString());
            if (Dt.Rows.Count > 0)
            {
                if (Dt.Rows[0][1].ToString() != Adminid.Text)
                {
                    lblError.Text = "This Admin Is Already Exist";

                    return;
                }
            }


            AdminTbl.Admin_Insert(txtAdminName.Text.Trim(), txtPassword.Text.Trim());

            Response.Redirect("~/Admin/Admin.aspx");

        }
    }
}
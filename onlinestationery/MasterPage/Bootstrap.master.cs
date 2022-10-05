using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Bootstrap : System.Web.UI.MasterPage
{

    MainDatasetTableAdapters.AdminTableAdapter AdminTbl = new MainDatasetTableAdapters.AdminTableAdapter();
    DataTable Dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LogInAdmin"] == null) {
            Response.Redirect("../Login.aspx");
            return;
        }


      Dt=  AdminTbl.Admin_Select_By_AdminID(Convert.ToInt32(Session["LogInAdmin"]));
      lblusername.Text = Dt.Rows[0][2].ToString();
    }



    protected void LinklogOut_Click(object sender, EventArgs e)
    {
        Session["LogInAdmin"] = null;
        Response.Redirect("../Login.aspx");


    }
}

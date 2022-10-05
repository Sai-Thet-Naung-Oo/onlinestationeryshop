using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage_navplusphotoshop : System.Web.UI.MasterPage
{

    MainDatasetTableAdapters.OrderTableAdapter OrderTbl = new
MainDatasetTableAdapters.OrderTableAdapter();
    DataTable Dt = new DataTable();
    DataTable Dt1 = new DataTable();
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
            Dt =
           OrderTbl.Order_Select_By_NotiStatus(Convert.ToInt32(Session["LogInCustomer"]));
            if (Dt.Rows.Count > 0)
                Session["NotiStatus"] = "Y";
        }
        if (Session["NotiStatus"] != null)
        {
            if (Session["NotiStatus"].ToString() == "-")
                btnMessage.Visible = false;
            else
                btnMessage.Visible = true;

        }

        if (Session["TempTbl"] != null)
        {

            Dt1 = (DataTable)Session["TempTbl"];
            txtcart.Text = Dt1.Rows.Count.ToString();
        }


    }
}

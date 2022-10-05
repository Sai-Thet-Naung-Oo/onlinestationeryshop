using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Home : System.Web.UI.Page
{

    MainDatasetTableAdapters.CategoryTableAdapter CategoryTbl = new
MainDatasetTableAdapters.CategoryTableAdapter();
    DataTable Dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            Dt = CategoryTbl.Category_Select_By_Product();


            CatNameList.DataSource = Dt;
            CatNameList.DataBind();
        }

    }
    protected void CatNameList_SelectedIndexChanged(object sender, EventArgs e)
    {

         Session["CatID"]=CatNameList.SelectedValue.ToString();
         Response.Redirect("Product.aspx");

    }
}
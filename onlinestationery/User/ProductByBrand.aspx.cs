using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_ProductByBrand : System.Web.UI.Page
{
   

    MainDatasetTableAdapters.BrandTableAdapter BrandTbl = new
MainDatasetTableAdapters.BrandTableAdapter();

    MainDatasetTableAdapters.ProductTableAdapter ProductTbl = new
   MainDatasetTableAdapters.ProductTableAdapter();


    DataTable Dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            Dt = BrandTbl.Brand_Select_By_Product();


            CatNameList.DataSource = Dt;
            CatNameList.DataBind();

            if (Dt.Rows.Count > 0) // first time show
            {
                Productlist.DataSource = ProductTbl.Product_Select_By_BrandID(Convert.ToInt32(Dt.Rows[0][1].ToString()));
                Productlist.DataBind();
            }




        }
    }



    protected void CatNameList_SelectedIndexChanged(object sender, EventArgs e)
    {

        Productlist.DataSource = ProductTbl.Product_Select_By_BrandID(Convert.ToInt32(CatNameList.SelectedValue.ToString()));
        Productlist.DataBind();
        txtSearch.Text = "";

    }

    protected void Productlist_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["ProductID"] = Productlist.SelectedValue.ToString();
        Debug.WriteLine(Productlist.SelectedValue.ToString() + "eee");

    }

    protected void LinkAddToCart(object sender, EventArgs e)
    {

        LinkButton btn = (LinkButton)sender; // ***
        DataListItem item = (DataListItem)btn.NamingContainer;

        Label lblId = (Label)item.FindControl("LblID");
        string Proid = lblId.Text;

        Debug.WriteLine(Proid + "eee");

        Session["ProductID"] = Proid;


        DataTable Tbl = new DataTable();
        DataRow TblDr;

        Tbl.Columns.Add("ProID");
        Tbl.Columns.Add("Qty");
        Tbl.Rows.Clear();

        if (Session["TempTbl"] != null)
        {
            Tbl = (DataTable)Session["TempTbl"];
            DataRow[] DrArray = Tbl.Select("ProID='" + Session["ProductID"] + "'"); // update the record by product id
            foreach (DataRow Dr in DrArray)
            {
                Dr[1] = Convert.ToInt32(Dr[1]) + 1;
                Tbl.AcceptChanges();
                Session["TempTbl"] = Tbl;
                Response.Redirect("ShoppingCart.aspx");
                return;  // stop
            }
        }

        TblDr = Tbl.NewRow();   // add new shopping record
        TblDr[0] = Session["ProductID"];
        TblDr[1] = 1;
        Tbl.Rows.Add(TblDr);

        Session["TempTbl"] = Tbl;
        Response.Redirect("ShoppingCart.aspx");
    }





    protected void LinkToDetail(object sender, EventArgs e)
    {

        LinkButton btn = (LinkButton)sender; // ***
        DataListItem item = (DataListItem)btn.NamingContainer;

        Label lblId = (Label)item.FindControl("LblID");

        string Proid = lblId.Text;
        Debug.WriteLine(Proid + "eee");

        Session["ProductID"] = Proid;
        Response.Redirect("ProductDetail.aspx");



    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Productlist.DataSource = ProductTbl.Product_Select_By_SearchProName(txtSearch.Text);
        Productlist.DataBind();
    }
}
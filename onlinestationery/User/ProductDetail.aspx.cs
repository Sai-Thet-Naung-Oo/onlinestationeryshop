using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_ProductDetail : System.Web.UI.Page
{
    MainDatasetTableAdapters.ProductTableAdapter ProductTbl = new
MainDatasetTableAdapters.ProductTableAdapter();






    DataTable Dt = new DataTable();


    MainDatasetTableAdapters.OrderTableAdapter OrderTbl = new
MainDatasetTableAdapters.OrderTableAdapter();
    DataTable D1 = new DataTable();
    DataTable D2 = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack) {
        //   // TextBox1.Text = Session["ProductID"].ToString();

        //}

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
            D1 =
           OrderTbl.Order_Select_By_NotiStatus(Convert.ToInt32(Session["LogInCustomer"]));
            if (D1.Rows.Count > 0)
                Session["NotiStatus"] = "Y";
        }
        if (Session["NotiStatus"] != null)
        {
            if (Session["NotiStatus"].ToString() == "Y")
                btnMessage.Visible = true;
            else
                btnMessage.Visible = false;

        }

        if (Session["TempTbl"] != null)
        {

            D2 = (DataTable)Session["TempTbl"];
            txtcart.Text = D2.Rows.Count.ToString();
        }






        Dt = ProductTbl.Product_Select_By_ProID(Convert.ToInt32(Session["ProductID"]));
        if (Dt.Rows.Count > 0)
        {
            foreach (DataRow Dr in Dt.Rows)
            {
                imgProduct.ImageUrl = Dr["Image"].ToString();
                lblCategoryName.Text = Dr["CatName"].ToString();
                lblBrandName.Text = Dr["BrandName"].ToString();
                lblPrice.Text = Dr["Price"].ToString();
                lblProductName.Text = Dr["ProName"].ToString();
            }
        }
       
    }
    protected void btnContinue_Click(object sender, EventArgs e)
    {
        Response.Redirect("Product.aspx");

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
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
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Product : System.Web.UI.Page
{
    MainDatasetTableAdapters.ProductTableAdapter ProductTbl = new MainDatasetTableAdapters.ProductTableAdapter();
    DataTable Dt = new DataTable();
    MainDatasetTableAdapters.CategoryTableAdapter CategoryTbl = new
   MainDatasetTableAdapters.CategoryTableAdapter();
    MainDatasetTableAdapters.BrandTableAdapter BrandTbl = new
  MainDatasetTableAdapters.BrandTableAdapter();



    protected void DisplayCategory()
    {
        ddlCategoryName.DataTextField = "CatName";
        ddlCategoryName.DataValueField = "CatID";
        ddlCategoryName.DataSource = CategoryTbl.GetData();
        ddlCategoryName.DataBind();
        ddlCategoryName.Items.Insert(0, "-----Select-------");
    }


    protected void DisplayBrand()
    {
        ddlBrandName.DataTextField = "BrandName";
        ddlBrandName.DataValueField = "BrandID";
        ddlBrandName.DataSource = BrandTbl.GetData();
        ddlBrandName.DataBind();
        ddlBrandName.Items.Insert(0, "-----Select-------");
    }

    protected void Page_Load(object sender, EventArgs e)
    {



        if (!IsPostBack)
        {
            DisplayProduct();

            MultiView1.ActiveViewIndex = 0;

            Debug.WriteLine("first page load" + Dt.Rows.Count);
        }

        error.Text = "";
        error.Visible = false;


        Dt = (DataTable)Session["productdatatable"];  // maintain state in session

        //Debug.WriteLine("outer page load" + Dt.Rows.Count);

    }


    public void DisplayProduct()
    {
        Dt = ProductTbl.GetData();

        grdVcustomersList.DataSource = Dt;
        grdVcustomersList.EmptyDataText = "No Records Found";
        grdVcustomersList.DataBind();

        lbtotalRow.Text = "Total : " + Convert.ToString(grdVcustomersList.Rows.Count) + " Records found" + "<br />";

        Session["productdatatable"] = Dt;

    }

    public void DisplaySearchProduct()
    {


        grdVcustomersList.DataSource = Dt;
        grdVcustomersList.EmptyDataText = "No Records Found";
        grdVcustomersList.DataBind();

        lbtotalRow.Text = "Total : " + Convert.ToString(grdVcustomersList.Rows.Count) + " Records found" + "<br />";

        Session["productdatatable"] = Dt;

    }




    protected void btnPrint_Click(object sender, EventArgs e)
    {


        if (txtSearch.Text.Trim().ToString() != string.Empty)
        {
            if (ddlSearchType.SelectedIndex == 0)
                Dt = ProductTbl.Product_Select_By_SearchProName(txtSearch.Text);
            else if (ddlSearchType.SelectedIndex == 1)
                Dt = ProductTbl.Product_Select_By_SearchCatName(txtSearch.Text);
            else if (ddlSearchType.SelectedIndex == 2)
                Dt = ProductTbl.Product_Select_By_SearchBrandName(txtSearch.Text);
            else if (ddlSearchType.SelectedIndex == 3)
                Dt = ProductTbl.Product_Select_By_SearchPrice(txtSearch.Text);
            else if (ddlSearchType.SelectedIndex == 4)
                Dt = ProductTbl.Product_Select_By_SearchQuantity(txtSearch.Text);
        }
        else
        {
            Dt = ProductTbl.GetData();
        }
        Session["ReportDt"] = Dt;
        Session["ReportName"] = "crptProduct.rpt";
        Response.Redirect("Report.aspx");


    }


    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        if (ddlSearchType.SelectedIndex == 0)
            Dt = ProductTbl.Product_Select_By_SearchProName(txtSearch.Text);
        else if (ddlSearchType.SelectedIndex == 1)
            Dt = ProductTbl.Product_Select_By_SearchCatName(txtSearch.Text);
        else if (ddlSearchType.SelectedIndex == 2)
            Dt = ProductTbl.Product_Select_By_SearchBrandName(txtSearch.Text);
        else if (ddlSearchType.SelectedIndex == 3)
            Dt = ProductTbl.Product_Select_By_SearchPrice(txtSearch.Text);
        else if (ddlSearchType.SelectedIndex == 4)
            Dt = ProductTbl.Product_Select_By_SearchQuantity(txtSearch.Text);
        DisplaySearchProduct();




    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        int RowIndex = grdVcustomersList.SelectedIndex;

        Productid.Text = Dt.Rows[RowIndex][1].ToString();
        txtProductName.Text = Dt.Rows[RowIndex][2].ToString();


        Debug.WriteLine("testing" + Dt.Rows[RowIndex][9].ToString());




        ddlCategoryName.SelectedValue = Dt.Rows[RowIndex][3].ToString(); // catid
        ddlBrandName.SelectedValue = Dt.Rows[RowIndex][8].ToString();

        txtPrice.Text = Dt.Rows[RowIndex][5].ToString();
        txtQuantity.Text = Dt.Rows[RowIndex][6].ToString();
        txtImage.Text = Dt.Rows[RowIndex][7].ToString();



        lblProductID.Text = Productid.Text; // for deletien prompt
        lblProductName.Text = txtProductName.Text; // for deletien prompt

    }







    protected void LinkEdit_Click(object sender, EventArgs e)
    {


        DisplayCategory();
        DisplayBrand();

        MultiView1.ActiveViewIndex = 1;

    }




    protected void btnSave_Click(object sender, EventArgs e)
    {

        Debug.WriteLine(ddlCategoryName.SelectedValue + "INDEX");
        int ok;
        if (txtProductName.Text.Trim().ToString() == string.Empty)
        {
            lblError.Text = "Please Enter Product Name";
            txtProductName.Focus();
            return;

        }
        else if (ddlCategoryName.SelectedIndex == 0)
        {
            lblError.Text = "Please Select Category";
            return;

        }
        else if (ddlBrandName.SelectedIndex == 0)
        {
            lblError.Text = "Please Select Brand";
            return;

        }
        else if (txtPrice.Text.Trim().ToString() == string.Empty)
        {
            lblError.Text = "Please Enter Price";
            txtPrice.Focus();

            return;

        }
        else if (int.TryParse(txtPrice.Text, out ok) == false)
        {
            lblError.Text = "Price Should Be Number";
            txtPrice.Focus();
            return;

        }
        else if (Convert.ToInt32(txtPrice.Text) < 0 || Convert.ToInt32(txtPrice.Text) >
       10000000)
        {
            lblError.Text = "Price Should Be Between 0 And 10,000,000";
            txtPrice.Focus();
            return;

        }
        else if (txtQuantity.Text.Trim().ToString() == string.Empty)
        {
            lblError.Text = "Please Enter Quantity";
            txtQuantity.Focus();
            return;

        }
        else if (int.TryParse(txtQuantity.Text, out ok) == false)
        {
            lblError.Text = "Quantity Should Be Number";
            txtQuantity.Focus();
            return;

        }
        else if (Convert.ToInt32(txtQuantity.Text) < 0)
        {
            lblError.Text = "Quantity Should Be Zero And Above";
            txtQuantity.Focus();
            return;

        }
        else
        {


            int ProID = Convert.ToInt32(Productid.Text);
            string ImagePath = ImageLocation(ProID);

            ProductTbl.Product_Update(Convert.ToInt32(Productid.Text),
           Convert.ToInt32(ddlCategoryName.SelectedValue), Convert.ToInt32(ddlBrandName.SelectedValue), txtProductName.Text,
           Convert.ToInt32(txtPrice.Text), Convert.ToInt32(txtQuantity.Text), ImagePath.ToString());

            Response.Redirect("~/Admin/Product.aspx");

        }








    }



    public string ImageLocation(int ProID)
    {
        string filename = FileUploadImage.FileName;


        string FilePath = Server.MapPath("~/Images/ProImage/") + ProID + ".jpg";
        if (System.IO.File.Exists(FilePath))
        {
            System.IO.File.Delete(FilePath);
        }

        if (filename != string.Empty)
        {
            FileUploadImage.SaveAs(FilePath);
            return "~/Images/ProImage/" + ProID + ".jpg";
        }
        else
            return "~/Images/ProImage/Image1.jpg";
    }

    protected void btnClose_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/Product.aspx");
    }
    protected void DeleteProduct(object sender, EventArgs e)
    {


        if (Convert.ToInt32(txtQuantity.Text.Trim().ToString()) > 0)
        {
            error.Text = "This Product Have In Stock";
            error.Visible = true;
        }
        else
        {

            string ImagePath = Server.MapPath(txtImage.Text);
            if (txtImage.Text.Contains("Image1.jpg") == false)
            {
                if (System.IO.File.Exists(ImagePath))
                    System.IO.File.Delete(ImagePath);
            }

            ProductTbl.Product_Delete(Convert.ToInt32(Productid.Text));

            Response.Redirect("~/Admin/Product.aspx");

        }




    }


    protected void LinkDeleteProduct(object sender, EventArgs e)
    {


        this.ModalPopupInactive.Show();

    }



    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

        txtSearch.Text = "";
        txtSearch.Focus();


    }
}
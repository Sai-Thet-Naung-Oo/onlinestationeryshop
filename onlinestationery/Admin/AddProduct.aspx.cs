using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AddProduct : System.Web.UI.Page
{


    MainDatasetTableAdapters.CategoryTableAdapter CategoryTbl = new
    MainDatasetTableAdapters.CategoryTableAdapter();
    MainDatasetTableAdapters.BrandTableAdapter BrandTbl = new
  MainDatasetTableAdapters.BrandTableAdapter();

    MainDatasetTableAdapters.ProductTableAdapter ProductTbl = new
  MainDatasetTableAdapters.ProductTableAdapter();
    DataTable Dt = new DataTable();


    protected void Page_Load(object sender, EventArgs e)
    {
       if(!IsPostBack){
       DisplayCategory();
        DisplayBrand();
       } 
    }



    protected void DisplayCategory()
    {
        ddlCategoryName.DataTextField = "CatName";
        ddlCategoryName.DataValueField = "CatID";
        ddlCategoryName.DataSource = CategoryTbl.GetData();
        ddlCategoryName.DataBind();
    }


    protected void DisplayBrand()
    {
        ddlBrandName.DataTextField = "BrandName";
        ddlBrandName.DataValueField = "BrandID";
        ddlBrandName.DataSource = BrandTbl.GetData();
        ddlBrandName.DataBind();
    }

    public string ImageLocation(int ProID)
    {
        string filename = FileUploadImage.FileName;


        string FilePath = Server.MapPath("~/Images/ProImage/") + ProID + ".jpg";
        if (System.IO.File.Exists(FilePath))
            System.IO.File.Delete(FilePath);
        if (filename != string.Empty)
        {
            FileUploadImage.SaveAs(FilePath);
            return "~/Images/ProImage/" + ProID + ".jpg";
        }
        else
            return "~/Images/ProImage/Image1.jpg";
    }




    protected void btnSave_Click(object sender, EventArgs e)
    {


        int ok;
        if (txtProductName.Text.Trim().ToString() == string.Empty)
        {
            lblError.Text = "Please Enter Product Name";
            txtProductName.Focus();
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
            Dt = ProductTbl.Product_Select_By_ProNameCatName(txtProductName.Text,
           ddlCategoryName.SelectedItem.ToString(), ddlBrandName.SelectedItem.ToString());  // ddlname
            if (Dt.Rows.Count > 0)
            {

                lblError.Text = "This Product Is Already Exist";

                return;

            }



            ProductTbl.Product_Insert(Convert.ToInt32(ddlCategoryName.SelectedValue), Convert.ToInt32(ddlBrandName.SelectedValue), txtProductName.Text, Convert.ToInt32(txtPrice.Text.ToString()),
               Convert.ToInt32(txtQuantity.Text.ToString()));


            Debug.Write("hello" + ProductTbl.Product_Select_By_MaxProID().Rows[0][1]);

            int ProID = Convert.ToInt32(ProductTbl.Product_Select_By_MaxProID().Rows[0][1]);


            Debug.Write("hello this is proid" + ProductTbl.Product_Select_By_MaxProID().Rows[0][1]);

            ProductTbl.Product_Insert_Image(ProID, ImageLocation(ProID));

            Response.Redirect("~/Admin/Product.aspx");

        }


        //Debug.WriteLine(ddlCategoryName.SelectedValue+"index");


    }







   
}
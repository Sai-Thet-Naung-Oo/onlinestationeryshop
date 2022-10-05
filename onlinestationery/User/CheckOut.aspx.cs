using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_CheckOut : System.Web.UI.Page
{

    MainDatasetTableAdapters.ProductTableAdapter ProductTbl = new MainDatasetTableAdapters.ProductTableAdapter();
    MainDatasetTableAdapters.CustomerTableAdapter CustomerTbl = new MainDatasetTableAdapters.CustomerTableAdapter();
    MainDatasetTableAdapters.OrderTableAdapter OrderTbl = new MainDatasetTableAdapters.OrderTableAdapter();
    MainDatasetTableAdapters.OrderDetailTableAdapter OrderDetailTbl = new MainDatasetTableAdapters.OrderDetailTableAdapter();
    MainDatasetTableAdapters.DeliverfeeTableAdapter DeliverTbl = new MainDatasetTableAdapters.DeliverfeeTableAdapter();

    DataTable Dt1 = new DataTable();
    DataTable Dt2 = new DataTable();
    DataTable DtDisplay = new DataTable();
    DataRow Dr;
    int Count;
    int Qty, Price, Total, Deliverfee;

    string TodayDate;
    String Day, Month, Year;

    DataTable dttownship = new DataTable();

    protected void SelectTempTbl()
    {
        DtDisplay.Columns.Clear();
        DtDisplay.Rows.Clear();
        DtDisplay.Columns.Add("No");
        DtDisplay.Columns.Add("ProID");
        DtDisplay.Columns.Add("ProName");

        DtDisplay.Columns.Add("CatName");
        DtDisplay.Columns.Add("BrandName");
        DtDisplay.Columns.Add("Price");
        DtDisplay.Columns.Add("Qty");

        Count = Dt1.Rows.Count;

        for (int i = 0; i < Count; i++)
        {
            int ProID = Convert.ToInt32(Dt1.Rows[i][0].ToString());

            Dt2 = ProductTbl.Product_Select_By_ProID(ProID);  // select from database
            Dr = DtDisplay.NewRow();

            Dr[0] = Dt2.Rows[0][0];
            Dr[1] = Dt2.Rows[0][1];
            Dr[2] = Dt2.Rows[0][2];
            Dr[3] = Dt2.Rows[0][4];
            Dr[4] = Dt2.Rows[0][9];
            Dr[5] = Dt2.Rows[0][5];
            Dr[6] = Dt1.Rows[i][1];
            DtDisplay.Rows.Add(Dr);
            GridView1.DataSource = DtDisplay;
            GridView1.DataBind();
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {


        calculateTotal();
  

        Dt1 = (DataTable)Session["TempTbl"];  // shopping cart

        if (!IsPostBack)
        {
            if (Session["TempTbl"] == null)
            {
                Response.Redirect("Product.aspx");
            }
            else
            {
                if (Dt1.Rows.Count <= 0)
                    Response.Redirect("Product.aspx");
                else
                {
                    SelectTempTbl();
                    DisplayTownship();
                }

            }

            calculateTotal();
            //TotalNDay();
            if (Session["LogInCustomer"] != null)
            {
                Dt2 = CustomerTbl.Customer_Select_By_CustID(Convert.ToInt32(Session["LogInCustomer"].ToString()));

                foreach (DataRow Dr in Dt2.Rows)
                {
                    txtCustomerName.Text = Dr["CustName"].ToString();
                    txtCardType.Text = Dr["CType"].ToString();
                    txtAccountNo.Text = Dr["AccNo"].ToString();
                    txtShipAdd.Text = Dr["Address"].ToString();
                }
                txtShipAdd.Focus();



            }





        }
        
       
        lblError.Text = "";
    }

    protected void DisplayTownship()
    {

        dttownship = DeliverTbl.GetData();
        ddltownship.DataTextField = "township";
        ddltownship.DataValueField = "deliverID";
        ddltownship.DataSource = dttownship;
        ddltownship.DataBind();
        ddltownship.Items.Insert(0, "-----Select-------");

        Session["branddatatable"] = dttownship;
    }

    protected void calculateTotal()
    {

        foreach (GridViewRow Row in GridView1.Rows)
        {
            Price = Convert.ToInt32(Row.Cells[5].Text.ToString());
            Qty = Convert.ToInt32(Row.Cells[6].Text.ToString());


            Total += Convert.ToInt32(Qty * Price);
        }

        Deliverfee = Convert.ToInt32(txtdeliverfee.Text);
        Total += Deliverfee;

        txttotal.Text = Total.ToString();
        Total = 0;


        Day = string.Format("{0:D2}", DateTime.Now.Day);
        Month = string.Format("{0:D2}", DateTime.Now.Month);
        Year = DateTime.Today.Year.ToString();

        TodayDate = Day + "/" + Month + "/" + Year;

    }

   

    protected void ddltownship_SelectedIndexChanged(object sender, EventArgs e)
    {
        dttownship = (DataTable)Session["branddatatable"];
        Session["ShippingAddress"] = txtShipAdd.Text;

        if (ddltownship.SelectedIndex == 0)
        {
            lblError.Text = "Please Select Deliver Township";
            return;
        }

        int deliverid = Convert.ToInt32(ddltownship.SelectedValue);
        DataTable dttownshiptemp = new DataTable();
        dttownshiptemp = DeliverTbl.Deliverfee_Select_By_deliverID(deliverid);

        Debug.WriteLine(dttownshiptemp.Rows[0][3] + "");
        txtdeliverfee.Text = dttownshiptemp.Rows[0][3].ToString();
        calculateTotal();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Session["LogInCustomer"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else if (txtShipAdd.Text.ToString() == "")
        {
            lblError.Text = "Please Type Shipped Address";
            return;
        }
        else if (ddltownship.SelectedIndex == 0)
        {
            lblError.Text = "Please Select Deliver Township";
            return;
        }
        else
        {

            OrderTbl.Order_Insert(TodayDate.ToString(), Convert.ToInt32(Session["LogInCustomer"].ToString()), txtShipAdd.Text, Convert.ToInt32(txttotal.Text), "Order...", Convert.ToInt32(ddltownship.SelectedValue));

            int RowIndex = OrderTbl.GetData().Rows.Count;
            int OrderID = Convert.ToInt32(OrderTbl.GetData().Rows[RowIndex - 1][0].ToString());

            int Index = 0;

            foreach (GridViewRow Row in GridView1.Rows)
            {

                ProductTbl.Product_ReduceQty_By_ProID(Convert.ToInt32(Dt1.Rows[Index][0].ToString()), Convert.ToInt32(Row.Cells[6].Text.ToString()));

                OrderDetailTbl.Order_Detail_Insert(OrderID, Convert.ToInt32(Dt1.Rows[Index][0].ToString()), Convert.ToInt32(Row.Cells[5].Text.ToString()), Convert.ToInt32(Row.Cells[6].Text.ToString()));
                Index = Index + 1;
            }
            DataTable Dt = (DataTable)Session["TempTbl"];
            Dt.Rows.Clear();
            Response.Redirect("Product.aspx");
        }

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        DataTable Dt = (DataTable)Session["TempTbl"];
        Dt.Rows.Clear();

        Response.Redirect("Product.aspx");
    }
}
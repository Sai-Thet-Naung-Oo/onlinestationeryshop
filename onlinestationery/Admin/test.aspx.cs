using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        StringBuilder sb = new StringBuilder();


        if (FileUpload1.HasFile)
        {

            Debug.WriteLine("Yes");
           
        }
        else
        {
            Debug.WriteLine("NO");
        }
    }

}
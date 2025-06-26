using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_list_product : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;


    void myconn()
    {
        conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\dotnet\\online_shopping\\online_shopping\\App_Data\\customer.mdf;Integrated Security=True");
        conn.Open();
    }

    void loadProduct()
    {
        myconn();
        cmd = new SqlCommand("select pr.product_id, c.category,  pr.product, pr.price ,pr.color ,pr.image ,pr.[desc] ,pr.status from Product as pr join category as c on pr.cat_id = c.cat_id" , conn);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            Rpt3.DataSource = ds;
            Rpt3.DataBind();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        loadProduct();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Add_Product.aspx");
    }

    protected void Rpt3_ItemCommand(object sender, RepeaterCommandEventArgs e)
    {
        String id = e.CommandArgument.ToString();
        myconn();
        cmd = new SqlCommand("delete from product where product_id = @id", conn);
        cmd.Parameters.AddWithValue("@id", id);
        cmd.ExecuteNonQuery();
        loadProduct();
        conn.Close();
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_cat_list : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection conn;
    SqlDataAdapter da;
    DataSet ds;

    void mycon()
    {
        conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\dotnet\\online_shopping\\online_shopping\\App_Data\\customer.mdf;Integrated Security=True");
        conn.Open();
    }

    void loadcat()
    {
        mycon();
        cmd = new SqlCommand("select * from category",conn);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            rpt1.DataSource = ds;
            rpt1.DataBind();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        loadcat();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Add_Category.aspx");
    }   
    protected void rpt1_ItemCommand(object source,RepeaterCommandEventArgs e)
    {
        String id = e.CommandArgument.ToString();
        mycon();
        cmd = new SqlCommand("delete from category where cat_id = @id",conn);
        cmd.Parameters.AddWithValue("@id", id);
        cmd.ExecuteNonQuery();

        loadcat();
        conn.Close();   
    }
}
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class USER_assets_product_detail : System.Web.UI.Page
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
    void loadproductdetail()
    {
        String id = Request.QueryString["id"];
        if (!String.IsNullOrEmpty(id))
        {
            myconn();
            cmd = new SqlCommand("select * from product where product_id = @id", conn);
            cmd.Parameters.AddWithValue("@id", id);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Image1.ImageUrl = ds.Tables[0].Rows[0]["image"].ToString();
                Label1.Text = ds.Tables[0].Rows[0]["product"].ToString();
                Label2.Text = ds.Tables[0].Rows[0]["desc"].ToString();
                Label3.Text = ds.Tables[0].Rows[0]["price"].ToString();
            }
        }
    }
    void loaddata()
    {
        String userid = Session["userid"] != null ? Session["userid"].ToString() : "";
        String id = Request.QueryString["id"];
        if (!String.IsNullOrEmpty(userid))
        {
            myconn();
            cmd = new SqlCommand("insert into cart values(@cid,@prid,@qt,@tp)", conn);
            cmd.Parameters.AddWithValue("@cid", userid);
            cmd.Parameters.AddWithValue("@prid", id);
            cmd.Parameters.AddWithValue("@qt", 1);
            cmd.Parameters.AddWithValue("@tp", Label3.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        else
        {
            Response.Redirect("login_page.aspx");
        }
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadproductdetail();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        loaddata();
        Response.Redirect("cart.aspx");

    }
}
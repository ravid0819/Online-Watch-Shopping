using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class USER_Home : System.Web.UI.Page
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
    String price;
    void featuredproducts()
    {
        myconn();
        cmd = new SqlCommand("select * from product where cat_id = '1'", conn);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            Rpt1.DataSource = ds;
            Rpt1.DataBind();
        }
        else
        {
            Response.Write("check the error");
        }
    }
    void products()
    {
        myconn();
        cmd = new SqlCommand("select * from product where cat_id = '2'", conn);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            Rpt2.DataSource = ds;
            Rpt2.DataBind();
        }
        else
        {
            Response.Write("check the error");
        }
    }
    void newproducts()
    {
        myconn();
        cmd = new SqlCommand("select * from product where cat_id = '3'", conn);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            Rpt3.DataSource = ds;
            Rpt3.DataBind();
        }
        else
        {
            Response.Write("check the error");
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            newproducts();
            featuredproducts();
            products();
        }
    }
    protected void Rpt1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        String Id = e.CommandArgument.ToString();
        if (e.CommandName == "addtocart")
        {
            string userid = Session["userid"] != null ? Session["userid"].ToString() : "";
            String cusId = Session["cusId"] != null ? Session["cusId"].ToString() : "";

            if (String.IsNullOrEmpty(userid))
            {
                Response.Redirect("login_page.aspx");
            }
            else
            {
                loaddata(Id);
                Response.Redirect("cart.aspx?id=" + Id);
            }
        }
        else
        {
            Response.Redirect("product_detail_page.aspx?id=" + Id);
        }
    }
    protected void Rpt2_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        String Id = e.CommandArgument.ToString();
        if(e.CommandName == "addtocart")
        {
            string userid = Session["userid"] != null ? Session["userid"].ToString() : "";
            String cusId = Session["cusId"] != null ? Session["cusId"].ToString() : "";

            if (String.IsNullOrEmpty(userid))
            {
                Response.Redirect("login_page.aspx");
            }
            else
            {
                loaddata(Id);
                Response.Redirect("cart.aspx?id="+Id);
            }
        }
        else
        {
            Response.Redirect("product_detail_page.aspx?id=" + Id);
        }
    }
    protected void Rpt3_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        String Id = e.CommandArgument.ToString();
        if (e.CommandName == "addtocart")
        {
            string userid = Session["userid"] != null ? Session["userid"].ToString() : "";
            String cusId = Session["cusId"] != null ? Session["cusId"].ToString() : "";

            if (String.IsNullOrEmpty(userid))
            {
                Response.Redirect("login_page.aspx");
            }
            else
            {
                loaddata(Id);
                Response.Redirect("cart.aspx?id=" + Id);
            }
        }
        else
        {
            Response.Redirect("product_detail_page.aspx?id=" + Id);
        }
    }
    void loaddata(String Id)
    {

        String userid = Session["userid"] != null ? Session["userid"].ToString() : "";
        if (!String.IsNullOrEmpty(userid))
        {
            myconn();
            cmd = new SqlCommand("select * from product where product_id = @ID",conn);
            cmd.Parameters.AddWithValue("@ID", Id);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                price = ds.Tables[0].Rows[0]["price"].ToString();
                cmd = new SqlCommand("insert into cart values(@cid,@prid,@qt,@tp)", conn);
                cmd.Parameters.AddWithValue("@cid", userid);
                cmd.Parameters.AddWithValue("@prid", Id);
                cmd.Parameters.AddWithValue("@qt", "1");
                cmd.Parameters.AddWithValue("@tp",price);
                cmd.ExecuteNonQuery();  
                conn.Close();
            }
        }
        else
        {
            Response.Redirect("login_page.aspx");
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        
    }
}
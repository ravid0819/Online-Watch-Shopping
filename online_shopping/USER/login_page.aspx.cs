using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class User_login_page : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    void myconn()
    {
        conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\dotnet\\online_shopping\\online_shopping\\App_Data\\customer.mdf;Integrated Security=True");
        conn.Open();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != "" && TextBox2.Text != "")
        {
            myconn();
            cmd = new SqlCommand("select * from client where name=@nm and password=@pw", conn);
            cmd.Parameters.AddWithValue("@nm", TextBox1.Text);
            cmd.Parameters.AddWithValue("@pw", TextBox2.Text);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                //string userid = ds.Tables[0].Rows[0]["user_id"].ToString();
                Session["userid"] = ds.Tables[0].Rows[0]["user_id"].ToString();
                Session["username"] = ds.Tables[0].Rows[0]["name"].ToString();
                Session["usName"] = Session["username"].ToString();
                Session["cusId"] = Session["userid"].ToString();
                Response.Redirect("home.aspx");
            }
            else
            {
                Response.Write("<script>alert('plz enter correct username and password')</script>");
            }
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        else
        {
            Response.Write("<script>alert('pls fill every box')</script>");
        }
    }
}
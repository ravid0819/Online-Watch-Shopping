using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_registration_page : System.Web.UI.Page
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
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    void create()
    {
        myconn();

        if (TextBox1.Text != "" && TextBox2.Text != "" && TextBox3.Text != "")
        {
            cmd = new SqlCommand("select * from client where email = @em", conn);
            cmd.Parameters.AddWithValue("@em", TextBox2.Text);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Response.Write("you can not enter same email for multiple username plz change email");
            }
            else
            {
                myconn();
                cmd = new SqlCommand("insert into client values(@name,@email,@password)", conn);
                cmd.Parameters.AddWithValue("@name", TextBox1.Text);
                cmd.Parameters.AddWithValue("@email", TextBox2.Text);
                cmd.Parameters.AddWithValue("@password", TextBox3.Text);
                cmd.ExecuteNonQuery();
                Response.Redirect("login_page.aspx");
            }
        }
        else
        {
            Response.Write("<script>alert('plz fill every box')</script>");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        create();
    }
}
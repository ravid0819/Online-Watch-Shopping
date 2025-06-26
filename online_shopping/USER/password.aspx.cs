using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class USER_password : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    void mycon()
    {
        con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\dotnet\\online_shopping\\online_shopping\\App_Data\\customer.mdf;Integrated Security=True");
        con.Open();
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != "" && TextBox2.Text != "" && TextBox1.Text == TextBox2.Text)
        {
            mycon();
            cmd = new SqlCommand("update client set password = @pass where email = @email", con);
            string email = Session["email"].ToString();
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@pass", TextBox1.Text);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);
            cmd.ExecuteNonQuery();

            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                Response.Write("your password is changed");
                Response.Redirect("login_page.aspx");
            }
        }
        else
        {
            Response.Write("pls enter the field carefully");
        }
    }
}

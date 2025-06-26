using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class USER_forget_page : System.Web.UI.Page
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != "" )
        {
            myconn();
            cmd = new SqlCommand("select * from client where email = @em", conn);
            cmd.Parameters.AddWithValue("@em", TextBox1.Text);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                //string userid = ds.Tables[0].Rows[0]["user_id"].ToString();
                Random r = new Random();

                string otp = r.Next(10000, 99999).ToString();
                Session["otp"] = otp;
                string message = "Your OTP=" + otp;
                Session["email"] = TextBox1.Text;
                if (GmailSender.SendMail(TextBox1.Text, "Your OTP", message))
                {
                    Button3.Visible = true;
                    TextBox2.Visible = true;
                    Button1.Visible = false;
                    Response.Write("succesfully otp sended");

                }
                else
                {
                    Response.Write("something is wrong");
                }
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
            Response.Write("<script>alert('plz enter valid email')</script>");
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        if (Session["otp"] != null && TextBox2.Text == Session["otp"].ToString())
        {
            Response.Redirect("password.aspx");
        }
        else
        {
            Response.Write("otp is not right");
        }

    }
}

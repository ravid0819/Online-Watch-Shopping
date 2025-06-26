using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class address : System.Web.UI.Page
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
    void loadAddress(String id)
    {
        mycon();
        cmd = new SqlCommand("select * from address where id = @id", con);
        cmd.Parameters.AddWithValue("@id", id);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            TextBox1.Text = ds.Tables[0].Rows[0]["full_name"].ToString();
            TextBox2.Text = ds.Tables[0].Rows[0]["city"].ToString();
            TextBox3.Text = ds.Tables[0].Rows[0]["state"].ToString();
            TextBox4.Text = ds.Tables[0].Rows[0]["pincode"].ToString();
            TextBox5.Text = ds.Tables[0].Rows[0]["address"].ToString();
            TextBox6.Text = ds.Tables[0].Rows[0]["number"].ToString();
        }
        con.Close();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
            String usName = Session["usname"] != null ? Session["usname"].ToString() : "";
           
        String id = Request.QueryString["id"];
        if (!IsPostBack)
        {
            if (!String.IsNullOrEmpty(id))
            {
                loadAddress(id);
            }
        }



    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("addressList.aspx");
    }
        protected void Button2_Click(object sender, EventArgs e)
    {
        String cusId = Session["cusId"] != null ? Session["cusId"].ToString() : "";
        String addressId = Request.QueryString["id"];
        mycon();

        if(!String.IsNullOrEmpty(addressId))
        {
            cmd = new SqlCommand("update address set full_name = @fname, city = @city, state = @state, pincode = @pincode, address = @address, number = @number where id = @id ",con);
            cmd.Parameters.AddWithValue("@fname", TextBox1.Text);
            cmd.Parameters.AddWithValue("@city", TextBox2.Text);
            cmd.Parameters.AddWithValue("@state", TextBox3.Text);
            cmd.Parameters.AddWithValue("@pincode", TextBox4.Text);
            cmd.Parameters.AddWithValue("@address", TextBox5.Text);
            cmd.Parameters.AddWithValue("@number", TextBox6.Text);
            cmd.Parameters.AddWithValue("@id", addressId);
            cmd.ExecuteNonQuery ();
            Response.Redirect("addressList.aspx");

        }
        else
        {
            if (!String.IsNullOrEmpty(cusId))
            {
                cmd = new SqlCommand("select * from orderdetail where custid = @cusId order by orderdate desc", con);
                cmd.Parameters.AddWithValue("@cusId", cusId);
                da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    cmd = new SqlCommand("insert into address values(@cusId, @invoice, @fname, @city, @state, @pincode, @address, @number)", con);
                    cmd.Parameters.AddWithValue("@cusId", cusId);
                    cmd.Parameters.AddWithValue("@invoice", ds.Tables[0].Rows[0]["invoice"].ToString());
                    cmd.Parameters.AddWithValue("@fname", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@city", TextBox2.Text);
                    cmd.Parameters.AddWithValue("@state", TextBox3.Text);
                    cmd.Parameters.AddWithValue("@pincode", TextBox4.Text);
                    cmd.Parameters.AddWithValue("@address", TextBox5.Text);
                    cmd.Parameters.AddWithValue("@number", TextBox6.Text);
                    cmd.ExecuteNonQuery();

                    Response.Redirect("addressList.aspx");
                }

            }
        }

        con.Close();

    }

  

}
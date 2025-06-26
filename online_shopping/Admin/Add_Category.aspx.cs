using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

public partial class Admin_Default : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    void mycon()
    {
        conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\dotnet\\online_shopping\\online_shopping\\App_Data\\customer.mdf;Integrated Security=True");
        conn.Open();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String Edit = Request.QueryString["Edit"];
            if (!String.IsNullOrEmpty(Edit))
            {
                mycon();
                string id = Request.QueryString["Edit"];
                cmd = new SqlCommand("select * from category where cat_id = @id", conn);
                cmd.Parameters.AddWithValue("@id", id);
                da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    TextBox1.Text = ds.Tables[0].Rows[0]["category"].ToString();
                    DropDownList1.SelectedItem.Text = ds.Tables[0].Rows[0]["status"].ToString();
                }

            }
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        String Edit = Request.QueryString["Edit"];
        if (!string.IsNullOrEmpty(Edit))
        {
            mycon();
            cmd = new SqlCommand("update category set category = @category ,status = @status where cat_id = @id", conn);
            cmd.Parameters.AddWithValue("@id",Edit);
            cmd.Parameters.AddWithValue("@category",TextBox1.Text);
            cmd.Parameters.AddWithValue("@status",DropDownList1.SelectedItem.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Write("saved successfully");
            Response.Redirect("cat_list.aspx");
        }
        else
        {
            mycon();
            cmd = new SqlCommand("insert into category values(@cat,@status)", conn);
            cmd.Parameters.AddWithValue("@cat", TextBox1.Text);
            cmd.Parameters.AddWithValue("@status", DropDownList1.SelectedValue);
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Write("saved successfully");
            Response.Redirect("cat_list.aspx");
        }

        
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("cat_list.aspx");
    }
}
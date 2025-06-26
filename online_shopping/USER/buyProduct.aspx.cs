using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class buyProduct : System.Web.UI.Page
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
    
    void loadProduct(String id)
    {
        mycon();
        cmd = new SqlCommand("select * from product where product_id = @pr_id",con);
        cmd.Parameters.AddWithValue("@pr_id",id);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);

        if(ds.Tables[0].Rows.Count > 0)
        {
            rpt1.DataSource = ds;
            rpt1.DataBind();
        }
        con.Close ();
    }
  

    protected void Page_Load(object sender, EventArgs e)
    {
        String usName = Session["usname"] != null ? Session["usname"].ToString() : "";
        

        String pr_id = Request.QueryString["pr_id"];
       
        if (!String.IsNullOrEmpty(pr_id))
        {
            loadProduct(pr_id);
        }
        
    }


    protected void plus(object sender, EventArgs e)
    {
        
            
    }
    protected void minus(object sender, EventArgs e)
    {

    }
    protected void continueShop(object sender, EventArgs e)
    {

    }
    protected void cart(object sender, EventArgs e)
    {
        
    }
    protected void buy(object sender, EventArgs e)
    {
        
    }

    protected void rpt1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if(e.CommandName == "plus")
        {
            TextBox txtInput = (TextBox)e.Item.FindControl("TextBox1");
            if (txtInput != null)
            {
                int num = Convert.ToInt32(txtInput.Text);
                if (num > 0)
                {
                    int increment = num + 1;

                    txtInput.Text = increment.ToString();
                }
            }
            
        }

        if (e.CommandName == "minus")
        {
            TextBox txtInput = (TextBox)e.Item.FindControl("TextBox1");
            if (txtInput != null)
            {
                int num = Convert.ToInt32(txtInput.Text);
                if (num > 1)
                {
                    int decrement = num - 1;

                    txtInput.Text = decrement.ToString();
                }
            }

        }

        if (e.CommandName == "continueShop")
        {
            Response.Redirect("home.aspx");
        }
        String name = Session["usname"] != null ? Session["usname"].ToString() : "";
        String cusId = Session["cusId"] != null ? Session["cusId"].ToString() : "";
        if(e.CommandName == "buy")
        {
            if(String.IsNullOrEmpty(name))
            {
                Response.Redirect("login.aspx"); 
            }
        }
        if(e.CommandName == "cart")
        {
            if(String.IsNullOrEmpty(name) && String.IsNullOrEmpty(cusId))
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                TextBox txtInput = (TextBox)e.Item.FindControl("TextBox1");
                Label price = (Label)e.Item.FindControl("Label1");
                if (txtInput != null)
                {
                    int num = Convert.ToInt32(txtInput.Text);
                    int totalPrice = num*Convert.ToInt32(price.Text);
                    mycon();
                    cmd = new SqlCommand("insert into cart values(@cus_id,@pr_id,@quantity, @totalPrice)", con);
                    cmd.Parameters.AddWithValue("@cus_id", Convert.ToInt32(cusId));
                    cmd.Parameters.AddWithValue("@pr_id", Convert.ToInt32(Request.QueryString["pr_id"]));
                    cmd.Parameters.AddWithValue("@quantity",num);
                    cmd.Parameters.AddWithValue("@totalPrice", totalPrice );
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("cart.aspx");
                }
            }

        }


        if(e.CommandName == "buy")
        {
            TextBox txtInput = (TextBox)e.Item.FindControl("TextBox1");

            Random r = new Random();
            String invoice = r.Next(100000, 999999).ToString();

            int pr_id = Convert.ToInt32(e.CommandArgument); 
            mycon();
            if (!String.IsNullOrEmpty(cusId) && txtInput.Text != null)
            {
                cmd = new SqlCommand("insert into orderdetail values(@pr_id, @cus_id, @invoice, @orDate, @qty)", con);
                cmd.Parameters.AddWithValue("@pr_id", pr_id);
                cmd.Parameters.AddWithValue("@cus_id", cusId);
                cmd.Parameters.AddWithValue("@invoice", invoice);
                cmd.Parameters.AddWithValue("@orDate", DateTime.Now);
                cmd.Parameters.AddWithValue("@qty", Convert.ToInt32(txtInput.Text));

                cmd.ExecuteNonQuery();
                Response.Redirect("addressList.aspx");
            }
            con.Close() ;
        }
    }

}
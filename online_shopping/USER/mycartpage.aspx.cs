using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class USER_mycart : System.Web.UI.Page
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
    void loadProduct(String cusId)
    {
        mycon();
        cmd = new SqlCommand("select p.image,p.pro_name,p.discription,p.price,c.quantity,c.cart_id from cart as c join product as p on c.pr_id = p.product_id where cus_id = @cusId", con);
        cmd.Parameters.AddWithValue("@cusId", Convert.ToInt32(cusId));
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            rpt1.DataSource = ds;
            rpt1.DataBind();
        }
        con.Close();

    }
    void totalAmount(String cusId)
    {
        int totalAmount = 0, del_amount = 40, items = 0, payable = 0;
        mycon();
        cmd = new SqlCommand("select total_price from cart where cus_id = @cusId", con);
        cmd.Parameters.AddWithValue("@cusId", cusId);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                totalAmount += Convert.ToInt32(ds.Tables[0].Rows[i]["total_price"]);
            }
            totalPrice.InnerText = "₹ " + totalAmount.ToString();
            items = Convert.ToInt32(ds.Tables[0].Rows.Count);
            item.InnerText = items.ToString();
            del.InnerText = "₹ " + del_amount.ToString();
            payable = totalAmount + del_amount;
            payAmount.InnerText = "₹ " + payable.ToString();
        }
        con.Close();
    }
    void updateQuantity(int num, int cartId)
    {
        // fetch item price
        mycon();
        cmd = new SqlCommand("select p.price from cart as c join product as p on c.pr_id = p.product_id where cart_id = @cartId", con);
        cmd.Parameters.AddWithValue("@cartId", cartId);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        decimal price = 0;
        if (ds.Tables[0].Rows.Count > 0)
        {
            price = Convert.ToDecimal(ds.Tables[0].Rows[0]["price"]);
        }

        // change quantity and price
        cmd = new SqlCommand("update cart set quantity = @quantity,total_price = @totalPrice where cart_id = @cartId ", con);
        cmd.Parameters.AddWithValue("@quantity", num);
        cmd.Parameters.AddWithValue("@cartId", cartId);
        cmd.Parameters.AddWithValue("@totalPrice", price * num);
        cmd.ExecuteNonQuery();
        con.Close();
    }
    void removeCartItem(int cartId)
    {
        mycon();
        cmd = new SqlCommand("delete from cart where cart_id = @cartId", con);
        cmd.Parameters.AddWithValue("@cartId", cartId);
        cmd.ExecuteNonQuery();
        con.Close();
    }


    //

    /* void loadproductdetail()
     {
         String id = Request.QueryString["p_id"];
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
                 Label1.Text = ds.Tables[0].Rows[0]["pro_name"].ToString();
                 Label2.Text = ds.Tables[0].Rows[0]["discription"].ToString();
                 Label3.Text = ds.Tables[0].Rows[0]["price"].ToString();
                 Label3.Text = "&#8377; " + Label3.Text;
                 Label4.Text = Label3.Text; 
             }
         }
     }*/
    protected void Page_Load(object sender, EventArgs e)
    {
        String usName = Session["usname"] != null ? Session["usname"].ToString() : "";
        String cusId = Session["cusId"] != null ? Session["cusId"].ToString() : "";


        if (!IsPostBack)
        {
            //loadproductdetail();            
        }
        if (!String.IsNullOrEmpty(cusId))
        {
            loadProduct(cusId);
            totalAmount(cusId);
        }
        else
        {
            Response.Redirect("login_page.aspx");
        }

    }



    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        String cusId = Session["cusId"] != null ? Session["cusId"].ToString() : "";
        if (!String.IsNullOrEmpty(cusId))
        {
            mycon();
            cmd = new SqlCommand("delete from cart where cus_id = @cusId", con);
            cmd.Parameters.AddWithValue("@cusId", cusId);
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect(Request.RawUrl);
        }

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        mycon();
        cmd = new SqlCommand("select * from shipping where user_id = @id", con);
        cmd.Parameters.AddWithValue("@id", Session["userid"].ToString());
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Response.Redirect("shipping_list.aspx");
        }
        else
        {
            Response.Redirect("Shipping_Form.aspx");
        }
    }

    protected void plus(object sender, EventArgs e)
    {

    }

    protected void minus(object sender, EventArgs e)
    {

    }
    protected void delete(object sender, EventArgs e)
    {

    }
    protected void update(object sender, EventArgs e)
    {

    }


    protected void rpt1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        TextBox txtInput = (TextBox)e.Item.FindControl("TextBox1");
        Button delete = (Button)e.Item.FindControl("delete");
        Button minus = (Button)e.Item.FindControl("minus");
        String cusId = Session["cusId"] != null ? Session["cusId"].ToString() : "";
        if (e.CommandName == "plus")
        {
            if (txtInput != null)
            {
                int num = Convert.ToInt32(txtInput.Text);
                int increment = 0;
                if (num > 0)
                {
                    increment = num + 1;

                    txtInput.Text = increment.ToString();
                }

                int cartId = Convert.ToInt32(e.CommandArgument);
                updateQuantity(increment, cartId);
                totalAmount(cusId);
            }

        }
        if (e.CommandName == "minus")
        {
            txtInput = (TextBox)e.Item.FindControl("TextBox1");
            if (txtInput != null)
            {
                int num = Convert.ToInt32(txtInput.Text);
                int decrement = 0;
                if (num > 1)
                {
                    decrement = num - 1;

                    txtInput.Text = decrement.ToString();
                }
                int cartId = Convert.ToInt32(e.CommandArgument);
                updateQuantity(decrement, cartId);
                totalAmount(cusId);
            }

        }

        if (txtInput.Text == "1")
        {
            delete.Style["display"] = "block";
            minus.Style["display"] = "none";
        }

        if (e.CommandName == "delete")
        {
            int cartId = Convert.ToInt32(e.CommandArgument);
            if (cartId > 0)
            {
                removeCartItem(cartId);

            }
            if (!String.IsNullOrEmpty(cusId))
            {
                loadProduct(cusId);
                totalAmount(cusId);
            }
        }
    }
}
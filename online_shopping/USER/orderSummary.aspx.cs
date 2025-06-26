using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class orderSummary : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlCommand cmd1;
    SqlDataAdapter da;
    SqlDataAdapter da1;
    DataSet ds;
    DataSet ds1;

    void mycon()
    {
        con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\dotnet\\online_shopping\\online_shopping\\App_Data\\customer.mdf;Integrated Security=True");
        con.Open();
    }
    
    void loadAddress(String addressId)
    {
        mycon();
        cmd = new SqlCommand("select * from address where id = @id", con);
        cmd.Parameters.AddWithValue("@id", addressId);
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

    void loadOrder()
    {
        mycon();
        String cusId = Session["cusId"] != null ? Session["cusId"].ToString() : "";
        String invoice = Session["invoice"] != null ? Session["invoice"].ToString() : "";
        if (!String.IsNullOrEmpty(cusId) && !String.IsNullOrEmpty(invoice))
        {
            cmd1 = new SqlCommand("select o.*,p.product,p.image,p.price from orderdetail as o join product as p on o.proid = p.product_id where o.invoice = @invoice and o.custid = @cusId ", con);
            cmd1.Parameters.AddWithValue("@cusId", cusId);
            cmd1.Parameters.AddWithValue("@invoice", invoice);
            da1 = new SqlDataAdapter(cmd1);
            ds1 = new DataSet();
            da1.Fill(ds1);

            if (ds1.Tables[0].Rows.Count > 0)
            {
                rpt2.DataSource = ds1;
                rpt2.DataBind();
            }
        }
        con.Close();
    }

    void removeProduct(int id)
    {
        mycon();    
        String cusId = Session["cusId"] != null ? Session["cusId"].ToString() : "";
        if (!String.IsNullOrEmpty(cusId))
        {
            cmd = new SqlCommand("delete from orderdetail where custid = @cusId and proid = @pr_id", con);
            cmd.Parameters.AddWithValue("@cusId", cusId);
            cmd.Parameters.AddWithValue("@pr_id", id);
            cmd.ExecuteNonQuery();
            Response.Redirect(Request.RawUrl);
        }
        con.Close();
        
    }

    void updateQty(int num,String id)
    {
        String cusId = Session["cusId"] != null ? Session["cusId"].ToString() : "";
        mycon();
        cmd = new SqlCommand("update orderdetail set totalqty = @qty where proid = @pr_id and custid = @cusId",con);
        cmd.Parameters.AddWithValue("@qty", num);
        cmd.Parameters.AddWithValue("@pr_id", id);
        cmd.Parameters.AddWithValue("@cusId", cusId );
        cmd.ExecuteNonQuery();
        con.Close();
    }
    void loadAmount()
    {
        int price = 0,totalPrice = 0, delCharge = 40, items = 0;
        String cusId = Session["cusId"] != null ? Session["cusId"].ToString() : "";
        String invoice = Session["invoice"] != null ? Session["invoice"].ToString() : "";

        mycon();
        cmd = new SqlCommand("select o.*,p.price from orderdetail as o join product as p on o.proid = p.product_id where o.custid = @cusid and o.invoice = @invoice ",con);
        cmd.Parameters.AddWithValue("@cusid", cusId);
        cmd.Parameters.AddWithValue("@invoice", invoice);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++) 
            {
                price = Convert.ToInt32(ds.Tables[0].Rows[i]["totalqty"]) * Convert.ToInt32(ds.Tables[0].Rows[i]["price"]);
                totalPrice += price;    
            }
            total_price.InnerText = "₹ " + totalPrice.ToString();
            items = Convert.ToInt32(ds.Tables[0].Rows.Count);   
            item.InnerText =  items.ToString(); 
            del.InnerText = "₹ " + delCharge.ToString();
            payAmount.InnerText = "₹ " + (totalPrice + delCharge) ;
        }

        con.Close();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        String usName = Session["usname"] != null ? Session["usname"].ToString() : "";
        String addressId = Request.QueryString["address_id"];
        username.InnerText = usName;
        
        if(!String.IsNullOrEmpty(addressId))
        {
            loadAddress(addressId);
        }
        loadOrder();
        loadAmount();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("login_page.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("addressList.aspx");
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

    protected void Button3_Click(object sender, EventArgs e)
    {
        String pay_status = "";
        String cusId = Session["cusId"] != null ? Session["cusId"].ToString() : "";
        int ship_id = Convert.ToInt32(Request.QueryString["address_id"]);
        String invoice = Session["invoice"] != null ? Session["invoice"].ToString() : "";
        if (RadioButton1.Checked)
        {
            pay_status = "Pay Online";
        }
        else if (RadioButton2.Checked)
        {
            pay_status = "Cash On Delivery";
        }
        else if (RadioButton3.Checked)
        {
            pay_status = "Normal Delivery";
        }
        else if (RadioButton4.Checked)
        {
            pay_status = "Fast Delivery";
        }

        mycon();
        if (!String.IsNullOrEmpty(invoice) && !String.IsNullOrEmpty(cusId))
        {
            cmd = new SqlCommand("select o.*,p.price from orderdetail as o join product as p on o.proid = p.product_id where o.custid = @cusId and o.invoice = @invoice", con);
            cmd.Parameters.AddWithValue("@cusId", cusId);
            cmd.Parameters.AddWithValue("@invoice", invoice);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);

            if (String.IsNullOrEmpty(pay_status))
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), "alert", "alert('Please select some Payment type');", true);
                return;
            }

            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    cmd = new SqlCommand("insert into bill values(@ship_id,@cus_id,@pr_id,@invoice,@qty,@price,@status,@date_time)", con);
                    cmd.Parameters.AddWithValue("@ship_id", ship_id);
                    cmd.Parameters.AddWithValue("@cus_id", cusId);
                    cmd.Parameters.AddWithValue("@pr_id", Convert.ToInt32(ds.Tables[0].Rows[i]["proid"]));
                    cmd.Parameters.AddWithValue("@invoice", invoice);
                    cmd.Parameters.AddWithValue("@qty", Convert.ToInt32(ds.Tables[0].Rows[i]["totalqty"]));
                    cmd.Parameters.AddWithValue("@price", Convert.ToInt32(ds.Tables[0].Rows[i]["price"]) * Convert.ToInt32(ds.Tables[0].Rows[i]["totalqty"]));
                    cmd.Parameters.AddWithValue("@status", pay_status);
                    cmd.Parameters.AddWithValue("@date_time", DateTime.Now);
                    cmd.ExecuteNonQuery();
                }
                Response.Redirect("bill.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), "alert", "alert('Your order is empty! Add some item for your purchase');", true);

            }

        }
        con.Close();
    }
    protected void rpt1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        
    }
    protected void rpt2_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        TextBox txtInput = (TextBox)e.Item.FindControl("TextBox1");
        Button delete = (Button)e.Item.FindControl("delete");
        Button minus = (Button)e.Item.FindControl("minus");

            int num = Convert.ToInt32(txtInput.Text);
        if (e.CommandName == "plus")
        {
            String id = e.CommandArgument.ToString();

            if (num > 0)
            {
                num += 1;
                txtInput.Text = num.ToString();
                updateQty(num, id);
                loadAmount();
            }
        }
        
        if(e.CommandName == "minus" && num > 1)
        {
            String id = e.CommandArgument.ToString();
            num -= 1;
            txtInput.Text = num.ToString();
            updateQty(num,id);
            loadAmount();
        }

        if (txtInput.Text == "1")
        {
            delete.Style["display"] = "block";
            minus.Style["display"] = "none";   
        }


        if (e.CommandName == "delete")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            removeProduct(id);
            loadAmount();
        }

    }

}
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bill : System.Web.UI.Page
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

    void loadAddress()
    {
        String invoice = Session["invoice"] != null ? Session["invoice"].ToString() : "";
        String cusId = Session["cusId"] != null ? Session["cusId"].ToString() : "";

        mycon();
        if(!String.IsNullOrEmpty(invoice) && !String.IsNullOrEmpty(cusId))
        {
            cmd = new SqlCommand("select top 1 b.*,a.* from bill as b join address as a on b.invoice = a.invoice where b.cus_id = @cusId and b.invoice = @invoice ", con);
            cmd.Parameters.AddWithValue("@invoice", invoice);
            cmd.Parameters.AddWithValue("@cusId",cusId);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                name.InnerText = ds.Tables[0].Rows[0]["full_name"].ToString();
                address.InnerText = ds.Tables[0].Rows[0]["address"].ToString();
                city.InnerText = ds.Tables[0].Rows[0]["city"].ToString();
                state.InnerText = ds.Tables[0].Rows[0]["state"].ToString();
                pincode.InnerText = ds.Tables[0].Rows[0]["pincode"].ToString();
                bill_no.InnerText = "Invoice #"+ds.Tables[0].Rows[0]["invoice"].ToString();
                time.InnerText = ds.Tables[0].Rows[0]["date_time"].ToString();

                if (ds.Tables[0].Rows[0]["pay_status"].ToString() == "Pay Online")
                {
                    Button1.Style["display"] = "block";
                    Button2.Style["display"] = "none";
                }
                else
                {
                    Button1.Style["display"] = "none";
                    Button2.Style["display"] = "block";
                }                
            }

        }   
        con.Close();

    }

    void loadBill()
    {
        int total_bill = 0, delCharge = 40;
        String invoice = Session["invoice"] != null ? Session["invoice"].ToString() : "";
        String cusId = Session["cusId"] != null ? Session["cusId"].ToString() : "";
        mycon();
        if (!String.IsNullOrEmpty(invoice) && !String.IsNullOrEmpty(cusId))
        {
            cmd = new SqlCommand("select b.*,p.product,p.price from bill as b join product as p on b.pr_id = p.product_id where b.cus_id = @cusId and b.invoice = @invoice ", con);
            cmd.Parameters.AddWithValue("@cusId", cusId);
            cmd.Parameters.AddWithValue("@invoice", invoice);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                for(int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    total_bill += Convert.ToInt32(ds.Tables[0].Rows[i]["total_amount"]);
                }

                del_charge.InnerText = "Rs. " + delCharge.ToString();
                bill_amount.InnerText = "Rs. " + (total_bill + delCharge); 

                rpt1.DataSource = ds;
                rpt1.DataBind();
            }

        }

        con.Close();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        loadAddress();
        loadBill();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("QrCode.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        mycon();
        String cusId = Session["cusId"] != null ? Session["cusId"].ToString() : "";
        String invoice = Session["invoice"] != null ? Session["invoice"].ToString() : "";
        
        if(!String.IsNullOrEmpty(cusId) && !String.IsNullOrEmpty(invoice))
        {
            cmd = new SqlCommand("delete from cart where cus_id = @cusId", con);
            cmd.Parameters.AddWithValue("@cusId", cusId);
            cmd.ExecuteNonQuery();

            cmd = new SqlCommand("delete from orderdetail where custid = @cusId and invoice = @invoice", con);
            cmd.Parameters.AddWithValue("@cusId", cusId);
            cmd.Parameters.AddWithValue("@invoice", invoice);
            cmd.ExecuteNonQuery();

            Response.Redirect("Home.aspx");

        }

        con.Close();
    }
    protected void rpt1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
}
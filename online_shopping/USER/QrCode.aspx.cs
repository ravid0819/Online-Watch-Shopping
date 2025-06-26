using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QrCode : System.Web.UI.Page
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


    void loadamount()
    {
        int pay_amount = 0,del_charge = 40;
        String invoice = Session["invoice"] != null ? Session["invoice"].ToString() : "";
        String cusId = Session["cusId"] != null ? Session["cusId"].ToString() : "";
        mycon();

        if(!String.IsNullOrEmpty(invoice) && !String.IsNullOrEmpty(cusId))
        {
            cmd = new SqlCommand("select total_amount from bill where cus_id = @cusId and invoice = @invoice",con);
            cmd.Parameters.AddWithValue("@cusId", cusId);
            cmd.Parameters.AddWithValue("@invoice", invoice);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);

            for(int i = 0;i < ds.Tables[0].Rows.Count; i++)
            {
                pay_amount += Convert.ToInt32(ds.Tables[0].Rows[i]["total_amount"]);
            }
            pay_amount += del_charge;
            paybale_amount.InnerText = pay_amount.ToString();
        }
        con.Close();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        String usName = Session["usname"] != null ? Session["usname"].ToString() : "";
     
        loadamount();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(paybale_amount.InnerText))
        {
            Response.Write("<script>alert('error')</script>");
            return;
        }
        else
        {
            Response.Redirect("pay_inquiry.aspx");
        }

        
    }
}
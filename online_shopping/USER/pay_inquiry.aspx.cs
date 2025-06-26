using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pay_inquiry : System.Web.UI.Page
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
        String usName = Session["usname"] != null ? Session["usname"].ToString() : "";
       
        
        
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        String filePath = "";
        String imgPath = "";
        if (image.HasFile)
        {
            filePath = Server.MapPath("~/pay_images/"+image.FileName);
            imgPath = "~/pay_images/"+ image.FileName;
            image.SaveAs(filePath);
        }
        if (!image.HasFile || String.IsNullOrEmpty(TextBox1.Text) || String.IsNullOrEmpty(TextBox2.Text) || String.IsNullOrEmpty(TextBox3.Text))
        {
            Response.Write("<script>alert('Please Fill the inquiry');</script>");
            return;
        }
        String cusId = Session["cusId"] != null ? Session["cusId"].ToString() : "";
        String invoice = Session["invoice"] != null ? Session["invoice"].ToString() : "";

        mycon();
        if (!String.IsNullOrEmpty(invoice)) 
        {
            cmd = new SqlCommand("insert into pay_inquire values(@invoice, @subject, @message, @urgency, @filepath )", con);
            cmd.Parameters.AddWithValue("@invoice",invoice);
            cmd.Parameters.AddWithValue("@subject",TextBox1.Text);
            cmd.Parameters.AddWithValue("@message",TextBox2.Text);
            cmd.Parameters.AddWithValue("@urgency",TextBox3.Text);
            cmd.Parameters.AddWithValue("@filepath",imgPath);
            cmd.ExecuteNonQuery();

            cmd = new SqlCommand("delete from cart where cus_id = @cusId", con);
            cmd.Parameters.AddWithValue("@cusId",cusId);
            cmd.ExecuteNonQuery();

            cmd = new SqlCommand("delete from orderdetail where custid = @cusId and invoice = @invoice", con);
            cmd.Parameters.AddWithValue("@cusId",cusId);
            cmd.Parameters.AddWithValue("@invoice", invoice);
            cmd.ExecuteNonQuery();

            Response.Redirect("Home.aspx");
        }
        con.Close();
        

    }
}
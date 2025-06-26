using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//abhi thirdcategory ka cs uthaya hai dropdownle liye sab funtions
public partial class Admin_Add_Product : System.Web.UI.Page
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
    void loadCat()
    {
        myconn();
        cmd = new SqlCommand("select * from category", conn);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DropDownList2.DataSource = ds;
            DropDownList2.DataValueField = "cat_id";
            DropDownList2.DataTextField = "category";
            DropDownList2.DataBind();
            DropDownList2.Items.Insert(0, "--Select Category--");
        }
    }
    /*void loadSub()
    {
        cmd = new SqlCommand("select * from subcategory", conn);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DropDownList3.DataSource = ds;
            DropDownList3.DataValueField = "sub_id";
            DropDownList3.DataTextField = "subcategory";
            DropDownList3.DataBind();
        }
    }*/

    void fileupload()
    {
        if(FileUpload1.HasFile)
        {
            string filepath = Server.MapPath("~/Admin/Upload/" + FileUpload1.FileName);
            
            FileUpload1.SaveAs(Server.MapPath("~/Admin/Upload/" + FileUpload1.FileName));
            Image1.ImageUrl = "~/Admin/Upload/" + FileUpload1.FileName;
        }
    }

    void save_data()
    {
        myconn();
        cmd = new SqlCommand("insert into product values(@cat_id,@p_name,@p_price,@p_color,@p_img,@p_des,@status)", conn);
        cmd.Parameters.AddWithValue("@cat_id", DropDownList2.SelectedValue);
        cmd.Parameters.AddWithValue("@p_name",TextBox1.Text);
        cmd.Parameters.AddWithValue("@p_price",TextBox2.Text);
        cmd.Parameters.AddWithValue("@p_color",TextBox3.Text);
        cmd.Parameters.AddWithValue("@p_img", Image1.ImageUrl);
        cmd.Parameters.AddWithValue("@p_des", TextBox4.Text);
        cmd.Parameters.AddWithValue("@status", DropDownList1.SelectedValue);
        Response.Write("data is inserted");
        cmd.ExecuteNonQuery();
        conn.Close();
    }
    void loadedit()
    {
        string imgpath = "~/Admin/Upload/" + FileUpload1.FileName;
        String Edit = Request.QueryString["Edit"];
        if (!String.IsNullOrEmpty(Edit))
        {
            myconn();
            cmd = new SqlCommand("select p.product,p.price,p.color,p.image,p.[desc],c.cat_id, p.status from product as p join category as c on p.cat_id = c.cat_id where p.product_id = @id", conn);
            //third cat syntax cmd = new SqlCommand("select tc.thirdcategory, c.category, sc.subcategory , tc.status from Thirdcategory as tc join subcategory as sc on tc.cat_id = sc .cat_id join category as c on c.cat_id = tc.cat_id where tc.third_id=@id", conn);
            cmd.Parameters.AddWithValue("@id", Edit);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                TextBox1.Text = ds.Tables[0].Rows[0]["product"].ToString();
                TextBox2.Text = ds.Tables[0].Rows[0]["price"].ToString();
                TextBox3.Text = ds.Tables[0].Rows[0]["color"].ToString();
                Image1.ImageUrl = ds.Tables[0].Rows[0]["image"].ToString();
                TextBox4.Text = ds.Tables[0].Rows[0]["desc"].ToString();
                DropDownList2.SelectedValue = ds.Tables[0].Rows[0]["cat_id"].ToString();
                DropDownList1.SelectedValue = ds.Tables[0].Rows[0]["status"].ToString();
                

            }
        }
    }
    void save_edit()
    {
        String Edit = Request.QueryString["Edit"];
        myconn();
        cmd = new SqlCommand("update product set status=@st ,cat_id=@cat ,price=@price,color=@color,image=@img,[desc]=@dis,product=@name where product_id=@id", conn);
        //cmd = new SqlCommand("update Thirdcategory set status=@st, thirdcategory=@tc, sub_id=@sub, cat_id=@cat where third_id = @id", conn);
        cmd.Parameters.AddWithValue("@id", Edit);
        cmd.Parameters.AddWithValue("@name",TextBox1.Text);
        cmd.Parameters.AddWithValue("@price",TextBox2.Text);
        cmd.Parameters.AddWithValue("@color",TextBox3.Text);
        cmd.Parameters.AddWithValue("@img",Image1.ImageUrl);
        cmd.Parameters.AddWithValue("@dis",TextBox4.Text);
        cmd.Parameters.AddWithValue("@st", DropDownList1.SelectedValue);
        cmd.Parameters.AddWithValue("@cat", DropDownList2.SelectedValue);
        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Write("saved succesfully");
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadCat();
            loadedit();
            String Edit = Request.QueryString["Edit"];
            if (!String.IsNullOrEmpty(Edit))
            {
            }
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        String Edit = Request.QueryString["Edit"];
        if (!String.IsNullOrEmpty(Edit))
        {
            save_edit();
            Response.Redirect("list_product.aspx");
        }
        else
        {
            save_data();
            Response.Redirect("list_product.aspx");
        }

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("list_product.aspx");
    }
    





    protected void Button5_Click(object sender, EventArgs e)
    {
        fileupload();
    }
}
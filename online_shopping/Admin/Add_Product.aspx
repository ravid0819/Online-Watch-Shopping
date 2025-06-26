<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Add_Product.aspx.cs" Inherits="Admin_Add_Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style>
     .text-box {
         height:2em;
         width:98%;
         margin-bottom:0.8em;
     }
     td {
         padding:0.8em 2em;
     }
     .dropdown-box {
         height:2em;
         width:98.7%;
         padding:1px;
         margin-bottom:1.5em;
         font-size:1em;
         padding-left:10px;
     }
     .middletd {
         background-color:white;
         border-top:0.5px solid black;        
         border-bottom:0.5px solid black;  
     }
     .button
     {
         background-color: cornflowerblue;
         border:0 ;
         border-radius: 5px;
         color: white;
         letter-spacing: 1px;
         color:White;
         font-size:1.1em;
     }
     .cat-tabel {

         border:0.5px solid black;
         border-radius:5px;

     }.back {
          margin-top:1em;
         float:right;
         background-color:#3399FF;
     }
     .closebtn {
         background-color:red;   
         margin:0px 0.7em;
     }
         .auto-style7 {
             background-color: white;
             border-top: 0.5px solid black;
             border-bottom: 0.5px solid black;
             margin-left: 40px;
         }
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 style="display:inline-block" >Add Product</h2><asp:Button ID="Button2" runat="server" Text="< Back" CssClass="button back" Height="2em" Width="5em" OnClick="Button2_Click" />
    <table class="cat-tabel">
    <tr>
        <td>Add Product</td>
    </tr>
    <tr >
        <td class="auto-style7">
            <h3>Category</h3>
            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="dropdown-box" AutoPostBack="True">
                <asp:ListItem Selected="True">--Select Sub Category--</asp:ListItem>        
            </asp:DropDownList>

            <h3>Product Name</h3>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="text-box"></asp:TextBox>

            <h3>Product Price</h3>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="text-box"></asp:TextBox>

            <h3>Product Color</h3>

            <asp:TextBox ID="TextBox3" runat="server" CssClass="text-box" TextMode="Color" ></asp:TextBox>
            &nbsp;<h3>Product image</h3>
            <div style="padding-right:100px;display:inline-block;">
                <p style="border:2px solid black;display:inline-block;padding:3px;margin:0"><asp:FileUpload ID="FileUpload1" runat="server" Width="270px"/></p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button runat="server" Text="Button" OnClick="Button5_Click" ID="Button5" style="width: 68px" />
            </div>
                <asp:Image ID="Image1" runat="server" Height="100px" Width="100px"/>
            
            <br />
            
            <h3>Product Desciption</h3>
            <asp:TextBox ID="TextBox4" runat="server" CssClass="text-box"></asp:TextBox>


            <h3>Status</h3>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropdown-box">
              <asp:ListItem Selected="True">Active</asp:ListItem>
              <asp:ListItem>Deactive</asp:ListItem>  
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="auto-style6">
            <asp:Button ID="Button3" CssClass="button" runat="server" Text="Save" Height="2em" Width="5em" OnClick="Button3_Click"/>
            <asp:Button ID="Button4" CssClass="button closebtn" runat="server" Text="x close" Height="2em" Width="5em"/>
         </td>
     </tr>
</table>
</asp:Content>


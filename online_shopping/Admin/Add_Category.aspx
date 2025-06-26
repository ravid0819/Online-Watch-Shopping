<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Add_Category.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        * {
            font-family:Arial, Helvetica, sans-serif;
        }
        .middle {
            padding:25px;
            padding-bottom:40px;
        }
        .text-box {
            height:30px;
            width:98%;
            margin-bottom:10px;
        }
        td {
                 padding:0.8em 2em;
        }
        .dropdown-box {
            height:35px;
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
            Height:30px;
            Width:74px;
        }
        .cat-tabel {
           
            border:0.5px solid black;
            border-radius:5px;

        }.back {
            float:right;
            background-color:#3399FF;
        }
        .closebtn {
            background-color:red;   
            margin:0px 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="middle">
     <h2 >Add Category<asp:Button ID="Button2" runat="server" Text="< Back" CssClass="button back" OnClick="Button2_Click" /></h2>
      <table class="cat-tabel">
          <tr>
              <td>Add categories</td>
          </tr>
          <tr >
              <td class="middletd">
                 <h3>Category</h3>
                  <asp:TextBox ID="TextBox1" runat="server" CssClass="text-box"></asp:TextBox>
                     <h3>Status</h3>
                     <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropdown-box">
                       <asp:ListItem Selected="True">Active</asp:ListItem>
                       <asp:ListItem>Deactive</asp:ListItem>  
                     </asp:DropDownList>
              </td>
          </tr>
          <tr>
              <td class="auto-style6">
                  <asp:Button ID="Button3" CssClass="button" runat="server" Text="Save" OnClick="Button3_Click" />
                  <asp:Button ID="Button4" CssClass="button closebtn" runat="server" Text="x close" />
              </td>
          </tr>
     </table>
 </div>
</asp:Content>


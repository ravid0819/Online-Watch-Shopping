<%@ Page Language="C#" AutoEventWireup="true" CodeFile="address.aspx.cs" Inherits="address"  MasterPageFile="~/USER/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style>
         * {
             margin:0;
             padding:0;
             font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
         }
         .section {
             padding:0;
         }
         .footer__copy{
             margin:10px 10px;
         }
        .form {
            width:400px;
            height:445px;
            margin:45px auto;
            border-radius:10px;
            box-shadow:0 0 6px 0;
            padding:15px;
            margin-top:100px;
        }
        .heading {
            display:flex;
            justify-content:space-between;
            height:50px;
            width:100%;
        }
        .button1 {
            height:30px;
            width:75px;
            background-color: #8492a1cc;
            border:none;
            border-radius:5px;
        }
        .textbox {
            width: 372px;
            font-size: 16px;
            /* margin: 10px 2px; */
            border-radius: 5px;
            border: none;
            background-color: #e9e9f5;
            padding: 6px 14px;
            margin: 5px 0px 12px 0px;
        }
        .button2 {
            width:372px;
            background-color:blueviolet;
            color:white;
            padding:10px 0px;
            border-radius:5px;
            border:none;
            padding: 6px 14px;
            font-size:16px;    
        }



</style></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  

        
     

           <div class="form">
    <div class="heading">
        <h3>Shipping Address</h3>
        <asp:Button ID="Button1" runat="server" Text="Back" CssClass="button1" ForeColor="White" OnClick="Button1_Click" />
    </div>
    <hr style="margin-bottom:10px;"/>
    <div>
        <asp:TextBox ID="TextBox1" runat="server" cssClass="textbox" placeholder="Full Name"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server" cssClass="textbox" placeholder="City"></asp:TextBox>
        <asp:TextBox ID="TextBox3" runat="server" cssClass="textbox" placeholder="state"></asp:TextBox>
        <asp:TextBox ID="TextBox4" runat="server" cssClass="textbox" placeholder="Pincode"></asp:TextBox>
        <asp:TextBox ID="TextBox5" runat="server" cssClass="textbox" placeholder="Address" TextMode="MultiLine"></asp:TextBox>
        <asp:TextBox ID="TextBox6" runat="server" cssClass="textbox" placeholder="Mobile Number"></asp:TextBox>

        <asp:Button ID="Button2" runat="server" Text="Submit" cssClass="button2" OnClick="Button2_Click" />

    </div>
    </div>
        
    

    
</asp:Content>

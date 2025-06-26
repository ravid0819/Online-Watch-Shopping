    <%@ Page Language="C#"  MasterPageFile="~/USER/MasterPage2.master" AutoEventWireup="true" CodeFile="registration_page.aspx.cs" Inherits="User_registration_page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <div class="hell">

            <div class="box">
                <div class="box-items">
                    <img src="assets/img/2.jpg" class="logo"/>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="text-box" placeholder="Name" ></asp:TextBox>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="text-box" placeholder="Email" TextMode="Email"></asp:TextBox>
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="text-box" placeholder="Password" TextMode="Password"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" CssClass="btn" Text="CREATE" OnClick="Button1_Click"/>
                </div>
                <div class="box-items link">
                    Already registred?
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/User/login_page.aspx">Sign In</asp:HyperLink>
                </div>
            </div>
        </div>
     
</asp:Content>


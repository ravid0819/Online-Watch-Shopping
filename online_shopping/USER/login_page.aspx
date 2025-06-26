<%@ Page Language="C#" MasterPageFile="~/USER/MasterPage2.master" AutoEventWireup="true" CodeFile="login_page.aspx.cs" Inherits="User_login_page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div class="hell">

            <div class="box">
                <div class="box-items">
                    <img src="assets/img/2.jpg" class="logo"/>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="text-box" placeholder="username"  ></asp:TextBox>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="text-box" placeholder="password"  TextMode="Password"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" CssClass="btn" Text="LOGIN" OnClick="Button1_Click" />
                 </div>
                <div class="box-items link">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/User/forgot_page.aspx">forget password?</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/User/registration_page.aspx">create an account?</asp:HyperLink>
                </div>
            </div>
        </div>
 
</asp:Content>

<%@ Page Language="C#" MasterPageFile="~/USER/MasterPage2.master" AutoEventWireup="true" CodeFile="password.aspx.cs" Inherits="USER_password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <div class="hell">

            <div class="box">
                <div class="box-items">
                    <img src="assets/img/2.jpg" class="logo"/>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="text-box" placeholder="enter your new password"  ></asp:TextBox>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="text-box" placeholder="confirm new password"  TextMode="Password" Visible="True"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" CssClass="btn" Text="submit" OnClick="Button1_Click" Visible="True" />
             
                </div>
                <div class="box-items link">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/User/forgot_page.aspx">forget password?</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/User/registration_page.aspx">create an account?</asp:HyperLink>
                </div>
            </div>
        </div>
   
</asp:Content>

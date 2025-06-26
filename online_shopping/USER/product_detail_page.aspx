<%@ Page Title="" Language="C#" MasterPageFile="~/USER/MasterPage.master" AutoEventWireup="true" CodeFile="product_detail_page.aspx.cs" Inherits="USER_assets_product_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
         
        .ho {
                margin-top: 78px;
        }
        .home__img {
            width:70%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="top">
    <div class="home__container container grid">
        <div class="home__img-bg">
            <asp:Image ID="Image1" runat="server" CssClass="home__img"/>
            <!--<img src="assets/img/home.png" alt="" class="home__img">-->
        </div>

         <div class="home__data">
             <h1 class="home__title">MEN'S PREMIUM WATCH <br> <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h1>
             <p class="home__description">
                 <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
             </p>
             <span class="home__price">
                 Rs <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></span>

             <div class="home__btns">
                 <!--<a href="#" class="button button--gray button--small">
                     Discover
                 </a>-->
                 <asp:Button ID="Button1" runat="server" Text="ADD TO CART" CssClass="button home__button" OnClick="Button1_Click"  />
             </div>
         </div>   
    </div>
        </div>
</asp:Content>


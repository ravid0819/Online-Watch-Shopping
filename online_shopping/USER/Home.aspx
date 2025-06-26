<%@ Page Title="" Language="C#" MasterPageFile="~/USER/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="USER_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
          
        <!--==================== MAIN ====================-->
        <main class="main">
            <!--==================== HOME ====================-->
            <section class="home" id="home">
                <div class="home__container container grid">
                    <div class="home__img-bg">
                        <img src="assets/img/home.png" alt="" class="home__img">
                    </div>

                    <!-- <div class="home__social">
                                <a href="https://www.facebook.com/" target="_blank" class="home__social-link">
                                    Facebook
                                </a>
                                <a href="https://twitter.com/" target="_blank" class="home__social-link">
                                    Twitter
                                </a>
                                <a href="https://www.instagram.com/" target="_blank" class="home__social-link">
                                    Instagram
                                </a>
                            </div>-->

                    <div class="home__data">
                        <h1 class="home__title">NEW WATCH <br> COLLECTIONS B720</h1>
                        <p class="home__description">
                            Latest arrival of the new imported watches of the B720 series,
                            with a modern and resistant design.
                        </p>
                        <span class="home__price">$1245</span>

                        <div class="home__btns">
                            <a href="#" class="button button--gray button--small">
                                Discover
                            </a>
                            <asp:Button ID="Button1" runat="server" Text="ADD TO CART" CssClass="button home__button" />
                        </div>
                    </div>
                </div>
            </section>

            <!--==================== FEATURED ====================-->
            <section class="featured section container" id="featured">
                <h2 class="section__title">
                    Featured
                </h2>

                <div class="featured__container grid">
                    <asp:Repeater ID="Rpt1" runat="server" EnableViewState="true" OnItemCommand="Rpt1_ItemCommand"> 
                        <ItemTemplate>
                            <div class="featured__card">
                                 <span class="featured__tag">Sale</span>
                                <asp:ImageButton ID="ImageButton2" runat="server" CssClass="featured__img" ImageUrl='<%#Eval("image")%>' CommandArgument='<%#Eval("product_id")%>'/>
                                    <div class="featured__data">
                                        <h3 class="featured__title"><%#Eval("product") %></h3>
                                        <span class="featured__price"> 
                                            Rs <asp:Label ID="Label4" runat="server"><%#Eval("price") %></asp:Label>
                                        </span>
                                    </div>
                                <asp:Button ID="Button5" runat="server" Text="ADD TO CART" CssClass="button featured__button" CommandName="addtocart" CommandArgument='<%#Eval("product_id")%>'/>
                                  
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </section>

            <!--==================== STORY ====================-->
            <section class="story section container">
                <div class="story__container grid">
                    <div class="story__data">
                        <h2 class="section__title story__section-title">
                            Our Story
                        </h2>
    
                        <h1 class="story__title">
                            Inspirational Watch of <br> this year
                        </h1>
    
                        <p class="story__description">
                            The latest and modern watches of this year, is available in various 
                            presentations in this store, discover them now.
                        </p>
    
                        <a href="#" class="button button--small">Discover</a>
                    </div>

                    <div class="story__images">
                        <img src="assets/img/story.png" alt="" class="story__img">
                        <div class="story__square"></div>
                    </div>
                </div>
            </section>

            <!--==================== PRODUCTS ====================-->
            <section class="products section container" id="products">
                <h2 class="section__title">
                    Products
                </h2>

                <div class="products__container grid">
                   

             <asp:Repeater ID="Rpt2" runat="server" EnableViewState="true" OnItemCommand="Rpt2_ItemCommand"> 
                <ItemTemplate>
                    <div class="products__card">
                        <asp:ImageButton ID="ImageButton3" runat="server" class="products__img" ImageUrl='<%#Eval("image")%>' CommandArgument='<%#Eval("product_id")%>'/>

                        <h3 class="products__title"><%#Eval("product") %></h3>
                        <span class="products__price">
                        Rs <asp:Label ID="Label3" runat="server"><%#Eval("price") %></asp:Label>
                        </span>
                        
                        <asp:Button ID="Button4" runat="server" Text="&#x1F6D2;" class="products__button cartbtn" OnClick="Button4_Click" CommandName="addtocart" CommandArgument='<%#Eval("product_id")%>'/>
                        <!--<button >
                            
                        </button>-->
                    </div>
                </ItemTemplate>
            </asp:Repeater>      
                </div>
            </section>

            <!--==================== TESTIMONIAL ====================-->
            <section class="testimonial section container">
                <div class="testimonial__container grid">
                    <div class="swiper testimonial-swiper">
                        <div class="swiper-wrapper">
                            <div class="testimonial__card swiper-slide">
                                <div class="testimonial__quote">
                                    <i class='bx bxs-quote-alt-left' ></i>
                                </div>
                                <p class="testimonial__description">
                                    They are the best watches that one acquires, also they are always with the latest 
                                    news and trends, with a very comfortable price and especially with the attention 
                                    you receive, they are always attentive to your questions.
                                </p>
                                <h3 class="testimonial__date">March 27. 2021</h3>
        
                                <div class="testimonial__perfil">
                                    <img src="assets/img/testimonial1.jpg" alt="" class="testimonial__perfil-img">
        
                                    <div class="testimonial__perfil-data">
                                        <span class="testimonial__perfil-name">Lee Doe</span>
                                        <span class="testimonial__perfil-detail">Director of a company</span>
                                    </div>
                                </div>
                            </div>

                            <div class="testimonial__card swiper-slide">
                                <div class="testimonial__quote">
                                    <i class='bx bxs-quote-alt-left' ></i>
                                </div>
                                <p class="testimonial__description">
                                    They are the best watches that one acquires, also they are always with the latest 
                                    news and trends, with a very comfortable price and especially with the attention 
                                    you receive, they are always attentive to your questions.
                                </p>
                                <h3 class="testimonial__date">March 27. 2021</h3>
        
                                <div class="testimonial__perfil">
                                    <img src="assets/img/testimonial2.jpg" alt="" class="testimonial__perfil-img">
        
                                    <div class="testimonial__perfil-data">
                                        <span class="testimonial__perfil-name">Samantha Mey</span>
                                        <span class="testimonial__perfil-detail">Director of a company</span>
                                    </div>
                                </div>
                            </div>

                            <div class="testimonial__card swiper-slide">
                                <div class="testimonial__quote">
                                    <i class='bx bxs-quote-alt-left' ></i>
                                </div>
                                <p class="testimonial__description">
                                    They are the best watches that one acquires, also they are always with the latest 
                                    news and trends, with a very comfortable price and especially with the attention 
                                    you receive, they are always attentive to your questions.
                                </p>
                                <h3 class="testimonial__date">March 27. 2021</h3>
        
                                <div class="testimonial__perfil">
                                    <img src="assets/img/testimonial3.jpg" alt="" class="testimonial__perfil-img">
        
                                    <div class="testimonial__perfil-data">
                                        <span class="testimonial__perfil-name">Raul Zaman</span>
                                        <span class="testimonial__perfil-detail">Director of a company</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="swiper-button-next">
                            <i class='bx bx-right-arrow-alt' ></i>
                        </div>
                        <div class="swiper-button-prev">
                            <i class='bx bx-left-arrow-alt' ></i>
                        </div>
                    </div>

                    <div class="testimonial__images">
                        <div class="testimonial__square"></div>
                        <img src="assets/img/testimonial.png" alt="" class="testimonial__img">
                    </div>
                </div>
            </section>

            <!--==================== NEW ====================-->
            <section class="new section container" id="new">
                <h2 class="section__title">
                    New Arrivals
                </h2>
                
                <div class="new__container">
                    <div class="swiper new-swiper">
                        <div class="swiper-wrapper">
                            
                             <asp:Repeater ID="Rpt3" runat="server" EnableViewState="true" OnItemCommand="Rpt3_ItemCommand"> 
                                <ItemTemplate>
                                    <div class="new__card swiper-slide">
                                        <span class="new__tag">New</span>
                                        <asp:ImageButton ID="ImageButton4" runat="server" CssClass="featured__img" ImageUrl='<%#Eval("image")%>' CommandArgument='<%#Eval("product_id")%>'/>
                                            <div class="new__data">
                                                <h3 class="new__title"><%#Eval("product") %></h3>
                                                <span class="new__price"> 
                                                    Rs <asp:Label ID="Label5" runat="server"><%#Eval("price") %></asp:Label>
                                                </span>
                                            </div>
                                        <asp:Button ID="Button6" runat="server" Text="ADD TO CART" CssClass="button new__button" CommandName="addtocart" CommandArgument='<%#Eval("product_id")%>'/>
                                    </div>
                                </ItemTemplate>
                             </asp:Repeater>
                        </div>
                    </div>
                </div>
            </section>

            <!--==================== NEWSLETTER ====================-->
            <section class="newsletter section container">
                <div class="newsletter__bg grid">
                    <div>
                        <h2 class="newsletter__title">Subscribe Our <br> Newsletter</h2>
                        <p class="newsletter__description">
                            Don't miss out on your discounts. Subscribe to our email 
                            newsletter to get the best offers, discounts, coupons, 
                            gifts and much more.
                        </p>
                    </div>

                    <form action="" class="newsletter__subscribe">
                        <input type="email" placeholder="Enter your email" class="newsletter__input">
                        <button class="button">
                            SUBSCRIBE
                        </button>
                    </form>
                </div>
            </section>
        </main>

        
        <!--=============== SCROLL UP ===============-->
        <a href="#" class="scrollup" id="scroll-up"> 
            <i class='bx bx-up-arrow-alt scrollup__icon' ></i>
        </a>

        <!--=============== SWIPER JS ===============-->
        <!-- ye replace karna padega -->
        <!-- <script src="assets/js/swiper-bundle.min.js"></script> -->

        <!--=============== MAIN JS ===============-->
        <!-- <script src="assets/js/main.js"></script> -->
   
</asp:Content>


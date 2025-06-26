<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/USER/MasterPage.master"  CodeFile="buyProduct.aspx.cs" Inherits="buyProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" rel="stylesheet"/>
    <style>
       

        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        body {
            background-color: #f0f2f5;
            color: #333;
        }
        a {
            text-decoration: none;
            color: white;
        }

        h1{
            font-size:1.6rem;
        }
        h4{
            font-size:1rem;
        }
        h3{
            font-size:0.7rem;
        }
        p{
            font-size:0.8rem;
        }


.menu{
    width:11%;
    cursor:default;
}

/*--product section--*/
.product-section{
    margin:20px 100px;
}
.product-div{
    border:1px solid black;
    padding:25px 25px;
}

.product-div .product{
    display:flex;
    gap:20px;
}

.image {
    width:30vw;
}
.image img{
    width:100%;
}

.buy-product{
    width:60vw;
    display:flex;
    flex-direction:column;
    justify-content:flex-start;
    gap:10px;
}
.buy-product h1{
    font-size:2rem;
}
.buy-product p{
    font-size:1rem;
}
.buy-product h2{
    font-size:2rem;
}
.num {
  display: flex;
  width:18%;
  align-items: center;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}
.num input[type="text"]{
  width: 60px;
  height: 50px;
  text-align: center;
  border: none;
  font-size: 24px;
  background-color: #fefefe;
  color: #333;
  border-left: 1px solid #ddd;
  border-right: 1px solid #ddd;

}

.num input[type="text"]:focus{
    outline:none;
}
.num input[type="submit"] {
  width: 50px;
  height: 50px;
  background: linear-gradient(135deg, #4b6cb7, #182848);
  border: none;
  color: white;
  font-size: 24px;
  cursor: pointer;
  transition: background 0.3s, transform 0.2s;
}

.num input[type=submit]:hover{
     background: linear-gradient(135deg, #182848, #4b6cb7);
     transform: scale(1.05);
}

.num input[type=submit]:active{
     transform: scale(1.15);
}

/*--Buttons editing buy now, add cart, continue shopping --*/

.btn{
    display:flex;
    gap:20px;
}
.btn .con_shop,.btn .cart{
    width:50%;
}

.btn .con_shop input[type=submit],.btn .cart input[type=submit]{
    width:100%;
    font-size:1.5rem;
    border:none;
    padding:10px; 
    border-radius:8px;
    font-weight:bold;
    background-color: #ff7f50;
    color:white;
    cursor:pointer;
    letter-spacing:1px;
    transition: transform 0.2s, background-color 0.3s, box-shadow 0.3s;
}

.btn .cart input[type=submit]{
    background-color: #32cd32;
}
.buy input[type=submit]{
    background-color: #1e90ff;
    color:white;
    width:100%;
    cursor:pointer;
    font-size:1.5rem;
    border:none;
    padding:10px; 
    border-radius:8px;
    font-weight:bold;
    letter-spacing:1px;
    transition: transform 0.2s, background-color 0.3s, box-shadow 0.3s;
}
.btn input[type=submit]:hover{
    transform: scale(1.05);
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
    background-color:darkorange;
}
.btn .cart input[type=submit]:hover{
    background-color:forestgreen;
    transform: scale(1.05);
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
}
.cart,.buy,.con_shop{
    position:relative;
}
.buy img{
    position:absolute;
    left:320px;
    top:10px;
    color:white;
    height:26px;
    filter:invert(100%);
transition: all 0.2s;

}
.con_shop i{
 position: absolute;
 left: 60px;
 top: 14px;
 color: white;
 font-size:1.2rem;
 font-weight:bold;  
transition: all 0.2s, color 0.3s;

}
.cart i{
 position: absolute;
 left: 90px;
 top: 11px;
 color: white;
 font-size:1.6rem;
transition: all 0.2s, color 0.3s;

}

.con_shop:hover  i{
    font-size:1.3rem;
    left:55px;
    top:14px;
}

.cart:hover i{
 left: 85px;
 top: 11px;
 font-size:1.6rem;
}

.buy:hover img{
 left:315px;
 top:10px;
 height:28px;
}

.buy input[type=submit]:hover{
    background-color:blue;
    transform: scale(1.05);
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
}
.buy input[type=submit]:active,.btn input[type=submit]:active{
      transform: scale(0.98);
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.ho {
        margin-top: 78px;
}
.home__img {
    width:70%;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<section class="product-section">
    <div class="product-div">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <asp:Repeater ID="rpt1" runat="server" EnableViewState="false" OnItemCommand="rpt1_ItemCommand" >
        <ItemTemplate>
        <div class="product">
            <div class="image">
                <img src='<%#Eval("image")%>' alt="product" runat="server" class="home__img"/>
            </div>
            <div class="buy-product">
                <h1><%#Eval("product")%></h1>
                <p><%#Eval("desc")%></p>

                <h2>₹<asp:Label ID="Label1" runat="server" CssClass="price" Text='<%#Eval("price")%>' ></asp:Label></h2>

                <div class="num">
                    <asp:Button Text="-" runat="server" OnClick="minus" CommandName="minus" />
                    <asp:TextBox ID="TextBox1" runat="server" Text="1" ></asp:TextBox>
                    <asp:Button Text="+" runat="server" OnClick="plus" CommandName="plus"  />
                </div>
                <div class="btn">
                    <div class="con_shop">
                        <asp:Button CssClass="conShop" Text="Continue Shopping" runat="server" OnClick="continueShop" CommandName="continueShop" />
                        <i class="fa-solid fa-angle-left"></i>
                    </div>
                    <div class="cart">
                        <asp:Button  Text="Add to Cart" runat="server" OnClick="cart" CommandName="cart" />
                        <i class="fa-solid fa-cart-plus"></i>
                    </div>
                </div>
                <div class="buy">
                    <asp:Button Text="Buy Now" runat="server" OnClick="buy" CommandName="buy" CommandArgument='<%#Eval("product_id")%>'/>                    
                    <img src="./image/buy.png" alt="buyImage" />
                </div>
            </div>
        </div>
        </ItemTemplate>
        </asp:Repeater>
        </ContentTemplate>
    </asp:UpdatePanel>
    </div>
</section>


  
</asp:Content>



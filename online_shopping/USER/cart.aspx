<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/USER/MasterPage.master"  CodeFile="cart.aspx.cs" Inherits="cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" rel="stylesheet"/>

    <style>
        *{
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


/*cart product section*/

.cart-product-section{
    padding:30px;
    width:100vw;
   
}
.cart-product{
    width:80vw;
    padding:15px;
    display:flex;
    gap:20px;
    margin:auto;
}

.row{
    width:100%;
    color:grey;
}

.total-amount{
    padding:10px;
    border:2px solid #808080;
    display:flex;
    flex-direction:column;
    gap:10px;
    height:25vh;
}

.price-detail{
    display:grid;
    grid-template-columns:1fr  1fr;
    gap:200px;
}

.remove-buttons{
    display:flex;
    align-items:end;
    justify-content:end;
    padding:5px;
    gap:20px;
}


#Button2:hover{
     background-color: #B22222; /* Dark red */
}

#Button2{
    padding:10px 5px;
    background-color: #FF0000; /* Bright red */
    color: white;
    border-radius:5px;
    font-size:1.2rem;
    border:none;
}
.shop-button{
    display:flex;
    justify-content:end;
    gap:30px;
    padding:10px;
}
.btn{
    padding:10px 5px;
    background-color: orange;
    border-radius:5px;
    font-size:1.2rem;
    border:none;
    color:white;
    transition:all 0.3s;
    border:2px solid orange;
    
}
.btn:hover{
    background-color:white;
    color:black;
    border:2px solid orange;
}

.products{
    border:2px solid #808080;
    padding:20px;
}
/*product inside design*/

.product
{
    display:flex;
    gap:10px;
}

.product .image{
    width:10vw;
    margin:auto 0;
}
.product .image img{
    width:100%;
}

.product .product-detail{
    width:25vw;
    display:flex;
    flex-direction:column;
    gap:10px;
    padding-bottom:30px;
}
/*plus minus designing button*/
.button {
 display: flex;
 width:180px;
  align-items: center;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
  padding:0;
}
.button input[type="text"]{
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

.button input[type="text"]:focus{
    outline:none;
}
.button input[type="submit"] {
  min-width: 60px;
  min-height: 50px;
  background: linear-gradient(135deg, #4b6cb7, #182848);
  border: none;
  color: white;
  font-size: 24px;
  cursor: pointer;
  transition: background 0.3s, transform 0.2s;
}

.delete{
    display:none;
}

.button input[type=submit]:hover{
     background: linear-gradient(135deg, #182848, #4b6cb7);
     transform: scale(1.05);
}

.button input[type=submit]:active{
     transform: scale(1.15);
}
       

.product-detail .name{
    font-size:1.3rem;
    font-weight:100;
}
.product-detail .desc{
    font-size:12px;
    color:#808080;
}

.product .price{
    font-size:20px; 
    font-weight:bold;
}
.cart {
    right:0;

}
.cart-product {
    margin-top:43px;
}
.total-amount {
    height:270px;
}
.footer__container {
    padding-bottom:0;
}
.section {
    padding:0;
}
.footer__copy {
    padding:10px 10px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <!-- cart product section -->
        <div class="cart-product-section">
            <hr class="row" />
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <div class="cart-product">
                
                  <div class="products">
                      <h1>My Cart</h1>
                      <div class="remove-buttons" >
                          <asp:Button ID="Button2"  runat="server" Text="✖ Remove All" OnClick="Button2_Click" />
                      </div>
                      <br />
                    
                       <asp:Repeater ID="rpt1" runat="server" EnableViewState="false" OnItemCommand="rpt1_ItemCommand" >
                         <ItemTemplate>
                         <div class="product">
                          <div class="image">
                              <img src='<%#Eval("image")%>' alt="product" runat="server"  />
                          </div>
                          <div class="product-detail" >
                              <div class="product-name">
                                    <h2 class="name"><%#Eval("product")%></h2>
                                    <p class="desc"><%#Eval("desc")%></p>
                              </div>
                                    <p class="price">₹ <%#Eval("price")%></p>
                              <div class="button">
                                    <asp:Button Text="-" ID="minus" CommandArgument='<%#Eval("cart_id") %>' runat="server" OnClick="minus" CommandName="minus" />
                                    <asp:Button Text='&#128465;' ID="delete" CommandArgument='<%#Eval("cart_id") %>' runat="server" OnClick="delete" CommandName="delete" CssClass="delete" />
                                    <asp:TextBox ID="TextBox1"   runat="server" Text='<%#Eval("quantity")%>' ></asp:TextBox>
                                    <asp:Button Text="+" CommandArgument='<%#Eval("cart_id") %>' runat="server" OnClick="plus" CommandName="plus"  />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                              </div>
                              
                             
                          </div>
                          <div class="delivery">    
                              <p>Delivery By Tue March 12 | <br /> Free ₹ 40 </p>
                          </div>
                       </div>
                      <hr class="row" />

                               </ItemTemplate>
                           </asp:Repeater>
                      <div class="shop-button">
                          <asp:Button ID="Button3" CssClass="btn" runat="server" Text="CONTINUE SHOPPING" OnClick="Button3_Click"  />
                          <asp:Button ID="Button4" CssClass="btn" runat="server" Text="PLACE ORDER" OnClick="Button4_Click"  />
                      </div>
                  </div>

                  <div class="total-amount">
                      <h2>Price Details</h2>
                      <hr class="row" />
                        <div class="price-detail">
                            <p>Price</p>
                            <p id="totalPrice" runat="server" >0</p>
                        </div>
                        <div class="price-detail">
                            <p>Items</p>
                            <p id="item" runat="server" >0</p>
                        </div>
                        <div class="price-detail">
                            <p>Delivery Charges</p>
                            <p id="del" runat="server">0</p>
                        </div>                        
                        <hr />
                      <div class="price-detail">
                            <p>Amount Payable</p>
                            <p id="payAmount" runat="server" >0</p>
                      </div>   
                  </div>
            </div>
                 </ContentTemplate>   
                 </asp:UpdatePanel>
        </div>



</asp:Content>
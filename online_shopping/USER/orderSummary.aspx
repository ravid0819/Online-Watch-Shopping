<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/USER/MasterPage.master" CodeFile="orderSummary.aspx.cs" Inherits="orderSummary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" rel="stylesheet"/>

    <style>
         * {
             margin:0;
             padding:0;
             font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
         }
        /* Global Styles */
      
            body {
                background-color: #f0f2f5;
                color: #333;
                overflow-x:hidden;
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

            .row{
                width:98vw;   
                margin:auto;
            }

            /*order summary section*/
            .total-amount{
                padding:10px;
                border:2px solid #808080;
                display:flex;
                flex-direction:column;
                gap:10px;
                height:25vh;
                width:30vw;
            }
            .row1{
                width:100%;
            }
            .price-detail{
                display:flex;
                justify-content:space-between;
                padding-inline:20px;
            }
            .order-summary-section{
                padding:30px 0;
                width:100vw;
                margin-top:45px;
            }
            .order-summary{
                width:80vw;
                padding:15px;
                display:flex;
                gap:20px;
                margin:auto;
            }

            .order-detail {
                width:60vw;
                display:flex;
                flex-direction:column;
                gap:20px;
            }
            .border{
                border:2px solid #808080;
            }
            .blue h2{
                background-color:blue;
                color:white;
                padding:5px 10px;
                font-size:1.2rem;
            }

            .login10 .user-detail{
                display:flex;
                justify-content:space-between;
                align-items:center;

                padding:10px;
            }
            .user-detail p{
                font-size:1rem;
                color:black;
            }

            .change{
                padding:5px 10px;
                color:blue;
                color:blue;
                font-size:1rem;
                border-radius:5px;
                border:2px solid blue;
                transition:all 0.3s;
            }
            .change:hover{
                background-color:blue;
                color:white;
            }

            .address{
                border:1px solid #808080;
                border-radius:5px;
                margin:10px;
                display:flex;
                justify-content:space-between;
                align-items:start;
                padding:5px;
            }
            .address-text p{
                padding:0;
                color:black;
                font-size:1rem;
            }
.num {
  display: flex;
  width:33%;
  align-items: center;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}
.num input[type="text"]{
  width: 40px;
  height: 40px;
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
  width: 30px;
  height: 40px;
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
.delete{
    display:none;
}

.product{
    display:flex;
    gap:20px;
    padding:10px;
}

.image {
    width:15vw;
}
.image img{
    width:60%;
}

.buy-product{
    width:20vw;
    display:flex;
    flex-direction:column;
    justify-content:flex-start;
    gap:10px;
}
.buy-product h1{
    font-size:1.2em;
}
.buy-product h3{
    font-size:1.3rem;
}

.payment{
    padding:10px 20px;
}

.payment-option hr{
    margin:5px 20px;
}

.place-order{
    border:2px solid orange;
    border-radius:5px;
    padding:5px 15px;
    color:black;
    background-color:white;
    transition:all 0.3s;
    font-size:1.3rem;

}
.place-order:hover{
    background-color:orange;
    color:white;
}

.order-btn{
    display:flex;
    justify-content:right;
    padding:10px 20px;
}
.section {
    padding:0;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


        <!-- order summary section -->
        <div class="order-summary-section">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <div class="order-summary">
                  <div class="order-detail">
                      <div class="login10 blue border">
                          <h2>LOGIN</h2>
                              <div class="user-detail">
                                <p>Username &nbsp;&nbsp;&nbsp;<span runat="server" id="username"></span></p>
                                <asp:Button ID="Button1" runat="server" CssClass="change" Text="Change" OnClick="Button1_Click" />
                              </div>
                      </div>                      
                      <div class="address-detail blue border">
                          <h2>DELIVERY ADDRESS</h2>
                          <div class="address">
                              <asp:Repeater ID="rpt1" runat="server" EnableViewState="false" OnItemCommand="rpt1_ItemCommand">
                                  <ItemTemplate>
                              <div class="address-text">
                                <p><%#Eval("full_name")%></p>
                                <p><%#Eval("address")%></p>
                                <p><%#Eval("city")%></p>
                                <p><%#Eval("state")%></p>
                                <p><%#Eval("pincode")%></p>
                                <p><%#Eval("number")%></p>
                               </div>
                                  </ItemTemplate>
                              </asp:Repeater>

                              <div class="change-button">
                                <asp:Button ID="Button2" runat="server" CssClass="change" Text="Change" OnClick="Button2_Click" />
                              </div>
                          </div>
                      </div>
           <div class="product-detail blue border">
            <h2>ORDER SUMMARY</h2>
             <div class="products">

          <asp:Repeater ID="rpt2" runat="server" EnableViewState="false" OnItemCommand="rpt2_ItemCommand" >
              <ItemTemplate>
           <div class="product">
            <div class="image">
                <img src='<%#Eval("image")%>' alt="product" runat="server" />
            </div>
            <div class="buy-product">
                <h1><%#Eval("product")%></h1>

                <h3>₹<asp:Label ID="Label1" runat="server" CssClass="price" Text='<%#Eval("price")%>' ></asp:Label></h3>

                <div class="num">
                    <asp:Button Text="-" runat="server" OnClick="minus" CommandArgument='<%#Eval("proid")%>' CommandName="minus" ID="minus" />
                    <asp:Button Text='&#128465;' ID="delete"  runat="server" OnClick="delete" CommandName="delete" CssClass="delete" CommandArgument='<%#Eval("proid")%>' />
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%#Eval("totalqty")%>' ></asp:TextBox>
                    <asp:Button Text="+" runat="server" OnClick="plus" CommandArgument='<%#Eval("proid")%>' CommandName="plus" ID="plus"  />
                </div>
            </div>
               
        </div>
                <hr />
                </ItemTemplate>
          </asp:Repeater>
        </div>
        </div>
                      <div class="payment-option border blue">
                          <h2>PAYMENT OPTION</h2>
                          <div class="payment">
                          <asp:RadioButton ID="RadioButton1" runat="server" cssClass="radio" GroupName="payment"  Text="&nbsp;&nbsp;Pay Online" TextAlign="Right" /> <br />
                          <asp:RadioButton ID="RadioButton2" runat="server" cssClass="radio" GroupName="payment"  Text="&nbsp;&nbsp;Cash On Delivery" TextAlign="Right" /><br />
                          <asp:RadioButton ID="RadioButton3" runat="server" cssClass="radio" GroupName="payment"  Text="&nbsp;&nbsp;Normal Delivery" TextAlign="Right" /><br />
                          <asp:RadioButton ID="RadioButton4" runat="server" cssClass="radio" GroupName="payment"  Text="&nbsp;&nbsp;Fast Delivery" TextAlign="Right" /><br />
                          </div>
                          <hr />
                          <div class="order-btn">
                            <asp:Button ID="Button3" CssClass="place-order" runat="server" Text="Place Order" OnClick="Button3_Click" />
                          </div>
                      </div>

                  </div>
                
                  <div class="total-amount">
                      <h2>Price Details</h2>
                      <hr class="row1" />
                        <div class="price-detail">
                            <p>Price</p>
                            <p id="total_price" runat="server" >0</p>
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
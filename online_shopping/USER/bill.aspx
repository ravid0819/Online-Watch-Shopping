<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/USER/MasterPage.master"  CodeFile="bill.aspx.cs" Inherits="bill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
         * {
             margin:0;
             padding:0;
             font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
         }
      
         body {
            background-color:#f1eded;
         }
        .bill-section{
            padding:10px 0;
            height:100vh;
            width:100vw;
            margin-top:100px;
        }
        .bill-page{
            margin:auto;
            padding:20px;
            width:40vw;
            border-radius:5px;
            border:1px solid lightgrey;
            background-color:white;
            box-shadow:0 0 10px lightgrey;
        } 
 .footer__copy{
     margin:10px 10px;
 }
        .grid1{
            display:grid;
            grid-template-columns:1fr 1fr;
            padding:20px 0;
        }
        .logo{
            display:flex;
            flex-direction:column;
            gap:10px;
        }
        .pay-to{
            text-align:right;
        }

        .logo img{
            width:100px;
        }
        .pay-btn{
            width:max(2vw, 100px);
            font-weight:bold;
        }
        #Button2{
            display:none;
        }

        .btn{
            display:flex;
            justify-content:end;
        }
        /*table styling*/
        .invoice-container {
            width: 35vw;
            margin: 20px auto;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .invoice-header {
            font-size: 18px;
            font-weight: bold;
            padding:10px;
            border-bottom:1px solid #808080;
            margin-bottom: 20px;
            background-color: #f4f4f4;
            border-top-right-radius:8px;
            border-top-left-radius:8px;
        }
        .invoice-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .invoice-table th, .invoice-table td {
            padding: 10px;
            text-align: left;
        }
        .table{
            padding:20px;
        }
        .invoice-table th {
            background-color: #f4f4f4;
            border-bottom: 2px solid #ddd; /* Header underline */
        }
        .invoice-table tr {
            border-bottom: 1px solid #ddd; /* Row underline */
        }
        .invoice-table tr:last-child {
            border-bottom: none; /* No underline for last row */
        }
        .total-row td {
            font-weight: bold;
            text-align: right;
        }
        .total-row td:first-child {
            text-align: left;
        }
        .grey{
            background-color: #f4f4f4;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


        <div class="bill-section">
            <div class="bill-page">
                <div class="bill-heading grid1">
                    <div class="logo">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/image/logo.png" />
                        <h2 id="bill_no" runat="server" ></h2>
                    </div>
                    <div class="btn">
                    <asp:Button ID="Button1" runat="server" Text="Pay Now" CssClass="pay-btn" OnClick="Button1_Click" style="height: 29px"  />
                    <asp:Button ID="Button2" runat="server" Text="Back" CssClass="pay-btn" OnClick="Button2_Click" style="height: 29px"  />
                    </div>
                </div>
                <hr class="row" />
                <div class="bill-detail grid1">
                    <div class="user-detail">
                        <h3>Invoiced To:</h3>
                        <p runat="server" id="name"></p>
                        <p runat="server" id="address"></p>
                        <p><span runat="server" id="city"></span><span runat="server" id="state"></span></p>
                        <p runat="server" id="pincode"></p>
                    </div>
                    <div class="pay-to">
                        <h3>Pay To:</h3>
                        <p>Shantinagar Soc.,<br />Near Zariya Mahadev Mandir,</p>
                        <p>Mahavirnagar,</p>
                        <p>Himmatnagar, Gujarat.</p>
                        <p>7041299493</p>
                        <br />
                        <p>GST : 08KBPR0611N2Z2</p>
                        <br />
                        <h4>Invoice Date:</h4>
                        <p runat="server" id="time"></p>
                    </div>
                </div>
    <div class="invoice-container">
        <div class="invoice-header">
            Invoice Items
        </div>
        <div class="table">
        <table class="invoice-table" >
            <thead>
                <tr>
                    <th>Sr</th>
                    <th>Product</th>
                    <th>Price</th>
                    <th>QTY</th>
                    <th>Amount</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rpt1" runat="server" EnableViewState="false" OnItemCommand="rpt1_ItemCommand">
                    <ItemTemplate>

                <tr>
                    <td class="sr-no"></td>
                    <td><%#Eval("product")%></td>
                    <td><%#Eval("price")%></td>
                    <td><%#Eval("qty")%></td>
                    <td>Rs. <%#Eval("total_amount")%></td>
                </tr>
                    </ItemTemplate>
                </asp:Repeater>

                <tr class="total-row grey">
                    <td colspan="4">Shipping Charge</td>
                    <td id="del_charge" runat="server" >Rs. 0</td>
                </tr>
                <tr class="total-row grey">
                    <td colspan="4">Full Total</td>
                    <td id="bill_amount" runat="server" >Rs. 0</td>
                </tr>
            </tbody>
        </table>
            </div>
    </div>

            </div>
        </div>
 
    <script>
        let sr_no = document.getElementsByClassName("sr-no");

        for (let i = 0; i < sr_no.length; i++) {
            sr_no[i].innerText = i+1;
        }

    </script>

</asp:Content>

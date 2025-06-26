<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/USER/MasterPage.master"  CodeFile="QrCode.aspx.cs" Inherits="QrCode" %>


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

            /*scanner aama 6*/
            .scan{
                display:flex;
                justify-content:center;
                align-items:center;
                flex-direction:column;
                gap:20px;
                padding:20px;
                margin-top:100px;
            }
            .scan h3{
                font-size:20px;
            }
            .upi{
                height:50px;
            }
            .scan-image{
                height:250px;
            }
            .btn{
                padding:5px 10px;
                background-color:blue;
                color:white;
                font-size:16px;
                border:none;
                border-radius:5px;
            }
  




    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


        <div class="scan">
            <h2>Amount to Pay: <span runat="server" id="paybale_amount"></span></h2>
            <br />
            <br />
            <br />
            <img src="./image/upi.png" class="upi" />
            <h3>UPI Payment accepted here</h3>
            <h1>Viral Suthar</h1>
            <p>Scan QR Code with your PSP App</p>
            <img src="./image/pay_qrCode.png" class="scan-image" />
            <p>Or Pay to VPA</p>
            <h2>viralsuthar5400-1@okhdfcbank</h2>
            <asp:Button ID="Button1" runat="server" CssClass="btn" Text="Payment Inquiry" OnClick="Button1_Click" />
        </div>


</asp:Content>

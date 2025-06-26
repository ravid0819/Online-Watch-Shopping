<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/USER/MasterPage.master" CodeFile="pay_inquiry.aspx.cs" Inherits="pay_inquiry" %>

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

           

            .scan{
                display:flex;
                justify-content:center;
                align-items:center;
            }

            /*submit inquiry*/
            .pay_inquiry{
                width:100vw;
                display:flex;
                justify-content:center;
                padding:20px;
                margin-top:100px;
            }
            .inquiry-input{
                display:flex;
                gap:50px;
            }

            .inquiry{
                width:80vw;
                display:flex;
                flex-direction:column;
                gap:20px;
            }

            .flex{
                display:flex;
                flex-direction:column;
                width:10vw;
                gap:5px;
            }
            .input{
                width:100%;
                border-radius:20px;
                padding:5px 15px;
                margin-left:-5px;
            }
            .label{
                font-size:14px;
            }
            
            #Button1{
                background-color:blue;
                border:none;
                padding:5px 15px;
                border-radius:5px;
                font-size:16px;
                color:white;
            }

            
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">




        <div class="pay_inquiry">
            <div class="inquiry">
                <div class="inquiry-input">
                    <div class="subject flex">
                        <asp:Label ID="Label1" runat="server" CssClass="label" Text="Subject"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="input"></asp:TextBox>
                    </div>
                    <div class="message flex">
                        <asp:Label ID="Label2" runat="server" CssClass="label" Text="Message"></asp:Label>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="input"></asp:TextBox>
                    </div>
                    <div class="urgency flex">
                        <asp:Label ID="Label3" runat="server" CssClass="label" Text="Urgency"></asp:Label>
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="input"></asp:TextBox>
                    </div>

                </div>
                <div class="pay_image">
                    <asp:FileUpload ID="image" runat="server" />
                </div>
                <div class="submit">
                    <asp:Button ID="Button1" runat="server" Text="Submit Inquiry" OnClick="Button1_Click" />
                </div>
            </div>
        </div>

        
    
</asp:Content>
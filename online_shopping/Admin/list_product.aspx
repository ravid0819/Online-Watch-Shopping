<%@ Page Language="C#" AutoEventWireup="true" CodeFile="list_product.aspx.cs" Inherits="Admin_list_product" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .text-box {
            height: 2em;
            width: 98%;
            margin-bottom: 0.8em;
        }

        tr, td, th, .title_table {
            padding: 0.8em 0.8em;
            border: 0.5px solid black;
        }

        .dropdown-box {
            height: 2em;
            width: 98.7%;
            padding: 1px;
            margin-bottom: 1.5em;
            font-size: 1em;
            padding-left: 10px;
        }

        .button {
            background-color: cornflowerblue;
            border: 0;
            border-radius: 5px;
            color: white;
            letter-spacing: 1px;
            color: White;
            font-size: 1.1em;
        }

        .tab {
            box-sizing: border-box;
            border-collapse: collapse;
            border: 0.5px solid black;
            border-radius: 0px 0px 5px 5px;
            background-color: white;
            width: 100%;
        }

        .title_table {
            border: 0.5px solid black;
            text-align: left;
            border-radius: 5px 5px 0px 0px;
            border-collapse: collapse;
        }

        .back {
            margin-top: 1em;
            float: right;
            background-color: #3399FF;
        }

        .closebtn {
            background-color: red;
            margin: 0px 0.7em;
        }

        .delete {
            background-color: red;
        }

        .leftbar {
            position: fixed;
            width: 10%;
            height: 100%;
            background-color: cornflowerblue;
            float: left;
            top: 0;
            left: 0;
            display: inline-block;
        }

        .whitetext {
            color: aliceblue;
        }

        .auto-style1 {
            color: aliceblue;
            text-align: center;
        }

        .auto-style2 {
            color: aliceblue;
            line-height: 20px;
            margin-left: 2.7em;
        }

        .a {
            text-align: center;
            margin-left: 0px;
        }

        .auto-style3 {
            text-align: left;
            color: aliceblue;
            margin-left: 5%;
            font-size: 12px;
        }

        .auto-style4 {
            width: 95%;
            opacity: 50%;
        }

        .rightbar {
            position: relative;
            height: 100%;
            background-color: whitesmoke;
            width: 90%;
            left: 10%
        }

        .header {
            box-sizing: border-box;
            position: sticky;
            z-index: 1000;
            top: 0;
            background-color: white;
            padding: 20px;
        }

        .mid {
            position: relative;
            box-sizing: border-box;
            width: 100%;
            padding: 25px;
            height: 100%;
        }

        .footer {
            box-sizing: border-box;
            position: sticky;
            background-color: white;
            text-align: center;
            padding: 20px;
            bottom: 0;
            width: 100%;
            left: 20%;
            z-index: 1000;
        }

        .search {
            height: 20px;
            width: 25vw;
        }

        .btn {
            height: 25px;
            width: 30px;
            background-color: cornflowerblue;
        }
        /*.button
{
border:0 ;
border-radius: 5px;
letter-spacing: 1px;
color:White;
    
}*/
        .back {
            float: right;
            background-color: #3399FF;
        }

        .cat-tabel {
            width: 100%;
            border: 0.5px solid black;
            border-radius: 5px;
        }

        .auto-style6 {
            text-align: center;
        }

        .box {
            height: 25px;
            width: 95%;
            margin-bottom: 10px;
        }

        #ContentPlaceHolder1 {
            height: 78%;
        }

        .left-side {
            width: 10%;
            height: 100vh;
            background-color: deepskyblue;
            display: flex;
            align-items: center;
            /*justify-content:center;*/
            flex-direction: column;
            float: left;
        }

        .auto-style1 {
            color: #FFFFFF;
            height: 3px;
            width: 100%;
        }
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin: 0; padding: 0;">

            <div class="leftbar">
                <div>
                    <h3 class="auto-style1">ESHOPPING</h3>
                    <h5 class="auto-style2 a">ADMIN</h5>
                </div>
                <hr class="auto-style4" />
                <div>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/cat_list.aspx">Category List</asp:HyperLink>
                    <hr class="auto-style4" />
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Admin/list_product.aspx">Product List</asp:HyperLink>
                    <hr class="auto-style4" />
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Admin/bills_page.aspx">Bills list</asp:HyperLink>
                    <hr class="auto-style4" />
                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Admin/orders_page.aspx">Order list</asp:HyperLink>
                    <hr class="auto-style4" />
                    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Admin/payment_inquire_page.aspx">payment inquiry</asp:HyperLink>
                    <hr class="auto-style4" />

                </div>
            </div>
            <div class="rightbar">
                <div class="header">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="search"></asp:TextBox><asp:Button ID="Button1" runat="server" CssClass="btn" />
                </div>

                <div class="mid">
                    <h2 style="display: inline-block">Third Category List</h2>
                    <asp:Button ID="Button2" runat="server" Text="+ Add" CssClass="button back" Height="2em" Width="5em" OnClick="Button2_Click" />
                    <div class="title_table">
                        Thirdcategory
                    </div>
                    <div style="border: 0.5px solid black; background-color: white; padding: 15px;">
                        <table class="tab">
                            <tr>
                                <th>Edit</th>
                                <th>Delete</th>
                                <th>Category</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Color</th>
                                <th>Image</th>
                                <th>Description</th>
                                <th>Status</th>
                            </tr>
                            <asp:Repeater ID="Rpt3" runat="server" EnableViewState="false" OnItemCommand="Rpt3_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td><a class="edit" href='Add_Product.aspx?Edit=<%#Eval("product_id") %>'>Edit</a></td>
                                        <td>
                                            <asp:Button ID="Button1" runat="server" Text="Delete" CssClass="delete button" CommandArgument='<%#Eval("product_id") %>' Height="2em" Width="5em" /></td>
                                        <td><%#Eval("category") %></td>
                                        <td><%#Eval("product") %></td>
                                        <td><%#Eval("price") %></td>
                                        <td>
                                            <input type="color" value="<%#Eval("color") %>"/>
                                        </td>
                                        <td> 
                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("image") %>'  Width="100px"/></image> 
                                        </td>
                                        <td><%#Eval("[desc]") %></td>
                                        <td><%#Eval("status") %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </div>
                </div>
                <div class="footer">
                    Copyright @ Your Website 2019
                </div>
            </div>

        </div>




    </form>
</body>
</html>

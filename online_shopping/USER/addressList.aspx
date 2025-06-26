<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/USER/MasterPage.master"  CodeFile="addressList.aspx.cs" Inherits="addressList" %>


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

        /* Navbar Styles */
        .navbar {
            background-color: #0078d7; /* Light blue color */
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;    
            color: white;
        }
        .navbar .left {
            font-size: 18px;
        }
        .navbar .right a {
            font-size: 17px;
            font-weight: bold;
        }

        /* Logo Section */
        .logo-section {
            text-align: center;
            margin: 20px 0;
        }
        .logo-section img {
            height: 80px;
        }

        /* Search Bar Styles */
        .search-bar {
            text-align: center;
            margin: 20px 0;
        }
        .search-bar input[type="text"] {
            width: 400px;
            padding: 12px;
            border: 2px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            outline: none;
        }
        .search-bar input[type="submit"] {
            padding: 12px 25px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 5px;
            margin-left: 10px;
            font-size: 16px;
            cursor: pointer;
        }
        .search-bar input[type="submit"]:hover {
            background-color: #555;
        }

        /* Category Styles */
        .category {
            font-weight: bold;
            margin-top: 20px;
            border-top:1px solid black;
            border-bottom:1px solid grey;
            color: black;
            padding-inline:20px;
            position:relative;
            padding-block:20px;
            font-size:1.5rem;
        }
        /* Dropdown List */
#categoryList {
    list-style-type: none;
    padding: 0;
    margin: 0;
    display: none; /* Initially hidden */
    background-color: #333;
    position: absolute;
    width: 100%;
    top: 100%;
    left: 0;
    z-index: 1;
}

#categoryList li {
    padding: 10px;
    color: white;
    font-size: 1.5rem;
    font-weight: 500;
    cursor: pointer;
}

#categoryList li:hover {
    background-color: #555;
}

.menu{
    width:11%;
    cursor:default;
}
/* Icon style for dropdown */
.category .icon {
    position: absolute;
    left: 160px;
    top: 20px;
    color: black;
    font-size: 1.3rem;
}

/*address list section*/
.address-list{
    display:flex;
    flex-direction:column;
    width:40vw;
    margin:100px  auto;
    padding:15px;
    box-shadow:0px 0px 20px darkgrey;
    border-radius:15px;
    gap:10px;
}
.address-heading{
    display:flex;
    justify-content:space-between;
    padding-bottom:10px;
    align-items:center;
}
.btn{
    color:white;
    background-color:darkgrey;
    border:none;
    cursor:pointer;
    padding:5px 15px;
    font-size:1rem;
    border-radius:5px;
}
.row{
    width:100%;
    color:#808080;
}

.address{
    padding:10px;
    display:flex;
    justify-content:space-between;
    align-items:start;
    border:1px solid #808080;
    border-radius:15px;
}

.address p{
    font-size:1rem;
    color:black;
}
.buttons{
    display:flex;
    gap:5px;
    align-items:start;
    justify-content:center;
}
.address .edit-delete{
    border:2px solid #808080;
    padding:5px;
    border-radius:5px;
}


    /* Footer Styles */
.footer-end {
  text-align: center;
  padding: 20px;
  background-color: #0078d7;
  color: white;
}
        

.footer {
  background-color: #473D5D; /* The exact background color */
  padding: 40px 0;
  padding-bottom:0;
  color: #fff;
}

.container {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
  padding-bottom:30px;
}

.footer-column {
  width: 16%;
}

.footer-column h3 {
  font-size: 18px;
  margin-bottom: 10px;
}

.footer-column ul {
  list-style-type: none;
}

.footer-column ul li {
  margin-bottom: 8px;
}

.footer-column ul li a {
  color: #fff;
  text-decoration: none;
  font-size: 14px;
}

.footer-column ul li a:hover {
  text-decoration: underline;
}

.address-column {
  width: 20%; /* A bit wider for the address column */
}

.address-column p {
  font-size: 14px;
  line-height: 1.6;
}

    </style>   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

       
        <div class="address-list">
            <div class="address-heading">
                <h1>Shipping Address List</h1>
                <asp:Button ID="Button1" CssClass="btn" runat="server" Text="+ Add" OnClick="Button1_Click" />
            </div>
            <div class="row">
            <hr />
            </div>
                <asp:Repeater runat="server" EnableViewState="false" OnItemCommand="rpt1_ItemCommand" ID="rpt1" >
                    <ItemTemplate>
                    <div class="address">
                        <div class="detail">
                            <p><%#Eval("full_name")%></p>
                            <p><%#Eval("address")%></p>
                            <p><%#Eval("city")%></p>
                            <p><%#Eval("state")%></p>
                            <p><%#Eval("pincode")%></p>
                            <p><%#Eval("number") %></p>
                        </div>
                        <div class="buttons">
                            <asp:Button ID="Button2" CommandName="delete" CommandArgument='<%#Eval("id")%>'  runat="server" cssClass="edit-delete" Text="&#128465;" />
                            <asp:Button ID="Button3" CommandName="edit" CommandArgument='<%#Eval("id")%>' runat="server" cssClass="edit-delete" Text="&#9998;" />
                            <asp:Button ID="Button4" CommandName="select" CommandArgument='<%#Eval("id")%>' runat="server" CssClass="btn" Text="&#10003; Select" />
                        </div>
                    </div>
                    </ItemTemplate>
                </asp:Repeater>

        </div>

  

</asp:Content>

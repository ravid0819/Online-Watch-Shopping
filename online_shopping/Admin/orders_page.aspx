<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="orders_page.aspx.cs" Inherits="Admin_orders_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
         <style>
         .text-box {
             height:2em;
             width:98%;
             margin-bottom:0.8em;
         }
         tr,td,th,.title_table{
                 padding:0.8em 2em;
                 text-align:center;
                 border:0.5px solid black;
         }
        
         .dropdown-box {
             height:2em;
             width:98.7%;
             padding:1px;
             margin-bottom:1.5em;
             font-size:1em;
             padding-left:10px;
         }
         
         .button
         {
             background-color: cornflowerblue;
             border:0 ;
             border-radius: 5px;
             color: white;
             letter-spacing: 1px;
             color:White;
             font-size:1.1em;
         }
         .tab {
             box-sizing:border-box;
             border-collapse:collapse;
             border:0.5px solid black;
             border-radius:0px 0px 5px 5px;
             background-color:white;
             width:100%;
         }
         .title_table {
             border:0.5px solid black;
             text-align:left;
             border-radius:5px 5px 0px 0px;
             border-collapse:collapse;
             
         }
         .back {
              margin-top:1em;
             float:right;
             background-color:#3399FF;
         }
         .closebtn {
             background-color:red;   
             margin:0px 0.7em;
         }
         .delete {
             background-color:red;
         }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <div class="title_table">
            orders
        </div>
        <div style="border:0.5px solid black;background-color:white;padding:15px;">
          <table class="tab">
                    <tr>
                        <th >order_id</th>
                        <th >proid</th>
                        <th >custid</th>
                        <th >invoice</th>
                        <th >orderdate</th>
                        <th >totalqty</th>
                     </tr>

              <asp:Repeater EnableViewState="false" ID="rpt1" runat="server">
                  <ItemTemplate>
                      <tr>
                          <td><%#Eval("order_id")%></td>
                          <td><%#Eval("proid")%></td>
                          <td><%#Eval("custid")%></td>
                          <td><%#Eval("invoice")%></td>
                          <td><%#Eval("orderdate")%></td>
                          <td><%#Eval("totalqty")%></td>
                      </tr>

                  </ItemTemplate>
              </asp:Repeater>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="bills_page.aspx.cs" Inherits="Admin_bills_page" %>

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
            bills page
        </div>
        <div style="border:0.5px solid black;background-color:white;padding:15px;">
          <table class="tab">
                    <tr>
                        <th >bill_id</th>
                        <th >ship_id</th>
                        <th >cus_id</th>
                        <th >pr_id</th>
                        <th >invoice</th>
                        <th >qty</th>
                        <th >total_amount</th>
                        <th >pay_status</th>
                        <th >bill_date</th>
                     </tr>

              <asp:Repeater EnableViewState="false" ID="rpt1" runat="server">
                  <ItemTemplate>
                      <tr>
                          <td><%#Eval("bill_id")%></td>
                          <td><%#Eval("ship_id")%></td>
                          <td><%#Eval("cus_id")%></td>
                          <td><%#Eval("pr_id")%></td>
                          <td><%#Eval("invoice")%></td>
                          <td><%#Eval("qty")%></td>
                          <td><%#Eval("total_amount")%></td>
                          <td><%#Eval("pay_status")%></td>
                          <td><%#Eval("date_time")%></td>
                      </tr>

                  </ItemTemplate>
              </asp:Repeater>
</asp:Content>


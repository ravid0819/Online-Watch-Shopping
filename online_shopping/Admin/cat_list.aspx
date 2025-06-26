<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="cat_list.aspx.cs" Inherits="Admin_cat_list" %>

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
        <h2 style="display:inline-block" >Category List</h2><asp:Button ID="Button2" runat="server" Text="+ Add" CssClass="button back" Height="2em" Width="5em" OnClick="Button2_Click" />
        <div class="title_table">
            categories
        </div>
        <div style="border:0.5px solid black;background-color:white;padding:15px;">
          <table class="tab">
                    <tr>
                        <th >
                            Edit
                        </th>
                        <th >
                            Delete
                        </th>
                        <th >ID</th>
                        <th >Category</th>
                        <th >Status</th>
                     </tr>

              <asp:Repeater EnableViewState="false" ID="rpt1" runat="server" OnItemCommand="rpt1_ItemCommand">
                  <ItemTemplate>
                      <tr>
                          <td><a class="edit" href='Add_Category.aspx?Edit=<%#Eval("cat_id") %>'>Edit</a></td>
                          <td>
                              <asp:Button CssClass="button delete" runat="server" CommandArgument='<%#Eval("cat_id")%>' Text="Delete" Height="2em" Width="5em" /></td>
                          <td><%#Eval("cat_id")%></td>
                          <td><%#Eval("category")%></td>
                          <td><%#Eval("status")%></td>
                      </tr>

                  </ItemTemplate>
              </asp:Repeater>

        
                </table>
        </div>
    </asp:Content>
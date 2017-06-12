<%@ Page Language="C#" AutoEventWireup="true" CodeFile="docpage2.aspx.cs" Inherits="docpage2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>

        .div1 {

            background-color :orange;
            width:30%;
            height:200px;
            float:left;
            
        }
         .div2 {

            background-color : red ;
            width:30%;
            height:200px;
            float:left;
            margin-left:5%;

            
        }
 .div3 {

            background-color : blue;
            width:30%;
            height:200px;
            float:left;
             margin-left:5%;
        }
        .divhead {

            width:100%;
            height:100px;
            background-color:black;
            margin-bottom:10px;


        }
        .block {
        width: 50px;
        height: 30px;
        background-color:black;
        border: 1px solid white;
        float: left;
        margin: 2px;
        border-radius: 10px;
        text-align: center;
        font-size: 16px;
        font-family: Calibri;
        color: white;
        text-decoration:none;    
    }


        .auto-style1 {
            width: 100%;
        }


    </style>



</head>
<body>
    <form id="form1" runat="server">
    <div>
<div id="divhead" class="divhead">

</div>        


    <div id="div1" class="div1">

        <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="124px" OnSelectionChanged="Calendar1_SelectionChanged" ShowGridLines="True" Width="171px">
            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
            <OtherMonthDayStyle ForeColor="#CC9966" />
            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
            <SelectorStyle BackColor="#FFCC66" />
            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
        </asp:Calendar>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="Todays Appointment" OnClick="Button1_Click" />


        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1"  OnItemCommand="Repeater1_ItemCommand" >
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="block"  CommandName ="get_Bid" CommandArgument='<%# Eval("booking_id")%>'><%# Eval("slot_time")%></asp:LinkButton>
            </ItemTemplate>

        </asp:Repeater>


    </div>
        <div id ="div2" class="div2">

            <table class="auto-style1" id="tblProfile">
                <tr>
                    <td>name</td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>user id </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>password</td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>

            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="View" />
            <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>

        </div>
        <div id ="div3" class="div3">

            <table class="auto-style1" id="tblProfile2">
                <tr>
                    <td>name</td>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>user id </td>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>password</td>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
            </table>

        </div>
    </div\>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myProjectConnectionString %>" SelectCommand="select  convert(char(5), doc_slots.slot_time , 108) slot_time , test_bookings.booking_id from doc_slots, test_bookings where
 test_bookings.slot_id = doc_slots.slot_id
  AND [date] = @date 
  AND [doc_id] = @doc_id">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label1" Name="date" PropertyName="Text" />
                <asp:SessionParameter Name="doc_id" SessionField="docId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>

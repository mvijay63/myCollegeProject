<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Find.aspx.cs" Inherits="Find" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, intial-scale=1" />
    <link rel="stylesheet" href="files/bootstrap/css/bootstrap.min.css" />
    <script src="files/jquery/jquery-3.1.1.min.js"></script>
    <script src="files/bootstrap/js/bootstrap.min.js"></script>
    <script src="files/javascript/HomeJs.js"></script>
    <script src="files/jquery/jqueryCustom/jquery-ui.js"></script>
    <link rel="stylesheet" href="files/jquery/jqueryCustom/jquery-ui.css" />
    <link rel="stylesheet" type="text/css" href="files/CSS/HomePage.css" />
    <link rel="stylesheet" type="text/css" href="files/CSS/FindCss.css" />
    
    <script>
        $(function () {
            $("#datepicker").datepicker();
        });
    </script>
    <style>
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            padding-top: 100px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
        }

        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

        .ModalClick {
            display: block;
            position: fixed;
            z-index: 1;
            padding-top: 100px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
        }

        .repeterDivHeight{
            margin-left:9%;

        }
         @media screen and (max-width:786px){
            .repeterDivHeight {
                height:230px;
            }
      
        }
          @media screen and (max-width:385px){
            .repeterDivHeight {
                height:350px;
                margin-left:0px;
            }
      
        }
     
          .slotPickBtn{
            background-color:#67C567;
            border:none;
            color:white;

        }
        .ImageIconPad{
            padding-top:10px;
        }

        

        .DocSlotPickBtn{
            border:none;
            color:white;
            background-color:#67C567;
            border-radius:3px;
            margin-top:15%;
            height:35px;
        }
        .DocSearchBtn{
            width:100%;
            background-color:#F58220;
            border:none;
        }
        .BookTxt{
            font-size:30px;
            color:#67C567;
            font-weight:500;
        }
  
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#MyNavbar">
                        <span class="icon-bar"></span>
                        <!--icon bar is used here to display 3 horizontal line when we resize browser-->
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#HomePage">
                        <img src="images/logoo.png" /></a>
                </div>
                <div class="collapse navbar-collapse" id="MyNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="javascript:void(0)" onclick="LoginPopupClick()">LOGIN</a></li>
                        <li><a href="Registration.aspx">REGISTER</a></li>
                        <li><a href="KnowMore.aspx">FEATURES</a></li>
                        <li><a href="#">CONTACT</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <asp:Label ID="SignLbl" runat="server" Text="LOGIN/REGISTER"></asp:Label><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#Doctor">
                                    <asp:LinkButton ID="LogOutBtn" runat="server" OnClick="LogOutBtn_Click">
                                        <asp:Label ID="DropDownLbl" runat="server" Text="LOGOUT"></asp:Label></asp:LinkButton></a></li>
                                
                            </ul>
                        </li>
                       
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container-fluid GeneralHeader">
        </div>
        <div class="container-fluid FindNoPadding FindSearchPanelDiv">
            <div class="row SearchDocHosClinic FindNoMargin">
                <div>
                    <center><h1>Find Your Best Doctor, Hospital, Clinic, Pharmach and Pathology</h1></center>
                </div>
                <div>
                    <div class="row FindSearchPanel FindNoMargin">
                        <div class="col-sm-3 FindNoPadding">
                            <asp:DropDownList CssClass="FindDrpDwnWidth" ID="FindCityDrpDwn" runat="server" OnSelectedIndexChanged="FindCityDrpDwn_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                        </div>
                        <div class="col-sm-3 FindNoPadding">
                            <asp:DropDownList CssClass="FindDrpDwnWidth" ID="FindLocationDrpDwn" runat="server"></asp:DropDownList>
                        </div>
                        <div class="col-sm-5 FindNoPadding">
                            <asp:DropDownList CssClass="FindDrpDwnWidth" ID="FindSpecialtyDrpDwn" runat="server"></asp:DropDownList>
                        </div>
                        <div id="DocSearch" class="col-sm-1 FindNoPadding FindSearchGlyphicon">
                            <asp:Button CssClass="DocSearchBtn" ID="DocSearchBtn" runat="server" Text="Search" OnClick="DocSearchBtn_Click" />
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="container FindNoPadding" style="padding-bottom:10px;padding-top:10px;">
            <asp:Repeater ID="BookingRptr" runat="server" OnItemCommand="BookingRptr_ItemCommand">
                <ItemTemplate>
                 <div class="container FindNoPadding" style="background-color: whitesmoke; border: 1px solid black;">
                        <div class="row FindNoMargin">
                            <div class="col-sm-6">
                                <div class="row FindNoMargin">
                                    <div class="col-xs-3 ImageIconPad">
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/doctor-male.png" Width="75" Height="75" />
                                    </div>
                                    <div class="col-xs-9">
                                        <asp:Label ID="DocNameLbl" CssClass="LabelBlock"  style="font-size:large" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                        <asp:Label ID="Degree1Lbl" runat="server" Text='<%#Eval("Degree1") %>'></asp:Label>
                                        <asp:Label ID="Degree2Lbl" runat="server" Text='<%#Eval("Degree2") %>'></asp:Label>
                                        <asp:Label ID="Degree3Lbl" runat="server" Text='<%#Eval("Degree3") %>'></asp:Label>
                                        <asp:Label ID="Specialization" CssClass="LabelBlock" runat="server" Text='<%#Eval("Specialization") %>'></asp:Label>
                                        <asp:Label ID="PracticingTxtLbl" CssClass="LabelBlock" runat="server" Text="Practicing At:"></asp:Label>
                                        <asp:Label ID="Address" runat="server" Text='<%#Eval("Address") %>'></asp:Label>
                                        <asp:Label ID="ContactTxtLbl" CssClass="LabelBlock" runat="server" Text="Contact:"></asp:Label>
                                        <asp:Label ID="Mobile" runat="server" Text='<%#Eval("Phone") %>'></asp:Label>
                                        <asp:Label ID="Landline1" runat="server" Text='<%#Eval("Landline1") %>'></asp:Label>


                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 FindNoPadding FindNoMargin">
                                <div class="row FindNoMargin FindNoPadding DivMargin">
                                    <div class="col-xs-4 DivBlockEdit LeftBorder">
                                        <center>
                                        <span class="Block" style="background-color:lightblue">Exprience</span>
                                        <%#Eval("Exprience") %> years
                                        </center>
                                    </div>
                                    <div class="col-xs-4 DivBlockEdit LeftBorder">
                                        <center>
                                        <span class="Block" style="background-color:lightblue">Fees</span>
                                        <%#Eval("Fees") %> Rs
                                        </center>
                                    </div>
                                    <div class="col-xs-4 DivBlockEdit">
                                        <center>
                                        <span class="Block" style="background-color:lightblue">City</span>
                                         <%#Eval("City") %>
                                    </center>
                                    </div>
                                </div>
                                <div class="row" style="padding-bottom:25px">
                                    <center>
                                         <asp:Button ID="ReviewsBtn" runat="server" CssClass="DocSlotPickBtn" Text="Reviews" CommandName="RevDoc" CommandArgument='<%#Eval("UserId") %>' ></asp:Button>
                                         <asp:Button ID="Book" CssClass="DocSlotPickBtn" runat="server" Text="Book Appointment" CommandName="get_id" CommandArgument='<%#Eval("UserId") %>' />
                                    </center>
                                       

                                </div>

                            </div>
                        </div>
                    </div> 
                    


                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div id="myModal" class="modal" runat="server">
            <div class="modal-content" runat="server">
               
                <div class="row FindNoMargin">
                    <span class="BookTxt">Book Your Appointment</span>
                    <span id="close" class="close" onclick="jsModal()">&times;</span>
                    <div class="col-sm-4 datepickerDiv">

                        <script type="text/javascript">

                            function jsModal() {
                                var span = document.getElementById('close');
                                var modal = document.getElementById('myModal');
                                span.onclick = function () {
                                    modal.style.display = "none";
                                }


                            }
                        </script>
                        <p>Date:<asp:TextBox ID="datepicker" runat="server" Width="100%" Height="28px"></asp:TextBox></p>
                        <p>Time:<asp:TextBox ID="SlotpickerTxt" runat="server" Width="100%" Height="28px"></asp:TextBox></p>
                        <asp:Button ID="SlotpickerBtn" CssClass="slotPickBtn" runat="server" OnClick="SlotpickerBtn_Click" Text="Pick Slot" />
                        <asp:Button ID="BookAppointmentBtn" CssClass="slotPickBtn" runat="server" Text="BookAppointment" OnClick="BookAppointmentBtn_Click" />

                    </div>
                    <div class="col-sm-8 FindNoPadding">
                        <div class="row FindNoMargin">
                            <div class="col-sm-6 main">
                                <center> <p class="head" id="head1" runat="server">
                                    Morning
                                </p></center>
                                
                                <div class="repeterDivHeight">
                                    <asp:Repeater ID="MorningSlotRptr" runat="server" OnItemCommand="MorningSlotRptr_ItemCommand">
                                        <ItemTemplate>

                                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="block" CommandName="get_time" CommandArgument='<%# Eval("slot_id")%>' OnClick="LinkButton1_Click"><%#Eval("time") %></asp:LinkButton>

                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                
                            </div>
                            
                            <div class="col-sm-6 main">
                                <center> <p class="head" id="head2" runat="server">
                                    Evening
                                </p></center>
                                <div class="repeterDivHeight">
                                <asp:Repeater ID="EveningSlotRptr" runat="server" OnItemCommand="EveningSlotRptr_ItemCommand">
                                    <ItemTemplate>

                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="block" CommandName="get_time" CommandArgument='<%# Eval("slot_id")%>' OnClick="LinkButton1_Click"><%#Eval("time") %></asp:LinkButton>

                                    </ItemTemplate>
                                </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
        <div class="container-fluid" style="background-color: #222222">
            <div class="container SubNoPad">
                <div class="row RowNoMargin">
                    <div class="col-md-3">
                        <h3><span class="BottomBorder">Contact Information</span></h3>
                        <div class="row">
                            <div class="col-xs-2">
                                <span class="glyphicon glyphicon-map-marker"></span>
                            </div>
                            <div class="col-xs-10">
                                234 Sector 12 greater noida 208011
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-2">
                                <span class="glyphicon glyphicon-globe"></span>
                            </div>
                            <div class="col-xs-10">
                                PatientCare.com
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-2">
                                <span class="glyphicon glyphicon-envelope"></span>
                            </div>
                            <div class="col-xs-10">
                                PatientCare.info@gmail.com
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-2">
                                <span class="glyphicon glyphicon-phone"></span>
                            </div>
                            <div class="col-xs-10">
                                9867543281
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <h3><span class="BottomBorder">Departments</span></h3>
                        <ul class="LiPad">
                            <li>Hospitals</li>
                            <li>Clinics</li>
                            <li>Labs</li>
                            <li>Medical Stores</li>
                            <li>Hospitals</li>
                            <li>Hospitals</li>
                        </ul>
                    </div>
                    <div class="col-md-3 LiPad">
                        <h3><span class="BottomBorder">Services</span></h3>
                        <ul>
                            <li>Book Appointment online</li>
                            <li>Locate Nearest Hospital or Clinic</li>
                            <li>Online prescription</li>
                        </ul>
                    </div>
                    <div class="col-md-3">
                        <h3><span class="BottomBorder">Contact Us</span></h3>
                        <form>
                            <input type="text" placeholder="Your Email" id="ContactUsEmail" class="ContactUsEmail" />
                            <textarea name="ContactUsMsg" cols="18" rows="4" placeholder="Message" class="TextareaStyle"></textarea>
                            <input type="button" name="Submit" value="Submit" class="ContactUsButton" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid AllRightReserved">
            <div class="container SubNoPad">
                <div class="row RowNoMargin">
                    Patient Care © 2016 | All Rights Reserved
                </div>
            </div>
        </div>

    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PathologyAfterLogin.aspx.cs" Inherits="PathologyAfterLogin" %>

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
    <link rel="stylesheet" type="text/css" href="files/CSS/DoctorRegistrationCss.css" />
    <link rel="stylesheet" type="text/css" href="files/CSS/AfterLogin.css" />
    <style>
            .SlotDiv{
            
            padding-right:4px;
        }
        .SlotDivHead{
            background-color: #28465A;
            color: white;
            height:94px;
            
        }
         .DocSlotPickBtn{
            border:none;
            color:white;
            background-color:#67C567;
            border-radius:3px;
            
        }
           .appointment1{
             font-size:30px;
             margin-left:30px;
        }
           .MidButton {
            background-color: white;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 5px 12px;
            transition: 0.3s;
            font-size: 17px;
            color: #28465A;
        }

            /* Change background color of buttons on hover */
            .MidButton:hover {
                background-color: #ddd;
            }
    </style>
    <script>
        $(function () {
            $("#datepicker").datepicker();
        });
  </script>
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
                                    <asp:LinkButton ID="LogOutBtn" runat="server" OnClick="LogOutBtn_Click">LOGOUT</asp:LinkButton></a></li>
                                
                            </ul>
                        </li>
                       
                    </ul>
                </div>
            </div>
        </nav>
        
        <script>
            var modal = document.getElementById("LoginPopupId");
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        </script>
        <div class="container-fluid GeneralHeader">
        </div>
        <div class="container FindNoPadding">
            <div class="row FindNoMargin">
                <div class="col-sm-3 SlotDiv">
                    <div class="SlotDivHead">
                            <span class="appointment1">Appointments</span>
                    </div>
                    <div style="border:1px solid #CCCCCC;padding:4px;">
                        
                        <p>Date:<asp:TextBox ID="datepicker" runat="server" placeholder="mm/dd/yyyy" Height="28px" Width="100%"></asp:TextBox></p>
                        <asp:Button ID="CheckApp" CssClass="DocSlotPickBtn" runat="server" Text="Check Appointment" onclick="CheckApp_Click" />

                        
                    </div>
                </div>
                <div class="col-sm-9 FindNoPadding">
                    <div style="background-color: #28465A; color: white;">
                        <span id="appointment" class="appointment">Appointment</span>
                    </div>
                    <div style="background-color: #28465A">

                        <center>
                       
                        <asp:Button ID="AppointmentBtn" CssClass="MidButton" runat="server" Text="Tests"></asp:Button>
                     
                        </center>
                    </div>

                    <div id="Tests" runat="server" style="border:1px solid #CCCCCC;padding-top:10px">
                      <div class="row" style="padding-left:10px">
                          <div class="col-sm-2" style="padding-bottom:4px">
                              Patient:
                          </div>
                          <div class="col-sm-4" style="padding-bottom:4px">
                              <asp:Label ID="PatientNameLbl" runat="server" Text="Label"></asp:Label>
                          </div>
                      </div>
                      <div class="row" style="padding-left:10px">
                          <div class="col-sm-2" style="padding-bottom:4px">
                              Doctor:
                          </div>
                          <div class="col-sm-4" style="padding-bottom:4px">
                              <asp:Label ID="DocNamelbl" runat="server" Text="Label"></asp:Label>
                          </div>
                      </div>
                          <div class="row" style="padding-bottom:4px">
                              <asp:DropDownList ID="LRTestNameDrpdwn" runat="server" Width="100%" Height="28px" AutoPostBack="true" OnSelectedIndexChanged="LRTestNameDrpdwn_SelectedIndexChanged"></asp:DropDownList>
                          </div>
                        <div class="row"  style="padding-left:10px" >
                          <div class="col-sm-2" style="padding-bottom:4px">
                              Report:
                          </div>
                          <div class="col-sm-4" style="padding-bottom:4px">
                               <asp:TextBox ID="ReportTxt" runat="server"  TextMode="MultiLine" Width="100%" Height="160px"></asp:TextBox>
                          </div>
                      </div>
                    
                          <div class="col-sm-4" style="padding-bottom:4px">
                              <asp:TextBox ID="AmountTxt" runat="server"  Width="100%" Height="28px"></asp:TextBox>
                          </div>
                            
                        <div class="row"  style="padding-left:10px" >
                          <div class="col-sm-4" style="padding-bottom:4px">
                              <asp:CheckBox ID="PaymentChkBox" runat="server" AutoPostBack="true" /> Payment Received
                          </div>
                          <div class="col-sm-4" style="padding-bottom:4px">
                              
                          </div>

                      </div>
                        <div class="row"  style="padding-left:10px" >
                          <div class="col-sm-2" style="padding-bottom:4px">
                              
                          </div>
                          <div class="col-sm-4" style="padding-bottom:4px">
                              <asp:Button ID="SubmitBtn" CssClass="AfterLoginBookAppBtn" runat="server" Text="Submit" />
                          </div>

                      </div>
                    </div>

                    

                </div>



            </div>


        </div>




    </form>
</body>
</html>

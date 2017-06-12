<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientAfterLogin.aspx.cs" EnableEventValidation="false" Inherits="PatientAfterLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, intial-scale=1" />
    <link rel="stylesheet" href="files/bootstrap/css/bootstrap.min.css" />
    <script src="files/jquery/jquery-3.1.1.min.js"></script>
    <script src="files/bootstrap/js/bootstrap.min.js"></script>
    <script src="files/jquery/jqueryCustom/jquery-ui.js"></script>
    <link rel="stylesheet" href="files/jquery/jqueryCustom/jquery-ui.css" />
    <script src="files/javascript/HomeJs.js"></script>
    <link rel="stylesheet" type="text/css" href="files/CSS/HomePage.css" />
    <link rel="stylesheet" type="text/css" href="files/CSS/DoctorRegistrationCss.css" />

    <style>
        body {
            font-family: "Lato", sans-serif;
        }

        /* Style the tab */


        /* Style the buttons inside the tab */
        .MidButton {
            background-color: #28465A;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 5px 12px;
            transition: 0.3s;
            font-size: 17px;
            color: white;
        }

            /* Change background color of buttons on hover */
            .MidButton:hover {
                background-color: #ddd;
            }

        /* Create an active/current tablink class */


        /* Style the tab content */
        .tabcontent {
            display: none;
            padding: 6px 12px;
            border: 1px solid #ccc;
            border-top: none;
        }

        .tabcontent1 {
            padding: 6px 12px;
            border: 1px solid #ccc;
            border-top: none;
        }

        /* Style the close button */
        .topright {
            float: right;
            cursor: pointer;
            font-size: 20px;
        }

            .topright:hover {
                color: red;
            }

        .appointment {
            font-size: 30px;
            margin-left: 30px;
        }

        .AfterLoginBookAppBtn {
            float: right;
            margin-top: 15px;
            margin-right: 30px;
            background-color: #67C567;
            color: white;
            border: none;
            border-radius: 3px;
        }

        .AfterLoginBookAppLeftBtn {
            float: left;
            margin-top: 15px;
            margin-right: 30px;
            background-color: #67C567;
            color: white;
            border: none;
            border-radius: 3px;
        }

        .tablinks {
            background-color: white;
        }
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
           .RateStar{
               text-shadow:0px 0px 1px black;
               color:white;
               font-size:22px;
           }
           .RateStar:hover{
               cursor:pointer;
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
                        <li><a href="Default.aspx">HOME</a></li>
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

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
                        <asp:Button ID="CheckApp" CssClass="DocSlotPickBtn" runat="server" Text="Check Appointment" OnClick="CheckApp_Click"  />

                        
                    </div>
                </div>
                <div class="col-sm-9 FindNoPadding">
                    <div style="background-color: #28465A; color: white;">
                        <span id="appointment" class="appointment">Appointment</span><asp:Button ID="AfterLoginBookAppBtn" CssClass="AfterLoginBookAppBtn" runat="server" OnClick="AfterLoginBookAppBtn_Click" Text="Book Appointment"></asp:Button>
                    </div>
                    <div style="background-color: #28465A">

                        <center>
                       
                        <asp:Button ID="AppointmentBtn" CssClass="MidButton" runat="server" Text="Appointment" OnClick="PastBtn_Click"></asp:Button>
                       <asp:Button ID="LabReportBtn" CssClass="MidButton" runat="server" Text="Lab Report" OnClick="LabReportBtn_Click"></asp:Button>
                       <asp:Button ID="MedicalPrescriptionBtn" CssClass="MidButton" runat="server" Text="Medical Prescription" OnClick="MedicalPrescriptionBtn_Click"></asp:Button>
                        <asp:Button ID="DocReviewBtn" CssClass="MidButton" runat="server" Text="Review" OnClick="DocReview_Click"></asp:Button>
                        </center>
                    </div>

                    <div id="Appointment" runat="server" style="border:1px solid #CCCCCC;padding-top:10px">
                      <div class="row" style="padding-left:10px">
                          <div class="col-sm-2" style="padding-bottom:4px">
                              Doctor:
                          </div>
                          <div class="col-sm-4" style="padding-bottom:4px">
                              <asp:Label ID="AppDocNameLbl" runat="server" Text="Label"></asp:Label>
                          </div>
                          
                      </div>
                        <div class="row"  style="padding-left:10px" >
                          <div class="col-sm-2" style="padding-bottom:4px">
                              Time:
                          </div>
                          <div class="col-sm-4" style="padding-bottom:4px">
                              <asp:Label ID="AppDocTimeLbl" runat="server" Text="Label"></asp:Label>
                          </div>
                          <div class="col-sm-4" style="padding-bottom:4px">
                              
                          </div>
                          <div class="col-sm-2" style="padding-bottom:4px">
                              <asp:Button ID="ReviewBtn" CssClass="AfterLoginBookAppBtn" runat="server" Text="Review" OnClick="DocReview_Click"/>
                          </div>
                      </div>
                    </div>

                    <div id="LabReport" runat="server" style="border:1px solid #CCCCCC;padding-top:10px">
                       <div class="row" style="padding-left:10px">
                          <div class="col-sm-2" style="padding-bottom:4px">
                              Doctor:
                          </div>
                          <div class="col-sm-5" style="padding-bottom:4px">
                              <asp:Label ID="LRDocNameLbl" runat="server" Text="Label"></asp:Label>
                          </div>
                      </div>
                        <div class="row" style="padding-left:10px">
                          <div class="col-sm-2" style="padding-bottom:4px">
                              Tests:
                          </div>
                          <div class="col-sm-5" style="padding-bottom:4px">
                              <asp:DropDownList ID="LRTestNameDrpdwn" runat="server" Width="100%" Height="28px" AutoPostBack="true" OnSelectedIndexChanged="LRTestNameDrpdwn_SelectedIndexChanged"></asp:DropDownList>
                          </div>
                      </div>
                        <div class="row" style="padding-left:10px">
                          <div class="col-sm-2" style="padding-bottom:4px">
                              Report:
                          </div>
                          <div class="col-sm-4" style="padding-bottom:4px">
                              <asp:TextBox ID="LRReportTxt" runat="server"  TextMode="MultiLine" Width="100%" Height="160px"></asp:TextBox>
                          </div>
                         
                      </div>
                        
                    </div>

                    <div id="MedicalPrescription" runat="server" style="border:1px solid #CCCCCC;padding-top:10px">
                        
                        <div class="row" style="padding-left:10px">
                          <div class="col-sm-2" style="padding-bottom:4px">
                              Doctor:
                          </div>
                          <div class="col-sm-5" style="padding-bottom:4px">
                              <asp:Label ID="MRDocNameLbl" runat="server" Text="Label"></asp:Label>
                          </div>
                      </div>
                       
                        <div class="row" style="padding-left:10px">
                          <div class="col-sm-2" style="padding-bottom:4px">
                              Prescription:
                          </div>
                          <div class="col-sm-5" style="padding-bottom:4px">
                              <asp:TextBox ID="MPPrescriptionTxt" runat="server"  TextMode="MultiLine" Width="100%" Height="160px"></asp:TextBox>
                          </div>
                      </div>
                    </div>

                    <div id="Review" runat="server" style="border:1px solid #CCCCCC;padding-top:10px">
                        <div class="row" style="padding-left:10px">
                          <div class="col-sm-2" style="padding-bottom:4px">
                              Doctor:
                          </div>
                          <div class="col-sm-5" style="padding-bottom:4px">
                              <asp:Label ID="RevDocNameLbl" runat="server"></asp:Label>
                          </div>
                        </div>
                        <div class="row" style="padding-left:10px">
                          <div class="col-sm-2" style="padding-bottom:4px">
                              Rate:
                          </div>
                          <div class="col-sm-5" style="padding-bottom:4px">

                              <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                  <ContentTemplate>
                                      <asp:LinkButton ID="S1" runat="server" OnClick="Star1_Click" CommandArgument="1"><span ID="Star1" runat="server" class="glyphicon glyphicon-star RateStar"></span></asp:LinkButton>
                                      <asp:LinkButton ID="S2" runat="server" OnClick="Star1_Click" CommandArgument="2"><span ID="Star2" runat="server" class="glyphicon glyphicon-star RateStar"></span></asp:LinkButton>
                                      <asp:LinkButton ID="S3" runat="server" OnClick="Star1_Click" CommandArgument="3"><span ID="Star3" runat="server" class="glyphicon glyphicon-star RateStar"></span></asp:LinkButton>
                                      <asp:LinkButton ID="S4" runat="server" OnClick="Star1_Click" CommandArgument="4"><span ID="Star4" runat="server" class="glyphicon glyphicon-star RateStar"></span></asp:LinkButton>
                                      <asp:LinkButton ID="S5" runat="server" OnClick="Star1_Click" CommandArgument="5"><span ID="Star5" runat="server" class="glyphicon glyphicon-star RateStar"></span></asp:LinkButton>
                                   
                                      <asp:HiddenField ID="HiddenField1" runat="server" />

                                  </ContentTemplate>
                              </asp:UpdatePanel>

                             
                          </div>
                        

                        </div>
                        <div class="row" style="padding-left:10px">
                          <div class="col-sm-2" style="padding-bottom:4px">
                              Review:
                          </div>
                          <div class="col-sm-8" style="padding-bottom:4px">
                              <asp:TextBox ID="DocReviewTxt" runat="server"  TextMode="MultiLine" Width="100%" Height="160px"></asp:TextBox>
                              <asp:Label ID="ReviewedLbl" runat="server"></asp:Label>
                          </div>
                        </div>
                        <div class="row" style="padding-left:10px">
                          <div class="col-sm-3" style="padding-bottom:4px">
                             
                          </div>
                          <div class="col-sm-4" style="padding-bottom:4px">
                              <asp:Button ID="ReviewSubmitBtn" CssClass="AfterLoginBookAppBtn" runat="server" Text="Submit" OnClick="ReviewSubmitBtn_Click"/>
                          </div>
                        </div>
                    </div>



            </div>


        </div>




    
    </form>
</body>
</html>

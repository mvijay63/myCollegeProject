﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DoctorReview.aspx.cs" Inherits="DoctorReview" %>

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
    <link rel="stylesheet" type="text/css" href="files/CSS/HomePage.css" />
    <link rel="stylesheet" type="text/css" href="files/CSS/DoctorRegistrationCss.css" />
    <style>
        .ImageIconPad{
            padding-top:10px;
        }
        .LabelBlock{
            display:block;
            font-size:large;
    
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
                    <a class="navbar-brand imagelogo" href="#HomePage">
                        <img style="margin-left: 10%" src="images/logoo.png" /></a>
                </div>
                <div class="collapse navbar-collapse" id="MyNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">HOME</a></li>
                        <li><a href="javascript:void(0)" onclick="OnloadPopup()">REGISTER</a></li>
                        <li><a href="KnowMore.aspx">FEATURES</a></li>
                        <li><a href="#">CONTACT</a></li>
                        <li><a href="javascript:void(0)" onclick="LoginPopupClick()">
                            <asp:Label ID="SignLbl" runat="server" Text="LOGIN/REGISTER"></asp:Label></a></li>

                    </ul>
                </div>
            </div>
        </nav>
        <div class="container-fluid GeneralHeader">
        </div>

        <div id="OnloadPopup" class="LoginPopupbackgroud">
            <div id="OnloadPopupContent" class=" container-fluid OnloadPopUp LoginPopupZoomIn">
                <div>
                    <img id="closeIcon" src="images/close-button.png" width="20px" height="20px" />

                </div>


                <div class="row">
                    <div class="col-sm-3">
                        <center><img src="images/hcue-doctor-icon.png" class="OnloadPopupImages"/>
                        <a href="DoctorRegistration.aspx">for doctors</a>
                        <p>
                            Focus on your practice, leave the rest to us
                        </p>
                        <asp:Button ID="DocKMBtn" CssClass="DocSlotPickBtn" runat="server" Text="Know More" OnClick="DocKMBtn_Click"></asp:Button>
                    </center>

                    </div>
                    <div class="col-sm-3">
                        <center><img src="images/hcue-partner-icon.png" class="OnloadPopupImages" />
                        <a href="LabsRegistration.aspx">for Labs</a>
                        <p>
                            Connect with doctors and patients, directly.
                        </p>
                        <asp:Button ID="LabsKMBtn" CssClass="DocSlotPickBtn" runat="server" Text="Know More" OnClick="DocKMBtn_Click"></asp:Button>
                    </center>
                    </div>
                    <div class="col-sm-3">
                        <center><img src="images/hcue-patient-icon.png" class="OnloadPopupImages" />
                        <a href="PatientsRegistration.aspx">for Patients</a>
                        <p>
                            Manage your doctor appointments & health records
                        </p>
                        <asp:Button ID="PatientKMBtn" CssClass="DocSlotPickBtn" runat="server" Text="Know More" OnClick="DocKMBtn_Click"></asp:Button>
                    </center>
                    </div>
                    <div class="col-sm-3">
                        <center><img src="images/hcue-pharmacy-icon.png" class="OnloadPopupImages" />
                        <a href="PharmacyRegistration.aspx">for Pharmacy</a>
                        <p>
                            Earn direct leads from doctors & attract more patients
                        </p>
                        <asp:Button ID="PharmacyKMBtn" CssClass="DocSlotPickBtn" runat="server" Text="Know More" OnClick="DocKMBtn_Click"></asp:Button>
                    </center>
                    </div>

                </div>

            </div>

        </div>

        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>

        <div id="LoginPopupId" class="LoginPopupbackgroud">
            <!--login modal -->
            <div class=" LoginPopup LoginPopupZoomIn" style="background-color: white;">

                <div class="row FindNoMargin">
                    <div class="col-sm-6 FindNoPadding LoginImageDiv">
                        <center><img src="images/logoo.png" class="LoginemageSize"/></center>
                    </div>
                    <div class="col-sm-6 FindNoPadding LoginEmailPwdDiv">
                        <center><p class="LoginLoginTxtEdit">Login to Patient Care</p></center>
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <div class="LoginNestedLoop">


                                    <div style="margin-bottom: 20px">
                                        <span class="LoginText">Email:</span>
                                        <asp:TextBox ID="LoginEmailTxt" CssClass="LoginTextbox" runat="server" placeholder="Enter your Email" Width="100%"></asp:TextBox>
                                    </div>
                                    <div style="margin-bottom: 20px">
                                        <span class="LoginText">Password:</span>
                                        <asp:TextBox ID="LoginPasswordTxt" CssClass="LoginTextbox" runat="server" placeholder="Enter password" Width="100%"></asp:TextBox>
                                    </div>

                                    <asp:Button ID="LogindBtn" CssClass="LoginButton" runat="server" Text="Login" OnClick="LogindBtn_Click" />


                                    <div style="color: red; font-weight: 600">
                                        <asp:Label ID="LoginMsglbl" runat="server"></asp:Label>
                                    </div>

                                    <span style="display: block">New to Patient Care?</span>
                                    <span><a href="PatientsRegistration.aspx">Register Now</a></span>

                                </div>
                            </ContentTemplate>
                            
                        </asp:UpdatePanel>


                    </div>
                </div>


            </div>

        </div>
        <script>
            var modal = document.getElementById("LoginPopupId");
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        </script>

        <div class="container FindNoPadding">
            <asp:Repeater ID="DocReviewRptr" runat="server">
                <ItemTemplate>
                    <div class="container FindNoPadding">
                        <div class="row FindNoMargin FindNoPadding">
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
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <div class="container FindNoPadding">
            <asp:Repeater ID="ReviewsContentRptr" runat="server">
                <ItemTemplate>
                     <div class="container FindNoPadding">
                        <div class="row FindNoMargin FindNoPadding">
                            <div class="col-xs-3 ImageIconPad">
                                <asp:Label ID="ReviewerNameLbl" runat="server" Text='<%#Eval("PatientName") %>'></asp:Label>
                            </div>
                            <div class="col-xs-9">
                              
                            </div>
                        </div>
                         <div class="row FindNoMargin FindNoPadding">
                            <div class="col-xs-1 ImageIconPad">
                                
                            </div>
                            <div class="col-xs-9">
                              <asp:Label ID="ReviewContentLbl" runat="server" Text='<%#Eval("Review") %>' ></asp:Label>
                            </div>
                        </div>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
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

<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title>Total Medical Resoltion System</title>
    <link rel="icon" href="images/heart_logo1.png"/>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, intial-scale=1" />
    <link rel="stylesheet" href="files/bootstrap/css/bootstrap.min.css" />
    <script src="files/jquery/jquery-3.1.1.min.js"></script>
    <script src="files/bootstrap/js/bootstrap.min.js"></script>
    <script src="files/javascript/HomeJs.js"></script>
    <link rel="stylesheet" type="text/css" runat="server" href="files/CSS/HomePage.css" />
    <script>


        $(window).on("load", function () {
            $("#OnloadPopup").css({ "display": "block" });
        });




    </script>
    <style>
         .LoginPopupbackgroud{
              display:none;
              position:fixed;
              left:0px;
              z-index:2;
              top:0px;
              width:100%;
              height:100%;
      
              background:rgba(0,0,0,0.6);
              overflow:auto;
          }
        .HomeFind {
            padding-top: 5%;
            padding-left: 5%;
        }

        .HomeFindTxt {
            margin-bottom: 10px;
            border-radius: 3px;
            border: 1px solid #777777;
        }

        .DocSlotPickBtn {
            border: none;
            color: white;
            background-color: #67C567;
            border-radius: 3px;
            margin-top: 20px;
        }

        .label {
            display: block;
            color: white;
            font-size: 30px;
            text-shadow: 1px 1px 4px black;
            margin-bottom: 10px;
        }
  
    </style>

</head>
<body>
    <form runat="server">

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
                        <li><a href="ContactUs.aspx">CONTACT</a></li>
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
                                        <asp:TextBox ID="LoginPasswordTxt" CssClass="LoginTextbox" runat="server" placeholder="Enter password" Width="100%" TextMode="Password"></asp:TextBox>
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

        <div id="MyCarousel" class="carousel slide CarouselZindex" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#MyCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#MyCarousel" data-slide-to="1"></li>
                <li data-target="#MyCarousel" data-slide-to="2"></li>
                <li data-target="#MyCarousel" data-slide-to="3"></li>
                <li data-target="#MyCarousel" data-slide-to="4"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="images/CarouselActive.jpg" alt="CarouselActive" />
                </div>
                <div class="item">
                    <img src="images/FemaleDoc.jpg" alt="FemaleDoc" />
                </div>
                <div class="item">
                    <img src="images/DocAtWork.jpg" alt="DocAtWork" />
                </div>
                <div class="item">
                    <img src="images/KidsCare.jpg" alt="KidsCare" />
                </div>
                <div class="item">
                    <img src="images/Pharmacy.jpg" alt="Pharmacy" />
                </div>
            </div>
            <a class="left carousel-control" href="#MyCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#MyCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <div class="container text-center" style="background-color: #F0F0F0">
            <div class="row RowNoMargin">
                <div class="col-md-4 " style="background-color: #3EB8D7">
                    <h3>24 Hour Service </h3>
                    <p class="ColorWhite">
                        The plateform where we provide 24 hour facility, every day for you and your family.We have a collabration with all the
                    mazor hospitals, clinics, pharmacy store and labs all over India 
                    </p>
                </div>
                <div class="col-md-4 " style="background-color: #0392CE">
                    <h3>Online Appointment</h3>
                    <p class="ColorWhite">
                        Book an appointment online for various hospital and clinic all over nation. No need to wait for your turn in hospitals, just get a
                    appointment no and time at which you have to address there
                    </p>
                </div>
                <div class="col-md-4" style="background-color: #3065B5">
                    <h3>Top Facility</h3>
                    <p class="ColorWhite">
                        Online assistance for finding your best doctor and hospitals. Totally paperless work and no need to rush to various department.
                    Hospital, clinics, labs and medical store on your fingertips.
                    </p>
                </div>
            </div>

        </div>
        <div class="container ParallaxMainDivPad">
            <div class="row ParallaxBackground FindNoMargin">
                <div class="col-sm-6 HomeFind">

                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <center>
                                <asp:Label runat="server" CssClass="label" Text="Book Appointment"></asp:Label>
                                <asp:DropDownList ID="CityDrpdwn" CssClass="HomeFindTxt" runat="server" Width="75%" Height="38px"  AutoPostBack="true" OnSelectedIndexChanged="CityDrpdwn_SelectedIndexChanged"></asp:DropDownList>
                                <asp:DropDownList ID="LocationDrpdwn" CssClass="HomeFindTxt" runat="server" Width="75%" Height="38px"></asp:DropDownList>
                                <asp:DropDownList ID="SpecialityDrpdwn" CssClass="HomeFindTxt" runat="server" Width="75%" Height="38px"></asp:DropDownList>
                            </center>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <center>
                        <asp:Button ID="HomeFindBtn" CssClass="DocSlotPickBtn" runat="server" Text="Book Appointment" Width="50%" Height="38" OnClick="HomeFindBtn_Click"></asp:Button>
                    </center>

                </div>
                <div class="col-sm-6 ParallaxLogo">
                </div>
            </div>
            <!--<div class="container ParallaxLogo"></div> -->


        </div>

        <div class="container-fluid" style="background-color: #3EB8D7">
            <div class="container SubNoPad">
                <div class="row RowNoMargin">
                    <div class="col-md-6 ColorWhite font20">
                        <h2>Subscribe to our newsletter</h2>
                        Get healthy news and solutions to your problems from our experts
                    </div>
                    <div class="col-md-6 subscribeMargin">
                        <div>
                            <input type="email" placeholder="Enter Your Email" class="SubscribeEmail" />&nbsp;
                        <br />
                            <input type="button" name="Subscribe" value="Subscribe" />
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

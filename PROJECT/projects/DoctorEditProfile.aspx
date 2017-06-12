<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DoctorEditProfile.aspx.cs" Inherits="DoctorEditProfile" %>

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
    <link rel="stylesheet" type="text/css" href="files/CSS/AfterLogin.css" />
   <style>
        .SlotDivHead{
            background-color: #28465A;
            color: white;
            height:94px;
            
        }
         .EditProfile{
             font-size:30px;
             margin-left:30px;
             display:block;
        }
         .DrName{
             font-size:20px;
             margin-left:30px;
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
        <div class="container FindNoPadding">
            <div class="SlotDivHead">
                 <span class="EditProfile">Edit Profile</span>
                 <span class="DrName">Dr. <asp:Label ID="DocNameLbl" runat="server" Text=""></asp:Label></span>
            </div>
            <div style="border:1px solid #CCCCCC;padding-top:3%;padding-left:10%">
                <div class="row FindNoMargin" style="padding-bottom:7px">
                    <div class="col-sm-2">
                        Phone:
                    </div>
                    <div class="col-sm-5">
                        <asp:TextBox ID="DocEditPhoneTxt" runat="server" Height="28px" Width="100%"></asp:TextBox>
                    </div>
                </div>
                <div class="row FindNoMargin" style="padding-bottom:7px">
                    <div class="col-sm-2">
                        City:
                    </div>
                    <div class="col-sm-5">
                        <asp:TextBox ID="DocEditCityTxt" runat="server" Height="28px" Width="100%"></asp:TextBox>
                    </div>
                </div>
                <div class="row FindNoMargin" style="padding-bottom:7px">
                    <div class="col-sm-2">
                        Exprience:
                    </div>
                    <div class="col-sm-5">
                        <asp:TextBox ID="DocEditExprienceTxt" runat="server" Height="28px" Width="100%"></asp:TextBox>
                    </div>
                </div>
                 <div class="row FindNoMargin" style="padding-bottom:7px">
                    <div class="col-sm-2">
                        Degree1:
                    </div>
                    <div class="col-sm-5">
                        <asp:TextBox ID="DocEditDegree1Txt" runat="server" Height="28px" Width="100%"></asp:TextBox>
                    </div>
                </div>
                 <div class="row FindNoMargin" style="padding-bottom:7px">
                    <div class="col-sm-2">
                        Degree2:
                    </div>
                    <div class="col-sm-5">
                        <asp:TextBox ID="DocEditDegree2Txt" runat="server" Height="28px" Width="100%"></asp:TextBox>
                    </div>
                </div>
                 <div class="row FindNoMargin" style="padding-bottom:7px">
                    <div class="col-sm-2">
                        Degree3:
                    </div>
                    <div class="col-sm-5">
                        <asp:TextBox ID="DocEditDegree3Txt" runat="server" Height="28px" Width="100%"></asp:TextBox>
                    </div>
                </div>
                 <div class="row FindNoMargin" style="padding-bottom:7px">
                    <div class="col-sm-2">
                        Region:
                    </div>
                    <div class="col-sm-5">
                        <asp:TextBox ID="DocEditRegionTxt" runat="server" Height="28px" Width="100%"></asp:TextBox>
                    </div>
                </div>
                 <div class="row FindNoMargin" style="padding-bottom:7px">
                    <div class="col-sm-2">
                        LandLine:
                    </div>
                    <div class="col-sm-5">
                        <asp:TextBox ID="DocEditLandlineTxt" runat="server" Height="28px" Width="100%"></asp:TextBox>
                    </div>
                </div>
                 <div class="row FindNoMargin" style="padding-bottom:7px">
                    <div class="col-sm-2">
                        Fee:
                    </div>
                    <div class="col-sm-5">
                        <asp:TextBox ID="DocEditFeeTxt" runat="server" Height="28px" Width="100%"></asp:TextBox>
                    </div>
                </div>
                 <div class="row FindNoMargin" style="padding-bottom:7px">
                    <div class="col-sm-2">
                        Address:
                    </div>
                    <div class="col-sm-5">
                        <asp:TextBox ID="DocEditAddressTxt" runat="server" Height="28px" Width="100%"></asp:TextBox>
                    </div>
                </div>
                 <div class="row FindNoMargin" style="padding-bottom:7px">
                    <div class="col-sm-2">
                        
                    </div>
                    <div class="col-sm-5">
                        <asp:Button ID="SubmitBtn" CssClass="AfterLoginBookAppBtn" runat="server" Text="Submit" OnClick="SubmitBtn_Click" />
                    </div>
                </div>
            </div>
            
        </div>
    
    </form>
</body>
</html>

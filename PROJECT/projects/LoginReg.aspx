<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginReg.aspx.cs" Inherits="LoginReg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Total Medical Resoltion System</title>
    <link rel="icon" href="images/heart_logo1.png">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, intial-scale=1" />
    <link rel="stylesheet" href="files/bootstrap/css/bootstrap.min.css" />
    <script src="files/jquery/jquery-3.1.1.min.js"></script>
    <script src="files/bootstrap/js/bootstrap.min.js"></script>
    <script src="files/javascript/HomeJs.js"></script>
    <link rel="stylesheet" type="text/css" href="files/CSS/HomePage.css" />
    <script>
        $(window).on("load", function () {
            $("#LoginPopupId").css({ "display": "block" });
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
                        <li><a href="#">HOME</a></li>
                        <li><a href="javascript:void(0)" onclick="OnloadPopup()">REGISTER</a></li>
                        <li><a href="KnowMore.aspx">FEATURES</a></li>
                        <li><a href="#">CONTACT</a></li>
                        <li><a href="javascript:void(0)" onclick="LoginPopupClick()">LOGIN/REGISTER</a></li>

                    </ul>
                </div>
            </div>
        </nav>
        <div class="container-fluid GeneralHeader">
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
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="LogindBtn" />
                            </Triggers>
                        </asp:UpdatePanel>


                    </div>
                </div>


            </div>

        </div>

    </form>
</body>
</html>

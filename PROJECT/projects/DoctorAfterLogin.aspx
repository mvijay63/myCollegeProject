<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DoctorAfterLogin.aspx.cs" EnableEventValidation="false" Inherits="DoctorAfterLogin" %>

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
    <link href="files/CSS/FindCss.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/files/CSS/DoctorRegistrationCss.css" />
    <link rel="stylesheet" type="text/css" href="files/CSS/AfterLogin.css" />
    <script>
        $(function () {
            $("#picker").datepicker();
        });
    </script>
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
        body {font-family: "Lato", sans-serif;}


.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
}

.tabcontent1{
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

.topright:hover {color: red;}

.appointment{
    font-size:30px;
    margin-left:30px;
}

.AfterLoginBookAppBtn {
    float:right;
    margin-top:15px;
    margin-right:30px;
    background-color:#67C567;
    color:white;
    border:none;
    border-radius:3px;
}
.AfterLoginBookAppLeftBtn {
    float:left;
    margin-top:15px;
    margin-right:30px;
    background-color:#67C567;
    color:white;
    border:none;
    border-radius:3px;
}


.MidButton {
    background-color: #28465A;
    
    border: none;
    outline: none;
    cursor: pointer;
    padding: 5px 12px;
    transition: 0.3s;
    font-size: 17px;
    color:white;
}

/* Change background color of buttons on hover */
.MidButton:hover {
    background-color: #ddd;
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
                <div class="col-sm-3 FindNoPadding SlotDiv" >
                    <div class="SlotDivHead">
                            <span class="appointment1">Appointments</span>
                    </div>
                    <div style="border:1px solid #CCCCCC;padding:4px;">
                        
                        <p>Date:<asp:TextBox ID="picker" runat="server" placeholder="mm/dd/yyyy" Height="28px" Width="100%"></asp:TextBox></p>
                        <asp:Button ID="CheckApp" CssClass="DocSlotPickBtn" runat="server" Text="Check Appointment" OnClick="CheckApp_Click" />

                        <asp:Repeater ID="BookedSlotsRptr" runat="server" OnItemCommand="BookedSlotsRptr_ItemCommand">
                            <ItemTemplate>
                                <asp:LinkButton ID="BookedSlotsBtn" runat="server" CssClass="block" CommandName="getBookingId" CommandArgument='<%#Eval("BookingId")%>'><%#Eval("slot_time")%></asp:LinkButton>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="col-sm-9 FindNoPadding">
                    <div style="background-color: #28465A; color: white">
                        <span id="appointment" class="appointment">Prescription</span><asp:Button ID="EditProfileBtn" CssClass="AfterLoginBookAppBtn" runat="server" Text="Edit Profile" OnClick="EditProfileBtn_Click"/>
                    </div>
                    <div style="background-color:#28465A">
                        <center>
                            <button class="MidButton" style="background-color:white;color:#28465A">Patients</button>
                        </center>
                    </div>

                    <div id="Patients" class="tabcontent1">


                        <div class="row FindNoMargin">
                            <div class="col-sm-3">
                                Name:
                            </div>
                            <div class="col-sm-9">
                                <asp:Label ID="NameLbl" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="row FindNoMargin">
                            <div class="col-sm-3">
                                Email:
                            </div>
                            <div class="col-sm-9">
                                <asp:Label ID="EmailLbl" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="row FindNoMargin">
                            <div class="col-sm-3">
                                Age:
                            </div>
                            <div class="col-sm-9">
                                <asp:Label ID="AgeLbl" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="row FindNoMargin" style="border-bottom:2px solid #CCCCCC">
                            <div class="col-sm-3">
                                Phone:
                            </div>
                            <div class="col-sm-9">
                                <asp:Label ID="PhoneLbl" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="row FindNoMargin" style="padding-top:10px">
                            <div class="col-sm-2">
                                Medicines:
                            </div>
                            <div class="col-sm-5">
                                <asp:DropDownList ID="MedicineDrpdwn" runat="server" Width="100%" Height="25px"></asp:DropDownList>
                            </div>
                            <div class="col-sm-1">
                                Dose:
                            </div>
                            <div class="col-sm-3">
                                <asp:DropDownList ID="DoseDrpdwn" runat="server" Width="100%"  Height="25px"></asp:DropDownList>
                            </div>
                             <div class="col-sm-1">
                                <asp:Button ID="AddMedicineBtn" CssClass="DocSlotPickBtn" runat="server" Text="Add" OnClick="AddMedicineBtn_Click"/>
                            </div>

                        </div>
                        <div class="row FindNoMargin">
                            <div class="col-sm-2">
                                Pharmacy:
                            </div>
                            <div class="col-sm-5">
                                <asp:DropDownList ID="PharmacyNameDrpdwn" runat="server" Width="100%" Height="25px"></asp:DropDownList>
                            </div>
                             

                        </div>
                        <div class="row FindNoMargin">
                            <div class="col-sm-2">
                                Pathology:
                            </div>
                            <div class="col-sm-5">
                                <asp:DropDownList ID="PathologyNameDrpdwn" runat="server" Width="100%" Height="25px"></asp:DropDownList>
                            </div>

                        </div>
                        <div class="row FindNoMargin">
                            <div class="col-sm-2">
                                Test:
                            </div>
                            <div class="col-sm-5">
                                <asp:DropDownList ID="LabTestDrpdwn" runat="server" Width="100%" Height="25px"></asp:DropDownList>
                            </div>
                             <div class="col-sm-4">
                                 <asp:Label ID="medicieLbl" runat="server" Text="Label" Visible="false"></asp:Label>
                            </div>
                             <div class="col-sm-1">
                                <asp:Button ID="AddTestBtn" CssClass="DocSlotPickBtn" runat="server" Text="Add" OnClick="AddTestBtn_Click"/>
                            </div>

                        </div>
                        
                        <div class="row FindNoMargin">
                            <div class="col-sm-2">
                                Prescription:
                            </div>
                            <div class="col-sm-7">
                                <asp:TextBox ID="PrescriptionTxt" runat="server"  TextMode="MultiLine" Width="100%" Height="160px"></asp:TextBox>
                            </div>

                        </div>
                        <div class="row FindNoMargin">
                            <div class="col-sm-2">
                                Lab Tests:
                            </div>
                            <div class="col-sm-7">
                                <asp:TextBox ID="LabTestTxt" runat="server"  TextMode="MultiLine" Width="100%" Height="160px"></asp:TextBox>
                            </div>

                        </div>
                        <div class="row FindNoMargin">
                            <div class="col-sm-2">
                            </div>
                            <div class="col-sm-5">
                                <asp:Button ID="SubmitBtn" CssClass="AfterLoginBookAppBtn" runat="server" Text="Submit" OnClick="SubmitBtn_Click" />
                            </div>

                        </div>

                    </div>



                </div>

            </div>



        </div>

    </form>
</body>
</html>

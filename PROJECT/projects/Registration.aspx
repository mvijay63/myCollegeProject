 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, intial-scale=1" />
    <link rel="stylesheet" href="files/bootstrap/css/bootstrap.min.css" />
    <script src="files/jquery/jquery-3.1.1.min.js"></script>
    <script src="files/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="files/CSS/Registration.css" />
    <script src="files/javascript/HomeJs.js"></script>
</head>
<body>
    <div class="container-fluid header">
        <h1>Patient Care</h1>
    </div>
    <div class="container-fluid SecondHeader">
        Thanks For Choosing Us!
    </div>
    <div class="container-fluid NoPadding">
        <div class="row NoMargin">
            <div class="col-sm-3 NoPadding Menu">
               <button class="DivLink" onclick="ShowDiv(event,'Patient')" id="defaultOpen">Patient</button>
               <button class="DivLink" onclick="ShowDiv(event,'Hospital')">Hospital</button>
               <button class="DivLink" onclick="ShowDiv(event,'Clinic')">Clinic</button>
               <button class="DivLink" onclick="ShowDiv(event,'Pathology')">Pathology</button>
               <button class="DivLink" onclick="ShowDiv(event,'Pharmacy')">Pharmacy</button>
            </div>
            <div class="col-sm-9 IframeNoPadding">
                <form class="form-horizontal" runat="server">
                    <div id="Patient" class="DivContent">
                        <div class="container-fluid">
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="PatientRegNameLbl">Name:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Enter Name" runat="server" id="PatientRegNameTxt"/>
                                    <asp:RequiredFieldValidator ID="PatientRegNameRFV" runat="server" ControlToValidate="PatientRegNameTxt" ErrorMessage="Enter Your Name"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="EmailLbl">Email:</label>
                                <div class="col-sm-6">
                                    <input type="email" class="form-control" placeholder="Enter Email" id="PatientEmailTxt" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="PatientDOB">Date Of Birth:</label>
                                <div class="col-sm-6">
                                    <input type="date" class="form-control" id="PatientDobTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="PatientGender">Gender:</label>
                                <div class="col-sm-6">
                                    <input type="radio" name="Gender" value="Male" />
                                    Male  
                                    <input type="radio" name="Gender" value="Female" />
                                    Female
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label  col-sm-3" for="PasswordLbl">Password:</label>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control" placeholder="Enter Password" id="PatientPwdTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="PatientCnfPwd">Confirm Password:</label>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control" placeholder="Enter Password Again" id="PatientCnfPwdTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-3"></div>
                                <div>
                                    <button type="button" class="btn btn-info HospitalRegSubmitBtnPad" id="PatientRegistrationSubmitBtn">Submit</button>
                                </div>

                            </div>

                        </div>
                    </div>
                    <div id="Hospital" class="DivContent">
                        <div class="container-fluid">

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="HospitalRegOwnerLbl">Owner:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Owner's Name" id="HospitalRegOwnerTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="HospialRegNameLbl">Hospital:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Hospital Name" id="HospitalRegNameTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="HospialRegEmailLbl">Email:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Email" id="HospitalRegEmailTxt" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="HospialRegPhoneNoLbl">Phone No:</label>
                                <div class="col-sm-2">
                                    <input type="tel" class="form-control" placeholder="STD Code" id="HospitalRegPhoneNoSTDTxt" />
                                </div>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" placeholder="Phone No" id="HospitalRegPhoneNoTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="HospialRegMobNoLbl">Mobile No:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Mobile No" id="HospitalRegMobNoTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="HospitalDept">Departments:</label>
                                <div class="col-sm-8">

                                    <input type="checkbox" name="HospitalDepartment" value="Audiologist" />
                                    Audiologist &nbsp;&nbsp;
                                    <input type="checkbox" name="HospitalDepartment" value="Allergist" />
                                    Allergist &nbsp;&nbsp;
                                    <input type="checkbox" name="HospitalDepartment" value="Anesthesiologist" />
                                    Anesthesiologist &nbsp;&nbsp;
                                    <input type="checkbox" name="HospitalDepartment" value="Cardiologist" />
                                    Cardiologist &nbsp;&nbsp;
                                    <input type="checkbox" name="HospitalDepartment" value="Dentist" />
                                    Dentist &nbsp;&nbsp;
                                    <input type="checkbox" name="HospitalDepartment" value="Dermatologist" />
                                    Dermatologist &nbsp;&nbsp;
                                    <input type="checkbox" name="HospitalDepartment" value="Endocrinologist" />
                                    Endocrinologist &nbsp;&nbsp;
                                    <input type="checkbox" name="HospitalDepartment" value="Epidemiologist" />
                                    Epidemiologist &nbsp;&nbsp;
                                    <input type="checkbox" name="HospitalDepartment" value="Gynecologist" />
                                    Gynecologist &nbsp;&nbsp;
                                    <input type="checkbox" name="HospitalDepartment" value=" Immunologist" />
                                    Immunologist &nbsp;&nbsp;
                                    <input type="checkbox" name="HospitalDepartment" value="Medical Geneticist" />
                                    Medical Geneticist &nbsp;&nbsp;
                                    <input type="checkbox" name="HospitalDepartment" value="Microbiologist" />
                                    Microbiologist &nbsp;&nbsp;
                                    <input type="checkbox" name="HospitalDepartment" value="Neonatologis" />
                                    Neonatologis &nbsp;&nbsp;
                                    <input type="checkbox" name="HospitalDepartment" value="Neurologist" />
                                    Neurologist &nbsp;&nbsp;
                                    <input type="checkbox" name="HospitalDepartment" value="Neurosurgeon" />
                                    Neurosurgeon &nbsp;&nbsp;
                                    <input type="checkbox" name="HospitalDepartment" value="Obstetrician" />
                                    Obstetrician &nbsp;&nbsp;
                                    <input type="checkbox" name="HospitalDepartment" value="Oncologist" />
                                    Oncologist &nbsp;&nbsp;
                                    <input type="checkbox" name="HospitalDepartment" value="Pediatrician" />
                                    Pediatrician &nbsp;&nbsp;
                                    <input type="checkbox" name="HospitalDepartment" value="Physiologist" />
                                    Physiologist &nbsp;&nbsp;
                                    <input type="checkbox" name="HospitalDepartment" value="Surgeon" />
                                    Surgeon &nbsp;&nbsp;
                                    <input type="checkbox" name="HospitalDepartment" value="Urologist" />
                                    Urologist &nbsp;&nbsp;
                
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="HospialRegAddresLbl">Address:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="House No and Landmark" id="HospitalRegAddressLine1Txt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-3"></div>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Street Town Locality" id="HospitalRegAddressLine2Txt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="HospitalRegStateDistrictLbl">State and District:</label>
                                <div class="col-sm-3">
                                    <asp:DropDownList CssClass="form-control" ID="HospitalRegStateDrpDwn" runat="server"></asp:DropDownList>
                                </div>
                                <div class="col-sm-3">
                                    <asp:DropDownList CssClass="form-control" ID="HospitalRegDistrictDrpDwn" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="HospialRegPincodeLbl">Pincode:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Pincode" id="HospitalRegPincodeTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="HospialRegPwdLbl">Password:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Password" id="HospitalRegPwdTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="HospialRegCnfPwdLbl">Confirm Password:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Password" id="HospitalRegCnfPwdTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-3"></div>
                                <div>
                                    <button type="button" class="btn btn-info HospitalRegSubmitBtnPad" id="HospitalRegistrationSubmitBtn">Submit</button>
                                </div>

                            </div>

                        </div>
                    </div>
                    <div id="Clinic" class="DivContent">
                        <div class="container-fluid">

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="ClinicRegistrationDrLbl">Name:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Dr Name" id="ClinicRegistrationDrTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="ClinicRegistrationClinicLbl">Clinic:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Clinic's Name" id="ClinicRegistrationClinicTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="ClinicRegEmailLbl">Email:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Email" id="ClinicRegEmailTxt" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="ClinicRegPhoneNoLbl">Phone No:</label>
                                <div class="col-sm-2">
                                    <input type="tel" class="form-control" placeholder="STD Code" id="ClinicRegPhoneNoSTDTxt" />
                                </div>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" placeholder="Phone No" id="ClinicRegPhoneNoTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="ClinicRegMobNoLbl">Mobile No:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Mobile No" id="ClinicRegMobNoTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="ClinicRegAddresLbl">Address:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="House No and Landmark" id="ClinicRegAddressLine1Txt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-3"></div>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Street Town Locality" id="ClinicRegAddressLine2Txt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="ClinicRegStateDistrictLbl">State and District:</label>
                                <div class="col-sm-3">
                                    <asp:DropDownList CssClass="form-control" ID="ClinicRegStateDrpDwn" runat="server"></asp:DropDownList>
                                </div>
                                <div class="col-sm-3">
                                    <asp:DropDownList CssClass="form-control" ID="ClinicRegDistrictDrpDwn" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="ClinicRegPincodeLbl">Pincode:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Pincode" id="ClinicRegPincodeTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="ClinicRegPwdLbl">Password:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Password" id="ClinicRegPwdTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="ClinicRegCnfPwdLbl">Confirm Password:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Password" id="ClinicRegCnfPwdTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-3"></div>
                                <div>
                                    <button type="button" class="btn btn-info HospitalRegSubmitBtnPad" id="ClinicRegistrationSubmitBtn">Submit</button>
                                </div>

                            </div>

                        </div>
                    </div>
                    <div id="Pharmacy" class="DivContent">
                        <div class="container-fluid">
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="PharmacyRegOwnerLbl">Owner:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Owner's Name" id="PharmacyRegOwnerTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="PharmacyRegNameLbl">Pharmacy:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Pharmacy Name" id="PharmacyRegNameTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="PharmacyRegEmailLbl">Email:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Email" id="PharmacyRegEmailTxt" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="PharmacyRegPhoneNoLbl">Phone No:</label>
                                <div class="col-sm-2">
                                    <input type="tel" class="form-control" placeholder="STD Code" id="PharmacyRegPhoneNoSTDTxt" />
                                </div>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" placeholder="Phone No" id="PharmacyRegPhoneNoTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="PharmacyRegMobNoLbl">Mobile No:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Mobile No" id="PharmacyRegMobNoTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="PharmacyRegAddresLbl">Address:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="House No and Landmark" id="PharmacyRegAddressLine1Txt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-3"></div>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Street Town Locality" id="PharmacyRegAddressLine2Txt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="PharmacyRegStateDistrictLbl">State and District:</label>
                                <div class="col-sm-3">
                                    <asp:DropDownList CssClass="form-control" ID="PharmacyRegStateDrpDwn" runat="server"></asp:DropDownList>
                                </div>
                                <div class="col-sm-3">
                                    <asp:DropDownList CssClass="form-control" ID="PharmacyRegDistrictDrpDwn" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="PharmacyRegPincodeLbl">Pincode:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Pincode" id="PharmacyRegPincodeTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="PharmacyRegPwdLbl">Password:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Password" id="PharmacyRegPwdTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="PharmacyRegCnfPwdLbl">Confirm Password:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Password" id="PharmacyRegCnfPwdTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-3"></div>
                                <div>
                                    <button type="button" class="btn btn-info HospitalRegSubmitBtnPad" id="PharmacyRegistrationSubmitBtn">Submit</button>
                                </div>

                            </div>

                        </div>
                    </div>
                    <div id="Pathology" class="DivContent">
                        <div class="container-fluid">

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="PathologyRegOwnerLbl">Owner:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Owner's Name" id="PathologyRegOwnerTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="PathologyRegNameLbl">Pathology:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Pathology Name" id="PathologyRegNameTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="PathologyRegEmailLbl">Email:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Email" id="PathologyRegEmailTxt" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="PathologyRegPhoneNoLbl">Phone No:</label>
                                <div class="col-sm-2">
                                    <input type="tel" class="form-control" placeholder="STD Code" id="PathologyRegPhoneNoSTDTxt" />
                                </div>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" placeholder="Phone No" id="PathologyRegPhoneNoTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="PathologyRegMobNoLbl">Mobile No:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Mobile No" id="PathologyRegMobNoTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="PathologyRegAddresLbl">Address:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="House No and Landmark" id="PathologyRegAddressLine1Txt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-3"></div>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Street Town Locality" id="PathologyRegAddressLine2Txt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="PathologyRegStateDistrictLbl">State and District:</label>
                                <div class="col-sm-3">
                                    <asp:DropDownList CssClass="form-control" ID="PathologyRegStateDrpDwn" runat="server"></asp:DropDownList>
                                </div>
                                <div class="col-sm-3">
                                    <asp:DropDownList CssClass="form-control" ID="PathologyRegDistrictDrpDwn" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="PathologyRegPincodeLbl">Pincode:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Pincode" id="PathologyRegPincodeTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="PathologyRegPwdLbl">Password:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Password" id="PathologyRegPwdTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="PathologyRegCnfPwdLbl">Confirm Password:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Password" id="PathologyRegCnfPwdTxt" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-3"></div>
                                <div>
                                    <button type="button" class="btn btn-info HospitalRegSubmitBtnPad" id="PathologyRegistrationSubmitBtn">Submit</button>
                                </div>

                            </div>

                        </div>
                    </div>
                    
                </form>
                
            </div>
        </div>
    </div>
    <script>
        document.getElementById("defaultOpen").click();
    </script>
</body>
</html>

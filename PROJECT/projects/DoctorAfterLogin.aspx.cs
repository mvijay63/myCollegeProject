using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class DoctorAfterLogin : System.Web.UI.Page
{
    int BookingId;
    DataSet ds;
    AllFunctions all = new AllFunctions();
    protected void Page_Load(object sender, EventArgs e)
    {
        /*try
        {
            if (Session["user"].ToString() != "")
                SignLbl.Text = Session["user"].ToString();
        }
        catch (Exception ex)
        {
            Response.Redirect("LoginReg.aspx");
        }*/
        if(!IsPostBack)
        {
     
            string query = "select MedicineId,MedicineName from Medicine";
            all.DrpDownData(MedicineDrpdwn, query, "MedicineId", "MedicineName", "--Select Medicine--");
            query = "select LabTestId,LabTestName from PathologyTests";
            all.DrpDownData(LabTestDrpdwn, query, "LabTestId", "LabTestName", "--Select Test--");
            query = "select DoseId,Dose from Doses";
            all.DrpDownData(DoseDrpdwn, query, "DoseId", "Dose", "--Select Dose--");
            query = "select UserId,PathologyName from LabDetails";
            all.DrpDownData(PathologyNameDrpdwn, query, "UserId", "PathologyName", "--Select Lab--");
            query = "select UserId,PharmacyName from PharmacyDetails";
            all.DrpDownData(PharmacyNameDrpdwn, query, "UserId", "PharmacyName", "--Select Pharmacy--");
        }
        
            
        
    }
    protected void LogOutBtn_Click(object sender, EventArgs e)
    {
        Session["user"] = "";
        Session["userid"] = "";
        Response.Redirect("Default.aspx");
    }
    protected void CheckApp_Click(object sender, EventArgs e)
    {
        int Docid = (int)Session["userid"];
        
        string query = "select  convert(char(5), doc_slots.slot_time , 108) slot_time , BookingDetails.BookingId from doc_slots, BookingDetails where BookingDetails.Slotid = doc_slots.slot_id  AND BookingDetails.Date = '"+picker.Text+"' AND BookingDetails.DoctorId = "+Docid+"";
        all.Repeater(BookedSlotsRptr, query);
        

    }
    protected void BookedSlotsRptr_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        EmailLbl.Text = string.Empty;
        NameLbl.Text = string.Empty;
        AgeLbl.Text = string.Empty;
        PhoneLbl.Text = string.Empty;
        PrescriptionTxt.Text = string.Empty;
        LabTestTxt.Text = string.Empty;

        if (e.CommandName == "getBookingId")
        {

            BookingId = Convert.ToInt32(e.CommandArgument);
            
        }
        string query = "select Name, Email, Gender, Phone from PatientDetails where UserId = (select PatientId  from BookingDetails where BookingId= '"+ BookingId +"') ";
        var reader = all.ExeReader(query);
        
        {
            if (reader.Read())
            {
                NameLbl.Text = reader["Name"].ToString();
                EmailLbl.Text = reader["Email"].ToString();
                AgeLbl.Text = reader["Gender"].ToString();
                PhoneLbl.Text = reader["Phone"].ToString();

            }
        }
        
        

    }
    protected void EditProfileBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("DoctorEditProfile.aspx");
    }
    protected void SubmitBtn_Click(object sender, EventArgs e)
    {
        string query1="select UserId from PatientDetails where Email='"+EmailLbl.Text+"'";
        object ui=all.ExeScalar(query1);
        string query = "insert into PharmacyPrescription(PatientId,DoctorId,PharmacyId,Prescription,Date)values(@patid,@docid,@pharid,@pres,@date)";
        SqlParameter[] parameter = new SqlParameter[]{
            new SqlParameter("@patid",Convert.ToInt32(ui)),
            new SqlParameter("@docid",Session["userid"]),
            new SqlParameter("@pharid",PharmacyNameDrpdwn.SelectedItem.Value),
            new SqlParameter("@pres",PrescriptionTxt.Text),
            new SqlParameter("@date",picker.Text)
        };
        int x = all.ExeNonQuery(query, parameter);


    }
    protected void AddMedicineBtn_Click(object sender, EventArgs e)
    {
        ArrayList medicine = new ArrayList();
        medicine.Add(MedicineDrpdwn.SelectedItem.Text);
        PrescriptionTxt.Text = PrescriptionTxt.Text + MedicineDrpdwn.SelectedItem.Text + "\t\t" + DoseDrpdwn.SelectedItem.Text + '\n';
        
    }
    protected void AddTestBtn_Click(object sender, EventArgs e)
    {
        string query1="select UserId from PatientDetails where Email='"+EmailLbl.Text+"'";
        object ui=all.ExeScalar(query1);
        string query = "insert into PathologyTestDetail(PatientId,DoctorId,PathologyId,TestName,Date)values(@patientid,@doctorid,@pathologyid,@testname,@date)";
        SqlParameter[] parameter = new SqlParameter[]{
            new SqlParameter("@patientid",Convert.ToInt32(ui)),
            new SqlParameter("@doctorid",Session["userid"]),
            new SqlParameter("@pathologyid",PathologyNameDrpdwn.SelectedItem.Value),
            new SqlParameter("@testname",LabTestDrpdwn.SelectedItem.Text),
            new SqlParameter("@date",picker.Text)
        };
        int x = all.ExeNonQuery(query, parameter);
        LabTestTxt.Text = LabTestTxt.Text + LabTestDrpdwn.SelectedItem.Text + '\n';
    }
}
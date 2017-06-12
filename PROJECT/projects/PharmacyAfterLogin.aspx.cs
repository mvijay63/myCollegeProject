using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class PharmacyAfterLogin : System.Web.UI.Page
{
    AllFunctions all = new AllFunctions();
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {






    
    }
    protected void LogOutBtn_Click(object sender, EventArgs e)
    {
        Session["user"] = "";
        Session["userid"] = "";
        Response.Redirect("Default.aspx");
    }
    protected void CheckApp_Click(object sender, EventArgs e)
    {
        string query = "select DoctorId from BookingDetails where PatientId = 10001 and Date = '" + datepicker.Text + "'";
       string Did = all.ExeScalar(query).ToString();
       string query1 = "select Name  from DoctorDetails where UserId = " + Did + " ";
       DocName.Text =  "DR  "+ all.ExeScalar(query1).ToString();
       string query2 = "select Prescription, Status from PharmacyPrescription where PatientId = 10001 and Date = '" + datepicker.Text + "'";
       ds = all.ExeAdapter(query2, "temp");
       PrescriptionTxt.Text = ds.Tables["temp"].Rows[0][0].ToString();
      string Sts = ds.Tables["temp"].Rows[0][1].ToString();
      if (Sts.Equals("paid"))
      {
          PaymentChkBox.Checked = true;
          SubmitBtn.Enabled = false;       
      }
    }
    protected void SubmitBtn_Click(object sender, EventArgs e)
    {    


        if (PaymentChkBox.Checked)
        {
            string query = "UPDATE PharmacyPrescription SET PaymentReceived='" + AmountTxt.Text + "', Status='paid' WHERE PatientId = 10001 and Date = '" + datepicker.Text + "'";
            int i = all.ExeNonQuery(query);

        }
        else
        {

            AmountTxt.Text = "Upaid";
        }
    }
}
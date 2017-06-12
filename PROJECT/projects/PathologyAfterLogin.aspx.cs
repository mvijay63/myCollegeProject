using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class PathologyAfterLogin : System.Web.UI.Page
  {
    AllFunctions all = new AllFunctions();
    DataSet ds ;
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
        } */
        if (!IsPostBack)
        {

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
        string query = "select DoctorId from BookingDetails where PatientId = 10001 and Date = '" + datepicker.Text + "'";
        string Did = all.ExeScalar(query).ToString();
        string query1 = "select Name  from DoctorDetails where UserId = " + Did + " ";
        DocNamelbl.Text = "DR  " + all.ExeScalar(query1).ToString();
        string query2 = "select Name  from PatientDetails where UserId = 10001 ";
        PatientNameLbl.Text = all.ExeScalar(query2).ToString();
        string query3 = "select TestId, TestName from PathologyTestDetail where PatientId = 10001 and Date = '" + datepicker.Text + "'";
        all.DrpDownData(LRTestNameDrpdwn, query3, "TestId", "TestName", "--select Test --");

         
    }

    


    protected void LRTestNameDrpdwn_SelectedIndexChanged(object sender, EventArgs e)
    {

        string query4 = "select PaymentReceived, Status from PathologyTestDetail where TestName = '" + LRTestNameDrpdwn.SelectedItem.ToString() + "' and PatientId = 10001 and Date = '" + datepicker.Text + "'";
        ds = all.ExeAdapter(query4, "temp");
        AmountTxt.Text = ds.Tables["temp"].Rows[0][0].ToString();
        string Sts = ds.Tables["temp"].Rows[0][1].ToString();
        if (Sts.Equals("done"))
        {
            PaymentChkBox.Checked = true;
            SubmitBtn.Enabled = false;
             ReportTxt.Text = Sts;
        }
        else
        {

             ReportTxt.Text = "this test is yet has to be done";
        }

 
            
              

        
    }
}

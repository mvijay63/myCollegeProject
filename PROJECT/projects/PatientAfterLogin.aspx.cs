using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class PatientAfterLogin : System.Web.UI.Page
{
    AllFunctions all = new AllFunctions();
    DataSet ds;
    int DocId, SlotId,val;
    
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        try
        {
            if (Session["user"].ToString() != "")
                SignLbl.Text = Session["user"].ToString();
        }
        catch (Exception ex) 
        {
            Response.Redirect("LoginReg.aspx");
        } 
        if (!IsPostBack)
        {
            AppointmentBtn.Attributes.Add("style", "background-color:white;color:#28465A;");
            Appointment.Visible = true;
            LabReport.Visible = false;
            MedicalPrescription.Visible = false;
            Review.Visible = false;
        }
        
           
    }
    protected void LogOutBtn_Click(object sender, EventArgs e)
    {
        Session["user"] = "";
        Session["userid"] = "";
        Response.Redirect("Default.aspx");
    }
    protected void AfterLoginBookAppBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Find.aspx");
    }

 
    protected void PastBtn_Click(object sender, EventArgs e)
    {
        MedicalPrescriptionBtn.Attributes.Add("style", "background-color:none;color:white;");
        LabReportBtn.Attributes.Add("style", "background-color:none;color:white;");
        DocReviewBtn.Attributes.Add("style", "background-color:none;color:white;");
        AppointmentBtn.Attributes.Add("style", "background-color:white;color:#28465A;");
        Appointment.Visible = true;
        Review.Visible = false;
        LabReport.Visible = false;
        MedicalPrescription.Visible = false;
    }
    protected void LabReportBtn_Click(object sender, EventArgs e)
    {
        MedicalPrescriptionBtn.Attributes.Add("style", "background-color:none;color:white;");
        LabReportBtn.Attributes.Add("style", "background-color:white;color:#28465A;");
        DocReviewBtn.Attributes.Add("style", "background-color:none;color:white;");
        AppointmentBtn.Attributes.Add("style", "background-color:none;color:white;");
        LabReport.Visible = true;
        Review.Visible = false;
        Appointment.Visible = false;
        MedicalPrescription.Visible = false;

        LRDocNameLbl.Text = AppDocNameLbl.Text;

        string query = "select TestId, TestName from PathologyTestDetail where PatientId = "+Session["userid"]+" and Date = '" + datepicker.Text + "'";
        all.DrpDownData(LRTestNameDrpdwn,query,"TestId","TestName","--select Test --") ;


    }
    protected void MedicalPrescriptionBtn_Click(object sender, EventArgs e)
    {
        MedicalPrescriptionBtn.Attributes.Add("style", "background-color:white;color:#28465A;");
        LabReportBtn.Attributes.Add("style", "background-color:none;color:white;");
        DocReviewBtn.Attributes.Add("style", "background-color:none;color:white;");
        AppointmentBtn.Attributes.Add("style", "background-color:none;color:white;");
        
        MedicalPrescription.Visible = true;
        Review.Visible = false;
        Appointment.Visible = false;
        LabReport.Visible = false;

        MRDocNameLbl.Text = AppDocNameLbl.Text;

        string query = "select Prescription from PharmacyPrescription where PatientId = " + Session["userid"] + " and Date = '" + datepicker.Text + "'";
        object s = all.ExeScalar(query);
       
        MPPrescriptionTxt.Text = s.ToString();
       
    }

    protected void DocReview_Click(object sender, EventArgs e)
    {
        
        MedicalPrescriptionBtn.Attributes.Add("style", "background-color:none;color:white;");
        LabReportBtn.Attributes.Add("style", "background-color:none;color:white;");

        AppointmentBtn.Attributes.Add("style", "background-color:none;color:white;");
        DocReviewBtn.Attributes.Add("style", "background-color:white;color:#28465A;");

        MedicalPrescription.Visible = false;
        Review.Visible = true;
        Appointment.Visible = false;
        LabReport.Visible = false;
        RevDocNameLbl.Text = AppDocNameLbl.Text;
    }
    protected void CheckApp_Click(object sender, EventArgs e)
    {

        try
        {
            string query = "select DoctorId,SlotId from BookingDetails where PatientId = " + Session["userid"] + " and Date = '" + datepicker.Text + "'";
            ds = all.ExeAdapter(query, "temp");
             DocId = (int)ds.Tables["temp"].Rows[0][0];
             SlotId = (int)ds.Tables["temp"].Rows[0][1];
            // AppDocTimeLbl.Text = SlotId.ToString();

             if (SlotId <13)
             {
                 string query1 = "select slot_time from doc_slots where slot_id = " + SlotId + "";
                 object dc = all.ExeScalar(query1);
                 AppDocTimeLbl.Text = dc.ToString() + " AM";
             }
             else
             {
                 string query1 = "select slot_time from doc_slots where slot_id = " + SlotId + "";
                 object dc = all.ExeScalar(query1);
                 AppDocTimeLbl.Text = dc.ToString() + " PM";
             }
            string query2 = "select Name from DoctorDetails where UserId = " + DocId + "";
            object dn = all.ExeScalar(query2);     
            AppDocNameLbl.Text = "DR. " + dn.ToString();
           


        }

        catch
        {

            AppDocNameLbl.Text = "NO bookings for" + datepicker.Text;

        } 



    }
    protected void LRTestNameDrpdwn_SelectedIndexChanged(object sender, EventArgs e)
    {

     //   LRReportTxt.Text = LRTestNameDrpdwn.SelectedItem.ToString();


        
        

            string query = "select Status from PathologyTestDetail where TestName = '" + LRTestNameDrpdwn.SelectedItem.ToString() + "' and PatientId = 10001 and Date = '" + datepicker.Text + "'";
            string s = all.ExeScalar(query).ToString();
            if (s.Equals("done"))
            {

                LRReportTxt.Text = s.ToString();
            }
            else
            {


                LRReportTxt.Text = "this test is yet has to be done";
            }
        
    }


  
  
    protected void Star1_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string NoOfStar = btn.CommandArgument;
        char[] num = NoOfStar.ToCharArray();
         
        val = (int)Char.GetNumericValue(num[0]);
         HiddenField1.Value = val.ToString();

        Star1.Attributes.Add("style", "color:white");
        Star2.Attributes.Add("style", "color:white");
        Star3.Attributes.Add("style", "color:white");
        Star4.Attributes.Add("style", "color:white");
        Star5.Attributes.Add("style", "color:white");
        
        switch(val)
        {
            case 1:
                Star1.Attributes.Add("style", "color:#fff099");
                break;
            case 2:
                Star1.Attributes.Add("style", "color:#fff099");
                Star2.Attributes.Add("style", "color:#fff099");
                break;
            case 3:
                Star1.Attributes.Add("style", "color:#fff099");
                Star2.Attributes.Add("style", "color:#fff099");
                Star3.Attributes.Add("style", "color:#fff099");
                break;
            case 4:
                Star1.Attributes.Add("style", "color:#fff099");
                Star2.Attributes.Add("style", "color:#fff099");
                Star3.Attributes.Add("style", "color:#fff099");
                Star4.Attributes.Add("style", "color:#fff099");
                break;
            case 5:
                Star1.Attributes.Add("style", "color:#fff099");
                Star2.Attributes.Add("style", "color:#fff099");
                Star3.Attributes.Add("style", "color:#fff099");
                Star4.Attributes.Add("style", "color:#fff099");
                Star5.Attributes.Add("style", "color:#fff099");
                break;
        }
        
    }

    protected void ReviewSubmitBtn_Click(object sender, EventArgs e)
    {
        string query = "select DoctorId from BookingDetails where PatientId = " + Session["userid"] + " and Date = '" + datepicker.Text + "'";
        ds = all.ExeAdapter(query, "temp");
        int DocId1 = (int)ds.Tables["temp"].Rows[0][0];
        
        char[] num = HiddenField1.Value.ToCharArray();
        int val1 = (int)Char.GetNumericValue(num[0]);

        query = "select Reviewed from ReviewDone where PatientI=" + Session["userid"] + " and DocId=" + DocId1 + "";
        ds = all.ExeAdapter(query, "temp2");

        try
        {
            int rev = (int)ds.Tables["temp2"].Rows[0][0];
            if (rev == 1)
            {
                ReviewedLbl.Text = "Already Reviewed";
                ReviewSubmitBtn.Enabled = false;
            }

        }
        catch (Exception ex) 
        {
            
            switch (val1)
            {
                case 1:
                    int n;
                    query = "select One from StarRate where DocId=" + DocId1 + "";
                    try
                    {
                        ds = all.ExeAdapter(query, "temp1");
                        n = (int)ds.Tables["temp1"].Rows[0][0];
                        n = n + 1;
                        query = "update StarRate set One=" + n + " where DocId=" + DocId1 + "";
                        int y = all.ExeNonQuery(query);
                        
                        

                    }
                    catch (Exception ex1)
                    {
                        query = "insert into StarRate(DocId,One)values(@docid,@one)";
                        SqlParameter[] parameter = new SqlParameter[]
                        {
                            new SqlParameter("@docid",DocId1),
                            new SqlParameter("@one",1)
                        };
                        int x = all.ExeNonQuery(query, parameter);

                        
                    }

                    break;
                case 2:
                   
                    query = "select Two from StarRate where DocId=" + DocId1 + "";
                    try
                    {
                        ds = all.ExeAdapter(query, "temp1");
                        n = (int)ds.Tables["temp1"].Rows[0][0];
                        n = n + 1;
                        query = "update StarRate set Two=" + n + " where DocId=" + DocId1 + "";
                        int y = all.ExeNonQuery(query);



                    }
                    catch (Exception ex1)
                    {
                        query = "insert into StarRate(DocId,Two)values(@docid,@two)";
                        SqlParameter[] parameter = new SqlParameter[]
                        {
                            new SqlParameter("@docid",DocId1),
                            new SqlParameter("@two",1)
                        };
                        int x = all.ExeNonQuery(query, parameter);


                    }

                    break;
                case 3:
                    
                    query = "select Three from StarRate where DocId=" + DocId1 + "";
                    try
                    {
                        ds = all.ExeAdapter(query, "temp1");
                        n = (int)ds.Tables["temp1"].Rows[0][0];
                        n = n + 1;
                        query = "update StarRate set Three=" + n + " where DocId=" + DocId1 + "";
                        int y = all.ExeNonQuery(query);



                    }
                    catch (Exception ex1)
                    {
                        query = "insert into StarRate(DocId,Three)values(@docid,@three)";
                        SqlParameter[] parameter = new SqlParameter[]
                        {
                            new SqlParameter("@docid",DocId1),
                            new SqlParameter("@three",1)
                        };
                        int x = all.ExeNonQuery(query, parameter);


                    }

                    break;
                case 4:
                    
                    query = "select Four from StarRate where DocId=" + DocId1 + "";
                    try
                    {
                        ds = all.ExeAdapter(query, "temp1");
                        n = (int)ds.Tables["temp1"].Rows[0][0];
                        n = n + 1;
                        query = "update StarRate set Four=" + n + " where DocId=" + DocId1 + "";
                        int y = all.ExeNonQuery(query);



                    }
                    catch (Exception ex1)
                    {
                        query = "insert into StarRate(DocId,Four)values(@docid,@four)";
                        SqlParameter[] parameter = new SqlParameter[]
                        {
                            new SqlParameter("@docid",DocId1),
                            new SqlParameter("@four",1)
                        };
                        int x = all.ExeNonQuery(query, parameter);


                    }

                    break;
                case 5:
                    
                    query = "select Five from StarRate where DocId=" + DocId1 + "";
                    try
                    {
                        ds = all.ExeAdapter(query, "temp1");
                        n = (int)ds.Tables["temp1"].Rows[0][0];
                        n = n + 1;
                        query = "update StarRate set Five=" + n + " where DocId=" + DocId1 + "";
                        int y = all.ExeNonQuery(query);



                    }
                    catch (Exception ex1)
                    {
                        query = "insert into StarRate(DocId,Five)values(@docid,@five)";
                        SqlParameter[] parameter = new SqlParameter[]
                        {
                            new SqlParameter("@docid",DocId1),
                            new SqlParameter("@five",1)
                        };
                        int x = all.ExeNonQuery(query, parameter);


                    }

                    break;

            }

            query = "insert into ReviewDone(PatientI,DocId,Reviewed)values(@patid,@docid,@review)";
            SqlParameter[] parameter1 = new SqlParameter[]
                        {
                            new SqlParameter("@patid",Session["userid"]),
                            new SqlParameter("@docid",DocId1),
                            new SqlParameter("@review",1)
                        };
            all.ExeNonQuery(query, parameter1);

            query = "insert into DocReview(PatientName,PatientId,Review,DocId)values(@patname,@patid,@rev,@docid)";
            SqlParameter[] parameter2 = new SqlParameter[]{
                new SqlParameter("@patname",Session["user"]),
                new SqlParameter("@patid",Session["userid"]),
                new SqlParameter("@rev",DocReviewTxt.Text),
                new SqlParameter("@docid",DocId1)
            };
            all.ExeNonQuery(query, parameter2);
 
        }
        
        

    }
}
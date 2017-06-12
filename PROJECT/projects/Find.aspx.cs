using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Windows;
using System.Configuration;
public partial class Find : System.Web.UI.Page
{
    DataSet ds;
    AllFunctions all = new AllFunctions();
    int Id, mOpen, mClose, eOpen, eClose;
    TimeSpan time;
    string time1;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["user"].ToString() == "")
            {
                DropDownLbl.Text = "SIGNIN";
            }
            else
            {
                SignLbl.Text = Session["user"].ToString();
            }
        }
        catch(Exception ex)
        {
            DropDownLbl.Text = "SIGNIN";
        }
       
        if (!this.IsPostBack)
        {
            if (Request.QueryString["speciality"] != null)
            {
                string query = "Select * from DoctorDetails where Specialization='" + Request.QueryString["speciality"] + "' and Region='" + Request.QueryString["location"] + "'";
                all.Repeater(BookingRptr, query);
            }
            string query1 = "select CityName, CityId from City";
            all.DrpDownData(FindCityDrpDwn, query1, "CityId", "CityName", "---Select City---");
            query1 = "select Speciality,Speciality_id from Speciality";
            all.DrpDownData(FindSpecialtyDrpDwn, query1, "Speciality_id", "Speciality", "---Select Speciality---");
            MorningSlotRptr.Visible = false;
            EveningSlotRptr.Visible = false;
            head1.Visible = false;
            head2.Visible = false;
            BookAppointmentBtn.Enabled = false;


        }
        
    }
    protected void FindCityDrpDwn_SelectedIndexChanged(object sender, EventArgs e)
    {
        string SelectedDrpdwnValue = FindCityDrpDwn.SelectedItem.Value;
        string query = "select ZoneId,ZoneName from Zone where CityId=" + SelectedDrpdwnValue + "";
        all.DrpDownData(FindLocationDrpDwn, query, "ZoneId", "ZoneName", "---Select Location---");
    }

    protected void appButton_Click(object sender, EventArgs e)
    {

    }
    protected void DocSearchBtn_Click(object sender, EventArgs e)
    {
        //string query = "select * from doc_profile where region='East'";
        string query = "Select * from DoctorDetails where Specialization='" + FindSpecialtyDrpDwn.SelectedItem.ToString() + "' and Region='" + FindLocationDrpDwn.SelectedItem.ToString() + "'";
        all.Repeater(BookingRptr, query);

    }
    protected void BookingRptr_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "get_id")
        {

           int Id = Convert.ToInt32(e.CommandArgument);
            myModal.Attributes["class"] = "hidden";
            myModal.Attributes.Add("class", "ModalClick");
           
            Session["docid"] = Id;

        }
        if (e.CommandName == "RevDoc")
        {
            int Id = Convert.ToInt32(e.CommandArgument);
            Session["docid"] = Id;
            Response.Redirect("DoctorReview.aspx");
        }
    }




    protected void SlotpickerBtn_Click(object sender, EventArgs e)
  {
        string query = "SELECT m_open, m_close, e_open, e_close  FROM doc_timings WHERE doc_id = '" + Session["docid"] + "'";

        var reader = all.ExeReader(query);
        if (reader.Read())
        {
            mOpen = Convert.ToInt32(reader["m_open"]);
            mClose = Convert.ToInt32(reader["m_close"]);
            eOpen = Convert.ToInt32(reader["e_open"]);
            eClose = Convert.ToInt32(reader["e_close"]);
        }
        all.CloseConnection();
        string query1 = "select  convert(char(5), slot_time , 108) [time],slot_id from doc_slots where slot_id >= '" + mOpen + "'AND slot_id <='" + mClose + "' AND slot_id not in (select Slotid from BookingDetails where Date ='" + datepicker.Text + "')";
        all.Repeater(MorningSlotRptr, query1);
        string query2 = "select  convert(char(5), slot_time , 108) [time],slot_id from doc_slots where slot_id >= '" + eOpen + "' AND slot_id <='" + eClose + "' AND slot_id not in (select Slotid from BookingDetails where Date ='" + datepicker.Text + "')";
        all.Repeater(EveningSlotRptr, query2);
        MorningSlotRptr.Visible = true;
        EveningSlotRptr.Visible = true;
        head1.Visible = true;
        head2.Visible = true;
        SlotpickerBtn.Visible = false;
        BookAppointmentBtn.Enabled = true;
    
    }
 
    protected void MorningSlotRptr_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "get_time")
        {

            int Id = Convert.ToInt32(e.CommandArgument);
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            string syntax = "SELECT slot_time FROM doc_slots WHERE slot_id=@slot_id";
            SqlCommand cmd = new SqlCommand(syntax, con);
            cmd.Parameters.AddWithValue("@slot_id", Id);
            cmd.Connection.Open();
            time = (TimeSpan)cmd.ExecuteScalar();
             time1 = string.Format("{0:00}:{1:00}", (int)time.TotalHours, (int)time.Minutes);
            cmd.Connection.Close();
          if (Id < 16)
            {

                SlotpickerTxt.Text= time1 + " AM";
            }
            else
            {

                SlotpickerTxt.Text = time1 + " PM";
            }
          Session["slotid"] = Id;
        }
    }
    protected void EveningSlotRptr_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "get_time")
        {

            Id = Convert.ToInt32(e.CommandArgument);
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            string syntax = "SELECT slot_time FROM doc_slots WHERE slot_id=@slot_id";
            SqlCommand cmd = new SqlCommand(syntax, con);
            cmd.Parameters.AddWithValue("@slot_id", Id);
            cmd.Connection.Open();
            time = (TimeSpan)cmd.ExecuteScalar();
            time1 = string.Format("{0:00}:{1:00}", (int)time.TotalHours, (int)time.Minutes);
            SlotpickerTxt.Text = time1 + " PM";
            Session["slotid"] = Id;
        }

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }
    protected void BookAppointmentBtn_Click(object sender, EventArgs e)
    {
        Session["date"] = datepicker.Text;
        if (Session["user"] == null || Session["user"] == "")
        {
            Session["state"] = 1;
            Response.Redirect("LoginReg.aspx");
        }
        else
        {
            Response.Write("<script>alert('Your Booking Is Succesful')</script>");
            string query2 = "insert into BookingDetails(PatientId,DoctorId,SlotId,Date)values(@patientid,@doctorid,@slotid,@date)";
            SqlParameter[] parameter = new SqlParameter[]
                            {
                                new SqlParameter("@patientid", Convert.ToInt32(Session["userid"])),
                                new SqlParameter("@doctorid",Convert.ToInt32(Session["docid"])),
                                new SqlParameter("@slotid",Convert.ToInt32(Session["slotid"])),
                                new SqlParameter("@date",Session["date"].ToString())
                            };
            Response.Redirect("PatientAfterLogin.aspx");
        }
    }
    protected void LogOutBtn_Click(object sender, EventArgs e)
    {
        Session["user"] = "";
        Session["userid"] = "";
        if (DropDownLbl.Text == "SIGNIN")
        {
            Session["state"] = 2;
            Response.Redirect("LoginReg.aspx");

        }
            
        else
            Response.Redirect("Default.aspx");
        
    }
}

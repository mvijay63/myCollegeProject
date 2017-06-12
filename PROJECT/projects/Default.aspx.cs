using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    DataSet ds;
    AllFunctions all = new AllFunctions();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["user"]="";
       if (!this.IsPostBack)
       {
            
            string query = "select CityName, CityId from City";
            all.DrpDownData(CityDrpdwn, query, "CityId", "CityName", "---Select City---");
            query = "select Speciality,Speciality_id from Speciality";
            all.DrpDownData(SpecialityDrpdwn, query, "Speciality_id", "Speciality", "---Select Speciality---");
       }
       if (Session["user"].ToString() != "")
           SignLbl.Text = Session["user"].ToString();

    }
    

    protected void DocKMBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("KnowMore.aspx");
    }
    protected void LogindBtn_Click(object sender, EventArgs e)
    {
        
        string email=LoginEmailTxt.Text;
        string pwd = LoginPasswordTxt.Text;
        if (LoginEmailTxt.Text == null || LoginEmailTxt.Text == "" || LoginPasswordTxt.Text == null || LoginPasswordTxt.Text == "")
        {
            LoginMsglbl.Text = "Please fill all the fields";
            LoginEmailTxt.Text = string.Empty;
            LoginPasswordTxt.Text = string.Empty;
        }
        else 
        {
            string query="select Email from EmailPasswordDetails where Email='"+email+"'";
            object firstelement = all.ExeScalar(query);



           try
            {
                if (firstelement.ToString() == email)
                {
                    string query1 = "select * from EmailPasswordDetails where Email='" + email+ "'";
                    ds = all.ExeAdapter(query1, "EmailPwdTable");
                    if (pwd != ds.Tables["EmailPwdTable"].Rows[0][2].ToString())
                    {
                        LoginMsglbl.Text = "Password does not Matches";


                    }
                    else
                    {
                        
                        if (Convert.ToInt32(ds.Tables["EmailPwdTable"].Rows[0][4]) == 1)
                        {

                            Session["user"] = ds.Tables["EmailPwdTable"].Rows[0][3].ToString();
                            Session["userid"] = Convert.ToInt32(ds.Tables["EmailPwdTable"].Rows[0][0]);
                            Response.Redirect("PatientAfterLogin.aspx");
                        }

                        else if (Convert.ToInt32(ds.Tables["EmailPwdTable"].Rows[0][4]) == 2)
                        {

                            Session["user"] = ds.Tables["EmailPwdTable"].Rows[0][3].ToString();
                            Session["userid"] = Convert.ToInt32(ds.Tables["EmailPwdTable"].Rows[0][0]);
                            Response.Redirect("DoctorAfterLogin.aspx");
                        }

                        else if (Convert.ToInt32(ds.Tables["EmailPwdTable"].Rows[0][4]) == 3)
                        {

                            Session["user"] = ds.Tables["EmailPwdTable"].Rows[0][3].ToString();
                            Session["userid"] = Convert.ToInt32(ds.Tables["EmailPwdTable"].Rows[0][0]);
                            Response.Redirect("PathologyAfterLogin.aspx");
                        }

                        else
                        {

                            Session["user"] = ds.Tables["EmailPwdTable"].Rows[0][3].ToString();
                            Session["userid"] = Convert.ToInt32(ds.Tables["EmailPwdTable"].Rows[0][0]);
                            Response.Redirect("PharmacyAfterLogin.aspx");
                        }

                    }

                }
               

            }
            catch (Exception ex)
            {
                LoginMsglbl.Text = "Email is not Registered";

            }
           
           
        }


        
        
       

       
    }


    protected void HomeFindBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Find.aspx?location="+LocationDrpdwn.SelectedItem.Text+"&speciality="+SpecialityDrpdwn.SelectedItem.Text);
    }
    protected void CityDrpdwn_SelectedIndexChanged(object sender, EventArgs e)
    {
        string SelectedDrpdwnValue = CityDrpdwn.SelectedItem.Value;
        string query = "select ZoneId,ZoneName from Zone where CityId=" + SelectedDrpdwnValue + "";
        all.DrpDownData(LocationDrpdwn, query, "ZoneId", "ZoneName", "---Select Location---");
    }
}
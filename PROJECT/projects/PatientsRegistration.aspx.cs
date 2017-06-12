using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class PatientsRegistration : System.Web.UI.Page
{
    AllFunctions all = new AllFunctions();
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PatientRegCnfPwdTxt.Text = string.Empty;
            PatientRegEmailTxt.Text = string.Empty;
            PatientRegNameTxt.Text = string.Empty;
            PatientRegPhoneTxt.Text = string.Empty;
            PatientRegPwdTxt.Text = string.Empty;
        }

    }
    protected void DocKMBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("KnowMore.aspx");
    }
    protected void PatientRegGetStartedBtn_Click(object sender, EventArgs e)
    {
        string Email = PatientRegEmailTxt.Text;
        if (PatientRegEmailTxt.Text == "" || PatientRegNameTxt.Text == "" || PatientRegPhoneTxt.Text == "" 
            || PatientRegGenderRdo.SelectedValue == "")
        {
            PatientRegMsgLbl.Text = "Fill all the field";
        }
        else
        {
            string query = "select Email from PatientDetails where Email='" + PatientRegEmailTxt.Text + "'";
            object firstElement = all.ExeScalar(query);

            try
            {
                if (firstElement.ToString() == Email)
                {
                    PatientRegMsgLbl.Text = "Email is already registered";

                }
            }
            catch (Exception ex)
            {
                if (PatientRegPwdTxt.Text != PatientRegCnfPwdTxt.Text)
                {
                    PatientRegMsgLbl.Text = "Password does not match";
                }
                else
                {
                    query = "insert into PatientDetails(Name,Email,Phone,Gender)values(@name,@email,@phone,@gender)";
                    SqlParameter[] parameter = new SqlParameter[]
                {
                    new SqlParameter("@name",PatientRegNameTxt.Text),
                    new SqlParameter("@email",PatientRegEmailTxt.Text),
                    new SqlParameter("@phone",PatientRegPhoneTxt.Text),
                    new SqlParameter("@gender",PatientRegGenderRdo.SelectedItem.Value)
                };
                    int x = all.ExeNonQuery(query, parameter);

                    string query1 = "select UserId from PatientDetails where Email='" + PatientRegEmailTxt.Text + "'";
                    object userid=all.ExeScalar(query1);
                    query = "insert into EmailPasswordDetails(UserId,Email,Password,Name,CustId)values(@useid,@email,@password,@name,@custid)";
                    SqlParameter[] parameter1 = new SqlParameter[]
                {
                    new SqlParameter("@useid",Convert.ToInt32(userid)),
                    new SqlParameter("@email",PatientRegEmailTxt.Text),
                    new SqlParameter("@password",PatientRegPwdTxt.Text),
                    new SqlParameter("@name",PatientRegNameTxt.Text),
                    new SqlParameter("@custid",1)
                };
                    x = all.ExeNonQuery(query, parameter1);
                    Response.Redirect("PatientAfterLogin.aspx");
                }
            }
            finally 
            {
                PatientRegMsgLbl.Text = "Email is already registered";
            }
            
            
        }
        
    }

    protected void LogindBtn_Click(object sender, EventArgs e)
    {

        string email = LoginEmailTxt.Text;
        string pwd = LoginPasswordTxt.Text;
        if (LoginEmailTxt.Text == null || LoginEmailTxt.Text == "" || LoginPasswordTxt.Text == null || LoginPasswordTxt.Text == "")
        {
            LoginMsglbl.Text = "Please fill all the fields";
            LoginEmailTxt.Text = string.Empty;
            LoginPasswordTxt.Text = string.Empty;
        }
        else
        {
            string query = "select Email from EmailPasswordDetails where Email='" + email + "'";
            object firstelement = all.ExeScalar(query);



            try
            {
                if (firstelement.ToString() == email)
                {
                    string query1 = "select * from EmailPasswordDetails where Email='" + email + "'";
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
}
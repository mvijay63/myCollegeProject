using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class LabsRegistration : System.Web.UI.Page
{
    AllFunctions all = new AllFunctions();
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LabRegNameTxt.Text = string.Empty;
            LabRegEmailTxt.Text = string.Empty;
            LabRegPhoneTxt.Text = string.Empty;
            LabRegMsgLbl.Text = string.Empty;
            LabRegPwdTxt.Text = string.Empty;
            LabRegCnfPwdTxt.Text = string.Empty;
        }
    }
    protected void LabRegGetStatedBtn_Click(object sender, EventArgs e)
    {
        string Email = LabRegEmailTxt.Text;
        if (LabRegEmailTxt.Text == "" || LabRegNameTxt.Text == "" || LabRegPhoneTxt.Text == "")
        {
            LabRegMsgLbl.Text = "Fill all the field";
        }
        else
        {
            string query = "select Email from LabDetails where Email='" + LabRegEmailTxt.Text + "'";
            object firstElement = all.ExeScalar(query);

            try
            {
                if (firstElement.ToString() == Email)
                {
                    LabRegMsgLbl.Text = "Email is already registered";

                }
            }
            catch(Exception ex)
            
            {
                if (LabRegPwdTxt.Text != LabRegCnfPwdTxt.Text)
                {
                    LabRegMsgLbl.Text = "Password does not match";
                }
                else
                {
                    query = "insert into LabDetails(Name,Email,Phone,PathologyName,City)values(@Name,@Email,@Phone,@pathology,@city)";
                    SqlParameter[] parameter = new SqlParameter[]
                    {
                        new SqlParameter("@Name",LabRegNameTxt.Text),
                        new SqlParameter("@Email",LabRegEmailTxt.Text),
                        new SqlParameter("@Phone",LabRegPhoneTxt.Text),
                        new SqlParameter("@pathology",LabRegPathologyNameTxt.Text),
                        new SqlParameter("@city",LabRegCityTxt.Text)
                    
                    };
                    int x = all.ExeNonQuery(query, parameter);

                    string query1 = "select UserId from LabDetails where Email='" + LabRegEmailTxt.Text + "'";
                    object userid = all.ExeScalar(query1);

                    query = "insert into EmailPasswordDetails(UserId,Email,Password,Name,CustId)values(@useid,@email,@password,@name,@custid)";
                    SqlParameter[] parameter1 = new SqlParameter[]
                    {
                        new SqlParameter("@useid",Convert.ToInt32(userid)),
                        new SqlParameter("@email",LabRegEmailTxt.Text),
                        new SqlParameter("@password",LabRegPwdTxt.Text),
                        new SqlParameter("@name",LabRegNameTxt.Text),
                         new SqlParameter("@custid",3)
                    };
                    x = all.ExeNonQuery(query, parameter1);

                    Response.Redirect("PathologyAfterLogin.aspx");
                }
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

    protected void DocKMBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("KnowMore.aspx");
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class LoginReg : System.Web.UI.Page
{
    DataSet ds;
    AllFunctions all = new AllFunctions();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LogindBtn_Click(object sender, EventArgs e)
    {

        string email = LoginEmailTxt.Text;
        string pwd = LoginPasswordTxt.Text;
        if (LoginEmailTxt.Text == null || LoginEmailTxt.Text == "" || LoginPasswordTxt.Text == null || LoginPasswordTxt.Text == "")
        {
            LoginMsglbl.Text = "Please fill all the fields";
            
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

                        if (Convert.ToInt32(Session["state"]) == 1)
                        {

                            Session["user"] = ds.Tables["EmailPwdTable"].Rows[0][3].ToString();
                            Session["userid"] = Convert.ToInt32(ds.Tables["EmailPwdTable"].Rows[0][0]);
                            
                            string query2 = "insert into BookingDetails(PatientId,DoctorId,SlotId,Date)values(@patientid,@doctorid,@slotid,@date)";
                            SqlParameter[] parameter = new SqlParameter[]
                            {
                                new SqlParameter("@patientid", Convert.ToInt32(Session["userid"])),
                                new SqlParameter("@doctorid",Convert.ToInt32(Session["docid"])),
                                new SqlParameter("@slotid",Convert.ToInt32(Session["slotid"])),
                                new SqlParameter("@date",Session["date"].ToString())
                            };
                            int x = all.ExeNonQuery(query2, parameter);
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Booking is successfull')", true);
                            Response.Redirect("PatientAfterLogin.aspx");
                        }

                        else
                        {

                            Session["user"] = ds.Tables["EmailPwdTable"].Rows[0][3].ToString();
                            Session["userid"] = Convert.ToInt32(ds.Tables["EmailPwdTable"].Rows[0][0]);
                            Response.Redirect("Find.aspx");
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
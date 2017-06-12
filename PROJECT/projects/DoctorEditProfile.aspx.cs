using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class DoctorEditProfile : System.Web.UI.Page
{
    DataSet ds;
    AllFunctions all = new AllFunctions();
    int temp;
    string query,docemail;
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
        DocNameLbl.Text = Session["user"].ToString();

        temp=Convert.ToInt32(Session["userid"]);

        query = "select Email from DoctorDetails where UserId=" + temp + "";
        docemail=all.ExeScalar(query).ToString();
        string query1 = "select Phone,City,Exprience,Degree1,Degree2,Degree3,Region,Landline1,Fees,Address from DoctorDetails where Email='" + docemail + "'";
        ds=all.ExeAdapter(query1, "tempTable");

        DocEditPhoneTxt.Text = ds.Tables["temptable"].Rows[0][0].ToString();
        DocEditCityTxt.Text = ds.Tables["temptable"].Rows[0][1].ToString();
        DocEditExprienceTxt.Text = ds.Tables["temptable"].Rows[0][2].ToString();
        DocEditDegree1Txt.Text = ds.Tables["temptable"].Rows[0][3].ToString();
        DocEditDegree2Txt.Text = ds.Tables["temptable"].Rows[0][4].ToString();
        DocEditDegree3Txt.Text = ds.Tables["temptable"].Rows[0][5].ToString();
        DocEditRegionTxt.Text = ds.Tables["temptable"].Rows[0][6].ToString();
        DocEditLandlineTxt.Text = ds.Tables["temptable"].Rows[0][7].ToString();
        DocEditFeeTxt.Text = ds.Tables["temptable"].Rows[0][8].ToString();
        DocEditAddressTxt.Text = ds.Tables["temptable"].Rows[0][9].ToString();
       
    }

    protected void LogOutBtn_Click(object sender, EventArgs e)
    {
        Session["user"] = "";
        Session["userid"] = "";
        Response.Redirect("Default.aspx");
    }

    protected void SubmitBtn_Click(object sender, EventArgs e)
    {
        

        string query2 = "update DoctorDetails set Phone=@phone, City=@city, Exprience=@exprience, Degree1=@degree1, Degree2=@degree2, Degree3=@degree3, Region=@region, Landline1=@landline, Fees=@fees, Address=@address where Email=@email";
        SqlParameter[] parameter = new SqlParameter[]{
            new SqlParameter("@phone",DocEditPhoneTxt.Text),
            new SqlParameter("@city",DocEditCityTxt.Text),
            new SqlParameter("@exprience",DocEditExprienceTxt.Text),
            new SqlParameter("@degree1",DocEditDegree1Txt.Text),
            new SqlParameter("@degree2",DocEditDegree2Txt.Text),
            new SqlParameter("@degree3",DocEditDegree3Txt.Text),
            new SqlParameter("@region",DocEditRegionTxt.Text),
            new SqlParameter("@landline",DocEditLandlineTxt.Text),
            new SqlParameter("@fees",DocEditFeeTxt.Text),
            new SqlParameter("@address",DocEditAddressTxt.Text),
            new SqlParameter("@email",docemail)
        };
        int x = all.ExeNonQuery(query2, parameter);
        Response.Redirect("DoctorAfterLogin.aspx");
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;


public partial class docpage2 : System.Web.UI.Page
{

    int bId;
    protected void Page_Load(object sender, EventArgs e)
    {
        Repeater1.Visible = false;
        

        string Id = Session["docId"].ToString();
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        Label1.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy");
        Calendar1.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Repeater1.Visible = true; 

    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "get_Bid")
        {
            bId = Convert.ToInt32(e.CommandArgument);
          
        }
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myProjectConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand(" select * from users_profile where user_id=(select user_id from test_bookings where booking_id = '" + bId + "')", con);
        con.Open();
        using (var reader = cmd.ExecuteReader())
        {
            if (reader.Read())
            {
                Label2.Text = reader["user_name"].ToString();
                Label3.Text = reader["user_id"].ToString();
                Label4.Text = reader["password"].ToString();

            }
        }
        con.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        
    }
}
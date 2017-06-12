using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for AllFunctions
/// </summary>
public class AllFunctions:System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    DataSet ds;
    SqlDataAdapter da;
    SqlDataReader dr;
    public AllFunctions() // create a connection with the database
    {
        string SettingConnection = System.Configuration.ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        cn = new SqlConnection(SettingConnection);
    }
    public void OpenConnection() //open a database connection
    {
        cn.Open();
    }
    public void CloseConnection() // close a database connection
    {
        cn.Close();
    }
    public SqlDataReader ExeReader(string query) 
    {
        OpenConnection();
        cmd = new SqlCommand(query, cn);
        SqlDataReader data = cmd.ExecuteReader();
       
        return data;
    }
    public int ExeNonQuery(string query) //returns no of rows affected
    {
        OpenConnection();
        cmd = new SqlCommand(query, cn);
        int NoOfRows = cmd.ExecuteNonQuery();
        CloseConnection();
        return NoOfRows;
    }
    public int ExeNonQuery(string query,SqlParameter[] parameter)
    {
        OpenConnection();
        cmd = new SqlCommand(query,cn);
        cmd.Parameters.AddRange(parameter);
        int NoOfRows = cmd.ExecuteNonQuery();
        CloseConnection();
        return NoOfRows;
    }
    public object ExeScalar(string query) // returns element of first row and first column
    {
        OpenConnection();
        cmd = new SqlCommand(query, cn);
        object ElementOfFirstColumnAndFirstRow = cmd.ExecuteScalar();
        CloseConnection();
        return ElementOfFirstColumnAndFirstRow;
    }
    public DataSet ExeAdapter(string query,string table) //create a temp table which can be access by ds
    {
        OpenConnection();
        da = new SqlDataAdapter(query, cn);
        ds = new DataSet();
        da.Fill(ds, table);
        CloseConnection();
        return ds;
    }
    public void DrpDownData(DropDownList ddl, string query, string value, string text, string header) // provide data for dropdown menu
    {
      
        ds = ExeAdapter(query, "TempTable");
        ddl.DataSource = ds;
        ddl.DataValueField = value;
        ddl.DataTextField = text;
        ddl.DataBind();
        ddl.Items.Insert(0, header);
      

    }
    public void Repeater(Repeater rptr, string query)
    {
        ds = ExeAdapter(query, "Temp");
        rptr.DataSource=ds;
        rptr.DataBind();
    }
   

}
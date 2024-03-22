using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace college
{
    public partial class gridview : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename=F:\college\college\App_Data\users.mdf;Integrated Security = True");
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                gridfill();

            }
        }

        protected void gridfill()
        {
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex == e.Row.RowIndex)
            {
                DropDownList quali = e.Row.FindControl("quali") as DropDownList;
                var c = quali.SelectedValue;
                quali.SelectedValue = "";
                cmd = new SqlCommand("SELECT * FROM tbl_qualification", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                quali.DataSource = ds;
                quali.DataTextField = "quli_name";
                quali.DataValueField = "quli_id";
                quali.DataBind();
                quali.SelectedValue = c;
                //con.Open();
                //quali.DataSource = cmd.ExecuteReader();
                //quali.DataTextField = "quli_name";
                //quali.DataValueField = "quli_id";
                //quali.DataBind();
                //con.Close();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            gridfill();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            gridfill();
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            DropDownList quali = e.Row.FindControl("quali") as DropDownList;
            //var c = quali.SelectedValue;
            //quali.SelectedValue = "";
            
            cmd = new SqlCommand("SELECT * FROM tbl_qualification", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            quali.DataSource = ds;
            quali.DataTextField = "quli_name";
            quali.DataValueField = "quli_id";
            quali.DataBind();
            //quali.SelectedValue = c;
        }
    }
}
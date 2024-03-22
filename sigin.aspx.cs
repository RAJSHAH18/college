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
    public partial class sigin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\college\college\App_Data\users.mdf;Integrated Security=True");
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                qualification_fil();
                department_fill();
            }
        }

        protected void signin_Click(object sender, EventArgs e)
        {

        }

        protected void reset_Click(object sender, EventArgs e)
        {

        }

        protected void department_SelectedIndexChanged(object sender, EventArgs e)
        {
            int deptid = Convert.ToInt32(department.SelectedValue);
            course_fill(deptid);
        }

        protected void qualification_fil()
        {
            string query = "SELECT * FROM tbl_qualification";
            cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            qualification.DataSource = ds;
            qualification.DataTextField = "quli_name";
            qualification.DataValueField = "quli_id";
            qualification.DataBind();
            qualification.Items.Insert(0, new ListItem("SELECT QUALIFICATION", "0"));


        }
        protected void department_fill()
        {
            string query = "SELECT * FROM tbl_dept";
            cmd = new SqlCommand(query, con);
            con.Open();
            department.DataSource = cmd.ExecuteReader();
            department.DataTextField = "dept_name";
            department.DataValueField = "dept_id";
            department.DataBind();
            department.Items.Insert(0, new ListItem("SELECT DEPARTMENT", "-1"));
            con.Close();
        }

        protected void course_fill(int deptid)
        {
            string query = "SELECT * FROM tbl_course WHERE dept_id =" + deptid;
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = query;
            con.Open();
            course.DataSource = cmd.ExecuteReader();
            course.DataTextField = "course_name";
            course.DataValueField = "course_id";
            course.DataBind();
            course.Items.Insert(0, new ListItem("SELECT COURSE", "0"));
            con.Close();
        }
    }
}
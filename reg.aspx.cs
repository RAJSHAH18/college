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
    public partial class reg : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\college\college\App_Data\users.mdf;Integrated Security=True");
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

                qualifill();
                departmentfill();
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string hobby = string.Join(",", txt_hobby.Items.OfType<ListItem>().Where(r => r.Selected).ToList());
            Response.Write($"<script>alert('{hobby}')</script>");

        }
        protected void qualifill()
        {
            cmd = new SqlCommand("SELECT * FROM tbl_qualification",con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            txt_quali.DataSource = ds;
            txt_quali.DataTextField = "quli_name";
            txt_quali.DataValueField = "quli_id";
            txt_quali.DataBind();
            txt_quali.Items.Insert(0, new ListItem("SELECT QUALIFICATION", "0"));

        }

        protected void departmentfill()
        {
            cmd = new SqlCommand("SELECT * FROM tbl_dept",con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            txt_dept.DataSource = ds;
            txt_dept.DataTextField = "dept_name";
            txt_dept.DataValueField = "dept_id";
            txt_dept.DataBind();
            txt_dept.Items.Insert(0, new ListItem("SELECT DEPARTMENT", "0"));

        }
        protected void coursefill(int did)
        {
            cmd = new SqlCommand("SELECT * FROM tbl_course WHERE dept_id="+did,con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            txt_course.DataSource = ds;
            txt_course.DataTextField = "course_name";
            txt_course.DataValueField = "course_id";
            txt_course.DataBind();
            txt_course.Items.Insert(0, new ListItem("SELECT COURSE", "0"));

        }

        protected void reset_Click(object sender, EventArgs e)
        {
            txt_name.Text = "";
            txt_email.Text = "";
            txt_password.Text = "";
            txt_phone.Text = "";
            txt_quali.ClearSelection();
            txt_dept.ClearSelection();
            txt_course.Items.Clear();
            txt_course.Items.Insert(0, new ListItem("SELECT COURSE", "0"));
            txt_gender.ClearSelection();
        }

        protected void txt_dept_SelectedIndexChanged(object sender, EventArgs e)
        {
            int did = Convert.ToInt32(txt_dept.SelectedValue);
            coursefill(did);
        }
    }
}
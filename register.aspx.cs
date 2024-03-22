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
    public partial class register : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\college\college\App_Data\users.mdf;Integrated Security=True");
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                qualification_fill();
                department_fill();
            }

        }

        protected void qualification_fill()
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
            department.Items.Insert(0, new ListItem("SELECT DEPARTMENT", "0"));
            con.Close();
        }
        protected void course_fill(int deptid)
        {
            string query = "SELECT * FROM tbl_course WHERE dept_id ="+deptid;
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


        


        protected void reset_Click(object sender, EventArgs e)
        {
            name.Text = "";
            email.Text = string.Empty;
            password.Text = "";
            confirmpassword.Text = string.Empty;
            qualification.SelectedValue = "0";
            department.SelectedValue = "0";
            course.Items.Clear();
            course.Items.Insert(0, new ListItem("SELECT COURSE","0"));
            gender.ClearSelection();
            hobby.ClearSelection();
        }

        protected void department_SelectedIndexChanged(object sender, EventArgs e)
        {
            //department.Items[0].Attributes["disabled"] = "disabled";
            int deptid = Convert.ToInt32(department.SelectedValue);
                course_fill(deptid);
        }

        protected void signin_Click(object sender, EventArgs e)
        {
            string nm = name.Text;
            string em = email.Text;
            string pswd = password.Text;
            int quali = Convert.ToInt32(qualification.SelectedValue);
            int dept = Convert.ToInt32(department.SelectedValue);
            int course1 = Convert.ToInt32(course.SelectedValue);
            long phn = Convert.ToInt64(phone.Text);
            string gn = gender.SelectedValue;
            string hobbies = string.Join(",",hobby.Items.OfType<ListItem>().Where(r => r.Selected).ToList());
            bool ans = check_email(em);
            string imgname = imageupload.FileName;
            //Response.Write($"<script>alert('{imgname}')</script>");
            string path = "/images/" + imgname;
            imageupload.SaveAs(Server.MapPath(path));

            
            if(ans)
            {
                nm = nm.ToUpper();
                cmd = new SqlCommand($"INSERT INTO tbl_registration VALUES('{nm}','{em}','{pswd}',{phn},{quali},{dept},{course1},'{gn}','{hobbies}','{path}','role')",con);
                con.Open();
                int i = Convert.ToInt32(cmd.ExecuteNonQuery());
                con.Close();
                //Response.Write($"<script>alert('{i}')</script>");
                if(i == 1)
                {
                    Response.Write("<script>alert('REGISTRATION SUCCESSFULLY');location.replace('login.aspx')</script>");
                }
                else
                {
                    Response.Write("<script>alert('SOMETHING WENT WRONG');location.replace('register.aspx')</script>");
                }
                
            }

            //foreach (ListItem li in hobby.Items)
            //{
            //    if (li.Selected)
            //    {
            //        if (hobbies == "")
            //        {
            //            hobbies = li.Text;
            //        }
            //        else
            //        {
            //            hobbies += "," + li.Text;
            //        }
            //    }


        }
        protected bool check_email(string email)
        {
            cmd = new SqlCommand($"SELECT count(*) FROM tbl_registration WHERE stud_email='{email}'",con);
            con.Open();
            int  i = Convert.ToInt32(cmd.ExecuteScalar());
            //Response.Write($"<script>alert('{i}')</script>");
            con.Close();
            if (i == 1)
            {
                Response.Write("<Script>alert('EMAIL_ID IS ALSREADY EXISTS')</script>");
                return false;
            }
            else
            {
                return true;
            }
            

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {

        }
    }

}
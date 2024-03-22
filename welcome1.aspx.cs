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
    public partial class welcome1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection( @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\college\college\App_Data\users.mdf;Integrated Security=True");
        SqlCommand cmd;
        DataSet ds;
        static int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                gridfill();
            }
        }
        protected void gridfill(int sid = 0)
        {
            string query ="";
            if (sid != 0)
            {

                query = "SELECT tbl_registration.*, tbl_qualification.quli_name, tbl_dept.dept_name, tbl_course.course_name FROM tbl_registration INNER JOIN tbl_qualification ON tbl_registration.quli_id = tbl_qualification.quli_id INNER JOIN tbl_dept ON tbl_registration.dept_id = tbl_dept.dept_id INNER JOIN tbl_course ON tbl_registration.course_id = tbl_course.course_id AND tbl_dept.dept_id = tbl_course.dept_id AND tbl_registration.role!='admin' AND tbl_registration.stud_id =" + sid  ;

            }
            else
            {
                query = "SELECT tbl_registration.*, tbl_qualification.quli_name, tbl_dept.dept_name, tbl_course.course_name FROM tbl_registration INNER JOIN tbl_qualification ON tbl_registration.quli_id = tbl_qualification.quli_id INNER JOIN tbl_dept ON tbl_registration.dept_id = tbl_dept.dept_id INNER JOIN tbl_course ON tbl_registration.course_id = tbl_course.course_id AND tbl_dept.dept_id = tbl_course.dept_id AND tbl_registration.role!='admin' ";
                searchsid.Text = "";
            }
            cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {



            var sid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            var name = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("edit_name")).Text;
            var email = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("edit_email")).Text;
            var password = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("edit_password")).Text;
            var phone = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("edit_phone")).Text;
            var quali = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("edit_quali")).SelectedValue;
            var dept = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("edit_dept")).SelectedValue;
            var course = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("edit_course")).SelectedValue;
            var hobby = ((CheckBoxList)GridView1.Rows[e.RowIndex].FindControl("edit_hobby"));
            var gender = ((RadioButtonList)GridView1.Rows[e.RowIndex].FindControl("edit_gender")).SelectedValue;
            var img = ((FileUpload)GridView1.Rows[e.RowIndex].FindControl("edit_profile"));


            var path = "";
            var filename = img.FileName;
            name = name.ToUpper();
            var hobbies = string.Join(",", hobby.Items.OfType<ListItem>().Where(r => r.Selected).ToList());
            if (hobbies == "")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "script", "swal('PLEASE CHOOSE ATLEST ONE HOBBY','','error')",true);
            }
            else
            {
                //Response.Write($"<script>alert('{filename}')</script>");

                if (filename == "")
                {
                    path =Convert.ToString( GridView1.DataKeys[e.RowIndex].Values[5]);
                }
                else
                {
                    path = "/images/"+filename;
                    img.SaveAs(Server.MapPath(path));
                }
                //Response.Write($"<script>alert('{path}')</script>");

                

                string query = $"UPDATE tbl_registration SET stud_name = '{name}',stud_email = '{email}',stud_password = '{password}',stud_phone = {phone},gender = '{gender}',hobby = '{hobbies}',quli_id = {quali},dept_id = {dept},course_id = {course},profile = '{path}' WHERE stud_id = {sid}";
                cmd = new SqlCommand(query, con);
                con.Open();
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i == 1)
                {
                    //Response.Write("<script>swal('UPDATED SUCCESSFULLY','You Clicked this button','success')</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "script", "swal('UPDATED SUCCESSFULLY','','success')",true);
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "script", "swal('SOMETHING WENT WRONG','','warning')",true);
                }
                GridView1.EditIndex = -1;
                id = 0;
                gridfill();
            }
            
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            //Response.Write($"<script>alert('{id}')</script>");
            if (id != 0)
            {
                gridfill(id);
            }
            else 
            { 
                gridfill();

            }
        }


        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var sid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string query = "DELETE FROM tbl_registration WHERE stud_id="+sid;
            cmd = new SqlCommand(query, con);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if(i==1)
            {

                ClientScript.RegisterClientScriptBlock(this.GetType(), "script", "swal('DELETED SUCCESSFULLY','','success')",true);
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "script", "swal('UPDATED SUCCESSFULLY','','warning')",true);
            }
            GridView1.EditIndex = -1;
            id = 0;
            gridfill();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if((e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex == e.Row.RowIndex))
            {
                //Response.Write($"<script>alert('{e.Row.RowIndex}')</script>");
                var quali = (DropDownList)e.Row.FindControl("edit_quali");
                var qid = Convert.ToString(GridView1.DataKeys[e.Row.RowIndex].Values[1]);
                cmd = new SqlCommand("SELECT * FROM tbl_qualification",con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);
                quali.DataSource = ds;
                quali.DataTextField = "quli_name";
                quali.DataValueField = "quli_id";
                quali.DataBind();
                quali.SelectedValue = qid;

                var dept = (DropDownList)e.Row.FindControl("edit_dept");
                var did = Convert.ToString(GridView1.DataKeys[e.Row.RowIndex].Values[2]);
                cmd = new SqlCommand("SELECT * FROM tbl_dept",con);
                con.Open();
                dept.DataSource = cmd.ExecuteReader();
                dept.DataTextField = "dept_name";
                dept.DataValueField = "dept_id";
                dept.DataBind();
                con.Close();

                var course = (DropDownList)e.Row.FindControl("edit_course");
                var cid = GridView1.DataKeys[e.Row.RowIndex].Values[3];
                cmd = new SqlCommand("SELECT * FROM tbl_course WHERE dept_id =" + did,con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                ds = new DataSet();
                sda.Fill(ds);
                course.DataSource = ds;
                course.DataTextField = "course_name";
                course.DataValueField = "course_id";
                course.DataBind();
                course.SelectedValue = cid.ToString();

                var hobbies_data = Convert.ToString(GridView1.DataKeys[e.Row.RowIndex].Values[4]);
                var hobby = (CheckBoxList)e.Row.FindControl("edit_hobby");
                string []h;
                h = hobbies_data.Split(',');

                foreach (ListItem li in hobby.Items)
                {
                    foreach (var s in h)
                    {
                        if (li.Value.Equals(s))
                        {
                            li.Selected = true;
                        }
                    }
                }
                //for(int i=0;i<hobby.Items.Count;i++)
                //{
                //    for(int j = 0;j<h.Length;j++)
                //    {
                //        if(hobby.Items[i].Value.Equals(h[j]))
                //        {
                //            hobby.Items[i].Selected = true;
                //        }
                //    }
                //}
            }

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            id = 0;
            gridfill();
        }

        protected void edit_dept_SelectedIndexChanged(object sender, EventArgs e)
        {
            var rowindex = GridView1.EditIndex;
            var dept = (DropDownList)GridView1.Rows[rowindex].FindControl("edit_dept");
            var did = dept.SelectedValue;
            var course = (DropDownList)GridView1.Rows[rowindex].FindControl("edit_course");
            cmd = new SqlCommand("SELECT * FROM tbl_course WHERE dept_id = " + did, con);
            con.Open();
            course.DataSource = cmd.ExecuteReader();
            course.DataTextField = "course_name";
            course.DataValueField = "course_id";
            course.DataBind();
            con.Close();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            var sid = searchsid.Text;
            sid = sid.Trim();
            Response.Write($"<script>alert('{id}')</script>");
            if (sid == "")
            {
                gridfill();
                id = 0;
            }
            else
            {
                id = Convert.ToInt32(sid);
                gridfill(id);

            }
            //Response.Write($"<script>alert('{id}')</script>");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}
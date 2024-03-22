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
    public partial class welcome : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\college\college\App_Data\users.mdf;Integrated Security=True");
        SqlCommand cmd;
        static string name ;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                gridfill();

            }
           
            
        }
        protected void gridfill(string name = null)
        {

            if(name != null)
            {
                string query = $"SELECT tbl_registration.*, tbl_qualification.quli_name, tbl_dept.dept_name, tbl_course.course_name FROM tbl_registration INNER JOIN tbl_qualification ON tbl_registration.quli_id = tbl_qualification.quli_id INNER JOIN tbl_dept ON tbl_registration.dept_id = tbl_dept.dept_id INNER JOIN tbl_course ON tbl_registration.course_id = tbl_course.course_id AND tbl_dept.dept_id = tbl_course.dept_id AND tbl_registration.stud_name LIKE '{name}%'";
                cmd = new SqlCommand(query,con);
                con.Open();
                //////GridView1.DataSource = cmd.ExecuteReader();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
                else
                    GridView1.EmptyDataText = "No records found!";
               
                con.Close();


            }
            else
            {
                string query = $"SELECT tbl_registration.*, tbl_qualification.quli_name, tbl_dept.dept_name, tbl_course.course_name FROM tbl_registration INNER JOIN tbl_qualification ON tbl_registration.quli_id = tbl_qualification.quli_id INNER JOIN tbl_dept ON tbl_registration.dept_id = tbl_dept.dept_id INNER JOIN tbl_course ON tbl_registration.course_id = tbl_course.course_id AND tbl_dept.dept_id = tbl_course.dept_id";
                cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                //GridView1.DataSource = SqlDataSource1;
                GridView1.DataSource = ds;
                GridView1.DataBind();
                searchbox.Text = "";

            }
            
            if(GridView1.Rows.Count>0)
            {
                GridViewRow header = GridView1.HeaderRow;
                header.Cells[2].Text = "STUDENT_ID";
                header.Cells[3].Text = "STUDENT_NAME";
                header.Cells[4].Text = "STUDENT_EMAIL";
                header.Cells[5].Text = "STUDENT_PASSWORD";
                header.Cells[6].Text = "STUDENT_PHONE";
                header.Cells[10].Text = "GENDER";
                header.Cells[11].Text = "HOBBY";
                header.Cells[13].Text = "QUALIFICTAION";
                header.Cells[14].Text = "DEPARTMENT";
                header.Cells[15].Text = "COURSES";

            }




        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            {
                //Response.Write("<script>alert('hello')</script>");
                //if(GridView1.Rows.Count>0)


                if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Header)
                {
                    e.Row.Cells[7].Visible = false;
                    e.Row.Cells[8].Visible = false;
                    e.Row.Cells[9].Visible = false;
                    e.Row.Cells[12].Visible = false;
                }
                 if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex == e.Row.RowIndex)
               {

                        e.Row.Cells[10].Enabled=false;
                        e.Row.Cells[13].Enabled= false;
                        e.Row.Cells[14].Enabled = false;
                        e.Row.Cells[15].Enabled = false;
                }
            }

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int sid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            String query = "DELETE FROM tbl_registration WHERE stud_id = " + sid;
            cmd = new SqlCommand(query, con);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            //if(i == 1)
            //{
            //    Response.Write("<scirpt>alert('DELETED SUCCESSFULLY')</script>");
            //}
            //else
            //{
            //    Response.Write("<script>alert('SOEMTHING WENT WRONG')</script>");
            //}
            //GridView1.EditIndex = -1;
            name = "";
            gridfill();

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            
            if (name!="" )
            {
                gridfill(name);
            }
            else
            {
                gridfill();
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int sid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            GridViewRow row = GridView1.Rows[e.RowIndex];
            string nm = (row.Cells[3].Controls[0] as TextBox).Text;
            string email = (row.Cells[4].Controls[0] as TextBox).Text;
            string password = (row.Cells[5].Controls[0] as TextBox).Text;
            string phone = (row.Cells[6].Controls[0] as TextBox).Text;
            string gender = (row.Cells[10].Controls[0] as TextBox).Text;
            string hobbby = (row.Cells[11].Controls[0] as TextBox).Text;
            string quali = (row.Cells[13].Controls[0] as TextBox).Text;
            string dept = (row.Cells[14].Controls[0] as TextBox).Text;
            string course = (row.Cells[15].Controls[0] as TextBox).Text;
            FileUpload image = row.FindControl("edit_image") as FileUpload;
            string filename = image.FileName;
            string path = "/images/" + filename;
            image.SaveAs(Server.MapPath(path));
            nm = nm.ToUpper();

            string  query =$"UPDATE tbl_registration SET stud_name='{nm}',stud_email='{email}',stud_password = '{password}',stud_phone='{phone}',profile='{path}' WHERE stud_id="+sid;
            cmd = new SqlCommand(query, con);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if(i==1)
            {
                Response.Write("<script>alert('UPDATED SUCCESSFULLY')</script>");
            }
            else
            {
                Response.Write("<script>alert('SOMETHING WENT WRONG')</script>");
            }
            GridView1.EditIndex = -1;
            name = "";
            gridfill();
            


        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            name = "";
            gridfill();
        }

       

        protected void searchbox_TextChanged1(object sender, EventArgs e)
        {
            name = searchbox.Text;
            Response.Write($"<script>alert('{name}')</script>");
            name = name.Trim();
            if (name == "")
            {

                gridfill();
                name = "";
            }
            else
            {
                gridfill(name);
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("login.aspx");
        }
        

    }
}
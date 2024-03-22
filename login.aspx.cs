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
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\college\college\App_Data\users.mdf;Integrated Security=True");
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void singup_Click(object sender, EventArgs e)
        {
            string em = email.Text;
            string psd = password.Text;
            cmd = new SqlCommand($"SELECT * FROM tbl_registration WHERE stud_email='{em}' AND stud_password='{psd}'",con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
           
            if (sdr.HasRows)
            {
                while(sdr.Read())
                {
                    Session["id"] = sdr["stud_id"];
                    Session["email"] = sdr["stud_email"];
                    Session["name"] = sdr["stud_name"];
                    Response.Redirect("welcome1.aspx");
                }
                con.Close();
            }

            else
            {

                    con.Close();  
                    string query = $"SELECT count(*) FROM tbl_registration WHERE stud_email='{em}'";
                    cmd = new SqlCommand(query, con);
                    con.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                    if (i == 1)
                    {
                        
                        {
                            Response.Write("<script>alert('PASSWORD IS INCORRECT')</script>");
                        }

                    }
                    else
                    {
                        Response.Write("<script>alert('PLEASE REGISTER FIRST!')</script>");
                    }
                
               
                
            }
        }
    }
}
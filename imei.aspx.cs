using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace college
{
    public partial class imei : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string search = TextBox1.Text;
            search = search.Trim();
            int j = 0;
            int digit = 0;
            int rem = 0;
            int s = 0;
            int ans = 0;
            if (search.Length==15 || search.Length ==14)
            {
                for(int i = search.Length-1;i>=0;i--)
                {
                    if(j==2 || i == search.Length-1)
                    {
                         ans = int.Parse(search[i].ToString()) * 2;
                        //Response.Write(ans+"  ");
                        if(ans>=10)
                        {
                            int temp = ans;
                            while(temp!=0)
                            {
                                rem = temp % 10;
                                s = s + rem;
                                temp = temp / 10;
                            }
                            digit = digit + s;
                            s = 0;
                        }
                        else
                        {
                            digit = digit + ans;
                        }
                        j = 0;
                    }
                    else
                    {
                        
                        digit = digit + int.Parse(search[i].ToString());
                    }
                    j++;
                    //Response.Write(digit);

                }
                Response.Write(digit);

            }
        }
    }
}
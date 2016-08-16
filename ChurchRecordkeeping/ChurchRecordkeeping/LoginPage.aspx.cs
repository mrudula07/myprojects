using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;



namespace ChurchRecordkeeping
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                if (Request.Cookies["yourapp"] == null)
                {
                    // string username = Request.Cookies["yourapp"].Values["UserName"];
                    //textboxusername.Text=username;
                    //Response.Write(username);

                }
                else
                {
                    string username = Request.Cookies["yourapp"].Values["UserName1"];

                    UserName.Text = username;
                    //Response.Write(username);

                }
            }
        }


        protected void LoginButton_Click(object sender, EventArgs e)
        {
            //Response.Write(CheckBox1.Checked);

            if (RememberMe.Checked == true)
            {
                //if(HttpContext.Current.Response.Cookies["cookie_name"] != null)
                //{ 
                if (Password.Text == "secretary" && UserName.Text == "wutrich")
                {
                    string s = UserName.Text;
                    HttpCookie cookie = new HttpCookie("yourapp");
                    cookie.Values.Add("UserName1", s);
                    cookie.Expires = DateTime.Now.AddDays(15);
                    Response.Cookies.Add(cookie);
                    Response.Redirect("~/UserScreens/memb.aspx");
                }
                else
                {
                    lblErrorMsg.Text = "Please enter correct username and password";
                }
                //}
            }
            else
            {
                //string s = textboxusername.Text;
                if (Password.Text == "secretary" && UserName.Text == "wutrich")
                {
                    HttpCookie cookie = new HttpCookie("yourapp");
                    cookie.Values.Add("UserName1", "");
                    cookie.Expires = DateTime.Now.AddDays(15);
                    Response.Cookies.Add(cookie);
                    Response.Redirect("~/UserScreens/memb.aspx");
                }
                else
                {
                    lblErrorMsg.Text ="Please enter correct username and password";
                }

            }




        }

        protected void RememberMe_CheckedChanged(object sender, EventArgs e)
        {

        }


    }
}



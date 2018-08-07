using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Web.Security;

public partial class ForgotPass : System.Web.UI.Page
{
    string mytime = null;
    string mylang = null;
    string lines = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        Master.Logout.Click += new EventHandler(loggingout);
        mytime = (string)Session["Email"];
        Master.onetime.SelectedIndexChanged += new EventHandler(Language);
        Display();
        if ((string)Session["mylang"] != null)
        {
            if ((string)Session["mylang"] == "en-US")
            {
                Page.UICulture = "en-US";
                Page.Culture = "en-US";
                Display();
            }
            else if ((string)Session["mylang"] == "zh-CH")
            {
                Page.UICulture = "zh-CN";
                Page.Culture = "zh-CN";
                Display();
            }
        }
        //    if (!IsPostBack)
        //    { 
        //        if (mylang != null)
        //        {
        //            if (mylang == "en-US")
        //            {
        //                Master.onetime.SelectedValue = mylang;
        //                Page.UICulture = "en-US";
        //                Page.Culture = "en-US";
        //                Display();
        //            }
        //            else if (mylang == "zh-CH")
        //            {
        //                Master.onetime.SelectedValue = mylang;
        //                Page.UICulture = "zh-CN";
        //                Page.Culture = "zh-CN";
        //                Display();
        //            }
        //        }
        //        else
        //        {
        //            Page.UICulture = Master.onetime.SelectedValue;
        //            Page.Culture = Master.onetime.SelectedValue;
        //        }
        //
        if (mytime != null && mytime != "User")
        {
            Master.one1 = false;
            Master.two2 = true;
            Master.three3 = false;
            Master.four4 = true;
            Session["Count"] = "2";
            Response.Redirect("Index.aspx");
        }
        else
        {
            Master.one1 = true;
            Master.two2 = false;
            Master.three3 = false;
            Master.four4 = true;
            Session["Email"] = "User";
        }
    }

    protected void loggingout(object sender, EventArgs e)
    {
        Session["Email"] = "User";
        Response.Redirect("Index.aspx");
    }
    protected void Language(object sender, EventArgs e)
    {
        if (Master.onetime.SelectedValue == "en-US")
        {
            Session["mylang"] = Master.onetime.SelectedValue;
            Page.UICulture = "en-US";
            Page.Culture = "en-US";
            Display();
        }
        else if (Master.onetime.SelectedValue == "zh-CH")
        {
            Session["mylang"] = Master.onetime.SelectedValue;
            Page.UICulture = "zh-CN";
            Page.Culture = "zh-CN";
            Display();
        }
    }

    private void Display()
    {
        Master.Navi.Text = (string)GetGlobalResourceObject("Resource", "Title");
        Master.News.Text = (string)GetGlobalResourceObject("Resource", "Newsletter");
        Master.Category.Text = (string)GetGlobalResourceObject("Resource", "Categories");
        Master.Account.Text = (string)GetGlobalResourceObject("Resource", "Account");
        Master.Order.Text = (string)GetGlobalResourceObject("Resource", "Order");
        Master.Wishlist.Text = (string)GetGlobalResourceObject("Resource", "Wishlist");
        Master.Vendor.Text = (string)GetGlobalResourceObject("Resource", "Vendor");
        Master.Front.Text = (string)GetGlobalResourceObject("Resource", "Front");
        Master.Popular.Text = (string)GetGlobalResourceObject("Resource", "Popular");
        Master.Description.Text = (string)GetGlobalResourceObject("Resource", "Description");
        Master.Subscribe.Text = (string)GetGlobalResourceObject("Resource", "Subscribe");
        Master.Brand.Text = (string)GetGlobalResourceObject("Resource", "Brand");
        Master.MenuCart.Text = (string)GetGlobalResourceObject("Resource", "Order");
        Master.MenuCheckout.Text = (string)GetGlobalResourceObject("Resource", "MenuCheckout");
        Master.MenuLogin.Text = (string)GetGlobalResourceObject("Resource", "MenuLogin");
        Master.MenuRegister.Text = (string)GetGlobalResourceObject("Resource", "MenuRegister");
        Master.MenuWishlist.Text = (string)GetGlobalResourceObject("Resource", "Wishlist");
        Master.Cart.Text = (string)GetGlobalResourceObject("Resource", "MenuCart");
        Master.Extra.Text = (string)GetGlobalResourceObject("Resource", "Categories");
        Master.Contact.Text = (string)GetGlobalResourceObject("Resource", "Contact");
        Master.Home.Text = (string)GetGlobalResourceObject("Resource", "Front");
        Master.Others.Text = (string)GetGlobalResourceObject("Resource", "Others");
        Master.Shop.Text = (string)GetGlobalResourceObject("Resource", "Shop");
        Master.Add.Text = (string)GetGlobalResourceObject("Resource", "Add");
        Master.Edit.Text = (string)GetGlobalResourceObject("Resource", "Edit");
        Master.Product.Text = (string)GetGlobalResourceObject("Resource", "Shop");
        Master.Manage.Text = (string)GetGlobalResourceObject("Resource", "Manage");
        Master.AdminContactUs.Text = (string)GetGlobalResourceObject("Resource", "AdminContactUs");
        Master.AdminFeedback.Text = (string)GetGlobalResourceObject("Resource", "AdmnFeedback");
    }
    public static void SendEmail(string Email, string pass)
    {
        try
        {
            MailMessage Message = new MailMessage("Team6NYP@gmail.com", Email);
            Message.Subject = "Forgot Password";
            Message.Body ="Your password have been reset, use this password to login."+Environment.NewLine+"Please change your password after logging in to your account."+Environment.NewLine+"Your password : " + pass.ToString();

            SmtpClient Client = new SmtpClient("smtp.gmail.com", 587);
            Client.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "Team6NYP@gmail.com",
                Password = "Team@NYP"
            };
            Client.EnableSsl = true;
            Client.Send(Message);
        }
        catch
        {

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@!#$%^&*";
            var stringChars = new char[12];
            var random = new Random();
            for (int i = 0; i < stringChars.Length; i++)
            {
                stringChars[i] = chars[random.Next(chars.Length)];
            }
            var finalString = new String(stringChars);

            string pass = finalString;
            string Email = txtEmail.Text;
            string check = "select count(*) from [Users] where Email=@Username";
            SqlConnection con = new SqlConnection(lines);
            SqlCommand com = new SqlCommand(check, con);
            con.Open();
            com.Parameters.AddWithValue("@Username", Email);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            con.Close();
            if (temp == 1)
            {
                string hashedpass = FormsAuthentication.HashPasswordForStoringInConfigFile(pass, "MD5");
                string check1 = "Update Users set Password = '"+ hashedpass +"' where Email=@Username";
                SqlConnection con1 = new SqlConnection(lines);
                SqlCommand com1 = new SqlCommand(check1, con1);

                con1.Open();
                com1.Parameters.AddWithValue("@Username", Email);
                com1.ExecuteNonQuery();
                con1.Close();
                SendEmail(Email, pass);
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Password has been changed and send to your Email.')", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Email does not exist.')", true);
            }
        }
        catch
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('We have encounter a problem, please try again later.')", true);
        }


    }
   
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Collections.Specialized;
using System.Net;
using System.Web.Security;


public partial class SignUp : System.Web.UI.Page
{
    string mytime = null;
    string mylang = null;
    string lines = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Panel2.Visible = false;
        Panel3.Visible = false;
        Panel4.Visible = false;
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
        //if (!IsPostBack)
        //{
        //    if (mylang != null)
        //    {
        //        if (mylang == "en-US")
        //        {
        //            Master.onetime.SelectedValue = mylang;
        //            Page.UICulture = "en-US";
        //            Page.Culture = "en-US";
        //            Display();
        //        }
        //        else if (mylang == "zh-CH")
        //        {
        //            Master.onetime.SelectedValue = mylang;
        //            Page.UICulture = "zh-CN";
        //            Page.Culture = "zh-CN";
        //            Display();
        //        }
        //    }
        //    else
        //    {
        //        Page.UICulture = Master.onetime.SelectedValue;
        //        Page.Culture = Master.onetime.SelectedValue;
        //    }
        //}
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
        ShoppingCart.Instance.Items.Clear();
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
    protected void Button2_Click(object sender, EventArgs e)
    {
        string gender = "";
        try
        {
            if (TextBoxPassword.Text != TextBoxRepeatPassword.Text)
            {
                TextBoxRepeatPassword.Text = "";
            }
            else
            {
                if (RadioButtonList1.SelectedValue=="Male")
                {
                    gender = "Male";
                }
                else
                {
                    gender = "Female";
                }

                string hashedpass = FormsAuthentication.HashPasswordForStoringInConfigFile(TextBoxRepeatPassword.Text, "MD5");

                string ins = "Select count(*) from Users where Email=@Email";
                SqlConnection con = new SqlConnection(lines);
                SqlCommand com = new SqlCommand(ins, con);
                con.Open();
                com.Parameters.AddWithValue("@Email", TextBoxEmail.Text);
                int temp = int.Parse(com.ExecuteScalar().ToString());
                con.Close();
                if (temp == 1)  
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Email Existed!')", true);
                }
                else
                {
                    Session["account"] = TextBoxEmail.Text+","+ hashedpass.ToString()+","+ TextBoxDate.Text+","+ gender.ToString()+","+ TextBoxAddress.Text+","+ TextBoxPostalCode.Text;
                    Panel1.Visible = false;
                    Panel2.Visible = true;
                    Panel3.Visible = false;
                    Panel4.Visible = false;
                }
            }
        }
        catch
        {
           
        }
    }

    protected void ButtonOTP_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = false;
        Panel3.Visible = true;
        Panel4.Visible = false;
        //Random random = new Random();
        //int value = random.Next(1001, 9999);
        //string destinationaddr = "+65" + TextBox1.Text;
        //string message = "Your OTP Number is " + value + " ( Sent By : USTORA )";
        //Label1.Text = message;
        //String message1 = HttpUtility.UrlEncode(message);

        //using (var wb = new WebClient())
        //{
        //    byte[] response = wb.UploadValues("https://api.txtlocal.com/send/", new NameValueCollection()
        //        {
        //        {"apikey" , "3MpsP1Y8Fzg-2sqjYGnDb7pvGsZLRRZ8Jk3mGVH8yM"},
        //        {"numbers" , destinationaddr},
        //        {"message" , message1},
        //        {"sender" , "Team6NYP"}
        //        });
        //    string result = System.Text.Encoding.UTF8.GetString(response);
        //    Session["otp"] = value;
        //}
        Session["otp"] = "haha";
        //for debugging use
    }

    protected void btn_verify_Click(object sender, EventArgs e)
    {
        string ins="";
        if (TextBox2.Text == Session["otp"].ToString())
        {
            Panel1.Visible = false;
            Panel2.Visible = false;
            Panel3.Visible = false;
            Panel4.Visible = true;
            string word = (string)Session["account"];
            string[] account = word.Split(',');
            ins = "Insert into [Users](Email, Password, DOB, Gender, Address, PostalCode, Blacklisted) values('" + account[0] + "','" + account[1] + "','" + account[2] + "','" + account[3] + "','" + account[4] + "','" + account[5] + "','" + "Enable" + "')";
           
            SqlConnection con = new SqlConnection(lines);
            SqlCommand com = new SqlCommand(ins, con);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
            Label1.Text = "Your Mobile Number Has Been Verified Successfully - Thanks";
        }
        else
        {
            Label1.Text = "OTP Number is Not Correct : Your Mobile Number not Verified";
            Panel1.Visible = false;
            Panel2.Visible = false;
            Panel3.Visible = true;
            Panel4.Visible = true;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }

}
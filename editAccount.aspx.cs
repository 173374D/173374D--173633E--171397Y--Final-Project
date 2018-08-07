using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Web.Security;

public partial class editAccount : System.Web.UI.Page
{
    string mytime = null;
    string mylang = null;
    string _connStr = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PanelView.Visible = true;
            PanelEdit.Visible = false;
        }
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
        if (mytime == "Admin")
        {
            Master.one1 = false;
            Master.two2 = true;
            Master.three3 = true;
            Master.four4 = false;
            Master.MenuAccount.Text = "Welcome back, " + mytime;
        }
        else if (mytime != null && mytime != "User")
        {
            Master.one1 = false;
            Master.two2 = true;
            Master.three3 = false;
            Master.four4 = true;
            Master.MenuAccount.Text = "Welcome back, " + mytime;
        }
        else
        {
            Response.Redirect("Index.aspx");
            
        }
        User();
    }
    protected void loggingout(object sender, EventArgs e)
    {
        foreach (ShoppingCartItem item in ShoppingCart.Instance.Items)
        {
            string ins = "Insert into [Shopping](Email, ProductID, Quantity) values('" + (string)Session["Email"] + "','" + item.ItemID.ToString() + "','" + item.Quantity.ToString() + "')";
            SqlConnection con = new SqlConnection(_connStr);
            SqlCommand com = new SqlCommand(ins, con);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
        }
        ShoppingCart.Instance.Items.Clear();
        foreach (WishlistItem item in Wishlist.Instance.Items)
        {
            string ins = "Insert into [Wishlist](Email, ProductID) values('" + (string)Session["Email"] + "','" + item.ItemID.ToString() + "')";
            SqlConnection con = new SqlConnection(_connStr);
            SqlCommand com = new SqlCommand(ins, con);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
        }
        Wishlist.Instance.Items.Clear();
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
    private void User()
    {
        string queryStr = "select * from Users where Email=@Email";
        SqlConnection conn = new SqlConnection(_connStr);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@Email", (string)Session["email"]);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            lbl_Address.Text = dr["Address"].ToString();
            lbl_DOB.Text = dr["DOB"].ToString();
            lbl_Email.Text = dr["Email"].ToString();
            lbl_Gender.Text = dr["Gender"].ToString();
            lbl_Postelcode.Text = dr["PostalCode"].ToString();
        }
        conn.Close();
        dr.Close();
    }

    protected void btn_ChangePassword_Click(object sender, EventArgs e)
    {
        lbl_Wrong.Text = "";
        lbl_New.Text = "";
        lbl_Confirm.Text = "";
        bool error=false;
        if (txt_Address.Text != "")
        {
            string queryStr = "UPDATE Users SET" + " Address=@Address " + " where Email=@Email";
            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@Address", txt_Address.Text);
            cmd.Parameters.AddWithValue("@Email", (string)Session["email"]);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        if (txt_Code.Text != "")
        {
            string queryStr = "UPDATE Users SET" + " PostalCode=@PCode " + " where Email=@Email";
            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@PCode", txt_Code.Text);
            cmd.Parameters.AddWithValue("@Email", (string)Session["email"]);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        if (txt_new.Text != "" || txt_old.Text != "")
        {
            if (txt_old.Text == "")
            {
                error = true;
                lbl_Wrong.ForeColor = System.Drawing.Color.Red;
                lbl_Wrong.Text = "Please enter your old password.";
            }
        }

        if (txt_old.Text != "")
        {
            string oldpass=null;
            string queryStr1 = "select Password from Users where Email=@Email";
            SqlConnection conn1 = new SqlConnection(_connStr);
            SqlCommand cmd1 = new SqlCommand(queryStr1, conn1);
            cmd1.Parameters.AddWithValue("@Email", (string)Session["email"]);
            conn1.Open();
            SqlDataReader dr = cmd1.ExecuteReader();
            while (dr.Read())
            {
                oldpass = dr["Password"].ToString();
            }
            conn1.Close();
            dr.Close();
            string enpass = FormsAuthentication.HashPasswordForStoringInConfigFile(txt_old.Text, "MD5");

            if (enpass == oldpass)
            {
                if (txt_new.Text == "")
                {
                    lbl_New.ForeColor = System.Drawing.Color.Red;
                    lbl_New.Text = "Please type in a new password";
                    error = true;
                }
                else
                {
                    if (txt_Confirm.Text != txt_new.Text)
                    {
                        lbl_Confirm.ForeColor = System.Drawing.Color.Red;
                        lbl_Confirm.Text = "password does not match please try again.";
                        error = true;
                    }
                    else
                    {
                        string hashedpass = FormsAuthentication.HashPasswordForStoringInConfigFile(txt_Confirm.Text, "MD5");
                        string queryStr = "UPDATE Users SET" + " Password=@pass " + " where Email=@Email";
                        SqlConnection conn = new SqlConnection(_connStr);
                        SqlCommand cmd = new SqlCommand(queryStr, conn);
                        cmd.Parameters.AddWithValue("@pass", hashedpass);
                        cmd.Parameters.AddWithValue("@Email", (string)Session["email"]);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            else
            {
                lbl_Wrong.ForeColor = System.Drawing.Color.Red;
                lbl_Wrong.Text = "Incorrect password, please try again.";
                error = true;
            }
        }
        if (error == false)
        {
        //Response.Redirect(Request.RawUrl);
        PanelView.Visible = true;
        PanelEdit.Visible = false;
            ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Profile has been updated.');window.location='"+ Request.RawUrl + "';</script>'");
        }
    }

    protected void btn_Edit_Click(object sender, EventArgs e)
    {
        PanelEdit.Visible = true;
        PanelView.Visible = false;
    }
}
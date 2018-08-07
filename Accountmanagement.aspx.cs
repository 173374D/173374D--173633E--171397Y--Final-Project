using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Accountmanagement : System.Web.UI.Page
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
        //}
        if (mytime == "Admin")
        {
            Master.one1 = false;
            Master.two2 = true;
            Master.three3 = true;
            Master.four4 = false;
            Master.MenuAccount.Text = "Welcome back, " + mytime;
        }
        else
        {
            Session["Count"] = "3";
            Response.Redirect("Index.aspx");
        }
        accountbind();
    }

    protected void loggingout(object sender, EventArgs e)
    {
        foreach (ShoppingCartItem item in ShoppingCart.Instance.Items)
        {
            string ins = "Insert into [Shopping](Email, ProductID, Quantity) values('" + (string)Session["Email"] + "','" + item.ItemID.ToString() + "','" + item.Quantity.ToString() + "')";
            SqlConnection con = new SqlConnection(lines);
            SqlCommand com = new SqlCommand(ins, con);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
        }
        ShoppingCart.Instance.Items.Clear();
        foreach (WishlistItem item in Wishlist.Instance.Items)
        {
            string ins = "Insert into [Wishlist](Email, ProductID) values('" + (string)Session["Email"] + "','" + item.ItemID.ToString() + "')";
            SqlConnection con = new SqlConnection(lines);
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
    private void accountbind()
    {

        string queryStr = "SELECT * FROM Users where Email <> '" + "Admin" + "'";
        SqlConnection conn = new SqlConnection(lines);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        conn.Close();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "black")
        {
            string user = e.CommandArgument.ToString();
            string check1 = "select count(*) from [Users] where Email='" + user.ToString() + "' and blacklisted ='" + "Enable" + "'";
            SqlConnection con1 = new SqlConnection(lines);
            SqlCommand com1 = new SqlCommand(check1, con1);
            con1.Open();
            int Temp = Convert.ToInt32(com1.ExecuteScalar().ToString());
            con1.Close();
            if (Temp == 1)
            {
                string queryStr = "UPDATE Users SET" + " blacklisted = '" + "Disabled" + "' where Email = '" + user.ToString() + "' ";
                SqlConnection conn = new SqlConnection(lines);
                SqlCommand cmd = new SqlCommand(queryStr, conn);
                conn.Open();
                int nofRow = 0;
                nofRow = cmd.ExecuteNonQuery();
                conn.Close();
                if (nofRow > 0)
                {
                    Response.Write("<script>alert('Status successfully changed');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Sorry, we have encountered a problem, please try again later.');</script>");
                }
                accountbind();
            }
            else
            {
                string queryStr = "UPDATE Users SET" + " blacklisted = '" + "Enable" + "'where Email = '" + user.ToString() + "' ";
                SqlConnection conn = new SqlConnection(lines);
                SqlCommand cmd = new SqlCommand(queryStr, conn);
                conn.Open();
                int nofRow = 0;
                nofRow = cmd.ExecuteNonQuery();
                conn.Close();
                if (nofRow > 0)
                {
                    Response.Write("<script>alert('Status successfully changed');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Sorry, we have encountered a problem, please try again later.');</script>");
                }
                accountbind();
            }
        }
    }
}
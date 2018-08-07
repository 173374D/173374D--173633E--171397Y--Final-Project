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
using System.Web.Security;



public partial class css_Login : System.Web.UI.Page
{
    Product prod = new Product();
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
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            string check2 = "select count(*) from [Users] where Email=@Username";
            SqlConnection con2 = new SqlConnection(lines);
            SqlCommand com2 = new SqlCommand(check2, con2);
            con2.Open();
            com2.Parameters.AddWithValue("@Username", txtName.Text);
            int Check = Convert.ToInt32(com2.ExecuteScalar().ToString());
            con2.Close();
            if (Check == 0)
            {
                lblerr.ForeColor = System.Drawing.Color.Red;
                lblerr.Text = "Unrecognized Email.";
            }
            else
            {
                string check1 = "select count(*) from [Users] where Email=@Username and Blacklisted = '" + "Enable" + "'";
                SqlConnection con1 = new SqlConnection(lines);
                SqlCommand com1 = new SqlCommand(check1, con1);
                con1.Open();
                com1.Parameters.AddWithValue("@Username", txtName.Text);
                int Temp = Convert.ToInt32(com1.ExecuteScalar().ToString());
                con1.Close();
                if (Temp == 0)
                {
                    lblerr.ForeColor = System.Drawing.Color.Red;
                    lblerr.Text = "Your account has been blacklisted.";
                }
                else if (Temp == 1)
                {
                    string hashedpass = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPass.Text, "MD5");
                    string check = "select count(*) from [Users] where Email=@Username and Password = '" + hashedpass.ToString() + "' ";
                    SqlConnection con = new SqlConnection(lines);
                    SqlCommand com = new SqlCommand(check, con);
                    con.Open();
                    com.Parameters.AddWithValue("@Username", txtName.Text);
                    int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                    con.Close();
                    if (temp == 1)
                    {
                        Session["Email"] = txtName.Text;
                        string queryStr = "SELECT * FROM Shopping WHERE Email = @Email";
                        SqlConnection conn = new SqlConnection(lines);
                        SqlCommand cmd = new SqlCommand(queryStr, conn);
                        cmd.Parameters.AddWithValue("@Email", (string)Session["Email"]);
                        conn.Open();
                        SqlDataReader dr = cmd.ExecuteReader();

                        //retrieve shopping cart data
                        while (dr.Read())
                        {
                            string ProductID = dr["ProductID"].ToString();
                            int Quantity = int.Parse(dr["Quantity"].ToString());
                            Product aProd = new Product();
                            prod = aProd.getProduct(ProductID);
                            string iProductID = prod.Product_ID.ToString();
                            for (int i = 0; i < (Quantity); i++)
                            {
                                ShoppingCart.Instance.AddItem(iProductID, prod);
                            }
                        }
                        conn.Close();
                        dr.Close();

                        string queryStr2 = "SELECT * FROM Wishlist WHERE Email = @Email";
                        SqlConnection conn2 = new SqlConnection(lines);
                        SqlCommand cmd2 = new SqlCommand(queryStr2, conn2);
                        cmd2.Parameters.AddWithValue("@Email", (string)Session["Email"]);
                        conn2.Open();
                        SqlDataReader dr2 = cmd2.ExecuteReader();

                        //retrieve Wishlist data
                        while (dr2.Read())
                        {
                            string ProductID = dr2["ProductID"].ToString();
                            Product aProd = new Product();
                            prod = aProd.getProduct(ProductID);
                            string iProductID = prod.Product_ID.ToString();
                            Wishlist.Instance.AddItem(iProductID, prod);
                        }
                        conn2.Close();
                        dr2.Close();

                        //delete retrieved data
                        string queryStr1 = "DELETE FROM Shopping WHERE Email=@Email";
                        SqlConnection conn1 = new SqlConnection(lines);
                        SqlCommand cmd1 = new SqlCommand(queryStr1, conn1);
                        cmd1.Parameters.AddWithValue("@Email", (string)Session["Email"]);
                        conn1.Open();
                        cmd1.ExecuteNonQuery();
                        conn1.Close();

                        //delete retrieved data
                        string queryStr3 = "DELETE FROM Wishlist WHERE Email=@Email";
                        SqlConnection conn3 = new SqlConnection(lines);
                        SqlCommand cmd3 = new SqlCommand(queryStr3, conn3);
                        cmd3.Parameters.AddWithValue("@Email", (string)Session["Email"]);
                        conn3.Open();
                        cmd3.ExecuteNonQuery();
                        conn3.Close();
                        //redirect to index page
                        Session["Count"] = "1";
                        Response.Redirect("Index.aspx");
                    }
                    else
                    {
                        lblerr.ForeColor = System.Drawing.Color.Red;
                        lblerr.Text = "Email or Password Invalid.";
                    }
                }
                else
                {
                    lblerr.ForeColor = System.Drawing.Color.Red;
                    lblerr.Text = "Error, Pls try again later.";
                }

            }
        }
        catch
        {
            lblerr.ForeColor = System.Drawing.Color.Red;
            lblerr.Text = "System Error, Pls try again later.";

        }

    }
}
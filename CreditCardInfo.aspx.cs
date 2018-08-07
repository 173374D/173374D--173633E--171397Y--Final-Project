using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class CreditCardInfo : System.Web.UI.Page
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
            Master.one1 = true;
            Master.two2 = false;
            Master.three3 = false;
            Master.four4 = true;
            Session["Email"] = "User";
            ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('You can only save billing information,after login in.');window.location='login.aspx';</script>'");
        }
        if (!IsPostBack)
        {
            string check1 = "select count(*) from [Billing] where Email=@Username";
            SqlConnection con1 = new SqlConnection(lines);
            SqlCommand com1 = new SqlCommand(check1, con1);
            con1.Open();
            com1.Parameters.AddWithValue("@Username", (string)Session["Email"]);
            int Temp = Convert.ToInt32(com1.ExecuteScalar().ToString());
            con1.Close();
            if (Temp == 1)
            {
                string review = "select * from [Billing] where Email=@Username";
                SqlConnection conn = new SqlConnection(lines);
                SqlCommand cmd = new SqlCommand(review, conn);
                conn.Open();
                cmd.Parameters.AddWithValue("@Username", (string)Session["Email"]);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    TextBoxFirstname.Text = dr["FName"].ToString();
                    TextBoxLastname.Text = dr["LName"].ToString();
                    TextBoxEmail.Text = dr["Mail"].ToString();
                    TextBoxAddress.Text = dr["Address"].ToString();
                    TextBoxCity.Text= dr["City"].ToString();
                    TextBoxPostalCode.Text= dr["Postcode"].ToString();
                    RadioButtonList1.SelectedValue= dr["CardType"].ToString();
                    TextBoxNameOnCard.Text=dr["NOC"].ToString();
                    TextBoxCardNo.Text= dr["CreditCardNo"].ToString();
                    TextBoxExpire.Text= dr["Expiry"].ToString();
                    TextBoxCVV.Text= dr["CVV"].ToString();
                    string check= dr["Shipping"].ToString();
                    if (check == "True")
                    {
                        CheckBox2.Checked=true;
                    }
                    else
                    {
                        CheckBox2.Checked = false;
                    }
                }
                conn.Close();
                dr.Close();
            }
        }
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

    protected void btn_Update_Click1(object sender, EventArgs e)
    {
        int test;
        if (TextBoxFirstname.Text == "" || TextBoxLastname.Text == "")
        {
            lbl_name.ForeColor = System.Drawing.Color.Red;
            lbl_name.Font.Bold = true;
            lbl_name.Text = "Please enter your full name";
        }
        //else if (int.TryParse(TextBoxCardNo.Text, out test) == false)
        //{
        //    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Check that you have enter Credit card number correctly.')", true);
        //}
        //else if (int.TryParse(TextBoxExpire.Text, out test) == false)
        //{
        //    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Check that you have key in correct expiry date.')", true);
        //}
        //else if (int.TryParse(TextBoxCVV.Text, out test) == false)
        //{
        //    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Check that you have key in CCV number correctly.')", true);
        //}
        else
        {
            string shipping;
            if (CheckBox2.Checked)
            {
                shipping = "True";
            }
            else
            {
                shipping = "False";
            }
            //try
            //{
                string check1 = "select count(*) from [Billing] where Email = @Username";
                SqlConnection con1 = new SqlConnection(lines);
                SqlCommand com1 = new SqlCommand(check1, con1);
                con1.Open();
                com1.Parameters.AddWithValue("@Username", (string)Session["Email"]);
                int Temp = Convert.ToInt32(com1.ExecuteScalar().ToString());
                con1.Close();
                if (Temp == 1)
                {
                    string queryStr = "UPDATE Billing SET" +
                " FName = @FName, " +
                " LName = @LName, " +
                " Mail = @Mail, " +
                " Address = @Address, " +
                " City = @City, " +
                " Country = @Country, " +
                " Postcode = @Postcode, " +
                " CardType = @CardType, " +
                " NOC = @NOC, " +
                " CreditCardNo = @CreditCardNo, " +
                " Expiry = @Expiry, " +
                " CVV = @CVV, " +
                " Shipping = '"+shipping+"'" +
                " WHERE Email = @Email";

                    SqlConnection conn = new SqlConnection(lines);
                    SqlCommand cmd = new SqlCommand(queryStr, conn);
                    cmd.Parameters.AddWithValue("@FName", TextBoxFirstname.Text);
                    cmd.Parameters.AddWithValue("@LName", TextBoxLastname.Text);
                    cmd.Parameters.AddWithValue("@Mail", TextBoxEmail.Text);
                    cmd.Parameters.AddWithValue("@Address", TextBoxAddress.Text);
                    cmd.Parameters.AddWithValue("@City", TextBoxCity.Text);
                    cmd.Parameters.AddWithValue("@Country", dropdownlist.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@Postcode", TextBoxPostalCode.Text);
                    cmd.Parameters.AddWithValue("@CardType", RadioButtonList1.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@NOC", TextBoxNameOnCard.Text);
                    cmd.Parameters.AddWithValue("@CreditCardNo", TextBoxCardNo.Text);
                    cmd.Parameters.AddWithValue("@Expiry", TextBoxExpire.Text);
                    cmd.Parameters.AddWithValue("@CVV", TextBoxCVV.Text);
                    cmd.Parameters.AddWithValue("@Email", (string)Session["Email"]);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Billing Info is updated successfully.')", true);
                }
                else
                {
                    string ins = "Insert into [Billing](Email, FName, LName, Mail, Address, City, Country, Postcode, CardType, NOC, CreditCardNo, Expiry, CVV, Shipping) values('" + (string)Session["Email"] + "','" + TextBoxFirstname.Text + "','" + TextBoxLastname.Text + "','" + TextBoxEmail.Text + "','" + TextBoxAddress.Text + "','" + TextBoxCity.Text + "','" + dropdownlist.SelectedValue.ToString() + "','" + TextBoxPostalCode.Text + "','" + RadioButtonList1.SelectedValue.ToString() + "','" + TextBoxNameOnCard.Text + "','" + TextBoxCardNo.Text + "','" + TextBoxExpire.Text + "','" + TextBoxCVV.Text + "','" + shipping + "')";
                    SqlConnection con = new SqlConnection(lines);
                    SqlCommand com = new SqlCommand(ins, con);
                    con.Open();
                    com.ExecuteNonQuery();
                    con.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Billing Info has been created.')", true);
                }
            //}
            //catch
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('e have encounter a problem, please try again later.')", true);
            //}
        }
    }
}
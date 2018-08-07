using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Checkout1 : System.Web.UI.Page
{
    string mytime = null;
    string mylang = null;
    string lines = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCart();
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
            Master.one1 = true;
            Master.two2 = false;
            Master.three3 = false;
            Master.four4 = true;
            Session["Email"] = "User";
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
                    billing_first_name.Text = dr["FName"].ToString();
                    billing_last_name.Text = dr["LName"].ToString();
                    billing_email.Text = dr["Mail"].ToString();
                    billing_address_1.Text = dr["Address"].ToString();
                    billing_city.Text = dr["City"].ToString();
                    billing_postcode.Text = dr["Postcode"].ToString();
                    txtCardno.Text = dr["CreditCardNo"].ToString();
                    txtCardExpiration.Text = dr["Expiry"].ToString();
                    txtCardCvv.Text = dr["CVV"].ToString();
                    string check = dr["Shipping"].ToString();
                    if (check == "True")
                    {
                        shipping_first_name.Text = dr["FName"].ToString();
                        shipping_last_name.Text = dr["LName"].ToString();
                        shipping_address_1.Text = dr["Address"].ToString();
                        shipping_city.Text = dr["City"].ToString();
                        shipping_postcode.Text = dr["Postcode"].ToString();
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
    protected void LoadCart()
    {
        //bind the Items inside the Session/ShoppingCart Instance with the Datagrid
        gv_CartView.DataSource = ShoppingCart.Instance.Items;
        gv_CartView.DataBind();

        decimal total = 0.0m;
        foreach (ShoppingCartItem item in ShoppingCart.Instance.Items)
        {
            total = total + item.TotalPrice;
        }
        lbl_TotalPrice.Text = total.ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        int left;
        int usercountry;
        string userfirstname;
        string userlastname;
        string usercompany;
        string useraddress1;
        string useraddress2;
        string usercity;
        string userstate;
        int userpostcode;
        string useremail;
        int userphone;


        //Data Validation
        if (ship_diff_address.Checked == true)
        {

            RfvShippingfirstname.Enabled = true;
            RfvShippinglastname.Enabled = true;
            RfvShippingaddress1.Enabled = true;
            RfvShippingcity.Enabled = true;
            RfvShippingpostcode.Enabled = true;

            int shippingcountry;
            string shippingfirstname;
            string shippinglastname;
            string shippingcompany;
            string shippingaddress1;
            string shippingaddress2;
            string shippingcity;
            string shippingstate;
            int shippingpostcode;

            usercountry = billing_country.SelectedIndex;
            userfirstname = billing_first_name.Text;
            userlastname = billing_last_name.Text;
            usercompany = billing_company.Text;
            useraddress1 = billing_address_1.Text;
            useraddress2 = billing_address_2.Text;
            usercity = billing_city.Text;
            userstate = billing_state.Text;
            userpostcode = int.Parse(billing_postcode.Text);
            useremail = billing_email.Text;
            userphone = int.Parse(billing_phone.Text);

            shippingcountry = shipping_country.SelectedIndex;
            shippingfirstname = shipping_first_name.Text;
            shippinglastname = shipping_last_name.Text;
            shippingcompany = shipping_company.Text;
            shippingaddress1 = shipping_address_1.Text;
            shippingaddress2 = shipping_address_2.Text;
            shippingcity = shipping_city.Text;
            shippingstate = shipping_state.Text;
            shippingpostcode = int.Parse(shipping_postcode.Text);



            //Billing Details
            UserDetails dt = new UserDetails(usercountry, userfirstname, userlastname, usercompany, useraddress1, useraddress2, usercity,
                                             userstate, userpostcode, useremail, userphone);

            DetailsManager.GetInstance().AddDetails(dt);

            //Shipping Details
            ShippingDetails sh = new ShippingDetails(shippingcountry, shippingfirstname, shippinglastname, shippingcompany, shippingaddress1, shippingaddress2, shippingcity,
                                             shippingstate, shippingpostcode);
            ShippingManager.GetInstance().AddShipping(sh);


            //Database////////////////////////////////////////////////////////////////////////
            int TQuantity = 0;
            string Product = "", quantity = "";
            string date = DateTime.Now.ToString();
            foreach (ShoppingCartItem item in ShoppingCart.Instance.Items)
            {
                Product = Product + item.ItemID.ToString() + ",";
                quantity = quantity + item.Quantity + ",";
                TQuantity = TQuantity + item.Quantity;
            }
            string Query = "insert into [Receipt] (Product_Name, Product_Quantity, Billing_Firstname, Billing_Lastname, Billing_Company, Billing_Address_Line1, Billing_Address_Line2, Billing_City, Billing_State, Billing_Postcode, Billing_Email, Billing_Phone, Shipping_Firstname, Shipping_Lastname, Shipping_Company, Shipping_Address_Line1, Shipping_Address_Line2, Shipping_City, Shipping_State, Shipping_Postcode, UserEmail, TQuantity, Date) values('" + Product + "','" + quantity + "','" + billing_first_name.Text + "','" + billing_last_name.Text + "','" + billing_company.Text + "','" + billing_address_1.Text + "','" + billing_address_2.Text + "','" + billing_city.Text + "','" + billing_state.Text + "','" + billing_postcode.Text + "','" + billing_email.Text + "','" + billing_phone.Text + "','" + shipping_first_name.Text + "','" + shipping_last_name.Text + "','" + shipping_company.Text + "','" + shipping_address_1.Text + "','" + shipping_address_2.Text + "','" + shipping_city.Text + "','" + shipping_state.Text + "','" + shipping_postcode.Text + "','" + (string)Session["Email"] + "','" + TQuantity.ToString() + "','" + date + "')";
            string strConnectionString = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
            SqlConnection myConnect = new SqlConnection(strConnectionString);

            SqlCommand cmd = new SqlCommand(Query, myConnect);
            myConnect.Open();


            cmd.ExecuteNonQuery();

            myConnect.Close();
            //////////////////////////////////////////////////////////////////////////////////////

            if (RdoCredit.Checked == true)
            {

                if (txtCardno.Text.Length < 16)
                {
                    lblCreditnumber.Text = "Please enter a Valid Credit Card Number";
                }

                if (txtCardExpiration.Text.Length < 5)
                {
                    lblExpiry.Text = "Please enter a Valid Expiry Date";
                }

                if (txtCardCvv.Text.Length < 3)
                {
                    lblCvv.Text = "Please enter a Valid CVV Number)";
                }
                foreach (ShoppingCartItem item in ShoppingCart.Instance.Items)
                {

                    string ins = "SELECT * FROM Products where Product_ID='" + item.ItemID + "'";
                    SqlConnection con = new SqlConnection(lines);
                    SqlCommand com = new SqlCommand(ins, con);
                    con.Open();
                    SqlDataReader dr = com.ExecuteReader();
                    while (dr.Read())
                    {
                        left = int.Parse(dr["Stock_Level"].ToString());
                        int stock = left - item.Quantity;
                        string queryStr = "UPDATE Products SET" +
               " Stock_Level = @ProductStock " +
               " WHERE Product_ID = '" + item.ItemID + "'";

                        SqlConnection conn = new SqlConnection(lines);
                        SqlCommand cmd1 = new SqlCommand(queryStr, conn);
                        cmd1.Parameters.AddWithValue("@ProductStock", stock);
                        conn.Open();
                        cmd1.ExecuteNonQuery();
                        conn.Close();
                    }
                    con.Close();
                }
                Server.Transfer("receipt.aspx?paymentmethod=CreditCard");
            }

            else
            {
                //paymentmethod = "Bank Transfer [Please Email transfer details to wadppayment@gmail.com]";
                foreach (ShoppingCartItem item in ShoppingCart.Instance.Items)
                {

                    string ins = "SELECT * FROM Products where Product_ID='" + item.ItemID + "'";
                    SqlConnection con = new SqlConnection(lines);
                    SqlCommand com = new SqlCommand(ins, con);
                    con.Open();
                    SqlDataReader dr = com.ExecuteReader();
                    while (dr.Read())
                    {
                        left = int.Parse(dr["Stock_Level"].ToString());
                        int stock = left - item.Quantity;
                        string queryStr = "UPDATE Products SET" +
               " Stock_Level = @ProductStock " +
               " WHERE Product_ID = '" + item.ItemID + "'";

                        SqlConnection conn = new SqlConnection(lines);
                        SqlCommand cmd1 = new SqlCommand(queryStr, conn);
                        cmd1.Parameters.AddWithValue("@ProductStock", stock);
                        conn.Open();
                        cmd1.ExecuteNonQuery();
                        conn.Close();
                    }
                    con.Close();
                }
                Server.Transfer("receipt.aspx?paymentmethod=BankTransfer");
            }

            //Response.Redirect("receipt.aspx");

        }

        else
        {



            usercountry = billing_country.SelectedIndex;
            userfirstname = billing_first_name.Text;
            userlastname = billing_last_name.Text;
            usercompany = billing_company.Text;
            useraddress1 = billing_address_1.Text;
            useraddress2 = billing_address_2.Text;
            usercity = billing_city.Text;
            userstate = billing_state.Text;
            userpostcode = int.Parse(billing_postcode.Text);
            useremail = billing_email.Text;
            userphone = int.Parse(billing_phone.Text);

            UserDetails dt = new UserDetails(usercountry, userfirstname, userlastname, usercompany, useraddress1, useraddress2, usercity,
                                             userstate, userpostcode, useremail, userphone);

            DetailsManager.GetInstance().AddDetails(dt);

            //Database////////////////////////////////////////////////////////////////////////
            int TQuantity = 0;
            string Product = "", quantity = "";
            string date = DateTime.Now.ToString();
            foreach (ShoppingCartItem item in ShoppingCart.Instance.Items)
            {
                Product = Product + item.ItemID.ToString() + ",";
                quantity = quantity + item.Quantity + ",";
                TQuantity = TQuantity + item.Quantity;
            }
            string Query = "insert into [Receipt] (Product_Name, Product_Quantity, Billing_Firstname, Billing_Lastname, Billing_Company, Billing_Address_Line1, Billing_Address_Line2, Billing_City, Billing_State, Billing_Postcode, Billing_Email, Billing_Phone, Shipping_Firstname, Shipping_Lastname, Shipping_Company, Shipping_Address_Line1, Shipping_Address_Line2, Shipping_City, Shipping_State, Shipping_Postcode, UserEmail, TQuantity, Date) values('" + Product + "','" + quantity + "','" + billing_first_name.Text + "','" + billing_last_name.Text + "','" + billing_company.Text + "','" + billing_address_1.Text + "','" + billing_address_2.Text + "','" + billing_city.Text + "','" + billing_state.Text + "','" + billing_postcode.Text + "','" + billing_email.Text + "','" + billing_phone.Text + "','" + shipping_first_name.Text + "','" + shipping_last_name.Text + "','" + shipping_company.Text + "','" + shipping_address_1.Text + "','" + shipping_address_2.Text + "','" + shipping_city.Text + "','" + shipping_state.Text + "','" + shipping_postcode.Text + "','" + (string)Session["Email"] + "','" + TQuantity.ToString() + "','" + date + "')";
            string strConnectionString = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
            SqlConnection myConnect = new SqlConnection(strConnectionString);

            SqlCommand cmd = new SqlCommand(Query, myConnect);
            myConnect.Open();


            cmd.ExecuteNonQuery();

            myConnect.Close();



            if (RdoCredit.Checked == true)
            {

                if (txtCardno.Text.Length < 16)
                {
                    lblCreditnumber.Text = "Please enter a Valid Credit Card Number";
                }

                if (txtCardExpiration.Text.Length < 5)
                {
                    lblExpiry.Text = "Please enter a Valid Expiry Date";
                }

                if (txtCardCvv.Text.Length < 3)
                {
                    lblCvv.Text = "Please enter a Valid CVV Number)";
                }
                foreach (ShoppingCartItem item in ShoppingCart.Instance.Items)
                {

                    string ins = "SELECT * FROM Products where Product_ID='" + item.ItemID + "'";
                    SqlConnection con = new SqlConnection(lines);
                    SqlCommand com = new SqlCommand(ins, con);
                    con.Open();
                    SqlDataReader dr = com.ExecuteReader();
                    while (dr.Read())
                    {
                        left = int.Parse(dr["Stock_Level"].ToString());
                        int stock = left - item.Quantity;
                        string queryStr = "UPDATE Products SET" +
               " Stock_Level = @ProductStock " +
               " WHERE Product_ID = '" + item.ItemID + "'";

                        SqlConnection conn = new SqlConnection(lines);
                        SqlCommand cmd1 = new SqlCommand(queryStr, conn);
                        cmd1.Parameters.AddWithValue("@ProductStock", stock);
                        conn.Open();
                        cmd1.ExecuteNonQuery();
                        conn.Close();
                    }
                    con.Close();
                }
                Server.Transfer("receipt.aspx?paymentmethod=CreditCard");
            }

            else
            {
                //paymentmethod = "Bank Transfer [Please Email transfer details to wadppayment@gmail.com]";
                foreach (ShoppingCartItem item in ShoppingCart.Instance.Items)
                {

                    string ins = "SELECT * FROM Products where Product_ID='" + item.ItemID + "'";
                    SqlConnection con = new SqlConnection(lines);
                    SqlCommand com = new SqlCommand(ins, con);
                    con.Open();
                    SqlDataReader dr = com.ExecuteReader();
                    while (dr.Read())
                    {
                        left = int.Parse(dr["Stock_Level"].ToString());
                        int stock = left - item.Quantity;
                        string queryStr = "UPDATE Products SET" +
               " Stock_Level = @ProductStock " +
               " WHERE Product_ID = '" + item.ItemID + "'";

                        SqlConnection conn = new SqlConnection(lines);
                        SqlCommand cmd1 = new SqlCommand(queryStr, conn);
                        cmd1.Parameters.AddWithValue("@ProductStock", stock);
                        conn.Open();
                        cmd1.ExecuteNonQuery();
                        conn.Close();
                    }
                    con.Close();
                }
                Server.Transfer("receipt.aspx?paymentmethod=BankTransfer");
            }

            //       Response.Redirect("receipt.aspx"); 

        }
    }
}


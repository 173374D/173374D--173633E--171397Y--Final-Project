using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Globalization;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Index : System.Web.UI.Page
{
    static int currentposition = 0;
    static int totalrows = 0;
    static int currentposition1 = 0;
    static int totalrows1 = 0;
    static int currentposition2 = 0;
    static int totalrows2 = 0;
    Product prod = null;
    string mytime = null;
    string mylang = null;
    string mycount = "0";
    string lines = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        Master.Logout.Click += new EventHandler(loggingout);
        mytime = (string)Session["Email"];
        mycount = (string)Session["Count"];
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
            if (mycount == "1")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Hello!')", true);
                Session["Count"] = "0";
            }
            if (mycount == "2")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You have already login!')", true);
                Session["Count"] = "0";
            }
            if (mycount == "3")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Resquest Time Out!')", true);
                Session["Count"] = "0";
            }

            Master.MenuAccount.Text = "Welcome back, " + mytime;
        }
        else if (mytime != null && mytime != "User")
        {
            Master.one1 = false;
            Master.two2 = true;
            Master.three3 = false;
            Master.four4 = true;
            if (mycount == "1")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Hello!')", true);
                Session["Count"] = "0";
            }
            if (mycount == "2")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You have already login!')", true);
                Session["Count"] = "0";
            }
            if (mycount == "3")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Response Time Out!')", true);
                Session["Count"] = "0";
            }

            Master.MenuAccount.Text = "Welcome back, " + mytime;
        }
        else
        {
            Master.one1 = true;
            Master.two2 = false;
            Master.three3 = false;
            Master.four4 = true;
            Session["Email"] = "User";
            if (mycount == "3")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Response Time Out!')", true);
                Session["Count"] = "0";
            }

        }
        Local();
        popular();
        recommended();
        recent();
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
    private void Local()
    {
        btn_1.Text = (string)GetLocalResourceObject("Cart");
        btn_2.Text = (string)GetLocalResourceObject("Cart");
        btn_3.Text = (string)GetLocalResourceObject("Cart");
        btn_4.Text = (string)GetLocalResourceObject("Cart");
        btn_5.Text = (string)GetLocalResourceObject("Cart");
        btn_6.Text = (string)GetLocalResourceObject("Cart");
        lbl_Payment.Text = (string)GetLocalResourceObject("Payment");
        lbl_Product.Text = (string)GetLocalResourceObject("Product");
        lbl_Return.Text = (string)GetLocalResourceObject("Return");
        lbl_Shipping.Text = (string)GetLocalResourceObject("Shipping");
        lbl_popular.Text = (string)GetLocalResourceObject("Popular");
        lbl_Recommended.Text = (string)GetLocalResourceObject("Recommended");
        lbl_recently.Text = (string)GetLocalResourceObject("Recently");
    }

    protected void btn_1_Click(object sender, EventArgs e)
    {
        string name = "";
        string Status = "";
        int Stock = -1;
        string queryStr = "SELECT * FROM Products WHERE Product_ID = @ProdID";
        SqlConnection conn = new SqlConnection(lines);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@ProdID", "4");
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        //Check if there are any resultsets
        if (dr.Read())
        {
            name = dr["Product_Name"].ToString();
            Status = dr["Status"].ToString();
            Stock = int.Parse(dr["Stock_Level"].ToString());
        }
        conn.Close();
        dr.Close();
        if (Status != "Enable")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('This Product is currently not for sales.')", true);
        }
        else if (Stock == 0)
        {
            string test = name;

            this.RegisterStartupScript("msg", "<script language='javascript'>alert('" + test.ToString() + " have not enough stock.')</script>");
        }
        else
        {
            Product aProd = new Product();
            prod = aProd.getProduct("4");
            string iProductID = prod.Product_ID.ToString();
            ShoppingCart.Instance.AddItem(iProductID, prod);
        }
    }
    protected void btn_2_Click(object sender, EventArgs e)
    {
        string name = "";
        string Status = "";
        int Stock = -1;
        string queryStr = "SELECT * FROM Products WHERE Product_ID = @ProdID";
        SqlConnection conn = new SqlConnection(lines);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@ProdID", "2");
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        //Check if there are any resultsets
        if (dr.Read())
        {
            name = dr["Product_Name"].ToString();
            Status = dr["Status"].ToString();
            Stock = int.Parse(dr["Stock_Level"].ToString());
        }
        conn.Close();
        dr.Close();
        if (Status != "Enable")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('This Product is currently not for sales.')", true);
        }
        else if (Stock == 0)
        {
            string test = name;
            this.RegisterStartupScript("msg", "<script language='javascript'>alert('" + test.ToString() + " have not enough stock.')</script>");
        }
        else
        {
            Product aProd = new Product();
            prod = aProd.getProduct("2");
            string iProductID = prod.Product_ID.ToString();
            ShoppingCart.Instance.AddItem(iProductID, prod);
        }
    }
    protected void btn_3_Click(object sender, EventArgs e)
    {
        string name = "";
        string Status = "";
        int Stock = -1;
        string queryStr = "SELECT * FROM Products WHERE Product_ID = @ProdID";
        SqlConnection conn = new SqlConnection(lines);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@ProdID", "3");
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        //Check if there are any resultsets
        if (dr.Read())
        {
            name = dr["Product_name"].ToString();
            Status = dr["Status"].ToString();
            Stock = int.Parse(dr["Stock_Level"].ToString());
        }
        conn.Close();
        dr.Close();
        if (Status != "Enable")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('This Product is currently not for sales.')", true);
        }
        else if (Stock == 0)
        {
            string test = name;
            this.RegisterStartupScript("msg", "<script language='javascript'>alert('" + test.ToString() + " have not enough stock.')</script>");
        }
        else
        {
            Product aProd = new Product();
            prod = aProd.getProduct("3");
            string iProductID = prod.Product_ID.ToString();
            ShoppingCart.Instance.AddItem(iProductID, prod);
        }
    }
    protected void btn_4_Click(object sender, EventArgs e)
    {
        string name = "";
        string Status = "";
        int Stock = -1;
        string queryStr = "SELECT * FROM Products WHERE Product_ID = @ProdID";
        SqlConnection conn = new SqlConnection(lines);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@ProdID", "1");
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        //Check if there are any resultsets
        if (dr.Read())
        {
            name = dr["Product_Name"].ToString();
            Status = dr["Status"].ToString();
            Stock = int.Parse(dr["Stock_Level"].ToString());
        }
        conn.Close();
        dr.Close();
        if (Status != "Enable")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('This Product is currently not for sales.')", true);
        }
        else if (Stock == 0)
        {
            string test = name;
            this.RegisterStartupScript("msg", "<script language='javascript'>alert('" + test.ToString() + " have not enough stock.')</script>");
        }
        else
        {
            Product aProd = new Product();
            prod = aProd.getProduct("1");
            string iProductID = prod.Product_ID.ToString();
            ShoppingCart.Instance.AddItem(iProductID, prod);
        }
    }

    protected void btn_5_Click(object sender, EventArgs e)
    {
        string name = "";
        string Status = "";
        int Stock = -1;
        string queryStr = "SELECT * FROM Products WHERE Product_ID = @ProdID";
        SqlConnection conn = new SqlConnection(lines);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@ProdID", "5");
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        //Check if there are any resultsets
        if (dr.Read())
        {
            name = dr["Product_Name"].ToString();
            Status = dr["Status"].ToString();
            Stock = int.Parse(dr["Stock_Level"].ToString());
        }
        conn.Close();
        dr.Close();
        if (Status != "Enable")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('This Product is currently not for sales.')", true);
        }
        else if (Stock == 0)
        {
            string test = name;
            this.RegisterStartupScript("msg", "<script language='javascript'>alert('" + test.ToString() + " have not enough stock.')</script>");
        }
        else
        {
            Product aProd = new Product();
            prod = aProd.getProduct("5");
            string iProductID = prod.Product_ID.ToString();
            ShoppingCart.Instance.AddItem(iProductID, prod);
        }
    }

    protected void btn_6_Click(object sender, EventArgs e)
    {
        string name = "";
        string Status = "";
        int Stock = -1;
        string queryStr = "SELECT * FROM Products WHERE Product_ID = @ProdID";
        SqlConnection conn = new SqlConnection(lines);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@ProdID", "6");
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        //Check if there are any resultsets
        if (dr.Read())
        {
            name = dr["Product_Name"].ToString();
            Status = dr["Status"].ToString();
            Stock = int.Parse(dr["Stock_Level"].ToString());
        }
        conn.Close();
        dr.Close();
        if (Status != "Enable")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('This Product is currently not for sales.')", true);
        }
        else if (Stock == 0)
        {
            string test = name;
            this.RegisterStartupScript("msg", "<script language='javascript'>alert('" + test.ToString() + " have not enough stock.')</script>");
        }
        else
        {
            Product aProd = new Product();
            prod = aProd.getProduct("6");
            string iProductID = prod.Product_ID.ToString();
            ShoppingCart.Instance.AddItem(iProductID, prod);
        }
    }

    protected void btnwish1_Click(object sender, ImageClickEventArgs e)
    {
        if (mytime != "User")
        {
            Product aProd = new Product();
            prod = aProd.getProduct("4");
            string iProductID = prod.Product_ID.ToString();
            Wishlist.Instance.AddItem(iProductID, prod);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('You need to login first, to use wishlist function');window.location='login.aspx';</script>'");
        }

    }

    protected void btnwish2_Click(object sender, ImageClickEventArgs e)
    {
        if (mytime != "User")
        {
            Product aProd = new Product();
            prod = aProd.getProduct("2");
            string iProductID = prod.Product_ID.ToString();
            Wishlist.Instance.AddItem(iProductID, prod);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('You need to login first, to use wishlist function');window.location='login.aspx';</script>'");
        }
    }

    protected void btnwish3_Click(object sender, ImageClickEventArgs e)
    {

        if (mytime != "User")
        {
            Product aProd = new Product();
            prod = aProd.getProduct("3");
            string iProductID = prod.Product_ID.ToString();
            Wishlist.Instance.AddItem(iProductID, prod);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('You need to login first, to use wishlist function');window.location='login.aspx';</script>'");
        }
    }

    protected void btnwish4_Click(object sender, ImageClickEventArgs e)
    {
        if (mytime != "User")
        {
            Product aProd = new Product();
            prod = aProd.getProduct("1");
            string iProductID = prod.Product_ID.ToString();
            Wishlist.Instance.AddItem(iProductID, prod);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('You need to login first, to use wishlist function');window.location='login.aspx';</script>'");
        }
    }

    protected void btnwish5_Click(object sender, ImageClickEventArgs e)
    {
        if (mytime != "User")
        {
            Product aProd = new Product();
            prod = aProd.getProduct("5");
            string iProductID = prod.Product_ID.ToString();
            Wishlist.Instance.AddItem(iProductID, prod);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('You need to login first, to use wishlist function');window.location='login.aspx';</script>'");
        }
    }

    protected void btnwish6_Click(object sender, ImageClickEventArgs e)
    {
        if (mytime != "User")
        {
            Product aProd = new Product();
            prod = aProd.getProduct("6");
            string iProductID = prod.Product_ID.ToString();
            Wishlist.Instance.AddItem(iProductID, prod);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('You need to login first, to use wishlist function');window.location='login.aspx';</script>'");
        }
    }
    protected void popular()
    {

        string review = "SELECT * FROM Products Order By Num_Sold DESC";
        SqlConnection conn = new SqlConnection(lines);
        SqlCommand cmd = new SqlCommand(review, conn);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        totalrows = ds.Tables[0].Rows.Count;
        DataTable dt = ds.Tables[0];
        PagedDataSource pg = new PagedDataSource();
        pg.DataSource = dt.DefaultView;
        pg.AllowPaging = true;
        pg.CurrentPageIndex = currentposition;
        pg.PageSize = 3;
        btn_first.Visible = !pg.IsFirstPage;
        btn_prev.Visible = !pg.IsFirstPage;
        btn_next.Visible = !pg.IsLastPage;
        btn_last.Visible = !pg.IsLastPage;
        //Binding pg to datalist
        DataList1.DataSource = pg;
        DataList1.DataBind();
        conn.Close();


    }
    private void recommended()
    {

        string review = "SELECT * FROM Products Order By Recommended DESC";
        SqlConnection conn = new SqlConnection(lines);
        SqlCommand cmd = new SqlCommand(review, conn);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        totalrows1 = ds.Tables[0].Rows.Count;
        DataTable dt = ds.Tables[0];
        PagedDataSource pg = new PagedDataSource();
        pg.DataSource = dt.DefaultView;
        pg.AllowPaging = true;
        pg.CurrentPageIndex = currentposition1;
        pg.PageSize = 3;
        btn_first1.Visible = !pg.IsFirstPage;
        btn_prev1.Visible = !pg.IsFirstPage;
        btn_next1.Visible = !pg.IsLastPage;
        btn_last1.Visible = !pg.IsLastPage;
        //Binding pg to datalist
        DataList2.DataSource = pg;
        DataList2.DataBind();
        conn.Close();

    }
    private void recent()
    {

        string review = "SELECT * FROM Products Order By DOR DESC";
        SqlConnection conn = new SqlConnection(lines);
        SqlCommand cmd = new SqlCommand(review, conn);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        totalrows2 = ds.Tables[0].Rows.Count;
        DataTable dt = ds.Tables[0];
        PagedDataSource pg = new PagedDataSource();
        pg.DataSource = dt.DefaultView;
        pg.AllowPaging = true;
        pg.CurrentPageIndex = currentposition2;
        pg.PageSize = 3;
        btn_first2.Visible = !pg.IsFirstPage;
        btn_prev2.Visible = !pg.IsFirstPage;
        btn_next2.Visible = !pg.IsLastPage;
        btn_last2.Visible = !pg.IsLastPage;
        //Binding pg to datalist
        DataList3.DataSource = pg;
        DataList3.DataBind();
        conn.Close();

    }

    protected void btn_prev_Click(object sender, EventArgs e)
    {


        if (currentposition == 0)
        {

        }
        else
        {
            currentposition = currentposition - 1;
            popular();
        }
    }

    protected void btn_next_Click(object sender, EventArgs e)
    {
        if (currentposition == totalrows - 1)
        {

        }
        else
        {
            currentposition = currentposition + 1;
            popular();
        }
    }

    protected void btn_last_Click(object sender, EventArgs e)
    {
        currentposition = totalrows - 1;
        popular();
    }

    protected void btn_first_Click(object sender, EventArgs e)
    {
        currentposition = 0;
        popular();
    }

    protected void btn_first1_Click(object sender, EventArgs e)
    {
        currentposition1 = 0;
        recommended();
    }

    protected void btn_prev1_Click(object sender, EventArgs e)
    {
        if (currentposition1 == 0)
        {
        }
        else
        {
            currentposition1 = currentposition1 - 1;
            recommended();
        }
    }

    protected void btn_next1_Click(object sender, EventArgs e)
    {
        if (currentposition1 == totalrows1 - 1)
        {

        }
        else
        {
            currentposition1 = currentposition1 + 1;
            recommended();
        }
    }

    protected void btn_last1_Click(object sender, EventArgs e)
    {
        currentposition1 = totalrows1 - 1;
        recommended();
    }

    protected void btn_first2_Click(object sender, EventArgs e)
    {
        currentposition2 = 0;
        recent();
    }

    protected void btn_prev2_Click(object sender, EventArgs e)
    {
        if (currentposition2 == 0)
        {
        }
        else
        {
            currentposition2 = currentposition2 - 1;
            recent();
        }
    }

    protected void btn_next2_Click(object sender, EventArgs e)
    {
        if (currentposition2 == totalrows2 - 1)
        {

        }
        else
        {
            currentposition2 = currentposition2 + 1;
            recent();
        }
    }

    protected void btn_last2_Click(object sender, EventArgs e)
    {
        currentposition2 = totalrows2 - 1;
        recent();
    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "viewdetail")
        {
            string prodID = e.CommandArgument.ToString();
            Response.Redirect("ProductDetails.aspx?ProdID=" + prodID);
        }
        if (e.CommandName == "addcart")
        {
            string name = "";
            string Status = "";
            int Stock = -1;
            string prodID = e.CommandArgument.ToString();
            string queryStr = "SELECT * FROM Products WHERE Product_ID = @ProdID";
            SqlConnection conn = new SqlConnection(lines);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@ProdID", prodID);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            //Check if there are any resultsets
            if (dr.Read())
            {
                name = dr["Product_Name"].ToString();
                Status = dr["Status"].ToString();
                Stock = int.Parse(dr["Stock_Level"].ToString());
            }
            conn.Close();
            dr.Close();
            if (Status != "Enable")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('This Product is currently not for sales.')", true);
            }
            else if (Stock == 0)
            {
                string test = name;
                this.RegisterStartupScript("msg", "<script language='javascript'>alert('" + test.ToString() + " have not enough stock.')</script>");
            }
            else
            {
                Product prod = null;
                Product aProd = new Product();
                prod = aProd.getProduct(prodID);
                string iProductID = prod.Product_ID.ToString();
                ShoppingCart.Instance.AddItem(iProductID, prod);
            }
        }
        if (e.CommandName == "wishlist")
        {
            if (mytime != "User")
            {
                string prodID = e.CommandArgument.ToString();
                Product prod = null;
                Product aProd = new Product();
                prod = aProd.getProduct(prodID);
                Wishlist.Instance.AddItem(prodID, prod);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('You need to login first, to use wishlist function');window.location='login.aspx';</script>'");
            }
        }
    }

    protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "viewdetail1")
        {
            string prodID = e.CommandArgument.ToString();
            Response.Redirect("ProductDetails.aspx?ProdID=" + prodID);
        }
        if (e.CommandName == "addcart1")
        {
            string name = "";
            string Status = "";
            int Stock = -1;
            string prodID = e.CommandArgument.ToString();
            string queryStr = "SELECT * FROM Products WHERE Product_ID = @ProdID";
            SqlConnection conn = new SqlConnection(lines);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@ProdID", prodID);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            //Check if there are any resultsets
            if (dr.Read())
            {
                name = dr["Product_Name"].ToString();
                Status = dr["Status"].ToString();
                Stock = int.Parse(dr["Stock_Level"].ToString());
            }
            conn.Close();
            dr.Close();
            if (Status != "Enable")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('This Product is currently not for sales.')", true);
            }
            else if (Stock == 0)
            {
                string test = name;
                this.RegisterStartupScript("msg", "<script language='javascript'>alert('" + test.ToString() + " have not enough stock.')</script>");
            }
            else
            {
                Product prod = null;
                Product aProd = new Product();
                prod = aProd.getProduct(prodID);
                string iProductID = prod.Product_ID.ToString();
                ShoppingCart.Instance.AddItem(iProductID, prod);
            }
        }
        if (e.CommandName == "wishlist1")
        {
            if (mytime != "User")
            {
                string prodID = e.CommandArgument.ToString();
                Product prod = null;
                Product aProd = new Product();
                prod = aProd.getProduct(prodID);
                Wishlist.Instance.AddItem(prodID, prod);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('You need to login first, to use wishlist function');window.location='login.aspx';</script>'");
            }
        }
    }

    protected void DataList3_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "viewdetail2")
        {
            string prodID = e.CommandArgument.ToString();
            Response.Redirect("ProductDetails.aspx?ProdID=" + prodID);
        }
        if (e.CommandName == "addcart2")
        {
            string name="";
            string Status = "";
            int Stock = -1;
            string prodID = e.CommandArgument.ToString();
            string queryStr = "SELECT * FROM Products WHERE Product_ID = @ProdID";
            SqlConnection conn = new SqlConnection(lines);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@ProdID", prodID);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            //Check if there are any resultsets
            if (dr.Read())
            {
                name = dr["Product_Name"].ToString();
                Status = dr["Status"].ToString();
                Stock = int.Parse(dr["Stock_Level"].ToString());
            }
            conn.Close();
            dr.Close();
            if (Status != "Enable")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('This Product is currently not for sales.')", true);
            }
            else if (Stock == 0)
            {
                string test = name;
                this.RegisterStartupScript("msg", "<script language='javascript'>alert('" + test.ToString() + " have not enough stock.')</script>");
            }
            else
            {
                Product prod = null;
                Product aProd = new Product();
                prod = aProd.getProduct(prodID);
                string iProductID = prod.Product_ID.ToString();
                ShoppingCart.Instance.AddItem(iProductID, prod);
            }
        }
        if (e.CommandName == "wishlist2")
        {
            if (mytime != "User")
            {
                string prodID = e.CommandArgument.ToString();
                Product prod = null;
                Product aProd = new Product();
                prod = aProd.getProduct(prodID);
                Wishlist.Instance.AddItem(prodID, prod);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('You need to login first, to use wishlist function');window.location='login.aspx';</script>'");
            }
        }
    }
}
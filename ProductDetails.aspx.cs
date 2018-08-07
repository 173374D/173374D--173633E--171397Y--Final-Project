using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class ProductDetail : System.Web.UI.Page
{
    Product prod = null;
    static int currentposition = 0;
    static int totalrows = 0;
    string mytime = null;
    string mylang = null;
    string prodID = null;
    string lines = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        Product aProd = new Product();
        try
        {
            // Get Product ID from querystring
            prodID = Request.QueryString["ProdID"].ToString();
            prod = aProd.getProduct(prodID);
            lbl_ProdName.Text = prod.Product_Name;
            lbl_ProdDesc.Text = prod.Product_Desc;
            lbl_Price.Text = prod.Unit_Price.ToString("c");
            img_Product.ImageUrl = prod.Product_Image;
            lbl_Price.Text = prod.Unit_Price.ToString();
            lbl_ProdID.Text = prodID.ToString();

            bind();
        }
        catch
        {
            Server.Transfer("ProductView.aspx");
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

    protected void Btn_Add_Click(object sender, EventArgs e)
    {
        string name = "";
        string Status = "";
        int Stock = -1;
        string iProductID = prod.Product_ID.ToString();
        string queryStr = "SELECT * FROM Products WHERE Product_ID = @ProdID";
        SqlConnection conn = new SqlConnection(lines);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@ProdID", iProductID);
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
            ShoppingCart.Instance.AddItem(iProductID, prod);
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
       if(mytime=="User")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Please login and give us a comment.');window.location='Login.aspx';</script>'");
        }
        else
        {
            if ((string)Session["rate"] == null)
            {
                lblRating.ForeColor = System.Drawing.Color.Red;
                lblRating.Text = "Please rate our product, thank you.";
            }
            else
            {
                try
                {
                    string rating = (string)Session["rate"];
                    string img = "img/" + rating + ".png";
                    string ins = "Insert into [Review](Product_ID, Name, Comment, image) values('" + prodID + "','" + txtName.Text + "','" + txtComment.Text + "', '" + img + "')";
                    SqlConnection con1 = new SqlConnection(lines);
                    SqlCommand com1 = new SqlCommand(ins, con1);
                    con1.Open();
                    com1.ExecuteNonQuery();
                    con1.Close();
                    Session.Remove("rate");
            }
                catch
            {

            }
            Response.Redirect(Request.RawUrl);
            }
        }
    }


    protected void btn_first_Click(object sender, EventArgs e)
    {
        currentposition = 0;
        bind();
    }

    protected void btn_prev_Click(object sender, EventArgs e)
    {

        if (currentposition == 0)
        {

        }
        else
        {
            currentposition = currentposition - 1;
            bind();
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
            bind();
        }
    }

    protected void btn_last_Click(object sender, EventArgs e)
    {

        currentposition = totalrows - 1;
        bind();
    }
    private void bind()
    {
        string review = "SELECT * FROM Review WHERE Product_ID = @ProdID";
        SqlConnection connect = new SqlConnection(lines);
        SqlCommand sqlcom = new SqlCommand(review, connect);
        connect.Open();
        sqlcom.Parameters.AddWithValue("@ProdID", prodID);
        SqlDataAdapter da = new SqlDataAdapter(sqlcom);
        DataSet ds = new DataSet();
        da.Fill(ds);
        totalrows = ds.Tables[0].Rows.Count;
        DataTable dt = ds.Tables[0];
        PagedDataSource pg = new PagedDataSource();
        pg.DataSource = dt.DefaultView;
        pg.AllowPaging = true;
        pg.CurrentPageIndex = currentposition;
        pg.PageSize = 5;
        btn_first.Visible = !pg.IsFirstPage;
        btn_prev.Visible = !pg.IsFirstPage;
        btn_next.Visible = !pg.IsLastPage;
        btn_last.Visible = !pg.IsLastPage;
        //Binding pg to datalist
        DataList1.DataSource = pg;
        DataList1.DataBind();
        connect.Close();
    }
    protected void Rating1_Click(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        string rate = e.Value;
        Session["rate"] = rate;
    }

    protected void btn_wish_Click(object sender, EventArgs e)
    {
        if (mytime != "User")
        {
            Product aProd = new Product();
            Product Prod = aProd.getProduct(prodID);
            string iProductID = prod.Product_ID.ToString();
            Wishlist.Instance.AddItem(iProductID, Prod);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('You need to login first, to use wishlist function');window.location='login.aspx';</script>'");
        }
    }
}
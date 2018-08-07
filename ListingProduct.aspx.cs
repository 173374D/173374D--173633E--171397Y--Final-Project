using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class ProductView : System.Web.UI.Page
{

    Product aProd = new Product();
    static int currentposition = 0;
    static int totalrows = 0;
    string mytime = null;
    string mylang = null;
    string lines = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
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
        else
        {
            Session["Count"] = "3";
            Response.Redirect("Index.aspx");
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
    protected void bind()
    {
        try
        {
            string Product = "SELECT * FROM Products";
            SqlConnection connect = new SqlConnection(lines);
            SqlCommand sqlcom = new SqlCommand(Product, connect);
            connect.Open();
            SqlDataAdapter da = new SqlDataAdapter(sqlcom);
            DataSet ds = new DataSet();
            da.Fill(ds);
            totalrows = ds.Tables[0].Rows.Count;
            DataTable dt = ds.Tables[0];
            PagedDataSource pg = new PagedDataSource();
            pg.DataSource = dt.DefaultView;
            pg.AllowPaging = true;
            pg.CurrentPageIndex = currentposition;
            pg.PageSize = 10;
            btn_prev.Visible = !pg.IsFirstPage;
            btn_next.Visible = !pg.IsLastPage;
            //Binding pg to Gridview
            gvProduct.DataSource = pg;
            gvProduct.DataBind();
            connect.Close();
        }
        catch
        {
            Response.Redirect(Request.RawUrl);
        }

    }

    protected void gvProduct_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Get the currently selected row.
        GridViewRow row = gvProduct.SelectedRow;

        // Get Product ID from the selected row, which is the 
        // first row, i.e. index 0.
        string prodID = row.Cells[0].Text;

        // Redirect to next page, with the Product Id added to the URL,
        // e.g. ProductDetails.aspx?ProdID=1
        Response.Redirect("ProductDetails.aspx?ProdID=" + prodID);

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void btn_AddProduct_Click(object sender, EventArgs e)
    {
        Response.Redirect("ProductInsert.aspx");
    }

    //protected void gvProduct_RowDeleting(object sender, GridViewDeleteEventArgs e)
    //{
    //    try
    //    {
    //        int result = 0;
    //        Product prod = new Product();

    //        string categoryID = gvProduct.DataKeys[e.RowIndex].Value.ToString();
    //        result = prod.ProductDelete(categoryID);
    //        string delete = "DELETE FROM Review WHERE Product_ID = @ProdID";
    //        SqlConnection connect = new SqlConnection(lines);
    //        SqlCommand sqlcom = new SqlCommand(delete, connect);
    //        connect.Open();
    //        sqlcom.Parameters.AddWithValue("@ProdID", categoryID);
    //        sqlcom.ExecuteNonQuery();
    //        connect.Close();

    //        if (result > 0)
    //        {
    //            ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Product Remove successfully');window.location='ListingProduct.aspx';</script>'");
    //        }
    //        else
    //        {
    //            ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Product Removal NOT successfully');window.location='ListingProduct.aspx';</script>'");
    //        }
    //    }
    //    catch
    //    {
    //        ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('We have Encountered an error, please try again later.');window.location='ListingProduct.aspx';</script>'");
    //    }


    //}


    protected void gvProduct_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvProduct.EditIndex = e.NewEditIndex;
        bind();
    }

    protected void gvProduct_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvProduct.EditIndex = -1;
        bind();
    }

    protected void gvProduct_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int result = 0;
        Product prod = new Product();
        GridViewRow row = (GridViewRow)gvProduct.Rows[e.RowIndex];
        string id = gvProduct.DataKeys[e.RowIndex].Value.ToString();
        string tid = ((TextBox)row.Cells[0].Controls[0]).Text;
        string tname = ((TextBox)row.Cells[1].Controls[0]).Text;
        string tDesc = ((TextBox)row.Cells[2].Controls[0]).Text;
        string tprice = ((TextBox)row.Cells[3].Controls[0]).Text;
        string tstock = ((TextBox)row.Cells[4].Controls[0]).Text;
        string tgender = ((TextBox)row.Cells[5].Controls[0]).Text;
        string tDOR = ((TextBox)row.Cells[6].Controls[0]).Text;
        string tBrand = ((TextBox)row.Cells[7].Controls[0]).Text;
        result = prod.ProductUpdate(tid, tname, tDesc, decimal.Parse(tprice), int.Parse(tstock), tgender, tDOR, tBrand);
        if (result > 0)
        {
            Response.Write("<script>alert('Product updated successfully');</script>");
        }
        else
        {
            Response.Write("<script>alert('Product NOT updated');</script>");
        }
        gvProduct.EditIndex = -1;
        bind();

        }
        catch
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('We have Encountered an error, please try again later.');window.location='ListingProduct.aspx';</script>'");
        }

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


    protected void gvProduct_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "black")
        {
            string Status = e.CommandArgument.ToString();
            string check1 = "select count(*) from [Products] where Product_ID='"+Status.ToString()+ "' and Status='" + "Enable" + "'";
            SqlConnection con1 = new SqlConnection(lines);
            SqlCommand com1 = new SqlCommand(check1, con1);
            con1.Open();
            int Temp = Convert.ToInt32(com1.ExecuteScalar().ToString());
            con1.Close();
            if (Temp == 1)
            {
                string queryStr = "UPDATE Products SET" + " Status = '" + "Disabled" + "' where Product_ID = '" + Status.ToString() + "' ";
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
                bind();
            }
            else
            {
                string queryStr = "UPDATE Products SET" + " Status = '" + "Enable" + "' where Product_ID = '" + Status.ToString() + "' ";
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
                bind();
            }

        }
    }
}


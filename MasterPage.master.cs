using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;



public partial class MasterPage : System.Web.UI.MasterPage
{
    bool one, two,three,four;
    string lines = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue == "en-US")
        {
            Page.UICulture = "en-US";
            Page.Culture = "en-US";
        }
        else if (DropDownList1.SelectedValue == "zh-CN")
        {
            Page.UICulture = "zh-CN";
            Page.Culture = "zh-CN";
        }
        PlaceHolder1.Visible = one;
        PlaceHolder2.Visible = two;
        PlaceHolder3.Visible = three;
        PlaceHolder4.Visible = four;

    }

   
    public bool one1
    {
        get { return this.one; }
        set { one = value; }
    }
    public bool two2
    {
        get { return this.two; }
        set { two = value; }
    }
    public bool three3
    {
        get { return this.three; }
        set { three = value; }
    }
    public bool four4
    {
        get { return this.four; }
        set { four = value; }
    }
    protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
    public DropDownList onetime
    {
        get { return this.DropDownList1; }
        set { DropDownList1 = value; }
    }
    public Label Navi
    {
        get { return this.lbl_Navi; }
    }
    public Label News
    {
        get { return this.lbl_News; }
    }
    public Label Category
    {
        get { return this.lbl_Category; }
    }
    public Label Popular
    {
        get { return this.lbl_Popular; }
    }
    public Label Account
    {
        get { return this.lbl_Account; }
    }
    public Label Order
    {
        get { return this.lbl_Order; }
    }
    public Label Vendor
    {
        get { return this.lbl_Vendor; }
    }
    public Label Wishlist
    {
        get { return this.lbl_Wishlist; }
    }
    public Label Front
    {
        get { return this.lbl_Front; }
    }
    public Button Subscribe
    {
        get { return this.btn_Subscribe; }
    }
    public TextBox NewsData
    {
        get { return this.txt_Subscribe; }
    }
    public Label Description
    {
        get { return this.lbl_Subscribe; }
    }
    public Label Brand
    {
        get { return this.lbl_Brand; }
    }
    public Label MenuAccount
    {
        get { return this.lbl_Menu_Account; }
    }
    public Label MenuWishlist
    {
        get { return this.lbl_Menu_Wishlist; }
    }
    public Label MenuCart
    {
        get { return this.lbl_Menu_Cart; }
    }
    public Label MenuCheckout
    {
        get { return this.lbl_Menu_Checkout; }
    }
    public Label MenuLogin
    {
        get { return this.lbl_Menu_Login; }
    }
    public Label MenuRegister
    {
        get { return this.lbl_Menu_Register; }
    }

    public Label Home
    {
        get { return this.lbl_Home; }
    }
    public Label Shop
    {
        get { return this.lbl_Shop; }
    }
    public Label Cart
    {
        get { return this.lbl_Cart; }
    }
    public Label Extra
    {
        get { return this.lbl_Extra; }
    }
    public Label Others
    {
        get { return this.lbl_Others; }
    }
    public Label Contact
    {
        get { return this.lbl_Contact; }
    }
    public Label Add
    {
        get { return this.lbl_Add; }
    }
    public Label Edit
    {
        get { return this.lbl_Edit; }
    }
    public LinkButton Logout
    {
        get { return this.btn_Logout; }
        set { btn_Logout = value; }
    }
    public Label Product
    {
        get { return this.lbl_Product; }
        set { lbl_Product = value; }
    }
    public Label Manage
    {
        get { return this.lbl_Manage; }
        set { lbl_Manage = value; }
    }
    public Label AdminContactUs
    {
        get { return this.lbl_AdminContactUs; }
        set { lbl_AdminContactUs = value; }
    }
    public Label AdminFeedback
    {
        get { return this.lbl_AdminFeedback; }
        set { lbl_AdminFeedback = value; }
    }
    protected void btn_Subscribe_Click(object sender, EventArgs e)
    {
        string check = "select count(*) from [Subscribe] where Email=@Username ";
        SqlConnection con = new SqlConnection(lines);
        SqlCommand com = new SqlCommand(check, con);
        con.Open();
        com.Parameters.AddWithValue("@Username", txt_Subscribe.Text);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        con.Close();

        if (temp != 1)
        {
            string ins2 = "Insert into [Subscribe](Email, Subscribed) values('" + txt_Subscribe.Text + "', '" + "Yes" + "')";
            SqlCommand com2 = new SqlCommand(ins2, con);
            con.Open();
            com2.ExecuteNonQuery();
            con.Close();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thank you for subscribing, You will now receive email from us.')", true);
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You have already subscribed!')", true);
        }
    }

    protected void btn_Logout_Click(object sender, EventArgs e)
    {
        Session["Email"] = "User";
        Response.Redirect(Request.RawUrl);
    }
}

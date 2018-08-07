using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ShippingDetails
/// </summary>
public class ShippingDetails
{

    //Private Variable Declaration

    private int shippingcountry, shippingpostcode;

    private string shippingfirstname, shippinglastname, shippingcompany, shippingaddress1,
                   shippingaddress2, shippingcity, shippingstate;


    public ShippingDetails()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    //-------------------------------------------------------------



    public ShippingDetails(int shippingcountry, string shippingfirstname, string shippinglastname,
                       string shippingcompany, string shippingaddress1, string shippingaddress2,
                       string shippingcity, string shippingstate, int shippingpostcode)
    {
        ShippingCountry = shippingcountry;
        ShippingFirstName = shippingfirstname;
        ShippingLastName = shippinglastname;
        ShippingCompany = shippingcompany;
        ShippingAddress1 = shippingaddress1;
        ShippingAddress2 = shippingaddress2;
        ShippingCity = shippingcity;
        ShippingState = shippingstate;
        ShippingPostcode = shippingpostcode;
    }


    //-------------------------------------------------------------



    //Integer Getter and Setter
    public int ShippingCountry
    {
        get { return shippingcountry; }
        set { shippingcountry = value; }
    }

    public int ShippingPostcode
    {
        get { return shippingpostcode; }
        set { shippingpostcode = value; }
    }


    //-------------------------------------------------------------


    //String Getter and Setter
    public string ShippingFirstName
    {
        get { return shippingfirstname; }
        set { shippingfirstname = value; }
    }

    public string ShippingLastName
    {
        get { return shippinglastname; }
        set { shippinglastname = value; }
    }
    public string ShippingCompany
    {
        get { return shippingcompany; }
        set { shippingcompany = value; }
    }
    public string ShippingAddress1
    {
        get { return shippingaddress1; }
        set { shippingaddress1 = value; }
    }
    public string ShippingAddress2
    {
        get { return shippingaddress2; }
        set { shippingaddress2 = value; }
    }
    public string ShippingCity
    {
        get { return shippingcity; }
        set { shippingcity = value; }
    }
    public string ShippingState
    {
        get { return shippingstate; }
        set { shippingstate = value; }
    }
    
}
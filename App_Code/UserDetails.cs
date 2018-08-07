using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserDetails
/// </summary>
public class UserDetails
{

    //Private Variable Declaration

    private int usercountry, userpostcode, userphone;

    private string userfirstname, userlastname, usercompany, useraddress1,
                   useraddress2, usercity, userstate, useremail;



//-------------------------------------------------------------



    public UserDetails()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public UserDetails(int usercountry, string userfirstname, string userlastname, 
                       string usercompany, string useraddress1, string useraddress2, 
                       string usercity, string userstate, int userpostcode, string useremail, 
                       int userphone)
    {
        UserCountry = usercountry;
        UserFirstName = userfirstname;
        UserLastName = userlastname;
        UserCompany = usercompany;
        UserAddress1 = useraddress1;
        UserAddress2 = useraddress2;
        UserCity = usercity;
        UserState = userstate;
        UserPostcode = userpostcode;
        UserEmail = useremail;
        UserPhone = userphone;
    }


//-------------------------------------------------------------



    //Integer Getter and Setter
    public int UserCountry
    {
        get { return usercountry; }
        set { usercountry = value; }
    }

    public int UserPostcode
    {
        get { return userpostcode; }
        set { userpostcode = value; }
    }

    public int UserPhone
    {
        get { return userphone; }
        set { userphone = value; }
    }


//-------------------------------------------------------------


    //String Getter and Setter
    public string UserFirstName
    {
        get { return userfirstname; }
        set { userfirstname = value; }
    }

    public string UserLastName
    {
        get { return userlastname; }
        set { userlastname = value; }
    }
    public string UserCompany
    {
        get { return usercompany; }
        set { usercompany = value; }
    }
    public string UserAddress1
    {
        get { return useraddress1; }
        set { useraddress1 = value; }
    }
    public string UserAddress2
    {
        get { return useraddress2; }
        set { useraddress2 = value; }
    }
    public string UserCity
    {
        get { return usercity; }
        set { usercity = value; }
    }
    public string UserState
    {
        get { return userstate; }
        set { userstate = value; }
    }
    public string UserEmail
    {
        get { return useremail; }
        set { useremail = value; }
    }

}
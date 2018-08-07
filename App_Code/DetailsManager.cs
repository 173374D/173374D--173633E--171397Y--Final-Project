using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DetailsManager
/// </summary>
public class DetailsManager
{
    private static DetailsManager instance = null;
    private List<UserDetails> details = new List<UserDetails>();
    public DetailsManager()
    {
    }

    public static DetailsManager GetInstance()
    {
        if(instance == null)
        {
            instance = new DetailsManager();
        }
        return instance;
    }

    public void AddDetails(UserDetails dt)
    {
        details.Add(dt);
    }

    public List<UserDetails> GetDetails()
    {
        return details;
    }
}
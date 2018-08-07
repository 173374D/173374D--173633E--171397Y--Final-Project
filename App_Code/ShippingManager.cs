using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ShippingManager
/// </summary>
public class ShippingManager
{
    private static ShippingManager instance = null;
    private List<ShippingDetails> shippings = new List<ShippingDetails>();
    public ShippingManager()
    {
    }

    public static ShippingManager GetInstance()
    {
        if(instance == null)
        {
            instance = new ShippingManager();
        }
        return instance;
    }

    public void AddShipping(ShippingDetails sh)
    {
        shippings.Add(sh);
    }

    public List<ShippingDetails> GetShippings()
    {
        return shippings;
    } 
}
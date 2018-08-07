using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


    public class temp
    {
        public List<tempItem> Items { get; private set; }

        //public static readonly temp Instance;
        public static temp Instance;

    // A Static Default temp Constructor. Meaning developers need not use the New keyword.
    static temp()
    {
        if (HttpContext.Current.Session["CSharptemp"] == null)
        {
            Instance = new temp();
            Instance.Items = new List<tempItem>();
            HttpContext.Current.Session["CSharptemp"] = Instance;
        }
        else
        {
            Instance = (temp)HttpContext.Current.Session["CSharptemp"];
        }
    }

    // A Default temp Constructor. 
    protected temp() { }

    // Find a tempItem inside the temp Instance by providing a Product ID
    public tempItem getAShopptingCartItem(string ProductID) {

        //tempItem newItem = new tempItem(ProductID, prod);

        if (!Items.Equals(null))
        {
            foreach (tempItem item in Items)
            {
                if (item.ItemID == ProductID)
                {
                    return item;
                }
            }
        }
        return null;
    }

    // Add a tempItem into the temp Instance by providing a Product ID and Product object
    public void AddItem(string ProductID,Product prod)
    {
        //tempItem newItem = new tempItem(ProductID);
        tempItem newItem = new tempItem(ProductID, prod);

        if (Items.Contains(newItem))
        {
            foreach (tempItem item in Items)
            {
                if (item.Equals(newItem))
                {
                    item.Quantity++;
                    return;
                }
            }
        }
        else
        {
            newItem.Quantity = 1;
            Items.Add(newItem);
        }
    }

    // Remove a tempItem from the temp Instance by providing a Product ID 
    public void RemoveItem(string ProductID)
    {
        Items.Remove(temp.Instance.getAShopptingCartItem(ProductID));
    }




}

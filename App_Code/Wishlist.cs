using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


    public class Wishlist
    {
        public List<WishlistItem> Items { get; private set; }

        //public static readonly Wishlist Instance;
        public static Wishlist Instance;

    // A Static Default Wishlist Constructor. Meaning developers need not use the New keyword.
    static Wishlist()
    {
        if (HttpContext.Current.Session["CSharpWishlist"] == null)
        {
            Instance = new Wishlist();
            Instance.Items = new List<WishlistItem>();
            HttpContext.Current.Session["CSharpWishlist"] = Instance;
        }
        else
        {
            Instance = (Wishlist)HttpContext.Current.Session["CSharpWishlist"];
        }
    }

    // A Default Wishlist Constructor. 
    protected Wishlist() { }

    // Find a WishlistItem inside the Wishlist Instance by providing a Product ID
    public WishlistItem getAShopptingCartItem(string ProductID) {

        //WishlistItem newItem = new WishlistItem(ProductID, prod);

        if (!Items.Equals(null))
        {
            foreach (WishlistItem item in Items)
            {
                if (item.ItemID == ProductID)
                {
                    return item;
                }
            }
        }
        return null;
    }

    // Add a WishlistItem into the Wishlist Instance by providing a Product ID and Product object
    public void AddItem(string ProductID,Product prod)
    {
        //WishlistItem newItem = new WishlistItem(ProductID);
        WishlistItem newItem = new WishlistItem(ProductID, prod);

        if (Items.Contains(newItem))
        {
            foreach (WishlistItem item in Items)
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

    // Remove a WishlistItem from the Wishlist Instance by providing a Product ID 
    public void RemoveItem(string ProductID)
    {
        Items.Remove(Wishlist.Instance.getAShopptingCartItem(ProductID));
    }




}

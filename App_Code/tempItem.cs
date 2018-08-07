using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;



    //IEquatable - type-specific to determine the equality of Instances
    public class tempItem : IEquatable <tempItem>
    {
        public int Quantity { get; set; }

        private string _ItemID;
        public string ItemID
        {
            get { return _ItemID; }
            set { _ItemID = value; }
        }

        private string _ItemName;
        public string Product_Name
        {
            get { return _ItemName; }
            set { _ItemName = value; }
        }

        private string _ItemDesc;
        public string Product_Desc
        {
            get { return _ItemDesc; }
            set { _ItemDesc = value; }

        }

        private decimal _ItemPrice;
        public decimal Product_Price
        {
            get { return _ItemPrice; }
            set { _ItemPrice = value; }
        }
    private string _ImageUrl;
    public string Product_Image
    {
        get { return _ImageUrl; }
        set { _ImageUrl = value; }
    }
    private int _Stock;
    public int Stock_Level
    {
        get { return _Stock; }
        set { _Stock = value; }
    }
    public decimal TotalPrice
        {
            get { return Product_Price * Quantity; }
        }

        public tempItem(string productID)
        {
            this.ItemID = productID;
        }

        public tempItem(string productID, Product prod)
        {
            this.ItemID = productID;
            this.Product_Name = prod.Product_Name;
            this.Product_Desc = prod.Product_Desc;
            this.Product_Price = prod.Unit_Price;
        this.Product_Image = prod.Product_Image;
        this.Stock_Level = prod.Stock_Level;


        }

        public tempItem(string productID, string productName, string productDesc, decimal productPrice,string productImage,int stock)
        {
            this.ItemID = productID;
            this.Product_Name = productName;
            this.Product_Desc = productDesc;
            this.Product_Price = productPrice;
            this.Product_Image = productImage;
              this.Stock_Level = stock;
    }

        public bool Equals(tempItem anItem)
        {
            return anItem.ItemID == this.ItemID;
        }

        //public bool Equals(tempItem product)
        //{
        //    return product.ItemID == this.ItemID;
        //}

}
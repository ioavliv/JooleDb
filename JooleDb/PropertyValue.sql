CREATE TABLE [dbo].[PropertyValue]
(
Prod_ID int FOREIGN KEY REFERENCES Product(Product_ID) NOT NULL,
Prop_ID int FOREIGN KEY REFERENCES Property(Property_ID) NOT NULL,
Value varchar(50)
PRIMARY KEY (Product_ID,Property_ID)
);

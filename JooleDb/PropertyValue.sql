CREATE TABLE [dbo].[PropertyValue]
(
Product_ID int FOREIGN KEY REFERENCES Product(Product_ID) NOT NULL,
Property_ID int FOREIGN KEY REFERENCES Property(Property_ID) NOT NULL,
Value varchar(50)
PRIMARY KEY (Product_ID,Property_ID)
);

CREATE TABLE [dbo].[Product]
(
Product_ID int NOT NULL PRIMARY KEY,
Subcategory_ID int FOREIGN KEY REFERENCES SubCategory(SubCategory_ID) NULL,
Manufacturer_ID int FOREIGN KEY REFERENCES Manufacturer(Manufacturer_ID) NULL,
Product_Name varchar(50),
Product_Image varchar(900),
Series varchar(20),
Model varchar(250)
);

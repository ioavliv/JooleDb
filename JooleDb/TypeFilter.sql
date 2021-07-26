CREATE TABLE [dbo].[TypeFilter]
(
Subcategory_ID int FOREIGN KEY REFERENCES SubCategory(SubCategory_ID) NOT NULL,
Property_ID int FOREIGN KEY REFERENCES Property(Property_ID) NULL,
Type_Name varchar(50),
Type_Option varchar(50)
);

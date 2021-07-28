CREATE TABLE [dbo].[TypeFilter]
(
SC_ID int FOREIGN KEY REFERENCES SubCategory(SubCategory_ID) NOT NULL,
Prop_ID int FOREIGN KEY REFERENCES Property(Property_ID) NOT NULL,
Type_Name varchar(50),
Type_Option varchar(50)
Primary Key (Property_ID,Subcategory_ID)
);

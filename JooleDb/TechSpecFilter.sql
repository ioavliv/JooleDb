CREATE TABLE [dbo].[TechSpecFilter]
(
Property_ID int FOREIGN KEY REFERENCES Property(Property_ID) NOT NULL,
Subcategory_ID int FOREIGN KEY REFERENCES SubCategory(SubCategory_ID) NOT NULL,
Max_Value float,
Min_Value float
Primary Key (Property_ID,Subcategory_ID)
);
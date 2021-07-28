CREATE TABLE [dbo].[SubCategory]
(
SubCategory_ID int NOT NULL PRIMARY KEY,
C_ID int FOREIGN KEY REFERENCES Category(Category_ID) NULL,
SubCategoryName varchar(30)
);

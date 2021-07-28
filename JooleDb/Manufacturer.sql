CREATE TABLE [dbo].[Manufacturer]
(
Manufacturer_ID int NOT NULL PRIMARY KEY,
U_ID int FOREIGN KEY REFERENCES User(User_ID) NULL,
Name varchar(50) NOT NULL
);

CREATE TABLE [dbo].[User]
(
User_ID int NOT NULL PRIMARY KEY,
Username varchar(50) NOT NULL,
Password varchar(50) NOT NULL,
Email varchar(50) NOT NULL,
Image varchar(250)
);
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

MERGE INTO [User] AS Target
USING (VALUES 
(1, 'Ioav', '123', 'ioav@gmail.com', ''),
(2, 'Baoling', '123', 'baoling@gmail.com', ''),
(3, 'Guoquan', '123', 'guoquan@gmail.com', ''),
(4, 'Gary', '123', 'gary@gmail.com', ''),
(5, 'Ian', '123', 'ian@gmail.com', '')
)
AS Source (User_ID, Username, Password, Email, Image)
ON Target.User_ID = Source.User_ID
WHEN NOT MATCHED BY TARGET THEN
INSERT (User_ID, Username, Password, Email, Image)
VALUES (User_ID, Username, Password, Email, Image);
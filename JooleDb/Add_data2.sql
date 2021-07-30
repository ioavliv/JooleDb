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
--add sample data to subcategory table
MERGE INTO [SubCategory] AS Target
USING (VALUES 
(4, 2, 'Power Strips'),
(5, 2, 'Power Adapters'),
(6, 3, 'Pens'),
(7, 3, 'Cards'),
(8, 4, 'Desks'),
(9, 4, 'Chairs')
)
AS Source (SubCategory_ID,Category_ID,SubCategoryName)
ON Target.SubCategory_ID = Source.SubCategory_ID
WHEN NOT MATCHED BY TARGET THEN
INSERT (SubCategory_ID,Category_ID,SubCategoryName)
VALUES (SubCategory_ID,Category_ID,SubCategoryName);
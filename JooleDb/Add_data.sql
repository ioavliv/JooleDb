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
--add sample data to category table
MERGE INTO [Category] AS Target
USING (VALUES 
(1, 'Mechanical'),
(2, 'Electrical'),
(3, 'Stationary'),
(4, 'Furniture')
)
AS Source (Category_ID,Category_Name)
ON Target.Category_ID = Source.Category_ID
WHEN NOT MATCHED BY TARGET THEN
INSERT (Category_ID,Category_Name)
VALUES (Category_ID,Category_Name);



--add sample data to subcategory table
MERGE INTO [SubCategory] AS Target
USING (VALUES 
(1,1, 'Fans'),
(2,1, 'Vaccums'),
(3,1, 'Toasters')
)
AS Source (SubCategory_ID,Category_ID,SubCategoryName)
ON Target.SubCategory_ID = Source.SubCategory_ID
WHEN NOT MATCHED BY TARGET THEN
INSERT (SubCategory_ID,Category_ID,SubCategoryName)
VALUES (SubCategory_ID,Category_ID,SubCategoryName);

--add sample data to Manufacturer Table
MERGE INTO [Manufacturer] AS Target
USING (VALUES 
(1,Null, 'Big Ass'),
(2,Null, 'Emerson'),
(3,Null, 'Minka')
)
AS Source (Manufacturer_ID,User_ID ,Name)
ON Target.Manufacturer_ID = Source.Manufacturer_ID
WHEN NOT MATCHED BY TARGET THEN
INSERT (Manufacturer_ID,User_ID ,Name)
VALUES (Manufacturer_ID,User_ID ,Name);

--add sample data to Product Table
MERGE INTO [Product] AS Target
USING (VALUES 
(1,1, 1,'Fan 1','','Haiku H','S3150-S0-BC-04-01-C-01'),
(2,1, 2,'Fan 2','','Luray Eco','CF860'),
(3,1, 3,'Fan 3','','Aviation','F853-RW')
)
AS Source (Product_ID,Subcategory_ID ,Manufacturer_ID,Product_Name,Product_Image, Series,Model)
ON Target.Product_ID = Source.Product_ID
WHEN NOT MATCHED BY TARGET THEN
INSERT (Product_ID,Subcategory_ID ,Manufacturer_ID,Product_Name,Product_Image, Series,Model)
VALUES (Product_ID,Subcategory_ID ,Manufacturer_ID,Product_Name,Product_Image, Series,Model);

--add sample data to Property Table
MERGE INTO [Property] AS Target
USING (VALUES 
(1,'Use Type', 1,0),
(2,'Application', 1,0),
(3,'Mounting Location', 1,0),
(4,'Accessories', 1,0),
(5,'Model Year', 1,0),
(6,'Air Flow', 0,1),
(7,'Power_Min', 0,1),
(8,'Power_Max', 0,1),
(9,'Operating Voltage_Min', 0,1),
(10,'Operating Voltage_Max', 0,1),
(11,'Fan speed_Min', 0,1),
(12,'Fan speed_Max', 0,1),
(13,'Number of fan speeds', 0,1),
(14,'Sound at max speed', 0,1),
(15,'Fan sweep diameter', 0,1),
(16,'Height_Min', 0,1),
(17,'Height_Max', 0,1),
(18,'Weight', 0,1)
)
AS Source (Property_ID,Property_Name ,IsType,IsTechSpec)
ON Target.Property_ID = Source.Property_ID
WHEN NOT MATCHED BY TARGET THEN
INSERT (Property_ID,Property_Name ,IsType,IsTechSpec)
VALUES (Property_ID,Property_Name ,IsType,IsTechSpec);

--add sample data to TypeFilter Table
MERGE INTO [TypeFilter] AS Target
USING (VALUES 
(1,5, 'Model Year','')
)
AS Source (Subcategory_ID,Property_ID ,Type_Name,Type_Option)
ON Target.Subcategory_ID = Source.Subcategory_ID and Target.Property_ID = Source.Property_ID
WHEN NOT MATCHED BY TARGET THEN
INSERT (Subcategory_ID,Property_ID ,Type_Name,Type_Option)
VALUES (Subcategory_ID,Property_ID ,Type_Name,Type_Option);

--add sample data to TechSpecFilter Table
MERGE INTO [TechSpecFilter] AS Target
USING (VALUES 
(6,1,0,1000),
(8,1,0,100),
(14,1,0,100),
(15,1,0,100)
)
AS Source (Property_ID,Subcategory_ID ,Max_Value,Min_Value)
ON Target.Property_ID = Source.Property_ID and Target.Subcategory_ID = Source.Subcategory_ID
WHEN NOT MATCHED BY TARGET THEN
INSERT (Property_ID,Subcategory_ID ,Max_Value,Min_Value)
VALUES (Property_ID,Subcategory_ID ,Max_Value,Min_Value);

--add sample data to PropertyValue Table
MERGE INTO [PropertyValue] AS Target
USING (VALUES 
(1,1,'Commercial'),
(1,2,'Indoor'),
(1,3,'Roof'),
(1,4,'With Light'),
(1,5,'2016'),
(1,6,'5467'),
(1,7,'1.95'),
(1,8,'21.14'),
(1,9,'100'),
(1,10,'240'),
(1,11,'35'),
(1,12,'200'),
(1,13,'7'),
(1,14,'35'),
(1,15,'60'),
(1,16,'12.3'),
(1,17,'57'),
(1,18,'13'),

(2,1,'Commercial'),
(2,2,'Indoor'),
(2,3,'Roof'),
(2,4,'With Light'),
(2,5,'2014'),
(2,6,'5467'),
(2,7,'1.95'),
(2,8,'21.14'),
(2,9,'100'),
(2,10,'240'),
(2,11,'35'),
(2,12,'200'),
(2,13,'7'),
(2,14,'35'),
(2,15,'60'),
(2,16,'12.3'),
(2,17,'57'),
(2,18,'13'),

(3,1,'Commercial'),
(3,2,'Indoor'),
(3,3,'Roof'),
(3,4,'With Light'),
(3,5,'2015'),
(3,6,'5467'),
(3,7,'1.95'),
(3,8,'21.14'),
(3,9,'100'),
(3,10,'240'),
(3,11,'35'),
(3,12,'200'),
(3,13,'7'),
(3,14,'35'),
(3,15,'60'),
(3,16,'12.3'),
(3,17,'57'),
(3,18,'13')
)
AS Source (Product_ID,Property_ID ,Value)
ON Target.Product_ID = Source.Product_ID and Target.Property_ID = Source.Property_ID
WHEN NOT MATCHED BY TARGET THEN
INSERT (Product_ID,Property_ID ,Value)
VALUES (Product_ID,Property_ID ,Value);
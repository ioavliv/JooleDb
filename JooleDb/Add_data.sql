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
(1,1, 1,'Fan 1','https://www.coolguys.ae/cache/bc562963020c3bd9fdf8c7b0e1fafb6f474c7fa1_0x0_fob_wm.jpg','Haiku H','S3150-S0-BC-04-01-C-01'),
(2,1, 2,'Fan 2','https://images-na.ssl-images-amazon.com/images/I/51WIJpOPRLL._SL500_AC_SS350_.jpg','Luray Eco','CF860'),
(3,1, 3,'Fan 3','https://www.home-dzine.co.za/2019/jun/242.jpg','Aviation','F853-RW'),
(4,1, 1,'Fan 4','https://images-na.ssl-images-amazon.com/images/I/41pJjzq6CbL._AC_.SS50.jpg','Haiku H','S9980-S0-CA-05-02-d-02'),
(5,1, 2,'Fan 5','https://warisanlighting.com/wp-content/uploads/parser/funky-ceiling-fans-9.jpg','Luray Eco','KJ268'),
(6,1, 3,'Fan 6','https://sep.yimg.com/ay/lookintheattic/minka-aire-mai-f820-ct-cattera-bronze-santa-lucia-60-5-blade-ceiling-fan-1.gif','Aviation','F985-DI'),
(7,1, 3,'Fan 7','https://cdn.manomano.com/minisun-chrome-wood-30-76cm-modern-6-blade-ceiling-fan-with-flush-light-P-4217627-8748082_1.jpg','Aviation','H478-SO'),
(8,2, 3,'Vaccum','https://cdn.manomano.com/minisun-chrome-wood-30-76cm-modern-6-blade-ceiling-fan-with-flush-light-P-4217627-8748082_1.jpg','Dyson','Roller')
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
(2,6,'6329'),
(2,7,'1.95'),
(2,8,'21.46'),
(2,9,'100'),
(2,10,'240'),
(2,11,'35'),
(2,12,'200'),
(2,13,'7'),
(2,14,'54'),
(2,15,'78'),
(2,16,'12.3'),
(2,17,'57'),
(2,18,'13'),

(3,1,'Commercial'),
(3,2,'Indoor'),
(3,3,'Roof'),
(3,4,'With Light'),
(3,5,'2015'),
(3,6,'2347'),
(3,7,'1.95'),
(3,8,'14.24'),
(3,9,'100'),
(3,10,'240'),
(3,11,'35'),
(3,12,'200'),
(3,13,'7'),
(3,14,'36'),
(3,15,'50'),
(3,16,'12.3'),
(3,17,'57'),
(3,18,'13'),

(4,1,'Commercial'),
(4,2,'Indoor'),
(4,3,'Roof'),
(4,4,'With Light'),
(4,5,'2014'),
(4,6,'7345'),
(4,7,'1.95'),
(4,8,'25.04'),
(4,9,'100'),
(4,10,'240'),
(4,11,'35'),
(4,12,'200'),
(4,13,'7'),
(4,14,'45'),
(4,15,'58'),
(4,16,'12.3'),
(4,17,'57'),
(4,18,'13'),

(5,1,'Commercial'),
(5,2,'Indoor'),
(5,3,'Roof'),
(5,4,'With Light'),
(5,5,'2014'),
(5,6,'6329'),
(5,7,'1.95'),
(5,8,'21.14'),
(5,9,'100'),
(5,10,'240'),
(5,11,'35'),
(5,12,'200'),
(5,13,'7'),
(5,14,'35'),
(5,15,'60'),
(5,16,'12.3'),
(5,17,'57'),
(5,18,'13'),

(6,1,'Commercial'),
(6,2,'Indoor'),
(6,3,'Roof'),
(6,4,'With Light'),
(6,5,'2014'),
(6,6,'6329'),
(6,7,'1.95'),
(6,8,'21.14'),
(6,9,'100'),
(6,10,'240'),
(6,11,'35'),
(6,12,'200'),
(6,13,'7'),
(6,14,'35'),
(6,15,'60'),
(6,16,'12.3'),
(6,17,'57'),
(6,18,'13'),

(7,1,'Commercial'),
(7,2,'Indoor'),
(7,3,'Roof'),
(7,4,'With Light'),
(7,5,'2014'),
(7,6,'6329'),
(7,7,'1.95'),
(7,8,'21.14'),
(7,9,'100'),
(7,10,'240'),
(7,11,'35'),
(7,12,'200'),
(7,13,'7'),
(7,14,'35'),
(7,15,'60'),
(7,16,'12.3'),
(7,17,'57'),
(7,18,'13')
)
AS Source (Product_ID,Property_ID ,Value)
ON Target.Product_ID = Source.Product_ID and Target.Property_ID = Source.Property_ID
WHEN NOT MATCHED BY TARGET THEN
INSERT (Product_ID,Property_ID ,Value)
VALUES (Product_ID,Property_ID ,Value);

/* 1. Return all category names with their descriptions from the Categories Table */

Select CategoryName, Description
From Categories

/* 2. Return the Contact Name, Customer Id, and Company Name of all Customers in London. */

Select ContactName, CustomerID, CompanyName
From Customers
Where City = 'London'

/* 3. Return all available columns in the Suppliers table for the marketing managers and sales representatives that have a Fax number. */

Select Fax
From Suppliers
Where Fax is not null and ContactTitle in ('Marketing Manager', 'Sales Representative')

/* 4. Return a list of customer id's from the orders table with required dates between Jan 1, 1997 and Jan 1 , 1998 and with freight under 100 units */

Select CustomerId
From Orders
Where RequiredDate Between 'Jan 1, 1997' and 'Jan 1, 1998' and freight < 100 

/* 5. Return a list of Company Names and Contact Names of all the owners from the Customer table from Mexico, Sweden and Germany */

Select CompanyName, ContactName
From Customers 
Where Country in ('Mexico', 'Sweden', 'Germany')

/* 6. Return a count of the number of discontinued products in the Products table. */

Select Count (*)
  From Products
  Where Discontinued = 1

/* 7. Return a list of category names and descriptions of all categories beginning of 'Co' from the Categories table */

Select CategoryName, Description
 From Categories 
 Where CategoryName like 'Co%'

 /* 8. Return all the Company names, city, country, and postal code from the suppliers table with the word 'rue' in there address. The list should be ordered alphabetically by company name.*/

 Select CompanyName, City, Country, PostalCode 
  From Suppliers 
  Where Address like 'rue'
  Order by CompanyName ASC

 /* 9. Return the Product ID and total quantities ordered for each product id in the Order Details table */

 Select ProductID, Quantity
  From [Order Details]

 /* 10. Return the customer name and customer address of all customers with orders that shipped using Speedy express */

 Select ContactName, Address
  From  Customers, Orders
  Where Orders. Shipvia = 1

/* 11. Return a list of suppliers that have regions. The list should contain company name, contact name, contact title, and region */

Select CompanyName, ContactName, ContactTitle, Region
  From Suppliers

/* 12. Return all product names from the Product table that are condiments */

Select ProductName
  From Products, Categories
  Where CategoryName = 'Condiments'

/* 13. Return a list of customer names who have no orders in the Order table */

 Select ContactName
  From Orders, Customers
  Where ShippedDate = null

/* 14. Add a shipper named 'Amazon' to the shippers table using SQL */

Insert Into Shippers (Companyname)
Values('Amazon')

/* 15. Change the Company name from 'Amazon' to 'Amazon Prime Shipping' in the Shippers table using SQL */

Update Shippers 
  Set CompanyName = 'Amazon Prime Shipping'
  Where CompanyName = ('Amazon')

/* 16. Return a complete list of company names from the Shippers table. Include freight totals rounded to the nearest whole number for each shipper from the Orders table for those shippers with orders */

SELECT s.CompanyName, ROUND (SUM(o.Freight),0) AS 'Total Freight'
From Shippers s, Orders o
Where s.ShipperID = o.Shipvia
Group By s.CompanyName

/* 17. Return all employee first and last names from the employees table by combining the two columns aliased as 'DisplayName' The Combined format should be 'Last name, first name' */

Select Concat(LastName,+', '+ FirstName) AS 'DisplayName' From Employees

/* 18. Add yourself to the Customers table with an order for 'Grandma's Boysenberry Spread' */

 INSERT INTO [dbo].[Customers] ([CustomerID],[ContactName],[CompanyName])
  VALUES ( '2345', 'Kevin', 'KevinINC');
 
  INSERT INTO [dbo].[Orders] ([CustomerID])
  VALUES (@@IDENTITY)

  DECLARE @ProductID int
  SELECT @ProductID = ProductID
  from products
  Where ProductName = 'Grandma''s Boysenberry Spread'

  INSERT INTO [dbo].[Order Details] ([OrderID], [ProductID])
  VALUES (@@IDENTITY,@ProductID)

/* 19. Remove yourself and your order from the database  */

DELETE FROM Customers where CustomerID= '2345'
Select [CustomerID],[CompanyName],[ContactName] from Customers where CustomerID='2345'

/* 20. Return a list of products from the products table along with the total units in stock for each product. Include only products with TotalUnits greater than 100. */

Select ProductName, UnitsInStock, SUM(UnitPrice) AS TotalUnits 
from Products where TotalUnits>100


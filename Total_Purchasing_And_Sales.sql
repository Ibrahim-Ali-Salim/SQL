-- The total Purchasing and Sales of AdventureWorks2019 DataBase
SELECT distinct A.[ProductID]
      ,A.[Name]
      ,A.[ProductNumber]
      ,A.[MakeFlag]
      ,A.[FinishedGoodsFlag]
      ,A.[Color]
      ,A.[SafetyStockLevel]
      ,A.[ReorderPoint]
      ,A.[StandardCost]
      ,A.[ListPrice]
      ,TotalSales = SUM(CASE WHEN A.ProductID = B.ProductID THEN (B.OrderQty*B.UnitPrice)-B.UnitPriceDiscount ELSE 0 END ) OVER(PARTITION BY A.ProductID)
      ,TotalSales = SUM(CASE WHEN A.ProductID = C.ProductID THEN C.OrderQty*C.UnitPrice ELSE 0 END) OVER(PARTITION BY A.ProductID)

  FROM [AdventureWorks2019].[Production].[Product] as A
	FULL JOIN AdventureWorks2019.Sales.SalesOrderDetail B
		ON A.ProductID = B.ProductID
	FULL JOIN  AdventureWorks2019.Purchasing.PurchaseOrderDetail C 
		ON A.ProductID = C.ProductID

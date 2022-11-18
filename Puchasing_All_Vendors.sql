-- Total Puchasing of all the vendors
SELECT distinct A.[BusinessEntityID]
      ,A.[Name]
	  ,TotalPurchasing = SUM(CASE WHEN A.BusinessEntityID = B.VendorID THEN B.SubTotal+B.TaxAmt+B.Freight ELSE 0 END) OVER(PARTITION BY A.BusinessEntityID)

  FROM [AdventureWorks2019].[Purchasing].[Vendor] as A
	FULL JOIN AdventureWorks2019.Purchasing.PurchaseOrderHeader B
		ON A.BusinessEntityID = B.VendorID
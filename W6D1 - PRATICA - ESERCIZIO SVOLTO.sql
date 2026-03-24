SELECT ProductKey,ProductAlternateKey,EnglishProductName,Color,StandardCost,FinishedGoodsFlag 
FROM dimproduct
WHERE FinishedGoodsFlag=1;

SELECT ProductKey,ProductAlternateKey,EnglishProductName,StandardCost,ListPrice 
FROM dimproduct
WHERE ProductAlternateKey LIKE 'FR%'
OR ProductAlternateKey LIKE 'BK%';

SELECT ProductKey,ProductAlternateKey,EnglishProductName,(ListPrice-StandardCost) AS MARKUP
FROM dimproduct
WHERE ProductAlternateKey LIKE 'FR%'
OR ProductAlternateKey LIKE 'BK%';

SELECT ProductKey,ProductAlternateKey,EnglishProductName,ListPrice,StandardCost
FROM dimproduct
WHERE FinishedGoodsFlag=1
AND ListPrice BETWEEN 1000 AND 2000;

SELECT EmployeeKey,FirstName,LastName,Title,SalespersonFlag
FROM DimEmployee
WHERE SalespersonFlag = 1;

SELECT ProductKey,ORDERDATE,SalesAmount,TotalProductCost, (SalesAmount - TotalProductCost) AS PROFIT
FROM factresellersales
WHERE ORDERDATE>= '2020-01-01'
AND ProductKey IN(597,598,477,214);





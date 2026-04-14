-- TASK 4
-- ESERCIZIO 1
SELECT CategoryID, COUNT(*) AS DUPLICATES
FROM Category
GROUP BY CategoryID
HAVING COUNT(*) > 1;

SELECT ProductID, COUNT(*) AS DUPLICATES
FROM Product
GROUP BY ProductID
HAVING COUNT(*) > 1;

SELECT RegionID, COUNT(*) AS DUPLICATES
FROM SalesRegion
GROUP BY RegionID
HAVING COUNT(*) > 1;

SELECT SalesID, COUNT(*) AS DUPLICATES
FROM Sales
GROUP BY SalesID
HAVING COUNT(*) > 1;
-- ESERCIZIO 2
SELECT 
    s.SalesID AS CodiceDocumento,
    s.SalesDate,
    p.ProductName,
    c.CategoryName,
    co.CountryName,
    r.RegionName,
    (DATEDIFF(CURDATE(), s.SalesDate) > 180) AS OlderThan180Days
FROM Sales s
JOIN Product p ON s.ProductID = p.ProductID
JOIN Category c ON p.CategoryID = c.CategoryID
JOIN Country co ON s.CountryID = co.CountryID
JOIN SalesRegion r ON co.RegionID = r.RegionID;
-- ESERCIZIO 3
SELECT 
    ProductID,
    SUM(Quantity) AS TotalQty
FROM Sales
GROUP BY ProductID
HAVING SUM(Quantity) > (
    SELECT AVG(Quantity)
    FROM Sales
    WHERE YEAR(SalesDate) = 2025
);
-- ESERCIZIO 4
SELECT 
    p.ProductID,
    YEAR(s.SalesDate) AS Anno,
    SUM(s.Amount) AS FatturatoTotale
FROM Sales s
JOIN Product p ON s.ProductID = p.ProductID
GROUP BY p.ProductID, YEAR(s.SalesDate)
ORDER BY p.ProductID, Anno;
-- ESERCIZIO 5
SELECT 
    co.CountryName,
    YEAR(s.SalesDate) AS Anno,
    SUM(s.Amount) AS FatturatoTotale
FROM Sales S
JOIN Country co ON s.CountryID = co.CountryID
GROUP BY co.CountryName, YEAR(s.SalesDate)
ORDER BY Anno, FatturatoTotale DESC;
-- ESERCIZIO 6
SELECT p.ProductID, p.ProductName
from product as p 
LEFT JOIN sales as s 
ON p.ProductID=s.ProductID
WHERE s.ProductID IS NULL;
-- ESERCIZIO 7
SELECT
    p.ProductID,
    p.ProductName
FROM product as p
WHERE NOT EXISTS 
(SELECT 1
FROM sales as s
WHERE s.ProductID = p.ProductID);
-- ESERCIZIO 8
CREATE VIEW VPRODUCT_INFO AS
SELECT p.ProductID, p.ProductName, c.CategoryName
FROM product as p
JOIN category as c
ON p.CategoryID = c.CategoryID;
-- ESERCIZIO 9
CREATE VIEW VGEO_INFO AS
SELECT co.CountryID, co.CountryName, r.RegionName
FROM country as co
JOIN region as r
ON co.RegionID = r.RegionID;
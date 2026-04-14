CREATE SCHEMA TOYSGROUP;

CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    CategoryID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE SalesRegion (
    RegionID INT PRIMARY KEY,
    RegionName VARCHAR(100) NOT NULL
);

CREATE TABLE Country (
    CountryID INT PRIMARY KEY,
    CountryName VARCHAR(100) NOT NULL,
    RegionID INT NOT NULL,
    FOREIGN KEY (RegionID) REFERENCES SalesRegion(RegionID)
);

CREATE TABLE Sales (
    SalesID INT PRIMARY KEY,
    ProductID INT NOT NULL,
    CountryID INT NOT NULL,
    SalesDate DATE NOT NULL,
    Quantity INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (CountryID) REFERENCES Country(CountryID)
);

INSERT INTO Category VALUES
(1, 'Bikes'),
(2, 'Clothing');
INSERT INTO Product VALUES
(1, 'Bikes-100', 1),
(2, 'Bikes-200', 1),
(3, 'Bike Gloves M', 2),
(4, 'Bike Gloves L', 2);
INSERT INTO SalesRegion VALUES
(1, 'WestEurope'),
(2, 'SouthEurope');
INSERT INTO Country VALUES
(1, 'France', 1),
(2, 'Germany', 1),
(3, 'Italy', 2),
(4, 'Greece', 2);
INSERT INTO Sales VALUES
(1, 1, 1, '2025-01-10', 2, 500.00),
(2, 2, 2, '2025-01-12', 1, 300.00),
(3, 3, 3, '2025-02-05', 5, 150.00),
(4, 4, 4, '2025-02-10', 3, 90.00);CategoryID
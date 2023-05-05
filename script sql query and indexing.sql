-- Script SQL berdasarkan modul SQL Query dan Indexing

-- Modul Query 1
-- 1. HR Data

SELECT customerName, contactFirstName, contactLastName FROM customers;

UPDATE customers SET creditLimit = creditLimit + 500 WHERE creditLimit = 0;

-- 2. Querying Data
SELECT customerNumber, contactFirstName, contactLastName, FLOOR(creditLimit) FROM customers;

-- 3. Sorting Data
SELECT customerNumber, contactFirstName, contactLastName, creditLimit FROM customers ORDER BY creditLimit DESC;

-- 4. Filtering Data
SELECT customerNumber, contactFirstName, contactLastName, creditLimit FROM customers WHERE creditLimit > 10000 AND country = 'USA' ORDER BY creditLimit;

SELECT customerNumber, customerName, contactFirstName, contactLastName, creditLimit FROM customers WHERE creditLimit > 10000 AND customerName LIKE 'M%' ORDER BY creditLimit;

-- 5. Join
SELECT firstName, lastName, city, country FROM employees LEFT JOIN offices ON employees.officeCode = offices.officeCode ORDER BY firstName;

SELECT firstName as NamaDepan, lastName as NamaBelakang, city as Kota, country as Negara FROM employees e LEFT JOIN offices o ON o.officeCode = e.officeCode WHERE jobTitle = 'Sales Rep';

-- 6. Agregate

SELECT country, AVG(creditLimit) as 'Rata-rata creditLimit' FROM customers GROUP BY country;

SELECT customerName, c.customerNumber, COUNT(*) AS 'Total Order' FROM customers c LEFT JOIN orders o ON c.customerNumber = o.customerNumber GROUP BY c.customerNumber;

-- 7. Cursor


-- Modul Query 2
-- 1. DDL(Syntax for altering and creating structures)
CREATE TABLE city (
cityId INT(4) PRIMARY KEY,
cityName VARCHAR(30) NOT NULL,
county VARCHAR(30) NOT NULL,
mayorName VARCHAR(100),
jk ENUM('L','P')
);

ALTER TABLE city DROP COLUMN jk;

DROP TABLE city;

-- 2. DML ( Update Syntax)
INSERT INTO city VALUES (1,'Bandar Lampung', 'Indonesia', 'Eva Dwiana', 'P');

UPDATE city SET mayorName = 'Eva' WHERE cityid = 1;

DELETE FROM city WHERE cityId = 1

-- Modul Indexing
CREATE INDEX countries_name ON customers(country);

SELECT * FROM customers WHERE country = 'USA' -- After indexing
-- T-SQL - Transact - Structured Query Language : Yapýlandýrýlmýþ Sorgulama Dili :
/*
Veri Tabanlarýnda komutla iþlam yapmak için kullanýlan script dilidir. Veri Tabanýný yada içindeki tablo, View, v.b. nesneleri yaratmak, nesneleri güncellemek, nesneleri silmek, yetki ayarlamak için kullanýlabilir. Ya da bir tablo içine kayýt eklemek, önceden eklenmiþ bir kaydý güncellemek, bir kaydý silmek için de sql komutu yazýlabilir.

3 ANA GRUPTA ÝNCELENEBÝLÝR: 
1- DDL: Data Definition Language  (CREATE - ALTER - DROP)
	Veri tabaný nesneleri üzerinde iþlem yapan komutlardýr.
	CREATE : Nesne yaratýr.
	CREATE Nesne_Türü Nesne Adý
	CREATE DATABASE TestSql

 */

 --CREATE DATABASE TestSql

 --USE TestSql
 --GO

 --CREATE TABLE Urunler  
 --(
	--UrunID int IDENTITY(1,1) PRIMARY KEY not null,
	--UrunAd nvarchar(50) not null,
	--Fiyati money,
	--Kayit_Tarihi smalldatetime
 --) 

 --CREATE TABLE Musteriler 
 --(
	--MusteriID int IDENTITY(1,1) PRIMARY KEY not null,
	--MusteriAdSoyad nvarchar(50) not null,
	--Email nvarchar(50) null,
	--Adresi nvarchar(200) null,
	--Durum bit,
	--Cinsiyet char(1) 
 --)

 -- ALTER : DB nesnelerini günceller.
		--ALTER NESNE_Tipi Nesne_Adý

		--ALTER ile tabloya yeni alan ekleme:
--ALTER TABLE Urunler
--	ADD Kategori nvarchar(20) null

		--ALTER ile tablodan alan güncelleme:
--ALTER TABLE Urunler ALTER COLUMN Fiyati money not null
--ALTER TABLE Urunler	ALTER COLUMN UrunAd nvarchar(100) not null

		--ALTER ile tablodan alan silme:
--ALTER TABLE Musteriler
--	DROP COLUMN Cinsiyet

--ALTER TABLE Musteriler
--	ADD Cinsiyet char(1)

-- DROP : DB NESNELERÝNÝ SÝLER.
-- DROP Nesne_Türü Nesne_Adý

--CREATE DATABASE Sil

--DROP DATABASE Sil

/*
2-DML : Data Manipulation Language (INSERT-UPDATE-DELETE)
		Bir tablodaki kayýtlar üzerinde kullanýlan komutlardýr. 

		INSERT : Bir tabloya kayýt (Veri) eklemek için kullanýlýr.
		
		INSERT INTO Tablo_Adý 
			(Kolon listesi) 
		VALUES 
			(Deðer Listesi) 
-------------------------------------------
		INSERT INTO Tablo_Adý 
		VALUES 
			(Deðer Listesi) 

*/

--INSERT INTO Urunler 
--(UrunAd,Fiyati,Kategori,Kayit_Tarihi) 
--VALUES 
--('Samsung S25 Ultra 256',100000,'Telefon','2026-05-23')

--INSERT INTO Musteriler
--VALUES
--('Ali Ak','ali@abc.com',NULL,1,'E')

--INSERT INTO Musteriler 
--([MusteriAdSoyad],[Email])
--VALUES
--('Ayþe Kara','ayse@xyz.com')


--UPDATE : Bir Tablodan kayýt günceller.

-- UPDATE Tablo_Adý 
-- SET Alan_adý=yeni_deðer, alan_adý2=yeni deðeri, .....
-- WHERE Koþul_ifadesi

--UPDATE Urunler 
--SET Kategori = 'Telefon'
--WHERE UrunID = 1

--UPDATE Urunler
--SET [Kayit_Tarihi] = GETDATE()
--WHERE [Kayit_Tarihi] is null


-- DELETE : Bir tablodan kayýt siler.

-- DELETE FROM Tablo_Adý WHERE Koþul_Ýfadesi

--DELETE FROM Musteriler WHERE [Email] is null

-----------------------------
--BEGIN TRANSACTION
--	DELETE FROM Musteriler

--	--COMMIT
--	ROLLBACK
---------------------------------
-----------------------------
--begin try
--	BEGIN TRANSACTION
--	DELETE FROM Musteriler
--	COMMIT
--end try
--begin catch
--	ROLLBACK
--end catch
------------------------------
--ALTER TABLE Musteriler
--	ALTER COLUMN  VergiNo char(8) not null

-- 3.DCL : Data Control Language (GRANT, DENY) - Veri Tabaný kullanýcýlarýna yetki vermek ya da engellemek için kullanýlýr.

-- 4.DRL-DQL : Data Reporting (Query) Language (SELECT)
-- Veri Tabanýnda sorgulama yapmak için kullanýlýr.
-- SELECT Kolon_listesi FROM Tablo_Adý WHERE koþul_ifadesi

--SELECT * FROM Urunler
--SELECT * FROM Urunler WHERE Kategori = 'Telefon'
--SELECT * FROM Urunler WHERE Fiyati <= 100000 
--SELECT * FROM Urunler WHERE Fiyati <= 100000 AND Kategori = 'Telefon'
--SELECT * FROM Urunler WHERE Fiyati <= 100000 OR Kategori = 'Telefon'
--SELECT Kategori,UrunAd,Fiyati FROM Urunler WHERE Fiyati <= 100000 AND Kategori = 'Telefon'
--SELECT Kategori,UrunAd,Fiyati FROM Urunler WHERE UrunAd LIKE '%Samsung%'
--SELECT Kategori,UrunAd,Fiyati FROM Urunler WHERE Fiyati >= 100000 AND Fiyati <= 130000
--SELECT Kategori,UrunAd,Fiyati FROM Urunler WHERE Fiyati BETWEEN 100000 AND 130000
--SELECT UrunID,Kategori,UrunAd,Fiyati FROM Urunler WHERE UrunID = 1 OR UrunID = 3 
--SELECT UrunID,Kategori,UrunAd,Fiyati FROM Urunler WHERE UrunID IN (1,3,17,66,79)
--SELECT * FROM Urunler WHERE Kategori <> 'Telefon'


--SELECT * FROM Urunler ORDER BY Fiyati DESC
--SELECT * FROM Urunler WHERE UrunAd LIKE '%Samsung%' ORDER BY Fiyati DESC

--------------------------------------------------------------------------------

-- NORTHWIND SORGULARI -----------------------

--SELECT [ProductName],[UnitPrice],[UnitsInStock] FROM Products
--SELECT [ProductName],[UnitPrice],[UnitsInStock] AS 'Stok Miktarý',[UnitPrice]*[UnitsInStock] AS 'Stok Deðeri' FROM Products

--SELECT SUM([UnitPrice]*[UnitsInStock]) AS 'Total Stock Value' FROM Products

--SELECT [ProductName],[UnitPrice],[UnitsInStock] AS 'Stok Miktarý', [UnitPrice]*[UnitsInStock]*1.2 AS 'Stok Deðeri' FROM Products

--SELECT SUM([UnitPrice]*[UnitsInStock]*1.2) AS 'Total Stock Value (Including VAT)' FROM Products

--SELECT AVG([UnitPrice]*[UnitsInStock]*1.2) AS 'AVG Total Stock Value (Including VAT)' FROM Products

--SELECT MAX([UnitPrice]*[UnitsInStock]*1.2) AS 'Max Total Stock Value (Including VAT)' FROM Products

--SELECT MAX(UnitPrice) AS 'En Yüksek Ürün Fiyatý' FROM Products

-- SUBQUERY
-- Bir sorgu içerisinde baþka bir sorgu yazýldýðýnda iç sorguya subquery denir. Bazý iþlemler tek sorgu ile halledilemediðinde yardýmcý olarak kullanýlýr. Bir sorgu tarafýndan çekilen veriler baþka bir sorguya devredilerek tekrar sorgulanabilir.

--SELECT ProductName AS 'En Yüksek Fiyatlý Ürün', UnitPrice FROM Products WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM Products)

--JOIN
-- SQL de SELECT komutu ile tablolardan veri çekeriz. SELECT ifadesinde FROM dan sonra verinin çekileceði tablonun adýný yazarýz. Eðer çekilecek olan veri tek bir tablodan gelmeyecekse yani birden fazla tablodan veri birleþtirilerek çekilecek ise, FROM dan sonra yazdýðýmýz tabloya diðer tabloyu (ya da tablolarý) JOIN komutu ile birleþtiririz. Böylece diðer tabloyu da sorgumuza baðlamýþ oluruz ve onun içindeki alnlardan da veri alabiliriz. JOIN ile baðladýðýmýz diðer tablodan iliþkili verileri çekebiliriz. Tablolarý birleþtirerek tek bir tabloymuþ gibi çalýþabilmemizi saðlar.

-- Ürünlerin Kategori Ýsimleri
--SELECT ProductName,CategoryName FROM Products 
--JOIN Categories ON Products.CategoryID = Categories.CategoryID 

-- Ürünlerin tedarikçileri
--SELECT ProductName,CompanyName AS 'Tedarikçi',Phone FROM Products 
--JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID

--SELECT OrderID,CompanyName,Phone FROM Orders 
--JOIN Customers ON Orders.CustomerID = Customers.CustomerID ORDER BY OrderID 

--SELECT OrderID,FirstName + ' ' + LastName AS 'Satýþ Yetkilisi', Title FROM Orders JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID

--SELECT [ProductName],[CategoryName],[CompanyName],[ContactName],[Phone],[Country] FROM Products 
--JOIN Categories ON Products.CategoryID = Categories.CategoryID
--JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID

--SELECT [OrderID],ProductName,[Order Details].[UnitPrice],[Quantity],[Order Details].[UnitPrice]*[Quantity] AS 'Tutar' FROM [Order Details] JOIN Products ON  [Order Details].ProductID = Products.ProductID


--GROUP BY
-- GROUP BY ifadesi sorgularda tekrar eden verileri gruplandýrarak tek satýra birleþtirir. Bu birleþtirilen datalar üzerinde de toplama, ortalama, saydýrma, v.b. iþlemleri yapýlabilir. Örneðin ürünler listesinde ürün adlarýna göre grupma yapýlarak, ürünün satýþ adetleri toplanabilir. Genellikle SUM(), COUNT(), AVG(), MAX(), MIN(), v.b. gibi birleþtirilen satýrlar üzerinde iþlem yapan fonksiyonlarla (Aggregate functions) birlikte kullanýlýr.

--SELECT City FROM Employees GROUP BY City
--SELECT City,COUNT(City) AS 'Adet' FROM Employees GROUP BY City

--SELECT [OrderID],SUM([Order Details].[UnitPrice]*[Quantity]) AS ' Toplam Tutar', COUNT([OrderID]) AS 'Ürün Sayýsý' FROM [Order Details] GROUP BY [OrderID]

--SELECT Orders.[OrderID],SUM([Order Details].[UnitPrice]*[Quantity]) AS ' Toplam Tutar', COUNT([Order Details].[OrderID]) AS 'Ürün Sayýsý', CompanyName, Address, Phone, City, Country FROM [Order Details] 
--JOIN Orders ON [Order Details].[OrderID] = Orders.[OrderID] 
--JOIN Customers ON Orders.CustomerID = Customers.CustomerID
--GROUP BY Orders.[OrderID],CompanyName,Address,Phone,City,Country

--SELECT [FirstName],[LastName], SUM([Order Details].[UnitPrice]*[Quantity]) AS 'Toplam Satýþ Tutarý' FROM [Order Details] 
--JOIN Orders ON [Order Details].[OrderID] = Orders.[OrderID] 
--JOIN Employees ON Orders.[EmployeeID] = [Employees].[EmployeeID]
--GROUP BY [FirstName],[LastName]
--ORDER BY 'Toplam Satýþ Tutarý' DESC

--DISTINCT
--Tekrarlanan veriyi engeller, her verinin 1 kere yazýlmasýný saðlar.
--select DISTINCT Country,City from Customers
--SELECT Count(DISTINCT ProductID) AS 'Satýlan Ürün Çeþidi Sayýsý' From [Order Details]


-- ÖRNEK ÇALIÞMA :
--------------------------

--INSERT INTO Categories ([CategoryName],[Description]) VALUES ('Araba','Otomobil ve oto parçalarý') 

--DELETE FROM Categories WHERE CategoryID = 25
--DELETE FROM Categories WHERE CategoryName = 'Araba'
--DELETE FROM Categories WHERE Description like '%oto%'

--UPDATE Categories SET CategoryName = 'Araba', Description = 'Otomobil ve Oto parçalarý'  WHERE  CategoryName = 'yyyyyyy'

--DROP TABLE Categories2

SELECT * FROM sys.Tables
SELECT * FROM sys.databases
SELECT * FROM sys.all_objects where [name] like 'Cust%'
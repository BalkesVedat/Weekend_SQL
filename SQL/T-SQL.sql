-- T-SQL - Transact - Structured Query Language : Yapýlandýrýlmýþ Sorgulama Dili :
/*
Veri Tabanlarýnda komutla iþlam yapmak için kullanýlan script dilidir. Veri Tabanýný yada içindeki tablo, View, v.b. nesneleri yaratmak, nesneleri güncellemek, nesneleri silmek, yetki ayarlamak için kullanýlabilir. Ya da bir tablo içine kayýt eklemek, önceden eklenmiþ bir kaydý güncellemek, bir kaydý silmek için de sql komutu yazýlabilir.

3 ANA GRUPTA ÝNCELENEBÝLÝR: 
1- DDL:     (CREATE - ALTER - DROP)
	Veri tabaný nesneleri üzerinde iþlem yapan komutlardýr.
	CREATE : Nesne yaratýr.
	CREATE Nesne_Türü Nesne Adý
	CREATE DATABASE TestSql

 */

 --CREATE DATABASE TestSql

 --USE TestSql
 --GO

 CREATE TABLE Urunler 
 (
	UrunID int IDENTITY(1,1) not null,
	UrunAd nvarchar(50) not null,
	Fiyati money 	 
 ) 
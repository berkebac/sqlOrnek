--VERÝTABANI OLUÞTURMA
--CREATE DATABASE <Database Adý>
--VERÝTABANI SECMEK ICIN
--USE <Database Adý>

CREATE DATABASE [uygulama00]

--TABLO OLUSTURMA
--CREATE TABLE <Tablo Adý> (alan kýsýtlarý , kýsýt1 ,kýsýt2 ....)

CREATE TABLE [Müþteriler]
(
	--Kýsýt Ekleme 1.Yöntem
	[MüþteriId] INT NOT NULL IDENTITY PRIMARY KEY,
	--Kýsýt Ekleme 2.Yöntem
	--[MüþteriId] INT NOT NULL IDENTITY CONSTRAINT PK_MUSTERILER PRIMARY KEY,
	--Kýsýt Ekleme 3.Yöntem
	--PRIMARY KEY([MüþteriId]),
	--Kýsýt Ekleme 4.Yöntem
	--CONSTRAINT PK_MUSTERILER PRIMARY KEY([MüþteriId]),

	[Ad] NVARCHAR(30) NOT NULL,
	[SoyAd] NVARCHAR(30) NOT NULL,
	[DoðumYeri] NVARCHAR(20) NOT NULL,
	[DoðumTarihi] DateTime NOT NULL,
	[Adres] NTEXT NULL,
	[Telefon] NVARCHAR(13) NULL
)

--------------------------------------------
--YENI KAYIT EKLEME
--1.Yöntem INSERT INTO [TabloAdý] VALUES (<Deðerler>)
--2.Yöntem INSERT INTO [TabloAdý] (Alanlar) VALUES (<Deðerler>)


INSERT INTO [Müþteriler] VALUES ('Luigi','Datome','Fransa','1990-1-1',NULL,'22222223242')

INSERT [Müþteriler] VALUES ('Leonard','Kawhi','San Antonio','1990-3-3','Spurs','22222223242')

INSERT INTO [Müþteriler] ([SoyAd],[Ad],[DoðumYeri],[DoðumTarihi],[Adres]) VALUES ('Manu','Ginóbili','Arjantin','1977.9.28','Spurs' )

INSERT  [Müþteriler] ([SoyAd],[Ad],[DoðumYeri],[DoðumTarihi],[Adres]) VALUES ('Pau','Gasol','Ýspanya','1980.9.6','Spurs' )

INSERT [Müþteriler] VALUES ('Parker','Tony','Belçika','1990-3-3','Spurs','22242323242')

---------------------------------------------------------------------------------
--Tabloya Kolon Ekleme
--BOS BIRAKILABILIRSE DEFAULT DEGERE GEREK YOK
ALTER TABLE [Müþteriler] ADD [E-Posta] NVARCHAR(20) NULL
--BOS GECILEMEZ OLDUGU ICIN ONCEKI DEGERLERDE HATA VERIR O YUZDEN DEFAULT DEGER EKLIYORUZ
ALTER TABLE [Müþteriler] ADD [E-Posta] NVARCHAR(20) NOT NULL DEFAULT 'spurs@gmail.com'

--KOLON DUZENLEME
ALTER TABLE [Müþteriler] ALTER COLUMN [E-Posta] NVARCHAR(25)

----------------------------------------------------


CREATE TABLE [Çalýþanlar]
(
	
	[ÇalýþanId] INT NOT NULL IDENTITY PRIMARY KEY,
	[ÇalýþanAd] NVARCHAR(30) NOT NULL,
	[ÇalýþanSoyAd] NVARCHAR(30) NOT NULL,
	[DoðumYeri] NVARCHAR(20) NOT NULL,
	[Ücret] DECIMAL NOT NULL
)
CREATE TABLE [Departmanlar]
(
	
	[DepartmanId] INT NOT NULL IDENTITY PRIMARY KEY,
	[DepartmanAd] NVARCHAR(30) NOT NULL,
	
)
ALTER TABLE [Departmanlar] ALTER COLUMN [DepartmanId] INT NOT NULL 
--------------------------
--Kýsýtlar sonradan eklenýrse(PK,FK)
-- ALTER TABLE [Çalýþanlar] CONSTRAINT PK_Çalýþanlar PRIMARY KEY([ÇalýþanId])
--Isým otomatýk verýlýcekse
-- ALTER TABLE [Çalýþanlar] PRIMARY KEY([ÇalýþanId])


--CHECK KISIDI
ALTER TABLE [Çalýþanlar] ADD CHECK([Ücret]>=1)
--ISIM VERILICEKSE
ALTER TABLE [Çalýþanlar] ADD CONSTRAINT Check_Ücret CHECK([Ücret]>=1)

--Veri Ekleme
INSERT INTO [Departmanlar] VALUES ('Bilgi Ýþlem')
INSERT INTO [Departmanlar] VALUES ('Insan Kaynaklarý')
INSERT INTO [Departmanlar] VALUES ('Muhasebe')


--Çalýþanlar ýle Departmanlar Arasý Baglantý Kurma
ALTER TABLE [Çalýþanlar] ADD [DepartmanId] INT NULL

--FOREIGN KEY ILE ILISKI KURULMASI
ALTER TABLE [Çalýþanlar] ADD  CONSTRAINT FK_Çalýþanlar_Departman FOREIGN KEY([DepartmanId]) REFERENCES [Departmanlar]([DepartmanId])
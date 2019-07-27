--VERÝTABANI OLUÞTURMA
--CREATE DATABASE <Database Adý>
--VERÝTABANI SEÇMEK ÝÇÝN
--USE <Database Adý>
CREATE DATABASE [uygulama01]

--TABLO OLUÞTURMA
--CREATE TABLE <Tablo Adý> (alan1 kýsýtlar, alan2 kýstlar ....)

CREATE TABLE [Müþteriler]
(
	
	
	--Kýsýt Ekleme 2. Yöntem CONSTRAINT kýsýtAdý KISIT (Bu iþlem ile kýsýt adýný biz veririz)
	--[MüþteriId] INT NOT NULL IDENTITY CONSTRAINT PK_Müþteriler PRIMARY KEY, 
	--[MüþteriId] INT NOT NULL IDENTITY,
	--Kýsýt Ekleme 1. Yöntem
	[MüþteriId] INT NOT NULL IDENTITY PRIMARY KEY, 
	[Ad] NVARCHAR(30) NOT NULL,
	[Soyad] NVARCHAR(30) NOT NULL,
	[DoðumYeri] NVARCHAR(30) NOT NULL,
	[DoðumTarihi] DATETIME NOT NULL,
	[Adres] NTEXT NULL,
	[Telefon] NVARCHAR(13) NULL,
	--3. Yöntem
	--PRIMARY KEY([MüþteriId])
	--4. Yöntem
	--CONSTRAINT PK_Müþteriler PRIMARY KEY([MüþteriId])

)
-----------------------------------------------------------------
--yeni kayýt ekleme
--1. Yöntem INSERT INTO [TabloAdý] VALUES (<Deðerler>)
 INSERT INTO [Müþteriler] VALUES ('Uðurcan','Tural','Ýstanbul','2000-12-10',NULL,'000000000000'  )
 INSERT [Müþteriler] VALUES ('Þuayip Yiðit','Beslen','Ýzmir','2001-10-10','Göztepe','111111111111')

--2. Yöntem INSERT INTO [TabloAdý] (Alanlar) VALUES (<Deðerler>)
INSERT INTO [Müþteriler] ([Soyad],[DoðumTarihi],[Ad],[DoðumYeri],[Adres]) VALUES ('Kayýþoðlu','2002-3-3','Mehmet Talha','Sakarya','Arifiye')

-----------------------------------------------------------------
--Tabloya Yeni kolon ekleme
--Eðer tasbloda veri varsa ve yeni alan boþ býrakýlabilirse
ALTER TABLE [Müþteriler] ADD [EPosta] NVARCHAR(30) NULL

--Eðer tasbloda veri varsa ve yeni alan boþ býrakýlamazsa
ALTER TABLE [Müþteriler] ADD [EPosta] NVARCHAR(30) NOT NULL DEFAULT 'abc@abc.com'

--Tablodaki kolon özelliklerini deðiþtirme
ALTER TABLE [Müþteriler] ALTER COLUMN [EPosta] NVARCHAR(50) NOT NULL

-- Tablodaki bir alaný (kolonu) silme:
ALTER TABLE [Müþteriler] DROP COLUMN [EPosta]

------------------------------------------------------------------------------------
--Ýki Tablo Arasý Ýliþki[Foreign Key] ve Check

CREATE TABLE [Çalýþanlar]
(
	[ÇalýþamId] INT NOT NULL IDENTITY,
	[ÇalýþanAd] NVARCHAR(40) NOT NULL,
	[ÇalýþanSoyad] NVARCHAR(40) NOT NULL,
	[Ucret] DECIMAL NOT NULL
	--Alternatif Kýsýt ekleme
	--CONSTRAINT PK_Çalýþanlar PRIMARY KEY([ÇalýþanId]) 
	--PRIMARY KEY([ÇalýþanId]) 
)

CREATE TABLE [Departmanlar]
(
	[DepartmanId] INT NOT NULL IDENTITY,
	[DepartmanAd] NVARCHAR(40) NOT NULL
)

--Kýsýtlar sonradan eklenirse
--PRIMARY KEY KISIDI
ALTER TABLE [Çalýþanlar] ADD CONSTRAINT PK_Çalýþanlar PRIMARY KEY([ÇalýþanId])
ALTER TABLE [Departmanlar] ADD CONSTRAINT PK_Departmanlar PRIMARY KEY([DepartmanId])
--Ýsim otomatik olarak verilecekse
ALTER TABLE [Çalýþanlar] ADD  PRIMARY KEY([ÇalýþanId])
--CHECK KISIDI
--Ýsim otomatik olarak verilecekse
ALTER TABLE [Çalýþanlar] ADD CHECK([Ucret]>=1) 
--Ýsim verilecekse
ALTER TABLE [Çalýþanlar] ADD CONSTRAINT CK_Ucret CHECK([Ucret]>=1)

--Veri ekleme
INSERT INTO [Departmanlar] VALUES ('Bilgi Ýþlem') 
INSERT INTO [Departmanlar] VALUES ('Muhasebe') 
INSERT INTO [Departmanlar] VALUES ('Ýnsan Kaynaklarý')

INSERT INTO [Çalýþanlar] ([ÇalýþanSoyad],[ÇalýþanAd],[Ucret]) VALUES ('KÖSE','Uðurcan',0.5)
INSERT INTO [Çalýþanlar] ([ÇalýþanSoyad],[ÇalýþanAd],[Ucret]) VALUES ('KÖSE','Uðurcan',0)--HATA CHECK KISIDI
INSERT INTO [Çalýþanlar] ([ÇalýþanSoyad],[ÇalýþanAd],[Ucret]) VALUES ('GÜNVEREN','Elif',2)

--Çalýþanlar ile Departmanlar arasýnda baðlantý kurma
--DepartmanId alanýný Çalýþanlar tablosuna ekleme
ALTER TABLE [Çalýþanlar] ADD [DepartmanId] INT NULL

--FOREIGN KEY ile iliþki kurulmasý
--Çalýþanlar tablosundaki DepartmanId alaný bilgileri Departman tablosundaki DepartmanId alanýna baðlýdýr
ALTER TABLE [Çalýþanlar] ADD CONSTRAINT FK_Çalýþanlar_Departmanlar FOREIGN KEY ([DepartmanId]) REFERENCES [Departmanlar]([DepartmanId])

INSERT INTO [Çalýþanlar] ([ÇalýþanSoyad],[ÇalýþanAd],[Ucret],[DepartmanId]) VALUES ('Tural','Uðurcan',2,4)

 




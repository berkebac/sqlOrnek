--VER�TABANI OLU�TURMA
--CREATE DATABASE <Database Ad�>
--VER�TABANI SECMEK ICIN
--USE <Database Ad�>

CREATE DATABASE [uygulama00]

--TABLO OLUSTURMA
--CREATE TABLE <Tablo Ad�> (alan k�s�tlar� , k�s�t1 ,k�s�t2 ....)

CREATE TABLE [M��teriler]
(
	--K�s�t Ekleme 1.Y�ntem
	[M��teriId] INT NOT NULL IDENTITY PRIMARY KEY,
	--K�s�t Ekleme 2.Y�ntem
	--[M��teriId] INT NOT NULL IDENTITY CONSTRAINT PK_MUSTERILER PRIMARY KEY,
	--K�s�t Ekleme 3.Y�ntem
	--PRIMARY KEY([M��teriId]),
	--K�s�t Ekleme 4.Y�ntem
	--CONSTRAINT PK_MUSTERILER PRIMARY KEY([M��teriId]),

	[Ad] NVARCHAR(30) NOT NULL,
	[SoyAd] NVARCHAR(30) NOT NULL,
	[Do�umYeri] NVARCHAR(20) NOT NULL,
	[Do�umTarihi] DateTime NOT NULL,
	[Adres] NTEXT NULL,
	[Telefon] NVARCHAR(13) NULL
)

--------------------------------------------
--YENI KAYIT EKLEME
--1.Y�ntem INSERT INTO [TabloAd�] VALUES (<De�erler>)
--2.Y�ntem INSERT INTO [TabloAd�] (Alanlar) VALUES (<De�erler>)


INSERT INTO [M��teriler] VALUES ('Luigi','Datome','Fransa','1990-1-1',NULL,'22222223242')

INSERT [M��teriler] VALUES ('Leonard','Kawhi','San Antonio','1990-3-3','Spurs','22222223242')

INSERT INTO [M��teriler] ([SoyAd],[Ad],[Do�umYeri],[Do�umTarihi],[Adres]) VALUES ('Manu','Gin�bili','Arjantin','1977.9.28','Spurs' )

INSERT  [M��teriler] ([SoyAd],[Ad],[Do�umYeri],[Do�umTarihi],[Adres]) VALUES ('Pau','Gasol','�spanya','1980.9.6','Spurs' )

INSERT [M��teriler] VALUES ('Parker','Tony','Bel�ika','1990-3-3','Spurs','22242323242')

---------------------------------------------------------------------------------
--Tabloya Kolon Ekleme
--BOS BIRAKILABILIRSE DEFAULT DEGERE GEREK YOK
ALTER TABLE [M��teriler] ADD [E-Posta] NVARCHAR(20) NULL
--BOS GECILEMEZ OLDUGU ICIN ONCEKI DEGERLERDE HATA VERIR O YUZDEN DEFAULT DEGER EKLIYORUZ
ALTER TABLE [M��teriler] ADD [E-Posta] NVARCHAR(20) NOT NULL DEFAULT 'spurs@gmail.com'

--KOLON DUZENLEME
ALTER TABLE [M��teriler] ALTER COLUMN [E-Posta] NVARCHAR(25)

----------------------------------------------------


CREATE TABLE [�al��anlar]
(
	
	[�al��anId] INT NOT NULL IDENTITY PRIMARY KEY,
	[�al��anAd] NVARCHAR(30) NOT NULL,
	[�al��anSoyAd] NVARCHAR(30) NOT NULL,
	[Do�umYeri] NVARCHAR(20) NOT NULL,
	[�cret] DECIMAL NOT NULL
)
CREATE TABLE [Departmanlar]
(
	
	[DepartmanId] INT NOT NULL IDENTITY PRIMARY KEY,
	[DepartmanAd] NVARCHAR(30) NOT NULL,
	
)
ALTER TABLE [Departmanlar] ALTER COLUMN [DepartmanId] INT NOT NULL 
--------------------------
--K�s�tlar sonradan eklen�rse(PK,FK)
-- ALTER TABLE [�al��anlar] CONSTRAINT PK_�al��anlar PRIMARY KEY([�al��anId])
--Is�m otomat�k ver�l�cekse
-- ALTER TABLE [�al��anlar] PRIMARY KEY([�al��anId])


--CHECK KISIDI
ALTER TABLE [�al��anlar] ADD CHECK([�cret]>=1)
--ISIM VERILICEKSE
ALTER TABLE [�al��anlar] ADD CONSTRAINT Check_�cret CHECK([�cret]>=1)

--Veri Ekleme
INSERT INTO [Departmanlar] VALUES ('Bilgi ��lem')
INSERT INTO [Departmanlar] VALUES ('Insan Kaynaklar�')
INSERT INTO [Departmanlar] VALUES ('Muhasebe')


--�al��anlar �le Departmanlar Aras� Baglant� Kurma
ALTER TABLE [�al��anlar] ADD [DepartmanId] INT NULL

--FOREIGN KEY ILE ILISKI KURULMASI
ALTER TABLE [�al��anlar] ADD  CONSTRAINT FK_�al��anlar_Departman FOREIGN KEY([DepartmanId]) REFERENCES [Departmanlar]([DepartmanId])
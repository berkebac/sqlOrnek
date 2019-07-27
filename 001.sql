--VER�TABANI OLU�TURMA
--CREATE DATABASE <Database Ad�>
--VER�TABANI SE�MEK ���N
--USE <Database Ad�>
CREATE DATABASE [uygulama01]

--TABLO OLU�TURMA
--CREATE TABLE <Tablo Ad�> (alan1 k�s�tlar, alan2 k�stlar ....)

CREATE TABLE [M��teriler]
(
	
	
	--K�s�t Ekleme 2. Y�ntem CONSTRAINT k�s�tAd� KISIT (Bu i�lem ile k�s�t ad�n� biz veririz)
	--[M��teriId] INT NOT NULL IDENTITY CONSTRAINT PK_M��teriler PRIMARY KEY, 
	--[M��teriId] INT NOT NULL IDENTITY,
	--K�s�t Ekleme 1. Y�ntem
	[M��teriId] INT NOT NULL IDENTITY PRIMARY KEY, 
	[Ad] NVARCHAR(30) NOT NULL,
	[Soyad] NVARCHAR(30) NOT NULL,
	[Do�umYeri] NVARCHAR(30) NOT NULL,
	[Do�umTarihi] DATETIME NOT NULL,
	[Adres] NTEXT NULL,
	[Telefon] NVARCHAR(13) NULL,
	--3. Y�ntem
	--PRIMARY KEY([M��teriId])
	--4. Y�ntem
	--CONSTRAINT PK_M��teriler PRIMARY KEY([M��teriId])

)
-----------------------------------------------------------------
--yeni kay�t ekleme
--1. Y�ntem INSERT INTO [TabloAd�] VALUES (<De�erler>)
 INSERT INTO [M��teriler] VALUES ('U�urcan','Tural','�stanbul','2000-12-10',NULL,'000000000000'  )
 INSERT [M��teriler] VALUES ('�uayip Yi�it','Beslen','�zmir','2001-10-10','G�ztepe','111111111111')

--2. Y�ntem INSERT INTO [TabloAd�] (Alanlar) VALUES (<De�erler>)
INSERT INTO [M��teriler] ([Soyad],[Do�umTarihi],[Ad],[Do�umYeri],[Adres]) VALUES ('Kay��o�lu','2002-3-3','Mehmet Talha','Sakarya','Arifiye')

-----------------------------------------------------------------
--Tabloya Yeni kolon ekleme
--E�er tasbloda veri varsa ve yeni alan bo� b�rak�labilirse
ALTER TABLE [M��teriler] ADD [EPosta] NVARCHAR(30) NULL

--E�er tasbloda veri varsa ve yeni alan bo� b�rak�lamazsa
ALTER TABLE [M��teriler] ADD [EPosta] NVARCHAR(30) NOT NULL DEFAULT 'abc@abc.com'

--Tablodaki kolon �zelliklerini de�i�tirme
ALTER TABLE [M��teriler] ALTER COLUMN [EPosta] NVARCHAR(50) NOT NULL

-- Tablodaki bir alan� (kolonu) silme:
ALTER TABLE [M��teriler] DROP COLUMN [EPosta]

------------------------------------------------------------------------------------
--�ki Tablo Aras� �li�ki[Foreign Key] ve Check

CREATE TABLE [�al��anlar]
(
	[�al��amId] INT NOT NULL IDENTITY,
	[�al��anAd] NVARCHAR(40) NOT NULL,
	[�al��anSoyad] NVARCHAR(40) NOT NULL,
	[Ucret] DECIMAL NOT NULL
	--Alternatif K�s�t ekleme
	--CONSTRAINT PK_�al��anlar PRIMARY KEY([�al��anId]) 
	--PRIMARY KEY([�al��anId]) 
)

CREATE TABLE [Departmanlar]
(
	[DepartmanId] INT NOT NULL IDENTITY,
	[DepartmanAd] NVARCHAR(40) NOT NULL
)

--K�s�tlar sonradan eklenirse
--PRIMARY KEY KISIDI
ALTER TABLE [�al��anlar] ADD CONSTRAINT PK_�al��anlar PRIMARY KEY([�al��anId])
ALTER TABLE [Departmanlar] ADD CONSTRAINT PK_Departmanlar PRIMARY KEY([DepartmanId])
--�sim otomatik olarak verilecekse
ALTER TABLE [�al��anlar] ADD  PRIMARY KEY([�al��anId])
--CHECK KISIDI
--�sim otomatik olarak verilecekse
ALTER TABLE [�al��anlar] ADD CHECK([Ucret]>=1) 
--�sim verilecekse
ALTER TABLE [�al��anlar] ADD CONSTRAINT CK_Ucret CHECK([Ucret]>=1)

--Veri ekleme
INSERT INTO [Departmanlar] VALUES ('Bilgi ��lem') 
INSERT INTO [Departmanlar] VALUES ('Muhasebe') 
INSERT INTO [Departmanlar] VALUES ('�nsan Kaynaklar�')

INSERT INTO [�al��anlar] ([�al��anSoyad],[�al��anAd],[Ucret]) VALUES ('K�SE','U�urcan',0.5)
INSERT INTO [�al��anlar] ([�al��anSoyad],[�al��anAd],[Ucret]) VALUES ('K�SE','U�urcan',0)--HATA CHECK KISIDI
INSERT INTO [�al��anlar] ([�al��anSoyad],[�al��anAd],[Ucret]) VALUES ('G�NVEREN','Elif',2)

--�al��anlar ile Departmanlar aras�nda ba�lant� kurma
--DepartmanId alan�n� �al��anlar tablosuna ekleme
ALTER TABLE [�al��anlar] ADD [DepartmanId] INT NULL

--FOREIGN KEY ile ili�ki kurulmas�
--�al��anlar tablosundaki DepartmanId alan� bilgileri Departman tablosundaki DepartmanId alan�na ba�l�d�r
ALTER TABLE [�al��anlar] ADD CONSTRAINT FK_�al��anlar_Departmanlar FOREIGN KEY ([DepartmanId]) REFERENCES [Departmanlar]([DepartmanId])

INSERT INTO [�al��anlar] ([�al��anSoyad],[�al��anAd],[Ucret],[DepartmanId]) VALUES ('Tural','U�urcan',2,4)

 




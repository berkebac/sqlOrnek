CREATE TABLE [Müþteriler]
(
[Id] INT NOT NULL IDENTITY PRIMARY KEY,
[Ad] NVARCHAR(30) NOT NULL,
[SoyAd] NVARCHAR(30) NOT NULL,
[Þehir] NVARCHAR(30) NOT NULL,
[Ülke] NVARCHAR(30) NOT NULL,
[Telefon] NVARCHAR(15) NOT NULL,
[MüþteriId] INT NULL
)

CREATE TABLE [Sýpariþler]
(
[Id] INT NOT NULL IDENTITY PRIMARY KEY,
[SýpariþTarihi] DATETIME NOT NULL,
[SýpariþNumarasý] NVARCHAR(10) NOT NULL,
[ToplamFiyat] DECIMAL(10,2) NOT NULL CONSTRAINT PK_Sipariþler CHECK([ToplamFiyat]>=1),
[SýpariþId] INT NULL
)

CREATE TABLE [Sýpariþ Detaylarý]
(
[SýpariþDetayýId] INT NOT NULL IDENTITY PRIMARY KEY,
[BirimFiyat] DECIMAL(10,2) NOT NULL,
[Adet] INT NOT NULL,
)

CREATE TABLE [Ürünler]
(
[Id] INT NOT NULL IDENTITY PRIMARY KEY,
[ÜrünAdý] NVARCHAR(20) NOT NULL,
[BirimFiyat] DECIMAL(10,2) NOT NULL,
[Paket] NVARCHAR(20) NOT NULL,
[StokDurumu] BIT NOT NULL DEFAULT(0),
[ÜrünId] INT NULL
)

CREATE TABLE [Tedarikçiler]
(
[Id] INT NOT NULL IDENTITY PRIMARY KEY,
[ÞirketAdý] NVARCHAR(20) NOT NULL,
[BaðlantýAdý] NVARCHAR(20) NOT NULL,
[BaðlantýÜnvaný] NVARCHAR(20) NOT NULL,
[Þehir] NVARCHAR(20) NOT NULL,
[Ülke] NVARCHAR(20) NOT NULL,
[Telefon] NVARCHAR(20) NOT NULL,
[Fax] NVARCHAR(20) NOT NULL,
[TedarikçiId] INT NULL
)


ALTER TABLE [Sýpariþler] ADD [MüþteriId] INT NULL
ALTER TABLE [Sýpariþler] ADD  CONSTRAINT FK_Müþteriler_Sýparýþ FOREIGN KEY([MüþteriId]) REFERENCES [Müþteriler]([MüþteriId])


ALTER TABLE [Sýpariþ Detaylarý] ADD [ÜrünId] INT NULL
ALTER TABLE [Sýpariþ Detaylarý] ADD [SýpariþId] INT NULL
ALTER TABLE [Sýpariþ Detaylarý] ADD  CONSTRAINT FK_SýpariþDetaylarý_Sýparýþ FOREIGN KEY([ÜrünId]) REFERENCES [Ürünler]([ÜrünId])
ALTER TABLE [Sýpariþ Detaylarý] ADD  CONSTRAINT FK_SýpariþDetaylarý_Ürün FOREIGN KEY([SýpariþId]) REFERENCES [Sýpariþler]([SýpariþId])


ALTER TABLE [Ürünler] ADD [TedarikçiId] INT NULL
ALTER TABLE [Ürünler] ADD  CONSTRAINT FK_Ürünler_Tedarikçi FOREIGN KEY([TedarikçiId]) REFERENCES [Tedarikçiler]([TedarikçiId])

INSERT INTO [Müþteriler] VALUES ('Berke','Baç','Ýstanbul','Türkiye','11')
INSERT INTO [Sýpariþler] VALUES ('2015-8-3','1111111111','50',1)
INSERT INTO [Ürünler] VALUES ('PC','3000','1',0,NULL)
INSERT INTO [Sýpariþ Detaylarý] VALUES ('33','3',1,NULL)
INSERT INTO [Tedarikçiler] VALUES ('MAC','apple','Apple','Ýstanbul','Türkiye','11111','111')
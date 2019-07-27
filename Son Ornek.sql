CREATE TABLE [Müþteriler]
(
[Id] INT NOT NULL IDENTITY PRIMARY KEY,
[Ad] NVARCHAR(30) NOT NULL,
[SoyAd] NVARCHAR(30) NOT NULL,
[Þehir] NVARCHAR(30) NOT NULL,
[Ülke] NVARCHAR(30) NOT NULL,
[Telefon] NVARCHAR(15) NOT NULL,
)

CREATE TABLE [Sýpariþler]
(
[Id] INT NOT NULL IDENTITY PRIMARY KEY,
[SýpariþTarihi] DATETIME NOT NULL,
[SýpariþNumarasý] NVARCHAR(10) NOT NULL,
[ToplamFiyat] DECIMAL(10,2) NOT NULL CONSTRAINT Check_Sipariþler CHECK([ToplamFiyat]>=1),
--CONSTRAINT Check_Sipariþler CHECK([ToplamFiyat]>=1) << Check kýsýdýný alt satýrdada yazabýlýrýz verýcegýmýz degýskenýn yanýnada
[MüþteriId] INT NULL

)

CREATE TABLE [Sýpariþ Detaylarý]
(
[SýpariþDetayýId] INT NOT NULL IDENTITY PRIMARY KEY,
[BirimFiyat] DECIMAL(10,2) NOT NULL,
[Adet] INT NOT NULL,
[SýpariþId] INT NULL,
[ÜrünId] INT NULL
)

CREATE TABLE [Ürünler]
(
[Id] INT NOT NULL IDENTITY PRIMARY KEY,
[ÜrünAdý] NVARCHAR(20) NOT NULL,
[BirimFiyat] DECIMAL(10,2) NOT NULL,
[Paket] NVARCHAR(20) NOT NULL,
[StokDurumu] BIT NOT NULL DEFAULT(0),
[TedarikçiId] INT NULL

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

)

-- ALTER TABLE [FK Eklenýcek Tablo Adý] ADD CONSTRAINT [FK adý] FOREIGN KEY([FK baglanýcak yer]) REFERENCES [Hangi Tablodan Alýnýcagý]([Alýnýcýk tablodaký Id)]
ALTER TABLE [Sýpariþler] ADD  CONSTRAINT FK_Sýpariþler_Müþteri FOREIGN KEY([MüþteriId]) REFERENCES [Müþteriler]([Id])


ALTER TABLE [Sýpariþ Detaylarý] ADD  CONSTRAINT FK_SýpariþDetaylarý_Sýparýþ FOREIGN KEY([SýpariþId]) REFERENCES [Sýpariþler]([Id])
ALTER TABLE [Sýpariþ Detaylarý] ADD  CONSTRAINT FK_SýpariþDetaylarý_Ürün FOREIGN KEY([ÜrünId]) REFERENCES [Ürünler]([Id])


ALTER TABLE [Ürünler] ADD  CONSTRAINT FK_Ürünler_Tedarikçi FOREIGN KEY([TedarikçiId]) REFERENCES [Tedarikçiler]([Id])

INSERT INTO [Müþteriler] VALUES ('Berke','Baç','Ýstanbul','Türkiye','11')
INSERT INTO [Sýpariþler] VALUES ('2015-8-3','1111111111','50',1)
INSERT INTO [Ürünler] VALUES ('PC','3000','1',0,NULL)
INSERT INTO [Sýpariþ Detaylarý] VALUES ('33','3',1,NULL)
INSERT INTO [Tedarikçiler] VALUES ('MAC','apple','Apple','Ýstanbul','Türkiye','11111','111')
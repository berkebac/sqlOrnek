CREATE TABLE [M��teriler]
(
[Id] INT NOT NULL IDENTITY PRIMARY KEY,
[Ad] NVARCHAR(30) NOT NULL,
[SoyAd] NVARCHAR(30) NOT NULL,
[�ehir] NVARCHAR(30) NOT NULL,
[�lke] NVARCHAR(30) NOT NULL,
[Telefon] NVARCHAR(15) NOT NULL,
[M��teriId] INT NULL
)

CREATE TABLE [S�pari�ler]
(
[Id] INT NOT NULL IDENTITY PRIMARY KEY,
[S�pari�Tarihi] DATETIME NOT NULL,
[S�pari�Numaras�] NVARCHAR(10) NOT NULL,
[ToplamFiyat] DECIMAL(10,2) NOT NULL CONSTRAINT PK_Sipari�ler CHECK([ToplamFiyat]>=1),
[S�pari�Id] INT NULL
)

CREATE TABLE [S�pari� Detaylar�]
(
[S�pari�Detay�Id] INT NOT NULL IDENTITY PRIMARY KEY,
[BirimFiyat] DECIMAL(10,2) NOT NULL,
[Adet] INT NOT NULL,
)

CREATE TABLE [�r�nler]
(
[Id] INT NOT NULL IDENTITY PRIMARY KEY,
[�r�nAd�] NVARCHAR(20) NOT NULL,
[BirimFiyat] DECIMAL(10,2) NOT NULL,
[Paket] NVARCHAR(20) NOT NULL,
[StokDurumu] BIT NOT NULL DEFAULT(0),
[�r�nId] INT NULL
)

CREATE TABLE [Tedarik�iler]
(
[Id] INT NOT NULL IDENTITY PRIMARY KEY,
[�irketAd�] NVARCHAR(20) NOT NULL,
[Ba�lant�Ad�] NVARCHAR(20) NOT NULL,
[Ba�lant��nvan�] NVARCHAR(20) NOT NULL,
[�ehir] NVARCHAR(20) NOT NULL,
[�lke] NVARCHAR(20) NOT NULL,
[Telefon] NVARCHAR(20) NOT NULL,
[Fax] NVARCHAR(20) NOT NULL,
[Tedarik�iId] INT NULL
)


ALTER TABLE [S�pari�ler] ADD [M��teriId] INT NULL
ALTER TABLE [S�pari�ler] ADD  CONSTRAINT FK_M��teriler_S�par�� FOREIGN KEY([M��teriId]) REFERENCES [M��teriler]([M��teriId])


ALTER TABLE [S�pari� Detaylar�] ADD [�r�nId] INT NULL
ALTER TABLE [S�pari� Detaylar�] ADD [S�pari�Id] INT NULL
ALTER TABLE [S�pari� Detaylar�] ADD  CONSTRAINT FK_S�pari�Detaylar�_S�par�� FOREIGN KEY([�r�nId]) REFERENCES [�r�nler]([�r�nId])
ALTER TABLE [S�pari� Detaylar�] ADD  CONSTRAINT FK_S�pari�Detaylar�_�r�n FOREIGN KEY([S�pari�Id]) REFERENCES [S�pari�ler]([S�pari�Id])


ALTER TABLE [�r�nler] ADD [Tedarik�iId] INT NULL
ALTER TABLE [�r�nler] ADD  CONSTRAINT FK_�r�nler_Tedarik�i FOREIGN KEY([Tedarik�iId]) REFERENCES [Tedarik�iler]([Tedarik�iId])

INSERT INTO [M��teriler] VALUES ('Berke','Ba�','�stanbul','T�rkiye','11')
INSERT INTO [S�pari�ler] VALUES ('2015-8-3','1111111111','50',1)
INSERT INTO [�r�nler] VALUES ('PC','3000','1',0,NULL)
INSERT INTO [S�pari� Detaylar�] VALUES ('33','3',1,NULL)
INSERT INTO [Tedarik�iler] VALUES ('MAC','apple','Apple','�stanbul','T�rkiye','11111','111')
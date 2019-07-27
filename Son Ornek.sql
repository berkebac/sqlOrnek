CREATE TABLE [M��teriler]
(
[Id] INT NOT NULL IDENTITY PRIMARY KEY,
[Ad] NVARCHAR(30) NOT NULL,
[SoyAd] NVARCHAR(30) NOT NULL,
[�ehir] NVARCHAR(30) NOT NULL,
[�lke] NVARCHAR(30) NOT NULL,
[Telefon] NVARCHAR(15) NOT NULL,
)

CREATE TABLE [S�pari�ler]
(
[Id] INT NOT NULL IDENTITY PRIMARY KEY,
[S�pari�Tarihi] DATETIME NOT NULL,
[S�pari�Numaras�] NVARCHAR(10) NOT NULL,
[ToplamFiyat] DECIMAL(10,2) NOT NULL CONSTRAINT Check_Sipari�ler CHECK([ToplamFiyat]>=1),
--CONSTRAINT Check_Sipari�ler CHECK([ToplamFiyat]>=1) << Check k�s�d�n� alt sat�rdada yazab�l�r�z ver�ceg�m�z deg�sken�n yan�nada
[M��teriId] INT NULL

)

CREATE TABLE [S�pari� Detaylar�]
(
[S�pari�Detay�Id] INT NOT NULL IDENTITY PRIMARY KEY,
[BirimFiyat] DECIMAL(10,2) NOT NULL,
[Adet] INT NOT NULL,
[S�pari�Id] INT NULL,
[�r�nId] INT NULL
)

CREATE TABLE [�r�nler]
(
[Id] INT NOT NULL IDENTITY PRIMARY KEY,
[�r�nAd�] NVARCHAR(20) NOT NULL,
[BirimFiyat] DECIMAL(10,2) NOT NULL,
[Paket] NVARCHAR(20) NOT NULL,
[StokDurumu] BIT NOT NULL DEFAULT(0),
[Tedarik�iId] INT NULL

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

)

-- ALTER TABLE [FK Eklen�cek Tablo Ad�] ADD CONSTRAINT [FK ad�] FOREIGN KEY([FK baglan�cak yer]) REFERENCES [Hangi Tablodan Al�n�cag�]([Al�n�c�k tablodak� Id)]
ALTER TABLE [S�pari�ler] ADD  CONSTRAINT FK_S�pari�ler_M��teri FOREIGN KEY([M��teriId]) REFERENCES [M��teriler]([Id])


ALTER TABLE [S�pari� Detaylar�] ADD  CONSTRAINT FK_S�pari�Detaylar�_S�par�� FOREIGN KEY([S�pari�Id]) REFERENCES [S�pari�ler]([Id])
ALTER TABLE [S�pari� Detaylar�] ADD  CONSTRAINT FK_S�pari�Detaylar�_�r�n FOREIGN KEY([�r�nId]) REFERENCES [�r�nler]([Id])


ALTER TABLE [�r�nler] ADD  CONSTRAINT FK_�r�nler_Tedarik�i FOREIGN KEY([Tedarik�iId]) REFERENCES [Tedarik�iler]([Id])

INSERT INTO [M��teriler] VALUES ('Berke','Ba�','�stanbul','T�rkiye','11')
INSERT INTO [S�pari�ler] VALUES ('2015-8-3','1111111111','50',1)
INSERT INTO [�r�nler] VALUES ('PC','3000','1',0,NULL)
INSERT INTO [S�pari� Detaylar�] VALUES ('33','3',1,NULL)
INSERT INTO [Tedarik�iler] VALUES ('MAC','apple','Apple','�stanbul','T�rkiye','11111','111')
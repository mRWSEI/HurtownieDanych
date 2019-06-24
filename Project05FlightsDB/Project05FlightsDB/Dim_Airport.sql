CREATE TABLE [DimAirports] (
	[Air_Id] int identity(1,1),
    [Air_IATACode] nvarchar(4),
    [Air_AirportName] nvarchar(50),
    [Air_CityName] nvarchar(50),
    [Air_StateCode] nvarchar(2),
    [Air_Country] nvarchar(50),
    [Air_Latitude] numeric(14,10),
    [Air_Longitude] numeric(14,10),
	CONSTRAINT [PK_AirID] PRIMARY KEY ([Air_ID]),
	CONSTRAINT [UQ_AirIATACode] UNIQUE (Air_IATACode) 
)

CREATE PROCEDURE dbo.DimAirportsNNRow
AS
BEGIN
	SET IDENTITY_INSERT DimAirports ON
	
		INSERT INTO DimAirports(Air_Id, Air_IATACode, Air_AirportName,
		Air_CityName, Air_StateCode, Air_Country, Air_Latitude, Air_Longitude)
		VALUES (-1, 'XNN', 'UNKNOWN',
		'UNKNOWN', '-', '-', NULL, NULL)

	SET IDENTITY_INSERT DimAirports OFF
END

EXEC dbo.DimAirportsNNRow

SELECT * FROM DimAirports
CREATE PROCEDURE [dbo].[DimAirportsNNRow]
AS
BEGIN
	SET IDENTITY_INSERT DimAirports ON
	
		INSERT INTO DimAirports(Air_Id, Air_IATACode, Air_AirportName,
		Air_CityName, Air_StateCode, Air_Country, Air_Latitude, Air_Longitude)
		VALUES (-1, '-1', 'UNKNOWN',
		'UNKNOWN', '-', '-', NULL, NULL)

	SET IDENTITY_INSERT DimAirports OFF
END
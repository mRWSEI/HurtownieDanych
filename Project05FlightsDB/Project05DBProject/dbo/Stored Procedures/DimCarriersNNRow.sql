CREATE PROCEDURE [dbo].[DimCarriersNNRow]
AS
BEGIN
	SET IDENTITY_INSERT DimCarriers ON
	
		INSERT INTO DimCarriers(Car_ID, Car_Code, Car_Description)
		VALUES (-1, '-1', 'UNKNOWN')

	SET IDENTITY_INSERT DimCarriers OFF
END
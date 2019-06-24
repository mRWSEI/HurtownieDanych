CREATE TABLE [DimCarriers] (
	[Car_Id] int identity(1,1),
    [Car_Code] nvarchar(10),
    [Car_Description] nvarchar(100),
 	CONSTRAINT [PK_CarID] PRIMARY KEY ([Car_Id]),
	CONSTRAINT [UQ_CarDescription] UNIQUE (Car_Code) 
)

CREATE PROCEDURE dbo.DimCarriersNNRow
AS
BEGIN
	SET IDENTITY_INSERT DimCarriers ON
	
		INSERT INTO DimCarriers(Car_ID, Car_Code, Car_Description)
		VALUES (-1, 'XNN', 'UNKNOWN')

	SET IDENTITY_INSERT DimCarriers OFF
END

EXEC dbo.DimCarriersNNRow

select * from DimCarriers
CREATE TABLE [DimPlaneData] (
	[Pld_Id] int identity(1,1),
    [Pld_TailnumCode] nvarchar(10),
    [Pld_Type] nvarchar(20),
	[Pld_Manufacturer] nvarchar(30),
	[Pld_IssueDate] date,
	[Pld_Model] nvarchar(20),
	[Pld_Status] nvarchar(20),
	[Pld_AircraftType] nvarchar(30),
	[Pld_EngineType] nvarchar(15),
	[Pld_Year] int
 	CONSTRAINT [PK_PldID] PRIMARY KEY ([Pld_Id]),
	CONSTRAINT [UQ_PldTailnumCode] UNIQUE (Pld_TailnumCode) 
)

CREATE PROCEDURE dbo.DimPlaneDataNNRow
AS
BEGIN
	SET IDENTITY_INSERT DimPlaneData ON
	
		INSERT INTO DimPlaneData(Pld_Id, Pld_TailnumCode, Pld_Type, Pld_Manufacturer, Pld_IssueDate,
		Pld_Model, Pld_Status, Pld_AircraftType, Pld_EngineType, Pld_Year)
		VALUES (-1, 'XNN', 'UNKNOWN', 'UNKNOWN', NULL,
		'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', NULL)

	SET IDENTITY_INSERT DimPlaneData OFF
END

EXEC dbo.DimPlaneDataNNRow

select * from DimPlaneData

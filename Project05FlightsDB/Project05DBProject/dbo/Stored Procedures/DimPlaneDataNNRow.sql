CREATE PROCEDURE [dbo].[DimPlaneDataNNRow]
AS
BEGIN
	SET IDENTITY_INSERT DimPlaneData ON
	
		INSERT INTO DimPlaneData(Pld_Id, Pld_TailnumCode, Pld_Type, Pld_Manufacturer, Pld_IssueDate,
		Pld_Model, Pld_Status, Pld_AircraftType, Pld_EngineType, Pld_Year)
		VALUES (-1, '-1', 'UNKNOWN', 'UNKNOWN', NULL,
		'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', NULL)

	SET IDENTITY_INSERT DimPlaneData OFF
END
CREATE VIEW TheFastestAirplanesByManufacturer 
AS
select TOP 100 PERCENT 
AVG(cast(Fli_Distance as decimal(8,2))/ cast(Fli_CRSElapsedTime as decimal(8,2)) * 60) as AVGSpeed
, AVG(Fli_Distance) as AVGDistance, AVG(Fli_CRSElapsedTime) as AVGTime 
, p.Pld_EngineType, p.Pld_Manufacturer, p.Pld_Model, p.Pld_Status, p.Pld_TailnumCode, p.Pld_Type, p.Pld_Year,
DENSE_RANK() OVER (PARTITION BY Pld_Manufacturer ORDER BY AVG(cast(Fli_Distance as decimal(8,2))/ cast(Fli_CRSElapsedTime as decimal(8,2)) * 60) DESC ) as [Rank]
from FactFlights f 
left join DimPlaneData p on f.Fli_PlaneDataKey=p.Pld_Id
where cast(Fli_CRSElapsedTime as int) > 0
GROUP BY p.Pld_EngineType, p.Pld_Manufacturer, p.Pld_Model, p.Pld_Status, p.Pld_TailnumCode, p.Pld_Type, p.Pld_Year
order by AVGSpeed desc
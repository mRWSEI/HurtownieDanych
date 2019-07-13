
CREATE VIEW raporty.ArriveDestStatisticsTime
AS
select TOP 100 PERCENT dest.Air_AirPortName as AirportName,
MIN(cast(Fli_ArrDelay as int)) as MinArriveTime, AVG(cast(Fli_ArrDelay as int)) as AvgArriveTime, MAX(cast(Fli_ArrDelay as int)) as MaxArriveTime,
MIN(cast(Fli_DepDelay as int)) as MinDepartmendDelay , AVG(cast(Fli_DepDelay as int)) as AVGDepartmendDelay, Max(cast(Fli_DepDelay as int)) as MaxDepartmendDelay 
from FactFlights f 
left join DimAirports dest on f.Fli_AirPortsDestinationKey=dest.Air_Id
left join DimAirports origin on f.Fli_AirPortsOriginKey=origin.Air_Id
group by dest.Air_AirportName
ORDER BY AirportName
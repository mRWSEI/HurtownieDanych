
CREATE VIEW raporty.Top10Destinations
AS
select TOP 10 dest.Air_StateCode, ROW_NUMBER() OVER (Order by Count(dest.Air_StateCode) DESC, dest.Air_StateCode) as Number, Count(dest.Air_StateCode) as [Count] from FactFlights f 
left join DimAirports dest on f.Fli_AirPortsDestinationKey=dest.Air_Id
group by Air_StateCode
ORDER BY [Count] desc

CREATE VIEW raporty.MostUsedPlanes
AS
select DENSE_RANK() OVER (ORDER BY count(f.Fli_CarriersKey) DESC) as [Rank], count(f.Fli_CarriersKey) as FliesCount, carr.Car_Code, carr.Car_Description, plane.Pld_Manufacturer, plane.Pld_Status, plane.Pld_TailnumCode, plane.Pld_Year from FactFlights f
left join DimCarriers carr on f.Fli_CarriersKey=carr.Car_Id
left join DimPlaneData	 plane on plane.Pld_Id=f.Fli_PlaneDataKey
WHERE f.Fli_CarriersKey>0 and f.Fli_PlaneDataKey>0
GROUP BY carr.Car_Code, carr.Car_Description, plane.Pld_Manufacturer, plane.Pld_Manufacturer, plane.Pld_Status, plane.Pld_TailnumCode, plane.Pld_Year
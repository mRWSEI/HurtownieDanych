CREATE TABLE [dbo].[DimAirports] (
    [Air_Id]          INT              IDENTITY (1, 1) NOT NULL,
    [Air_IATACode]    NVARCHAR (4)     NULL,
    [Air_AirportName] NVARCHAR (50)    NULL,
    [Air_CityName]    NVARCHAR (50)    NULL,
    [Air_StateCode]   NVARCHAR (2)     NULL,
    [Air_Country]     NVARCHAR (50)    NULL,
    [Air_Latitude]    NUMERIC (14, 10) NULL,
    [Air_Longitude]   NUMERIC (14, 10) NULL,
    CONSTRAINT [PK_AirID] PRIMARY KEY CLUSTERED ([Air_Id] ASC),
    CONSTRAINT [UQ_AirIATACode] UNIQUE NONCLUSTERED ([Air_IATACode] ASC)
);


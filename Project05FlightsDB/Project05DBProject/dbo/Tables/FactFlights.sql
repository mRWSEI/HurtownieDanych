CREATE TABLE [dbo].[FactFlights] (
    [Fli_Id]                     INT           IDENTITY (1, 1) NOT NULL,
    [Fli_DateKey]                INT           NULL,
    [Fli_AirPortsOriginKey]      INT           NULL,
    [Fli_AirPortsDestinationKey] INT           NULL,
    [Fli_CarriersKey]            INT           NULL,
    [Fli_PlaneDataKey]           INT           NULL,
    [Fli_DepTime]                NVARCHAR (4)  NULL,
    [Fli_CRSDepTime]             SMALLINT      NULL,
    [Fli_ArrTime]                NVARCHAR (4)  NULL,
    [Fli_CRSArrTime]             SMALLINT      NULL,
    [Fli_UniqueCarrier]          NVARCHAR (2)  NULL,
    [Fli_FlightNum]              SMALLINT      NULL,
    [Fli_TailNum]                NVARCHAR (50) NULL,
    [Fli_ActualElapsedTime]      NVARCHAR (5)  NULL,
    [Fli_CRSElapsedTime]         SMALLINT      NULL,
    [Fli_AirTime]                NVARCHAR (5)  NULL,
    [Fli_ArrDelay]               NVARCHAR (5)  NULL,
    [Fli_DepDelay]               NVARCHAR (5)  NULL,
    [Fli_Origin]                 NVARCHAR (3)  NULL,
    [Fli_Dest]                   NVARCHAR (3)  NULL,
    [Fli_Distance]               SMALLINT      NULL,
    [Fli_TaxiIn]                 NVARCHAR (5)  NULL,
    [Fli_TaxiOut]                NVARCHAR (5)  NULL,
    [Fli_Cancelled]              SMALLINT      NULL,
    [Fli_CancellationCode]       NVARCHAR (1)  NULL,
    [Fli_Diverted]               SMALLINT      NULL,
    [Fli_TailNumId]              INT           NULL,
    [Fli_CarrierDelay]           NVARCHAR (5)  NULL,
    [Fli_WeatherDelay]           NVARCHAR (5)  NULL,
    [Fli_NASDelay]               NVARCHAR (5)  NULL,
    [Fli_SecurityDelay]          NVARCHAR (5)  NULL,
    [Fli_LateAircraftDelay]      NVARCHAR (5)  NULL,
    [Fli_PackageStartTime]       DATETIME      NULL,
    [Fli_PackageFileName]        NVARCHAR (50) NULL,
    CONSTRAINT [PK__FactFlig__F048FBC4640A5D0B] PRIMARY KEY CLUSTERED ([Fli_Id] ASC)
);






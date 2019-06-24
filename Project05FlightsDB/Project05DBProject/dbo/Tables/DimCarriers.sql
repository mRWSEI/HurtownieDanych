CREATE TABLE [dbo].[DimCarriers] (
    [Car_Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Car_Code]        NVARCHAR (10)  NULL,
    [Car_Description] NVARCHAR (100) NULL,
    CONSTRAINT [PK_CarID] PRIMARY KEY CLUSTERED ([Car_Id] ASC),
    CONSTRAINT [UQ_CarDescription] UNIQUE NONCLUSTERED ([Car_Code] ASC)
);


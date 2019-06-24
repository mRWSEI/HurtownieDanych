CREATE TABLE [dbo].[DimPlaneData] (
    [Pld_Id]           INT           IDENTITY (1, 1) NOT NULL,
    [Pld_TailnumCode]  NVARCHAR (10) NULL,
    [Pld_Type]         NVARCHAR (20) NULL,
    [Pld_Manufacturer] NVARCHAR (30) NULL,
    [Pld_IssueDate]    DATE          NULL,
    [Pld_Model]        NVARCHAR (20) NULL,
    [Pld_Status]       NVARCHAR (20) NULL,
    [Pld_AircraftType] NVARCHAR (30) NULL,
    [Pld_EngineType]   NVARCHAR (15) NULL,
    [Pld_Year]         INT           NULL,
    CONSTRAINT [PK_PldID] PRIMARY KEY CLUSTERED ([Pld_Id] ASC),
    CONSTRAINT [UQ_PldTailnumCode] UNIQUE NONCLUSTERED ([Pld_TailnumCode] ASC)
);


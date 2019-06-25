CREATE TABLE [dbo].[DimDate] (
    [Dat_DateKey]                INT           NOT NULL,
    [Dat_FullDate]               DATE          NOT NULL,
    [Dat_DayNumberOfWeek]        TINYINT       NOT NULL,
    [Dat_DayNameOfWeek]          NVARCHAR (10) NOT NULL,
    [Dat_WeekDayType]            NVARCHAR (7)  NOT NULL,
    [Dat_DayNumberOfMonth]       TINYINT       NOT NULL,
    [Dat_DayNumberOfYear]        SMALLINT      NOT NULL,
    [Dat_WeekNumberOfYear]       TINYINT       NOT NULL,
    [Dat_MonthNameOfYear]        NVARCHAR (10) NOT NULL,
    [Dat_MonthNumberOfYear]      TINYINT       NOT NULL,
    [Dat_QuarterNumberCalendar]  TINYINT       NOT NULL,
    [Dat_QuarterNameCalendar]    NCHAR (2)     NOT NULL,
    [Dat_SemesterNumberCalendar] TINYINT       NOT NULL,
    [Dat_SemesterNameCalendar]   NVARCHAR (15) NOT NULL,
    [Dat_YearCalendar]           SMALLINT      NOT NULL,
    [Dat_MonthNumberFiscal]      TINYINT       NOT NULL,
    [Dat_QuarterNumberFiscal]    TINYINT       NOT NULL,
    [Dat_QuarterNameFiscal]      NCHAR (2)     NOT NULL,
    [Dat_SemesterNumberFiscal]   TINYINT       NOT NULL,
    [Dat_SemesterNameFiscal]     NVARCHAR (15) NOT NULL,
    [Dat_YearFiscal]             SMALLINT      NOT NULL,
    CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED ([Dat_DateKey] ASC)
);




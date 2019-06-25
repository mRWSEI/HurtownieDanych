ALTER PROCEDURE dbo.DimDateFillUp @DateCalendarStart datetime, @DateCalendarEnd datetime
AS
BEGIN

--declare @DateCalendarStart datetime = '2015-01-01'
--declare @DateCalendarEnd datetime = '2019-12-31'

drop table if exists dimDate
create	table dbo.DimDate 
(
    Dat_DateKey                 int not null,
    Dat_FullDate                date not null,
    Dat_DayNumberOfWeek         tinyint not null,
    Dat_DayNameOfWeek           nvarchar(10) not null,
    Dat_WeekDayType             nvarchar(7) not null,
    Dat_DayNumberOfMonth        tinyint not null,
    Dat_DayNumberOfYear         smallint not null,
    Dat_WeekNumberOfYear        tinyint not null,
    Dat_MonthNameOfYear         nvarchar(10) not null,
    Dat_MonthNumberOfYear       tinyint not null,
    Dat_QuarterNumberCalendar   tinyint not null,
    Dat_QuarterNameCalendar     nchar(2) not null,
    Dat_SemesterNumberCalendar  tinyint not null,
    Dat_SemesterNameCalendar    nvarchar(15) not null,
    Dat_YearCalendar            smallint not null,
    Dat_MonthNumberFiscal       tinyint not null,
    Dat_QuarterNumberFiscal     tinyint not null,
    Dat_QuarterNameFiscal       nchar(2) not null,
    Dat_SemesterNumberFiscal    tinyint not null,
    Dat_SemesterNameFiscal      nvarchar(15) not null,
    Dat_YearFiscal              smallint not null
 
    constraint PK_DimDate primary key clustered  
    (
        Dat_DateKey asc
    )
) 

declare @FiscalCounter      date,
        @FiscalMonthOffset  int;
 
-- Set this to the number of months to add or extract to the current date to get the beginning 
-- of the Fiscal Year. Example: If the Fiscal Year begins July 1, assign the value of 6 
-- to the @FiscalMonthOffset variable. Negative values are also allowed, thus if your 
-- 2012 Fiscal Year begins in July of 2011, assign a value of -6.
set @FiscalMonthOffset = 6;
 
with DateDimension  
as
(
    select  @DateCalendarStart as DateCalendarValue,
            dateadd(m, @FiscalMonthOffset, @DateCalendarStart) as FiscalCounter
                 
    union all
     
    select  DateCalendarValue + 1,
            dateadd(m, @FiscalMonthOffset, (DateCalendarValue + 1)) as FiscalCounter
    from    DateDimension 
    where   DateCalendarValue + 1 < = @DateCalendarEnd
)
insert into dbo.DimDate (Dat_DateKey, Dat_FullDate, Dat_DayNumberOfWeek, Dat_DayNameOfWeek, Dat_WeekDayType, 
                        Dat_DayNumberOfMonth, Dat_DayNumberOfYear, Dat_WeekNumberOfYear, Dat_MonthNameOfYear, 
                        Dat_MonthNumberOfYear, Dat_QuarterNumberCalendar, Dat_QuarterNameCalendar, Dat_SemesterNumberCalendar, 
                        Dat_SemesterNameCalendar, Dat_YearCalendar, Dat_MonthNumberFiscal, Dat_QuarterNumberFiscal, 
                        Dat_QuarterNameFiscal, Dat_SemesterNumberFiscal, Dat_SemesterNameFiscal, Dat_YearFiscal)
select  cast(convert(varchar(25), DateCalendarValue, 112) as int) as 'DateKey',
        cast(DateCalendarValue as date) as 'FullDate',
        datepart(weekday, DateCalendarValue) as 'DayNumberOfWeek',
        datename(weekday, DateCalendarValue) as 'DayNameOfWeek',
        case datename(dw, DateCalendarValue)
            when 'Saturday' then 'Weekend'
            when 'Sunday' then 'Weekend'
        else 'Weekday'
        end as 'WeekDayType',
        datepart(day, DateCalendarValue) as'DayNumberOfMonth',
        datepart(dayofyear, DateCalendarValue) as 'DayNumberOfYear',
        datepart(week, DateCalendarValue) as 'WeekNumberOfYear',
        datename(month, DateCalendarValue) as 'MonthNameOfYear',
        datepart(month, DateCalendarValue) as 'MonthNumberOfYear',
        datepart(quarter, DateCalendarValue) as 'QuarterNumberCalendar',
        'Q' + cast(datepart(quarter, DateCalendarValue) as nvarchar) as 'QuarterNameCalendar',
        case
            when datepart(month, DateCalendarValue) <= 6 then 1
            when datepart(month, DateCalendarValue) > 6 then 2
        end as 'SemesterNumberCalendar',
        case
            when datepart(month, DateCalendarValue) < = 6 then 'First Semester'
            when datepart(month, DateCalendarValue) > 6 then 'Second Semester' 
        end as 'SemesterNameCalendar',
        datepart(year, DateCalendarValue) as 'YearCalendar',
        datepart(month, FiscalCounter) as 'MonthNumberFiscal',
        datepart(quarter, FiscalCounter) as 'QuarterNumberFiscal',
        'Q' + cast(datepart(quarter, FiscalCounter) as nvarchar) as 'QuarterNameFiscal',  
        case
            when datepart(month, FiscalCounter) < = 6 then 1
            when datepart(month, FiscalCounter) > 6 then 2 
        end as 'SemesterNumberFiscal',  
        case
            when datepart(month, FiscalCounter) < = 6 then 'First Semester'
            when  datepart(month, FiscalCounter) > 6 then 'Second Semester'
        end as 'SemesterNameFiscal',            
        datepart(year, FiscalCounter) as 'YearFiscal'
from    DateDimension
order by
        DateCalendarValue
option (maxrecursion 0);

END


EXEC dbo.DimDateFillUp '2015-01-01', '2019-12-31'



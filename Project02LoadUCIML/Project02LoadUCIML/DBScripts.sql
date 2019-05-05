if not exists (select * from sysobjects where name='Abalone' and xtype='U')
	CREATE TABLE [Abalone] (
		[Sex] varchar(1),
		[Length] numeric(10,5),
		[Diameter] numeric(10,5),
		[Height] numeric(10,5),
		[WholeWeight] numeric(10,5),
		[ShuckedWeight] numeric(10,5),
		[VisceraWeight] numeric(10,5),
		[ShellWeight] numeric(10,5),
		[Rings] int
	)
go


if not exists (select * from sysobjects where name='Adult' and xtype='U')
	CREATE TABLE [Adult] (
    [age] int,
    [workclass] varchar(40),
    [fnlwgt] int,
    [education] varchar(40),
    [education-num] int,
    [marital-status] varchar(30),
    [occupation] varchar(40),
    [relationship] varchar(40),
    [race] varchar(40),
    [sex] varchar(10),
    [capital-gain] int,
    [capital-loss] int,
    [hours-per-week] int,
    [native-country] varchar(40),
    [city-population] varchar(50)
)
go

if not exists (select * from sysobjects where name='PackageLogs' and xtype='U')
CREATE TABLE [PackageLogs] (
	[StartDate] datetime,
	[StartedBy] varchar(100),
	[PackageName] varchar(100)
)
go

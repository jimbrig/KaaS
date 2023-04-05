# SQL - Create Date Dimension with Fiscal Years

*Source: [Create \[Date\] Dimension with Fiscal Years | thiscodeWorks](https://www.thiscodeworks.com/61faf438b783be0015bbaf84)*

````SQL
BEGIN TRY
    DROP TABLE [Dim].[Date]
END TRY
 
BEGIN CATCH
    /*No Action*/
END CATCH
 
CREATE TABLE [Dim].[Date]
(
    [DateKey] INT primary key, 
    [Date] DATETIME,
    [FullDate] CHAR(10),-- Date in MM-dd-yyyy format
    [DayOfMonth] VARCHAR(2), -- Field will hold day number of Month
    [DaySuffix] VARCHAR(4), -- Apply suffix as 1st, 2nd ,3rd etc
    [DayName] VARCHAR(9), -- Contains name of the day, Sunday, Monday 
    [DayOfWeek] CHAR(1),-- First Day Sunday=1 and Saturday=7
    [DayOfWeekInMonth] VARCHAR(2), --1st Monday or 2nd Monday in Month
    [DayOfWeekInYear] VARCHAR(2),
    [DayOfQuarter] VARCHAR(3), 
    [DayOfYear] VARCHAR(3),
    [WeekOfMonth] VARCHAR(1),-- Week Number of Month 
    [WeekOfQuarter] VARCHAR(2), --Week Number of the Quarter
    [WeekOfYear] VARCHAR(2),--Week Number of the Year
    [Month] VARCHAR(2), --Number of the Month 1 to 12
    [MonthName] VARCHAR(9),--January, February etc
    [MonthOfQuarter] VARCHAR(2),-- Month Number belongs to Quarter
    [Quarter] CHAR(1),
    [QuarterName] VARCHAR(9),--First,Second..
    [Year] CHAR(4),-- Year value of Date stored in Row
    [YearName] CHAR(7), --CY 2012,CY 2013
    [MonthYear] CHAR(10), --Jan-2013,Feb-2013
    [MMYYYY] CHAR(6),
    [FirstDayOfMonth] DATE,
    [LastDayOfMonth] DATE,
    [FirstDayOfQuarter] DATE,
    [LastDayOfQuarter] DATE,
    [FirstDayOfYear] DATE,
    [LastDayOfYear] DATE,
    [IsHoliday] BIT,-- Flag 1=National Holiday, 0-No National Holiday
    [IsWeekday] BIT,-- 0=Week End ,1=Week Day
    [HolidayName] VARCHAR(50),--Name of Holiday in US
)
GO
 
--=========================================================================================
--Specify Start Date and End date here
--Value of Start Date Must be Less than Your End Date 
--=========================================================================================
 
DECLARE @StartDate DATETIME = '12/29/2014' --Starting value of Date Range
DECLARE @EndDate DATETIME = '01/01/2100' --End Value of Date Range
 
--Temporary Variables To Hold the Values During Processing of Each Date of Year
DECLARE
    @DayOfWeekInMonth INT,
    @DayOfWeekInYear INT,
    @DayOfQuarter INT,
    @WeekOfMonth INT,
    @CurrentYear INT,
    @CurrentMonth INT,
    @CurrentQuarter INT
 
/*Table Data type to store the day of week count for the month and year*/
DECLARE @DayOfWeek TABLE
(
    DOW INT,
    MonthCount INT,
    QuarterCount INT,
    YearCount INT
)
 
INSERT INTO @DayOfWeek VALUES (1, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (2, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (3, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (4, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (5, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (6, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (7, 0, 0, 0)
 
--Extract and assign various parts of Values from Current Date to Variable
 
DECLARE @CurrentDate AS DATETIME = @StartDate
SET @CurrentMonth = DATEPART(MM, @CurrentDate)
SET @CurrentYear = DATEPART(YY, @CurrentDate)
SET @CurrentQuarter = DATEPART(QQ, @CurrentDate)
 
/********************************************************************************************/
--Proceed only if Start Date(Current date) is less than End date you specified above
 
WHILE @CurrentDate < @EndDate
/*Begin day of week logic*/
BEGIN
    /*Check for Change in Month of the Current date if Month changed then 
    Change variable value*/
    IF @CurrentMonth != DATEPART(MM, @CurrentDate) 
    BEGIN
        UPDATE @DayOfWeek
        SET [MonthCount] = 0
        SET @CurrentMonth = DATEPART(MM, @CurrentDate)
    END
 
    /* Check for Change in Quarter of the Current date if Quarter changed then change 
        Variable value*/
    IF @CurrentQuarter != DATEPART(QQ, @CurrentDate)
    BEGIN
        UPDATE @DayOfWeek
        SET [QuarterCount] = 0
        SET @CurrentQuarter = DATEPART(QQ, @CurrentDate)
    END
 
    /* Check for Change in Year of the Current date if Year changed then change 
        Variable value*/
    IF @CurrentYear != DATEPART(YY, @CurrentDate)
    BEGIN
        UPDATE @DayOfWeek
        SET YearCount = 0
        SET @CurrentYear = DATEPART(YY, @CurrentDate)
    END
 
    -- Set values in table data type created above from variables
    UPDATE @DayOfWeek
    SET 
        MonthCount = MonthCount + 1,
        QuarterCount = QuarterCount + 1,
        YearCount = YearCount + 1
    WHERE DOW = DATEPART(DW, @CurrentDate)
 
    SELECT
        @DayOfWeekInMonth = MonthCount,
        @DayOfQuarter = QuarterCount,
        @DayOfWeekInYear = YearCount
    FROM @DayOfWeek
    WHERE DOW = DATEPART(DW, @CurrentDate)
    
/*End day of week logic*/
 
 
/* Populate Your Dimension Table with values*/
    
    INSERT INTO [Dim].[Date]
    SELECT
        
        CONVERT (char(8),@CurrentDate,112) as 'DateKey',
        @CurrentDate AS 'Date',
        CONVERT (char(10),@CurrentDate,101) as 'FullDate',
        DATEPART(DD, @CurrentDate) AS 'DayOfMonth',
        --Apply Suffix values like 1st, 2nd 3rd etc..
        CASE 
            WHEN DATEPART(DD,@CurrentDate) IN (11,12,13) THEN CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'th'
            WHEN RIGHT(DATEPART(DD,@CurrentDate),1) = 1 THEN CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'st'
            WHEN RIGHT(DATEPART(DD,@CurrentDate),1) = 2 THEN CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'nd'
            WHEN RIGHT(DATEPART(DD,@CurrentDate),1) = 3 THEN CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'rd'
            ELSE CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'th' 
        END AS 'DaySuffix',
        
        DATENAME(DW, @CurrentDate) AS 'DayName',
        DATEPART(DW, @CurrentDate) AS 'DayOfWeek',
        @DayOfWeekInMonth AS 'DayOfWeekInMonth',
        @DayOfWeekInYear AS 'DayOfWeekInYear',
        @DayOfQuarter AS 'DayOfQuarter',
        DATEPART(DY, @CurrentDate) AS 'DayOfYear',
        DATEPART(WW, @CurrentDate) + 1 - DATEPART(WW, CONVERT(VARCHAR, DATEPART(MM, @CurrentDate)) + '/1/' + CONVERT(VARCHAR, DATEPART(YY, @CurrentDate))) AS 'WeekOfMonth',
        (DATEDIFF(DD, DATEADD(QQ, DATEDIFF(QQ, 0, @CurrentDate), 0), @CurrentDate) / 7) + 1 AS 'WeekOfQuarter',
        DATEPART(WW, @CurrentDate) AS 'WeekOfYear',
        DATEPART(MM, @CurrentDate) AS 'Month',
        DATENAME(MM, @CurrentDate) AS 'MonthName',
        CASE
            WHEN DATEPART(MM, @CurrentDate) IN (1, 4, 7, 10) THEN 1
            WHEN DATEPART(MM, @CurrentDate) IN (2, 5, 8, 11) THEN 2
            WHEN DATEPART(MM, @CurrentDate) IN (3, 6, 9, 12) THEN 3
        END AS 'MonthOfQuarter',
        DATEPART(QQ, @CurrentDate) AS 'Quarter',
        CASE DATEPART(QQ, @CurrentDate)
            WHEN 1 THEN 'First'
            WHEN 2 THEN 'Second'
            WHEN 3 THEN 'Third'
            WHEN 4 THEN 'Fourth'
        END AS 'QuarterName',
        DATEPART(YEAR, @CurrentDate) AS 'Year',
        'CY ' + CONVERT(VARCHAR, DATEPART(YEAR, @CurrentDate)) AS 'YearName',
        LEFT(DATENAME(MM, @CurrentDate), 3) + '-' + CONVERT(VARCHAR, DATEPART(YY, @CurrentDate)) AS 'MonthYear',
        RIGHT('0' + CONVERT(VARCHAR, DATEPART(MM, @CurrentDate)),2) + CONVERT(VARCHAR, DATEPART(YY, @CurrentDate)) AS 'MMYYYY',
        CONVERT(DATETIME, CONVERT(DATE, DATEADD(DD, - (DATEPART(DD, @CurrentDate) - 1), @CurrentDate))) AS 'FirstDayOfMonth',
        CONVERT(DATETIME, CONVERT(DATE, DATEADD(DD, - (DATEPART(DD, (DATEADD(MM, 1, @CurrentDate)))), DATEADD(MM, 1, @CurrentDate)))) AS 'LastDayOfMonth',
        DATEADD(QQ, DATEDIFF(QQ, 0, @CurrentDate), 0) AS 'FirstDayOfQuarter',
        DATEADD(QQ, DATEDIFF(QQ, -1, @CurrentDate), -1) AS 'LastDayOfQuarter',
        CONVERT(DATETIME, '01/01/' + CONVERT(VARCHAR, DATEPART(YY, @CurrentDate))) AS 'FirstDayOfYear',
        CONVERT(DATETIME, '12/31/' + CONVERT(VARCHAR, DATEPART(YY, @CurrentDate))) AS 'LastDayOfYear',
        NULL AS 'IsHoliday',
        CASE DATEPART(DW, @CurrentDate)
            WHEN 1 THEN 0
            WHEN 2 THEN 1
            WHEN 3 THEN 1
            WHEN 4 THEN 1
            WHEN 5 THEN 1
            WHEN 6 THEN 1
            WHEN 7 THEN 0
        END AS 'IsWeekday',
        NULL AS 'HolidayName'
 
    SET @CurrentDate = DATEADD(DD, 1, @CurrentDate)
END
        
--============================================================================
-- Step 3.
-- Update Values of Holiday as per USA Govt. Declaration for National Holiday.
--============================================================================
 
/*Update HOLIDAY Field of USA In dimension*/
    /* New Years Day - January 1 */
    UPDATE [Dim].[Date]
        SET HolidayName = 'New Year''s Day'
    WHERE [Month] = 1 AND [DayOfMonth] = 1
 
    /* Martin Luther King, Jr. Day - Third Monday in January starting in 1983 */
    UPDATE [Dim].[Date]
        SET HolidayName = 'Martin Luther King, Jr. Day'
    WHERE
        [Month] = 1 AND
        [DayOfWeek] = 'Monday' AND
        [Year] >= 1983 AND
        DayOfWeekInMonth = 3
 
    /* Valentine's Day - February 14 */
    UPDATE [Dim].[Date]
        SET HolidayName = 'Valentine''s Day'
    WHERE
        [Month] = 2 AND
        [DayOfMonth] = 14
 
    /* President's Day - Third Monday in February */
    UPDATE [Dim].[Date]
        SET HolidayName = 'President''s Day'
    WHERE
        [Month] = 2 AND
        [DayOfWeek] = 'Monday' AND
        [DayOfWeekInMonth] = 3
 
    /* Saint Patrick's Day */
    UPDATE [Dim].[Date]
        SET HolidayName = 'Saint Patrick''s Day'
    WHERE
        [Month] = 3 AND
        [DayOfMonth] = 17
 
    /* Memorial Day - Last Monday in May */
    UPDATE [Dim].[Date]
        SET HolidayName = 'Memorial Day'
    FROM [Dim].[Date]
    WHERE DateKey IN 
    (
        SELECT
            MAX(DateKey)
        FROM [Dim].[Date]
        WHERE
            [MonthName] = 'May' AND
            [DayOfWeek] = 'Monday'
        GROUP BY
            [Year],
            [Month]
    )
 
    /* Mother's Day - Second Sunday of May */
    UPDATE [Dim].[Date]
        SET HolidayName = 'Mother''s Day'
    WHERE
        [Month] = 5 AND
        [DayOfWeek] = 'Sunday' AND
        [DayOfWeekInMonth] = 2
 
    /* Father's Day - Third Sunday of June */
    UPDATE [Dim].[Date]
        SET HolidayName = 'Father''s Day'
    WHERE
        [Month] = 6 AND
        [DayOfWeek] = 'Sunday' AND
        [DayOfWeekInMonth] = 3
 
    /* Independence Day */
    UPDATE [Dim].[Date]
        SET HolidayName = 'Independance Day'
    WHERE [Month] = 7 AND [DayOfMonth] = 4
 
    /* Labor Day - First Monday in September */
    UPDATE [Dim].[Date]
        SET HolidayName = 'Labor Day'
    FROM [Dim].[Date]
    WHERE DateKey IN 
    (
        SELECT
            MIN(DateKey)
        FROM [Dim].[Date]
        WHERE
            [MonthName] = 'September' AND
            [DayOfWeek] = 'Monday'
        GROUP BY
            [Year],
            [Month]
    )
 
    /* Columbus Day - Second MONDAY in October */
    UPDATE [Dim].[Date]
        SET HolidayName = 'Columbus Day'
    WHERE
        [Month] = 10 AND
        [DayOfWeek] = 'Monday' AND
        [DayOfWeekInMonth] = 2
 
    /* Halloween - 10/31 */
    UPDATE [Dim].[Date]
        SET HolidayName = 'Halloween'
    WHERE
        [Month] = 10 AND
        [DayOfMonth] = 31
 
    /* Veterans Day - November 11 */
    UPDATE [Dim].[Date]
        SET HolidayName = 'Veterans Day'
    WHERE
        [Month] = 11 AND
        [DayOfMonth] = 11
    
    /* Thanksgiving - Fourth THURSDAY in November */
    UPDATE [Dim].[Date]
        SET HolidayName = 'Thanksgiving Day'
    WHERE
        [Month] = 11 AND
        [DayOfWeek] = 'Thursday' AND
        [DayOfWeekInMonth] = 4
 
    /* Christmas */
    UPDATE [Dim].[Date]
        SET HolidayName = 'Christmas Day'
    WHERE [Month] = 12 AND
          [DayOfMonth]  = 25
    
    /* Election Day - The first Tuesday after the first Monday in November */
    BEGIN
    DECLARE @Holidays TABLE
    (
        [ID] INT IDENTITY(1,1),
        [DateID] INT,
        [Week] TINYINT,
        [Year] CHAR(4),
        [Day] CHAR(2)
    )
 
        INSERT INTO @Holidays([DateID], [Year], [Day])
            SELECT
                [DateKey],
                [Year],
                [DayOfMonth] 
            FROM [Dim].[Date]
            WHERE
                [Month] = 11 AND 
                [DayOfWeek] = 'Monday'
            ORDER BY
                [Year],
                [DayOfMonth]
 
        DECLARE @CNTR INT,
                @POS INT,
                @STARTYEAR INT,
                @ENDYEAR INT,
                @MINDAY INT
 
        SELECT @CURRENTYEAR = MIN([Year])
             , @STARTYEAR = MIN([Year])
             , @ENDYEAR = MAX([Year])
        FROM @Holidays
 
        WHILE @CURRENTYEAR <= @ENDYEAR
        BEGIN
            SELECT @CNTR = COUNT([Year])
            FROM @Holidays
            WHERE [Year] = @CURRENTYEAR
 
            SET @POS = 1
 
            WHILE @POS <= @CNTR
            BEGIN
                SELECT @MINDAY = MIN(DAY)
                FROM @Holidays
                WHERE
                    [Year] = @CURRENTYEAR AND
                    [Week] IS NULL
 
                UPDATE @Holidays
                    SET [Week] = @POS
                WHERE
                    [Year] = @CURRENTYEAR AND
                    [Day] = @MINDAY
 
                SELECT @POS = @POS + 1
            END
 
            SELECT @CURRENTYEAR = @CURRENTYEAR + 1
        END
 
        UPDATE [Dim].[Date]
            SET HolidayName  = 'Election Day'
        FROM [Dim].[Date] DT
            JOIN @Holidays HL ON (HL.DateID + 1) = DT.DateKey
        WHERE
            [Week] = 1
    END
    --set flag for USA holidays in Dimension
    UPDATE [Dim].[Date]
        SET IsHoliday = CASE WHEN HolidayName IS NULL THEN 0
                                WHEN HolidayName IS NOT NULL THEN 1 END
 
/*****************************************************************************************/
 
/* Add Fiscal Calendar columns into table DimDate */
 
ALTER TABLE [Dim].[Date] ADD
    [FiscalDayOfYear] VARCHAR(3),
    [FiscalWeekOfYear] VARCHAR(3),
    [FiscalMonth] VARCHAR(2), 
    [FiscalQuarter] CHAR(1),
    [FiscalQuarterName] VARCHAR(9),
    [FiscalYear] CHAR(4),
    [FiscalYearName] CHAR(7),
    [FiscalMonthYear] CHAR(10),
    [FiscalMMYYYY] CHAR(6),
    [FiscalFirstDayOfMonth] DATE,
    [FiscalLastDayOfMonth] DATE,
    [FiscalFirstDayOfQuarter] DATE,
    [FiscalLastDayOfQuarter] DATE,
    [FiscalFirstDayOfYear] DATE,
    [FiscalLastDayOfYear] DATE
 
GO
 
/***************************************************************************
The following section needs to be populated for defining the fiscal calendar
***************************************************************************/
 
DECLARE
    @dtFiscalYearStart SMALLDATETIME = 'December 29, 2014',
    @FiscalYear INT = 2015,
    @LastYear INT = 2100,
    @FirstLeapYearInPeriod INT = 2012
 
/*****************************************************************************************/
 
DECLARE
    @iTemp INT,
    @LeapWeek INT,
    @CurrentDate DATETIME,
    @FiscalDayOfYear INT,
    @FiscalWeekOfYear INT,
    @FiscalMonth INT,
    @FiscalQuarter INT,
    @FiscalQuarterName VARCHAR(10),
    @FiscalYearName VARCHAR(7),
    @LeapYear INT,
    @FiscalFirstDayOfYear DATE,
    @FiscalFirstDayOfQuarter DATE,
    @FiscalFirstDayOfMonth DATE,
    @FiscalLastDayOfYear DATE,
    @FiscalLastDayOfQuarter DATE,
    @FiscalLastDayOfMonth DATE
 
/*Holds the years that have 455 in last quarter*/
 
DECLARE @LeapTable TABLE (leapyear INT)
 
/*TABLE to contain the fiscal year calendar*/
 
DECLARE @tb TABLE
(
    [PeriodDate] DATETIME,
    [FiscalDayOfYear] VARCHAR(3),
    [FiscalWeekOfYear] VARCHAR(3),
    [FiscalMonth] VARCHAR(2), 
    [FiscalQuarter] VARCHAR(1),
    [FiscalQuarterName] VARCHAR(9),
    [FiscalYear] VARCHAR(4),
    [FiscalYearName] VARCHAR(7),
    [FiscalMonthYear] VARCHAR(10),
    [FiscalMMYYYY] VARCHAR(6),
    [FiscalFirstDayOfMonth] DATE,
    [FiscalLastDayOfMonth] DATE,
    [FiscalFirstDayOfQuarter] DATE,
    [FiscalLastDayOfQuarter] DATE,
    [FiscalFirstDayOfYear] DATE,
    [FiscalLastDayOfYear] DATE
)
 
/*Populate the table with all leap years*/
 
SET @LeapYear = @FirstLeapYearInPeriod
WHILE (@LeapYear < @LastYear)
    BEGIN
        INSERT INTO @leapTable VALUES (@LeapYear)
        SET @LeapYear = @LeapYear + 6
    END
 
/*Initiate parameters before loop*/
 
SET @CurrentDate = @dtFiscalYearStart
SET @FiscalDayOfYear = 1
SET @FiscalWeekOfYear = 1
SET @FiscalMonth = 1
SET @FiscalQuarter = 1
SET @FiscalWeekOfYear = 1
 
IF (EXISTS (SELECT * FROM @LeapTable WHERE @FiscalYear = leapyear))
    BEGIN
        SET @LeapWeek = 1
    END
    ELSE
    BEGIN
        SET @LeapWeek = 0
    END
 
/*******************************************************************************************/
 
/* Loop on days in interval*/
 
WHILE (DATEPART(yy,@CurrentDate) <= @LastYear)
BEGIN
    
/*SET fiscal Month*/
    SELECT @FiscalMonth = CASE
        /* 
        /*Use this section for a 4-5-4 calendar.  
        Every leap year the result will be a 4-5-5*/
        WHEN @FiscalWeekOfYear BETWEEN 1 AND 4 THEN 1 /*4 weeks*/
        WHEN @FiscalWeekOfYear BETWEEN 5 AND 9 THEN 2 /*5 weeks*/
        WHEN @FiscalWeekOfYear BETWEEN 10 AND 13 THEN 3 /*4 weeks*/
        WHEN @FiscalWeekOfYear BETWEEN 14 AND 17 THEN 4 /*4 weeks*/
        WHEN @FiscalWeekOfYear BETWEEN 18 AND 22 THEN 5 /*5 weeks*/
        WHEN @FiscalWeekOfYear BETWEEN 23 AND 26 THEN 6 /*4 weeks*/
        WHEN @FiscalWeekOfYear BETWEEN 27 AND 30 THEN 7 /*4 weeks*/
        WHEN @FiscalWeekOfYear BETWEEN 31 AND 35 THEN 8 /*5 weeks*/
        WHEN @FiscalWeekOfYear BETWEEN 36 AND 39 THEN 9 /*4 weeks*/
        WHEN @FiscalWeekOfYear BETWEEN 40 AND 43 THEN 10 /*4 weeks*/
        WHEN @FiscalWeekOfYear BETWEEN 44 AND (48+@LeapWeek) THEN 11 /*5 weeks*/
        WHEN @FiscalWeekOfYear BETWEEN (49+@LeapWeek) AND (52+@LeapWeek) THEN 12 /*4 weeks (5 weeks on leap year)*/
        */
 
        /*Use this section for a 4-4-5 calendar.  
        Every leap year the result will be a 4-5-5*/
        WHEN @FiscalWeekOfYear BETWEEN 1 AND 4 THEN 1 /*4 weeks*/
        WHEN @FiscalWeekOfYear BETWEEN 5 AND 8 THEN 2 /*4 weeks*/
        WHEN @FiscalWeekOfYear BETWEEN 9 AND 13 THEN 3 /*5 weeks*/
        WHEN @FiscalWeekOfYear BETWEEN 14 AND 17 THEN 4 /*4 weeks*/
        WHEN @FiscalWeekOfYear BETWEEN 18 AND 21 THEN 5 /*4 weeks*/
        WHEN @FiscalWeekOfYear BETWEEN 22 AND 26 THEN 6 /*5 weeks*/
        WHEN @FiscalWeekOfYear BETWEEN 27 AND 30 THEN 7 /*4 weeks*/
        WHEN @FiscalWeekOfYear BETWEEN 31 AND 34 THEN 8 /*4 weeks*/
        WHEN @FiscalWeekOfYear BETWEEN 35 AND 39 THEN 9 /*5 weeks*/
        WHEN @FiscalWeekOfYear BETWEEN 40 AND 43 THEN 10 /*4 weeks*/
        WHEN @FiscalWeekOfYear BETWEEN 44 AND (47+@leapWeek) THEN 11 /*4 weeks (5 weeks on leap year)*/
        WHEN @FiscalWeekOfYear BETWEEN (48 + @leapWeek) AND (52 + @leapWeek) THEN 12 /*5 weeks*/
        
    END
 
    /*SET Fiscal Quarter*/
    SELECT @FiscalQuarter = CASE 
        WHEN @FiscalMonth BETWEEN 1 AND 3 THEN 1
        WHEN @FiscalMonth BETWEEN 4 AND 6 THEN 2
        WHEN @FiscalMonth BETWEEN 7 AND 9 THEN 3
        WHEN @FiscalMonth BETWEEN 10 AND 12 THEN 4
    END
    
    SELECT @FiscalQuarterName = CASE 
        WHEN @FiscalMonth BETWEEN 1 AND 3 THEN 'First'
        WHEN @FiscalMonth BETWEEN 4 AND 6 THEN 'Second'
        WHEN @FiscalMonth BETWEEN 7 AND 9 THEN 'Third'
        WHEN @FiscalMonth BETWEEN 10 AND 12 THEN 'Fourth'
    END
    
    /*Set Fiscal Year Name*/
    SELECT @FiscalYearName = 'FY ' + CONVERT(VARCHAR, @FiscalYear)
 
    INSERT INTO @tb
    (
        PeriodDate,
        FiscalDayOfYear,
        FiscalWeekOfYear,
        FiscalMonth,
        FiscalQuarter,
        FiscalQuarterName,
        FiscalYear,
        FiscalYearName
    ) VALUES (
        @CurrentDate,
        @FiscalDayOfYear,
        @FiscalWeekOfYear,
        @FiscalMonth,
        @FiscalQuarter,
        @FiscalQuarterName,
        @FiscalYear,
        @FiscalYearName
    )
 
    /*SET next day*/
    SET @CurrentDate = DATEADD(dd, 1, @CurrentDate)
    SET @FiscalDayOfYear = @FiscalDayOfYear + 1
    SET @FiscalWeekOfYear = ((@FiscalDayOfYear-1) / 7) + 1
 
 
    IF (@FiscalWeekOfYear > (52+@LeapWeek))
    BEGIN
        /*Reset a new year*/
        SET @FiscalDayOfYear = 1
        SET @FiscalWeekOfYear = 1
        SET @FiscalYear = @FiscalYear + 1
        IF (EXISTS (SELECT * FROM @leapTable WHERE @FiscalYear = leapyear))
        BEGIN
            SET @LeapWeek = 1
        END
        ELSE
        BEGIN
            SET @LeapWeek = 0
        END
    END
END
 
/********************************************************************************************/
 
/*Set first and last days of the fiscal months*/
UPDATE @tb
SET
    FiscalFirstDayOfMonth = minmax.StartDate,
    FiscalLastDayOfMonth = minmax.EndDate
FROM
    @tb t,
    (
        SELECT
            FiscalMonth,
            FiscalQuarter,
            FiscalYear,
            MIN(PeriodDate) AS StartDate, 
            MAX(PeriodDate) AS EndDate
        FROM @tb
        GROUP BY
            FiscalMonth,
            FiscalQuarter,
            FiscalYear
    ) minmax
 
WHERE
    t.FiscalMonth = minmax.FiscalMonth AND
    t.FiscalQuarter = minmax.FiscalQuarter AND
    t.FiscalYear = minmax.FiscalYear 
 
/*Set first and last days of the fiscal quarters*/
 
UPDATE @tb
SET FiscalFirstDayOfQuarter = minmax.StartDate,
    FiscalLastDayOfQuarter = minmax.EndDate
FROM
    @tb t,
    (
        SELECT
            FiscalQuarter,
            FiscalYear,
            MIN(PeriodDate) as StartDate,
            MAX(PeriodDate) as EndDate
        FROM
            @tb
        GROUP BY
            FiscalQuarter,
            FiscalYear
    ) minmax
WHERE
    t.FiscalQuarter = minmax.FiscalQuarter AND
    t.FiscalYear = minmax.FiscalYear 
 
/*Set first and last days of the fiscal years*/
 
UPDATE @tb
SET
    FiscalFirstDayOfYear = minmax.StartDate,
    FiscalLastDayOfYear = minmax.EndDate
FROM
@tb t,
(
    SELECT FiscalYear, min(PeriodDate) as StartDate, max(PeriodDate) as EndDate
    FROM @tb
    GROUP BY FiscalYear
) minmax
WHERE
    t.FiscalYear = minmax.FiscalYear 
 
/*Set FiscalYearMonth*/
UPDATE @tb
SET
    FiscalMonthYear = 
        CASE FiscalMonth
        WHEN 1 THEN 'Jan'
        WHEN 2 THEN 'Feb'
        WHEN 3 THEN 'Mar'
        WHEN 4 THEN 'Apr'
        WHEN 5 THEN 'May'
        WHEN 6 THEN 'Jun'
        WHEN 7 THEN 'Jul'
        WHEN 8 THEN 'Aug'
        WHEN 9 THEN 'Sep'
        WHEN 10 THEN 'Oct'
        WHEN 11 THEN 'Nov'
        WHEN 12 THEN 'Dec'
        END + '-' + CONVERT(VARCHAR, FiscalYear)
 
/*Set FiscalMMYYYY*/
UPDATE @tb
SET
    FiscalMMYYYY = RIGHT('0' + CONVERT(VARCHAR, FiscalMonth),2) + CONVERT(VARCHAR, FiscalYear)
 
/********************************************************************************************/
 
UPDATE [Dim].[Date]
    SET FiscalDayOfYear = a.FiscalDayOfYear
      , FiscalWeekOfYear = a.FiscalWeekOfYear
      , FiscalMonth = a.FiscalMonth
      , FiscalQuarter = a.FiscalQuarter
      , FiscalQuarterName = a.FiscalQuarterName
      , FiscalYear = a.FiscalYear
      , FiscalYearName = a.FiscalYearName
      , FiscalMonthYear = a.FiscalMonthYear
      , FiscalMMYYYY = a.FiscalMMYYYY
      , FiscalFirstDayOfMonth = a.FiscalFirstDayOfMonth
      , FiscalLastDayOfMonth = a.FiscalLastDayOfMonth
      , FiscalFirstDayOfQuarter = a.FiscalFirstDayOfQuarter
      , FiscalLastDayOfQuarter = a.FiscalLastDayOfQuarter
      , FiscalFirstDayOfYear = a.FiscalFirstDayOfYear
      , FiscalLastDayOfYear = a.FiscalLastDayOfYear
FROM @tb a
    INNER JOIN [Dim].[Date] b ON a.PeriodDate = b.[Date]
 
/********************************************************************************************/
 
SELECT * FROM [Dim].[Date]
````

---

## Appendix: Links

* *Code*
* [SQL](SQL.md)
* [Databases](../../MOCs/Databases.md)
* [SQL Server](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/SQL%20Server.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[SQL - Create Date Dimension with Fiscal Years]] AND -"Changelog"
````

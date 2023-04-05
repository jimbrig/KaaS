# SQL - PostgreSQL - Date Dimension Table

*Source: https://gist.github.com/jpotts18/eaaf18c2b2ffe969f9641c2e05783150*

## Create

````SQL
CREATE TABLE public.dates (
	id                          int4 NOT NULL PRIMARY KEY,
	date                        date NOT NULL,
	datetime                    timestamp NOT NULL,

	julian_day                  int4 NOT NULL,

	day                         int4 NOT NULL,
	day_name 			        varchar NOT NULL,
	day_abbrev 			        varchar NOT NULL,

	year                        int4 NOT NULL,
	year_name 			        varchar NOT NULL,
	year_abbrev 			    varchar NOT NULL,
	year_begins_on              date NOT NULL,
	year_ends_on                date NOT NULL,
	is_end_of_year              bool, -- These need to be NULL on CREATE and they are populated on UPDATE
	is_leap_year                bool,
	days_in_year                int2,

	quarter                     int4 NOT NULL,
	quarter_name 			    varchar NOT NULL,
	quarter_abbrev 			    varchar NOT NULL,
	quarter_begins_on           date NOT NULL,
	quarter_ends_on             date NOT NULL,
	is_end_of_quarter           bool,
	days_in_quarter             int2,

	month                       int2 NOT NULL,
	month_name 			        varchar NOT NULL,
	month_abbrev 			    varchar NOT NULL,
	month_begins_on             date NOT NULL,
	month_ends_on               date NOT NULL,
	is_end_of_month             bool,
	days_in_month               int2,

	week_of_year                int2 NOT NULL,
	week_of_year_name 			varchar NOT NULL,
	week_of_year_abbrev 		varchar NOT NULL,
	week_of_year_begins_on      date NOT NULL,
	week_of_year_ends_on        date NOT NULL,
	is_end_of_week_of_year      bool,
	days_in_week_of_year        int2,

	week_of_month               int2 NOT NULL,
	week_of_month_name 			varchar NOT NULL,
	week_of_month_abbrev 		varchar NOT NULL,
	week_of_month_begins_on     date NOT NULL,
	week_of_month_ends_on       date NOT NULL,
	is_end_of_week_of_month     bool,
	days_in_week_of_month       int2,

	day_of_year                 int2 NOT NULL,
	day_of_year_name 			varchar NOT NULL,
	day_of_year_abbrev 			varchar NOT NULL,

	day_of_month                int2 NOT NULL,
	day_of_month_name 			varchar NOT NULL,
	day_of_month_abbrev 		varchar NOT NULL,

	day_of_week                 int2 NOT NULL,
	day_of_week_name 			varchar NOT NULL,
	day_of_week_abbrev 			varchar NOT NULL,

	weekday_weekend             varchar NOT NULL
)
WITH (OIDS=FALSE);
````

## Insert

````SQL
TRUNCATE TABLE dates;

INSERT INTO dates VALUES (
    -1, -- id
    '1/1/1800', -- date
    '1/1/1800', -- datetime

    0, -- julian_day

    0, -- day
    'Unknown', -- day_name
    'Unk', -- day_abbrev

    0, -- year
    'Unknown', -- year_name
    'Unk', -- year_abbrev
    '1/1/1800', -- year_begins_on
    '1/1/1800', -- year_ends_on
    false, -- is_end_of_year
    false, -- is_leap_year
    0, -- days_in_year

    0, -- quarter
    'Unknown', -- quarter_name
    'Unk', -- quarter_abbrev
    '1/1/1800', -- quarter_begins_on
    '1/1/1800', -- quarter_ends_on
    false, -- is_end_of_quarter
    0, -- days_in_quarter

    0, -- month
    'Unknown', -- month_name
    'Unk', -- month_abbrev
    '1/1/1800', -- month_begins_on
    '1/1/1800', -- month_ends_on
    false, -- is_end_of_month
    0, -- days_in_month

    0, -- week_of_year
    'Unknown', -- week_of_year_name
    'Unk', -- week_of_year_abbrev
    '1/1/1800', -- week_of_year_ends_on
    '1/1/1800', -- week_of_year_begins_on
    false, -- is_end_of_week_of_year
    0, -- days_in_week_of_year

    0, -- week_of_month
    'Unknown', -- week_of_month_name
    'Unk', -- week_of_month_name_abbrev
    '1/1/1800', -- week_of_month_begins_on
    '1/1/1800', -- week_of_month_ends_on
    false, -- is_end_of_week_of_monfth
    0, -- days_in_week_of_month

    0, -- day_of_year
    'Unknown', -- day_of_year_name
    'Unk', -- day_of_year_abbrev

    0, -- day_of_month
    'Unknown', --day_of_month_name
    'Unk', -- day_of_month_abbrev

    0, -- day_of_week
    'Unknown', -- day_of_week_name
    'Unk', -- day_of_week_abbrev

    'Unknown' -- weekday_weekend
);

INSERT INTO dates
SELECT
  to_char(day, 'YYYYMMDD')::integer AS id,
  day::date AS date,
  day::timestamp AS datetime,

  to_char(day, 'J')::integer AS julian_day,

  to_char(day, 'YYYYMMDD')::integer AS day,
  to_char(day, 'DD TMMonth YYYY') AS day_name,
  to_char(day, 'MM/DD/YY') AS day_abbrev,

  extract(year FROM day)::integer AS year,
  to_char(day, 'YYYY') AS year_name,
  to_char(day, 'YY') AS year_abbrev,
  date_trunc('year', day)::date AS year_begins_on,
  (date_trunc('year', day)::date + '1 year - 1 day'::interval)::date AS year_ends_on,
  null AS is_end_of_year,
  null AS days_in_year,
  null AS is_leap_year,

  extract(quarter FROM day)::integer AS quarter,
  to_char(day, 'Qth') || ' Quarter' AS quarter_name,
  to_char(day, '"Q"Q') AS quarter_abbrev,
  date_trunc('quarter', day)::date AS quarter_begins_on,
  (date_trunc('quarter', day)::date + '3 months - 1 day'::interval)::date AS quarter_ends_on,
  null AS is_end_of_quarter,
  null AS days_in_quarter,

  extract(month FROM day)::integer AS month,
  to_char(day, 'TMMonth') AS month_name,
  to_char(day, 'TMMon') AS month_abbrev,
  date_trunc('month', day)::date AS month_begins_on,
  (date_trunc('month', day)::date + '1 month - 1 day'::interval)::date AS month_ends_on,
  null AS is_end_of_month,
  null AS days_in_month,

  to_char(day, 'WW')::integer AS week_of_year,
  to_char(day, '"Week "WW') AS week_of_year_name,
  to_char(day, '"W"WW') AS week_of_year_abbrev,
  date_trunc('week', day)::date AS week_of_year_begins_on,
  (date_trunc('week', day)::date + '1 week - 1 day'::interval)::date AS week_of_year_ends_on,
  null AS is_end_of_week_of_year,
  null AS days_in_week_of_year,

  to_char(day, 'W')::integer AS week_of_month,
  to_char(day, '"Week "W') AS week_of_month_name,
  to_char(day, '"W"W') AS week_of_month_abbrev,
  date_trunc('week', day)::date AS week_of_month_begins_on,
  (date_trunc('week', day)::date + '1 week - 1 day'::interval)::date AS week_of_month_ends_on,
  null AS is_end_of_week_of_month,
  null AS days_in_week_of_month,

  extract(doy FROM day)::integer AS day_of_year,
  to_char(day, 'DD TMMonth YYYY') AS day_of_year_name,
  to_char(day, 'MM/DD/YY') AS day_of_year_abbrev,

  extract(day FROM day)::integer AS day_of_month,
  to_char(day, 'TMDay') AS day_of_month_name,
  to_char(day, 'TMDy') AS day_of_month_abbrev,

  to_char(day, 'D')::integer AS day_of_week,
  to_char(day, 'TMDay') AS day_of_week_name,
  to_char(day, 'TMDy') AS day_of_week_abbrev,

  CASE WHEN extract(isodow FROM day) IN (6, 7) THEN 'Weekend' ELSE 'Weekday' END AS weekday_weekend

FROM generate_series('2015-01-01'::date, '2017-01-01'::date, '1 day') day;

UPDATE dates
   SET is_end_of_year = (date = year_ends_on),
       days_in_year = (year_ends_on - year_begins_on) + 1,
       is_leap_year = (year % 4 = 0) AND ((year % 100 != 0) OR (year % 400 = 0)),

       is_end_of_quarter = (date = quarter_ends_on),
       days_in_quarter = (quarter_ends_on - quarter_begins_on) + 1,

       is_end_of_month = (date = month_ends_on),
       days_in_month = (month_ends_on - month_begins_on) + 1,

       is_end_of_week_of_year = (date = week_of_year_ends_on),
       days_in_week_of_year = (week_of_year_ends_on - week_of_year_begins_on) + 1
 WHERE id > 0;
````

---

## Appendix: Links

* *Code*
* [SQL](SQL.md)
* [Databases](../../MOCs/Databases.md)
* [PostgreSQL](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/PostgreSQL.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[SQL - PostgreSQL - Date Dimension Table]] AND -"Changelog"
````

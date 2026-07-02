SELECT *
FROM migrants;

-- No of years recorded for each Region/Country/Area 
SELECT *, COUNT(DISTINCT(year)) AS no
FROM 'migrants'
GROUP BY T04
HAVING no > 4
ORDER BY no DESC;

-- Investigation if Region/Country/Area have the same years recorded
SELECT *
FROM 'migrants'
-- GROUP BY T04
WHERE t04 = 92
ORDER BY year DESC;

SELECT *
FROM `migrants`
-- GROUP BY T04
WHERE t04 = 583
ORDER BY year DESC;

-- checking the distinct data Source
SELECT DISTINCT(source)
FROM `migrants`;

-- Lokking into the years with data
SELECT DISTINCT(year)
FROM `migrants`
ORDER BY year ;

-- checking just countries and their serial
SELECT DISTINCT(t04), `region_country_area`
FROM `migrants`
ORDER BY t04;

-- Selecting regions and areas from Countries
SELECT DISTINCT(t04), `region_country_area`
FROM `migrants`
WHERE (`region_country_area` LIKE '%Asia%' 
OR`region_country_area` LIKE '%Africa%'
OR`region_country_area` LIKE '%Oceania%'
OR`region_country_area` LIKE '%Europe%'
OR`region_country_area` LIKE '%Total%'
OR`region_country_area` LIKE '%America%'
OR`region_country_area` LIKE '%Carribean%'
OR`region_country_area` LIKE '%esia%'
OR`region_country_area` LIKE '%other%'
OR`region_country_area` LIKE '%Australia and New Zealand%'
OR`region_country_area` LIKE '%Caribbean%')
AND `region_country_area` NOT LIKE '%United States of America%'
AND `region_country_area` NOT LIKE '%South Africa%'
AND `region_country_area` NOT LIKE '%Micronesia (Fed. States of)%'
AND `region_country_area` NOT LIKE '%Indonesia%'
AND `region_country_area` NOT LIKE '%American Samoa%'
AND `region_country_area` NOT LIKE '%Central African Republic%'
ORDER BY `region_country_area`;

-- Looking for duplicates in Region/Country/Area column
SELECT t04, COUNT(DISTINCT(`region_country_area`))
FROM `migrants`
GROUP BY t04
ORDER BY t04 DESC;

-- Looking at nulls in each COLUMN
SELECT *
FROM `migrants`
WHERE `region_country_area` IS NULL;

SELECT *
FROM `Migrants`
WHERE `year` IS NULL;

SELECT *
FROM `migrants`
WHERE `source` IS NULL;

SELECT COUNT(*)
FROM `migrants`
WHERE `ims_both_sexes_4num` IS NULL;

-- null ims_both_sexes_4num
WITH nullRow AS (
SELECT COUNT(*) as nullValues
FROM `Migrants`
WHERE `ims_both_sexes_4num` IS NULL
)
SELECT nullValues,
(SELECT COUNT(*) FROM `migrants`) AS TotalValues,
(1.0 * nullValues/ (SELECT COUNT(*) FROM `migrants`)) * 100 AS '% null'
FROM nullRow;


SELECT COUNT(*)
FROM `migrants`
WHERE `ims_both_sexes_4pop` IS NULL;

-- null ims_both_sexes_4pop
WITH nullRow AS (
SELECT COUNT(*) AS nullValues
FROM `migrants`
WHERE `ims_both_sexes_4pop` IS NULL
)
SELECT nullValues,
(SELECT COUNT(*) FROM `migrants`) AS TotalValues,
(1.0 * nullValues/ (SELECT COUNT(*) FROM `migrants`)) * 100 AS '% null'
FROM nullRow;

--
SELECT COUNT(*)
FROM `migrants`
WHERE `ims_female_4pop` IS NULL;

-- null ims_female_4pop
WITH nullRow AS (
SELECT COUNT(*) AS nullValues
FROM `migrants`
WHERE `ims_female_4pop` IS NULL
)
SELECT nullValues,
(SELECT COUNT(*) FROM `migrants`) AS TotalValues,
(1.0 * nullValues/ (SELECT COUNT(*) FROM `migrants`)) * 100 AS '% null'
FROM nullRow;


SELECT COUNT(*)
FROM `Migrants`
WHERE `ims_male_4pop` IS NULL;

SELECT COUNT(*)
FROM `Migrants`
WHERE `refugees_total_4num` IS NULL;

-- null refugees_total_4num
WITH nullRows AS ( SELECT COUNT(*) AS nullValues
FROM `Migrants`
WHERE `refugees_total_4num` IS NULL)
SELECT nullValues, 
(SELECT COUNT(*) FROM `Migrants`) AS TotalValues, 
(1.0 * nullValues/(SELECT COUNT(*) FROM `Migrants`))*100 AS '% null'
FROM nullRows;


SELECT COUNT(*)
FROM `Migrants`
WHERE `asylum_seekers_total_4num` IS NULL;

-- null asylum_seekers_total_4num
WITH nullRows AS ( SELECT COUNT(*) AS nullValues
FROM `Migrants`
WHERE `asylum_seekers_total_4num` IS NULL)
SELECT nullValues, 
(SELECT COUNT(*) FROM `Migrants`) AS TotalValues, 
(1.0 * nullValues/(SELECT COUNT(*) FROM `Migrants`))*100 AS '% null'
FROM nullRows;

SELECT COUNT(*)
FROM `migrants`
WHERE `other_of_concern_total_4num` IS NULL;

-- null other_of_concern_total_4num
WITH nullRows AS ( SELECT COUNT(*) AS nullValues
FROM `Migrants`
WHERE `other_of_concern_total_4num` IS NULL)
SELECT nullValues, 
(SELECT COUNT(*) FROM `Migrants`) AS TotalValues, 
(1.0 * nullValues/(SELECT COUNT(*) FROM `Migrants`))*100 AS '% null'
FROM nullRows;

-- null total_pop_of_concern_unhcr_4num
WITH nullRows AS ( SELECT COUNT(*) AS nullValues
FROM `Migrants`
WHERE `total_pop_of_concern_unhcr_4num` IS NULL)
SELECT nullValues, 
(SELECT COUNT(*) FROM `Migrants`) AS TotalValues, 
(1.0 * nullValues/(SELECT COUNT(*) FROM `Migrants`))*100 AS '% null'
FROM nullRows;


-- Investigating duplicate areas, year and Source
SELECT t04, region_country_area, year, source, COUNT(*) AS no
FROM Migrants
GROUP BY t04, region_country_area, year, source
ORDER BY no DESC;

SELECT * 
FROM migrants
WHERE t04 = 840 AND year = 2023 AND source = "United Nations High Commissioner for Refugees (UNHCR), Geneva, UNHCR Population Statistics Database, last accessed May 2025.";

SELECT * 
FROM Migrants
WHERE t04 = 8 AND year = 2023 AND source = "United Nations High Commissioner for Refugees (UNHCR), Geneva, UNHCR Population Statistics Database, last accessed May 2025.";


SELECT * 
FROM Migrants
WHERE t04 = 8 AND year = 2024 AND source = "United Nations High Commissioner for Refugees (UNHCR), Geneva, UNHCR Population Statistics Database, last accessed May 2025.";

SELECT * 
FROM Migrants
WHERE t04 = 36 AND year = 2015 AND source = "United Nations High Commissioner for Refugees (UNHCR), Geneva, UNHCR Population Statistics Database, last accessed May 2025.";

-- create tamporary table
CREATE TEMPORARY TABLE migrants_temp AS
SELECT 
	t04,
	region_country_area, 
	year, 
	source, 
	ims_both_sexes_4num,
	ims_both_sexes_4pop,
	ims_male_4pop,
	ims_female_4pop,
	NULLIF(SUM(COALESCE(`refugees_total_4num`, 0)), 0) AS `refugees_total_4num`, 
	NULLIF(SUM(COALESCE(asylum_seekers_total_4num, 0)),0) AS asylum_seekers_total_4num,
	NULLIF(SUM(COALESCE(other_of_concern_total_4num, 0)),0) AS other_of_concern_total_4num,
	NULLIF(SUM(COALESCE(total_pop_of_concern_unhcr_4num, 0)),0) AS total_pop_of_concern_unhcr_4num,
	NULLIF(
		SUM(COALESCE(`refugees_total_4num`, 0)) 
		+ SUM(COALESCE(asylum_seekers_total_4num, 0)) 
		+ SUM(COALESCE(other_of_concern_total_4num, 0))
	,0) AS unhr_calc_total
FROM Migrants
GROUP BY t04, region_country_area, year, source
ORDER BY t04, region_country_area, year, source;

-- Browsing the lookup data
SELECT *
FROM lookup;

-- Joining the migrants_temp table with the lookup table
SELECT *, lk.country
FROM migrants_temp AS mt
LEFT JOIN lookup AS lk
ON mt.t04 = lk.t04;

--  Top 10 countries by migrant stock in the latest available year
SELECT
	mt.t04,
	lk.country,
	mt.year AS recent_year,
	mt.ims_both_sexes_4num
FROM migrants_temp AS mt
LEFT JOIN lookup AS lk
ON mt.t04 = lk.t04
GROUP BY 	mt.t04, mt.region_country_area, mt.source
HAVING lk.country IS NOT NULL
AND MAX(mt.year) = recent_year
AND source = "United Nations Population Division, New York, International migrant stock: The 2024 Revision, last accessed April 2025."
ORDER BY mt.ims_both_sexes_4num DESC
LIMIT 10;

-- Migrant stock as % of population 
WITH continental_rank AS (SELECT
	l.continent, 
	m.t04,
	m.region_country_area,
	l.country,
	m.year,
	m.source,
	m.ims_both_sexes_4pop,
	DENSE_RANK() OVER(
	PARTITION BY l.continent
	ORDER BY l.continent, year DESC, m.ims_both_sexes_4pop DESC
	) AS rank
FROM migrants_temp AS m
LEFT JOIN lookup AS l
ON m.t04 = l.t04
WHERE l.country IS NOT NULL
AND m.ims_both_sexes_4pop IS NOT NULL)
SELECT
	continent,
	region_country_area AS country,
	year AS recent_year,
	ims_both_sexes_4pop, 
	rank
FROM continental_rank
WHERE rank <=3;

-- Total refugees by continent, in the most recent year
WITH continental_rank AS (
SELECT 
	m.region_country_area,
	l.continent,
	m.year,
	m.refugees_total_4num,
	m.source,
	l.country,
	DENSE_RANK() OVER(
	PARTITION BY l.continent
	ORDER BY l.continent, year DESC
	) AS rank
FROM migrants_temp AS m
LEFT JOIN lookup AS l
ON m.t04 = l.t04
WHERE m.region_country_area IS NOT NULL
AND country IS NULL
AND continent IS NOT NULL
AND m.source = "United Nations High Commissioner for Refugees (UNHCR), Geneva, UNHCR Population Statistics Database, last accessed May 2025.")
SELECT 
	continent,
	year AS recent_year,
	refugees_total_4num
FROM continental_rank
WHERE rank = 1;


-- Year-over-year change in migrant stock for a country of choice
SELECT 
	region_country_area,
	year,
	source,
	ims_both_sexes_4num,
	LAG(ims_both_sexes_4num, 1,0 ) OVER(
	PARTITION BY region_country_area
	ORDER BY year
	) AS previous_year_value,
	((ims_both_sexes_4num * 1.0)- LAG(ims_both_sexes_4num, 1,0 ) OVER(
	PARTITION BY t04
	))/(LAG(ims_both_sexes_4num, 1,0 ) OVER(
	PARTITION BY region_country_area
	))*100 AS y_o_y
FROM migrants_temp
WHERE source = "United Nations Population Division, New York, International migrant stock: The 2024 Revision, last accessed April 2025.";

-- Countries with the highest refugee-to-migrant-stock ratio
SELECT 
	t1.t04,
	t1.region_country_area,
	t1.year,
	t1.refugees_total_4num,
	t2.ims_both_sexes_4num,
	(t1.refugees_total_4num * 1.0)/t2.ims_both_sexes_4num AS refugee_to_migrant_ratio
FROM migrants_temp AS t1
JOIN migrants_temp AS t2
ON t1.t04 = t2.t04
AND t1.year = t2.year
AND t1.source < t2.source
WHERE t1.year = 2024 
ORDER BY refugee_to_migrant_ratio DESC;

--Pivots the two sources into one row per area+year
	--Using a JOIN
	SELECT
		m1.t04,
		m1.region_country_area,
		m1.year,
		m1.source,
		m1.ims_both_sexes_4num,
		m1.ims_both_sexes_4pop,
		m1.ims_female_4pop,
		m1.ims_male_4pop,
		m2.source,
		m2.refugees_total_4num,
		m2.asylum_seekers_total_4num,
		m2.other_of_concern_total_4num,
		m2.total_pop_of_concern_unhcr_4num
	FROM migrants_temp AS m1
	JOIN migrants_temp AS m2
	ON m1.t04 = m2.t04
	AND m1.year = m2.year
	AND m1.source > m2.source;
	
	-- USING CTEs AND JOIN
	WITH UNPD AS (
	SELECT *
	FROM migrants_temp
	WHERE ims_both_sexes_4num IS NOT NULL
	),
	UNHCR AS (
	SELECT *
	FROM migrants_temp
	WHERE refugees_total_4num IS NOT NULL
	)
	SELECT 
		u1.t04,
		u1.region_country_area,
		u1.year,
		u1.ims_both_sexes_4num,
		u1.ims_both_sexes_4pop,
		u1.ims_female_4pop,
		u1.ims_male_4pop,
		u2.refugees_total_4num,
		u2.asylum_seekers_total_4num,
		u2.other_of_concern_total_4num,
		u2.total_pop_of_concern_unhcr_4num	
	FROM UNPD as u1
	LEFT JOIN UNHCR AS u2
	ON u1.t04 = u2.t04
	AND u1.year = u2.year;
	
-- Rank countries within each continent using RANK()/DENSE_RANK()
-- Full rank for all countries in each continent in 2024
SELECT
	l.continent,
	m.t04,
	m.region_country_area,
	m.year,
	m.ims_both_sexes_4num,
	DENSE_RANK() OVER (
		PARTITION BY l.continent
		ORDER BY m.ims_both_sexes_4num DESC
	) AS rank
FROM migrants_temp AS m
LEFT JOIN lookup AS l
ON m.t04 = l.t04
WHERE l.country IS NOT NULL
AND ims_both_sexes_4num IS NOT NULL
AND year = 2024;

-- Full rank for all countries in each continent in 2015
SELECT
	l.continent,
	m.t04,
	m.region_country_area,
	m.year,
--	m.source,
	m.ims_both_sexes_4num,
	DENSE_RANK() OVER (
		PARTITION BY l.continent
		ORDER BY m.ims_both_sexes_4num DESC
	) AS rank
FROM migrants_temp AS m
LEFT JOIN lookup AS l
ON m.t04 = l.t04
WHERE l.country IS NOT NULL
AND ims_both_sexes_4num IS NOT NULL
AND year = 2015;

-- rank top 5 countries in each continent in 2015
WITH continental_rank AS 
(SELECT
	l.continent,
	m.t04,
	m.region_country_area,
	m.year,
--	m.source,
	m.ims_both_sexes_4num,
	DENSE_RANK() OVER (
		PARTITION BY l.continent
		ORDER BY m.ims_both_sexes_4num DESC
	) AS rank
FROM migrants_temp AS m
LEFT JOIN lookup AS l
ON m.t04 = l.t04
WHERE l.country IS NOT NULL
AND ims_both_sexes_4num IS NOT NULL
AND year = 2015)
SELECT 
	continent,
	region_country_area,
	year,
	ims_both_sexes_4num,
	rank
FROM continental_rank
WHERE rank <= 5;

--Calculate a 3-period moving average of migrant stock per country
SELECT 
	t04,
	region_country_area,
	year,
	ims_both_sexes_4num,
	AVG(ims_both_sexes_4num) OVER(
		PARTITION BY t04
		ORDER BY year
		ROWS BETWEEN  2 PRECEDING AND CURRENT ROW
	) AS `3_period_moving_average`
FROM migrants_temp
WHERE ims_both_sexes_4num IS NOT NULL;

--Find countries that appear in one source but never the other
WITH UNDP AS (
SELECT
	m1.t04 AS undp_code,
	m1.region_country_area AS undp_area,
	l.country AS undp_country,
	l.continent AS undp_continent,
	m1.year AS undp_year,
	m1.source AS undp_source,
	m1.ims_both_sexes_4num AS undp_ims,
	m1.total_pop_of_concern_unhcr_4num AS undp_ref
FROM migrants_temp AS m1
LEFT JOIN lookup AS l ON m1.t04 = l.t04
--GROUP BY m1.t04, m1.year
WHERE source LIKE "%Population Division%"
AND country IS NOT NULL),
UNHR AS (
SELECT 
	m1.t04 AS unhr_t04,
	m1.region_country_area AS unhr_area,
	l.country AS unhr_country,
	l.continent AS unhr_continent,
	m1.year AS unhr_year,
	m1.source AS unhr_source,
	m1.ims_both_sexes_4num AS unhr_ims,
	m1.unhr_calc_total AS unhr_total
FROM migrants_temp AS m1
LEFT JOIN lookup AS l
ON m1.t04 = l.t04
WHERE source LIKE "%High Commissioner%"
AND country IS NOT NULL
)
SELECT 
	undp_code,
	unhr_t04, 
	undp_area,
	undp_year,
	undp_ims,
	unhr_total,
	"Only UNDP" AS `only_undp/only_unhr`
FROM UNDP
LEFT JOIN UNHR
ON undp_code = unhr_t04
AND undp_year = unhr_year
WHERE unhr_total IS NULL
UNION ALL
SELECT 
	undp_code,
	unhr_t04, 
	unhr_area,
	unhr_year,
	undp_ims,
	unhr_total,
	"Only UNHR" AS `only_undp/only_unhr`
FROM UNHR
LEFT JOIN UNDP
ON unhr_t04 = undp_code
AND unhr_year = undp_year
WHERE undp_code IS NULL
AND unhr_total IS NOT NULL;

-- find each country's peak migrant year

-- Using CTE
WITH peak_year AS 
	(SELECT 
	m.t04, 
	m.region_country_area,
	l.country,
	m.year,
	m.ims_both_sexes_4num,
	MAX(ims_both_sexes_4num) OVER(
		PARTITION BY m.t04
	) AS max_ims
FROM migrants_temp as m
INNER JOIN lookup AS l
ON m.t04 = l.t04
WHERE l.country IS NOT NULL
)
SELECT 
	t04,
	region_country_area,
	year,
	max_ims
FROM peak_year
WHERE ims_both_sexes_4num =  max_ims;


-- Using correlated subquery
SELECT 
	m.t04, 
	m.region_country_area, 
	m.year, 
	m.ims_both_sexes_4num
FROM migrants_temp AS m
INNER JOIN lookup AS l
ON m.t04 = l.t04
WHERE m.ims_both_sexes_4num = (
	SELECT MAX(m2.ims_both_sexes_4num)
	FROM migrants_temp AS m2
	WHERE m2.t04 = m.t04
)
AND country IS NOT NULL
AND ims_both_sexes_4num IS NOT NULL;





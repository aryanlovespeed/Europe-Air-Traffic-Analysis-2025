-- data cleaning --

SELECT *
FROM airport1;

CREATE TABLE airport2
LIKE airport1;

INSERT airport2
SELECT *
FROM airport1;


SELECT *
FROM 
(SELECT *,
	ROW_NUMBER() OVER(PARTITION BY year, month_number,month, `date`,airport_code, airport_name, country_name, flt_dep,flt_arr,flt_total,flt_dep_ifr,flt_total_ifr) AS row_num
FROM airport2) x
WHERE row_num > 1;

-- no duplicates --

SELECT DISTINCT country_name
FROM airport2;

-- spelling mistakes and extra gaps --

UPDATE airport2 
SET `date` = STR_TO_DATE(`date`,'%d-%m-%Y');

ALTER TABLE airport2
MODIFY COLUMN `date` DATE;

UPDATE airport2
SET flt_dep_ifr = NULL
WHERE flt_dep_ifr = '';

UPDATE airport2
SET flt_arr_ifr = NULL
WHERE flt_arr_ifr = '';

UPDATE airport2
SET flt_total_ifr = TRIM(flt_total_ifr);

UPDATE airport2
SET flt_total_ifr = NULL
WHERE flt_total_ifr = '';

-- it is not working looks like this table value set in char instead of varchar so lets do it other way --

UPDATE airport2
SET flt_total_ifr = NULL
WHERE LTRIM(RTRIM(flt_total_ifr)) = '';

ALTER TABLE airport2 
MODIFY COLUMN flt_total_ifr VARCHAR(255);

-- still didn't completed looks like we have some ghost spaces --

UPDATE airport2
SET flt_total_ifr = NULL
WHERE 
    flt_total_ifr IS NOT NULL 
    AND REGEXP_LIKE(HEX(flt_total_ifr), '^(20|A0|09|0D|0A)*$')
    AND HEX(flt_total_ifr) != '';
    
-- took chatgpt help to fix it and it worked --



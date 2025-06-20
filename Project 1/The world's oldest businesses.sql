CREATE DATABASE project;

USE project;

--View the businesses table to identify any errors
SELECT *
FROM businesses;

--View the categories table to identify any errors
SELECT *
FROM categories;

/* The following code corrects spelling errors discovered in the categories,countries 
and new businesses tables
*/
UPDATE project.categories
SET category = 'Cafes,Restaurants & Bars'
WHERE category_code = 'CAT4';

SELECT *
FROM countries;

UPDATE project.countries
SET country = "Côte d'Ivoire"
WHERE country_code = 'ÇIV';

SELECT *
FROM new_businesses;

UPDATE project.new_businesses
SET business = 'J. Armando Bermúdez & Co'
WHERE category_code = 'CAT9';

--Update the businesses table by adding the information from the new businesses table
INSERT INTO project.businesses
			(business,year_founded,category_code,country_code)
VALUES ('Fiji Times',1869,'CAT13','FJI'),
       ('J. Armando Bermúdez & Co',1852,'CAT9','DOM');

-- View the updated businesses table
SELECT * FROM businesses;

-- The query finds the oldest business in the dataset
SELECT *
FROM project.businesses
ORDER BY year_founded ASC
LIMIT 1;

-- To find out the category, the oldest business belongs to 
SELECT category
FROM categories
WHERE category_code = 'CAT6';

-- This query provides the range of years when the businesses were established
SELECT DISTINCT year_founded
FROM businesses
ORDER BY year_founded ASC;

-- To provide the businesses formed before 1000AD
SELECT *
FROM businesses
WHERE year_founded < 1000;

/*The following lines of code create a Join view ,
to determine the most popular business category
*/
CREATE VIEW business_category AS
SELECT b.business,
       b.category_code,
       c.category
FROM businesses AS b
INNER JOIN categories AS c
ON b.category_code = c.category_code;

SELECT COUNT(business) AS industry_count,
	   category
FROM business_category
GROUP BY category
ORDER BY industry_count DESC;

/* The following lines of code include creating another JOIN view -company_country-
to determine the number of businesses in each continent ,
and the oldest business per continent.
*/
CREATE VIEW company_country AS
SELECT b.business,
       b.year_founded,
       cs. country,
       cs.continent
FROM businesses AS b
LEFT JOIN countries AS cs
ON b.country_code = cs.country_code;

SELECT COUNT(business) AS no_of_business,
       continent
FROM company_country
GROUP BY continent
ORDER BY no_of_business DESC;

SELECT *
FROM company_country
WHERE continent = 'Africa'
ORDER BY year_founded
LIMIT 1;

SELECT *
FROM company_country
WHERE continent = 'North America'
ORDER BY year_founded
LIMIT 1;

SELECT *
FROM company_country
WHERE continent = 'South America'
ORDER BY year_founded
LIMIT 1;

SELECT *
FROM company_country
WHERE continent = 'Europe'
ORDER BY year_founded
LIMIT 1;

SELECT *
FROM company_country
WHERE continent = 'Oceania'
ORDER BY year_founded
LIMIT 1;

SELECT *
FROM company_country
WHERE continent = 'Asia'
ORDER BY year_founded
LIMIT 1;

SELECT category,
       COUNT(business) AS no_of_business
FROM business_category
GROUP BY category
ORDER BY no_of_business ASC
LIMIT 1;

SELECT continent,
       COUNT(*) AS no_of_companies
FROM company_country
GROUP BY continent
ORDER BY no_of_companies
LIMIT 1;

--This query categorises each business into centuries based on their founding year
SELECT COUNT(business) AS no_of_businesses,
      CASE 
          WHEN year_founded < 1000 THEN '<1000'
          WHEN year_founded BETWEEN 1000 AND 1099 THEN '1000s'
          WHEN year_founded BETWEEN 1100 AND 1199 THEN '1100s'
          WHEN year_founded BETWEEN 1200 AND 1299 THEN '1200s'
          WHEN year_founded BETWEEN 1300 AND 1399 THEN '1300s'
          WHEN year_founded BETWEEN 1400 AND 1499 THEN '1400s'
          WHEN year_founded BETWEEN 1500 AND 1599 THEN '1500s'
          WHEN year_founded BETWEEN 1600 AND 1699 THEN '1600s'
          WHEN year_founded BETWEEN 1700 AND 1799 THEN '1700s'
          WHEN year_founded BETWEEN 1800 AND 1899 THEN '1800s'
          WHEN year_founded BETWEEN 1900 AND 1999 THEN '1900s'
          ELSE 'Unknown'
	END AS centuries
FROM businesses
GROUP BY centuries
ORDER BY centuries;



       




















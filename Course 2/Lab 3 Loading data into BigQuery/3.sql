#Create tables from other tables with DDL The 2018trips table now has trips from throughout the year. What if you were only interested in January trips? 
#standardSQL
CREATE TABLE
  nyctaxi.january_trips AS
SELECT
  *
FROM
  nyctaxi.2018trips
WHERE
  EXTRACT(Month
  FROM
    pickup_datetime)=1;

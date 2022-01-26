--Question 3: 

SELECT 
	DATE_TRUNC('day', "tpep_pickup_datetime") AS "day",
	COUNT ("tpep_pickup_datetime") AS "amount_of_pickups"
FROM yellow_taxi_trips
GROUP by DATE_TRUNC('day', "tpep_pickup_datetime");



--Question 4: 

SELECT 
	DATE_TRUNC('day', "tpep_pickup_datetime") AS "day",
	MAX ("tip_amount") AS "max_tip"
FROM yellow_taxi_trips
GROUP by DATE_TRUNC('day', "tpep_pickup_datetime");

### base
SELECT * FROM yellow_taxi_trips LIMIT 100


--Question 5:

SELECT
    CONCAT(zones_zpu."Borough", '/', zones_zpu."Zone") AS "pickup_loc",
    CONCAT(zones_taxi."Borough", '/', zones_taxi."Zone") AS "dropoff_loc",
    COUNT(1) AS "trips_count"
FROM
    yellow_taxi_trips t JOIN zones zones_zpu
        ON t."PULocationID" = zones_zpu."LocationID"
    JOIN zones zones_taxi
        ON t."DOLocationID" = zones_taxi."LocationID"
WHERE
	t."PULocationID" = ( SELECT "LocationID" FROM zones zones_zpu WHERE zones_zpu."Zone" IN ('Central Park'))
GROUP BY
	1, 2 
;

--Question 6:

SELECT
    CONCAT(zones_zpu."Zone", '/', zones_taxi."Zone") AS "from_to",
    AVG(t."total_amount") AS "total_spend"
FROM
    yellow_taxi_trips t JOIN zones zones_zpu
        ON t."PULocationID" = zones_zpu."LocationID"
    JOIN zones zones_taxi
        ON t."DOLocationID" = zones_taxi."LocationID"
GROUP BY
	1
ORDER BY
	2 DESC
;

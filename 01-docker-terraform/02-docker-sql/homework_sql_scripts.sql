-- Q4) How many taxi trips were totally made on September 18th 2019?
select count(*)  
from green_taxi_data
where date_trunc('day', green_taxi_data.lpep_dropoff_datetime) = '2019-09-18 00:00:00'
and date_trunc('day', green_taxi_data.lpep_pickup_datetime) = '2019-09-18 00:00:00';

--Q5) Which was the pick up day with the largest trip distance? 
SELECT date_trunc('day', green_taxi_data.lpep_pickup_datetime),
	max(green_taxi_data.trip_distance)
FROM green_taxi_data
GROUP BY 1
ORDER BY 2 DESC;

-- Q6) 
-- Consider lpep_pickup_datetime in '2019-09-18' and ignoring Borough has Unknown
-- Which were the 3 pick up Boroughs that had a sum of total_amount superior to 50000?
SELECT pickup_zone."Borough"
	, SUM(green.total_amount) AS sum_amnt
FROM public.green_taxi_data as green 
JOIN zones as pickup_zone 
ON green."PULocationID" = pickup_zone."LocationID"
WHERE pickup_zone."Borough" <> 'Unknown'
	and DATE_TRUNC('day', green.lpep_pickup_datetime) = '2019-09-18 00:00:00'
GROUP BY 1 
HAVING SUM(green.total_amount) > 50000
ORDER BY 2 DESC;

-- Q7) 
-- For the passengers picked up in September 2019 in the zone name Astoria which was the drop off zone that had the largest tip?
-- We want the name of the zone, not the id.
SELECT dropoff_zone."Zone", max(green.tip_amount)
FROM public.green_taxi_data as green 
JOIN zones as pickup_zone 
ON green."PULocationID" = pickup_zone."LocationID"
JOIN zones as dropoff_zone 
ON green."DOLocationID" = dropoff_zone."LocationID"
WHERE pickup_zone."Zone" = 'Astoria'
GROUP BY 1
ORDER BY 2 DESC;


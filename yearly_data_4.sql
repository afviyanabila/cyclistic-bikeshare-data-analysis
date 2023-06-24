#Combining quarterly tables representing all trips in a year

SELECT 
        ride_id, 
        rideable_type, 
        started_at,
        ended_at
        ride_date,
        start_time,
        end_time,
        ride_length,
        day_of_week,
	start_station_name, 
	end_station_name, 
        member_casual,
	'Q1' AS quarter
FROM 
        `cyclistic.tripdata_Q1`
UNION DISTINCT  
SELECT 
        ride_id, 
        rideable_type, 
        started_at,
        ended_at
        ride_date,
        start_time,
        end_time,
        ride_length,
        day_of_week,
	start_station_name, 
	end_station_name, 
        member_casual,
	'Q2' AS quarter
FROM 
        `cyclistic.tripdata_Q2`
UNION DISTINCT  
SELECT 
        ride_id, 
        rideable_type, 
        started_at,
        ended_at
        ride_date,
        start_time,
        end_time,
        ride_length,
        day_of_week,
	start_station_name, 
	end_station_name, 
        member_casual,
	'Q3' AS quarter
FROM 
        `cyclistic.tripdata_Q3`
UNION DISTINCT  
SELECT 
        ride_id, 
        rideable_type, 
        started_at,
        ended_at
        ride_date,
        start_time,
        end_time,
        ride_length,
        day_of_week,
	start_station_name, 
	end_station_name, 
        member_casual,
	'Q4' AS quarter
FROM 
        `cyclistic.tripdata_Q4`

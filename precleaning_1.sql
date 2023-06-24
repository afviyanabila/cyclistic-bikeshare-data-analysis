#Converting time to string

SELECT
        ride_id,
        rideable_type,
        started_at,
        ended_at,
        ride_date,
        start_time,
        end_time,
        CAST(ride_length AS STRING) AS ride_length,
        day_of_week,
        start_station_name,
        start_station_id,
        end_station_name,
        end_station_id,
        start_lat,
        start_lng,
        end_lat,
        end_lng,
        member_casual
FROM
        `cyclistic.tripdata_2201`
ORDER BY
        ride_length DESC 
        
#Repeat for all months

#Creating quarterly tables representing trips per seasons

SELECT 
        ride_id, 
        rideable_type, 
        started_at, 
        ended_at, 
        ride_date,
        start_time,
        end_time,
        ride_length,
        day_of_week,
	start_station_name, 
	start_station_id, 
        end_station_name, 
	end_station_id, 
        start_lat, 
        start_lng, 
	end_lat, 
        end_lng, 
        member_casual,
	'Q1' AS quarter
FROM 
        `cyclistic.tripdata_2201`
UNION DISTINCT  
SELECT 
        ride_id, 
        rideable_type, 
        started_at, 
        ended_at, 
        ride_date,
        start_time,
        end_time,
        ride_length,
        day_of_week,
	start_station_name, 
	start_station_id, 
        end_station_name, 
	end_station_id, 
        start_lat, 
        start_lng, 
	end_lat, 
        end_lng, 
        member_casual,
	'Q1' AS quarter
FROM 
        `cyclistic.tripdata_2202`
UNION DISTINCT  
SELECT 
        ride_id, 
        rideable_type, 
        started_at, 
        ended_at, 
        ride_date,
        start_time,
        end_time,
        ride_length,
        day_of_week,
	start_station_name, 
	start_station_id, 
        end_station_name, 
	end_station_id, 
        start_lat, 
        start_lng, 
	end_lat, 
        end_lng, 
        member_casual,
	'Q1' AS quarter
FROM 
        `cyclistic.tripdata_2203`

#Repeat for all quarter

#Converting integer to string

SELECT 
        ride_id, 
        rideable_type, 
        started_at, 
        ended_at, 
        ride_date,
        start_time,
        end_time,
        CAST(ride_length AS INTERVAL) AS ride_length,
        CAST(day_of_week AS STRING) AS day_of_week,
	start_station_name, 
	start_station_id, 
        end_station_name, 
	end_station_id, 
        start_lat, 
        start_lng, 
	end_lat, 
        end_lng, 
        member_casual,
	'Q1' AS quarter
FROM 
        `cyclistic.tripdata_Q1`

#Repeat for all quarter

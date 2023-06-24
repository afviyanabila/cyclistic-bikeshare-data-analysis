#Counting total overall trips, casual riders trips, and annual members trips per quarter year

SELECT 
        total_trips,
        total_casual_trips,
        total_member_trips,
        ROUND(total_casual_trips/total_trips,2)*100 AS casual_percentage,
        ROUND(total_member_trips/total_trips,2)*100 AS member_percentage
        #round to specified percentage decimal      
FROM 
        ( SELECT
                COUNT(ride_id) AS total_trips,
                COUNTIF(member_casual = 'casual') AS total_casual_trips,
                COUNTIF(member_casual = 'member') AS total_member_trips,
        FROM
                `cyclistic.tripdata_Q1` )

#Repeat for all quarter

#Calculating average ride length of overall trips, casual riders trips, and annual members trips per quarter year

SELECT
        ( SELECT 
                AVG(ride_length)
        FROM 
                `cyclistic.tripdata_Q1` ) 
        AS 
                average_ride_length_overall,
        ( SELECT 
                AVG(ride_length) 
        FROM 
                `cyclistic.tripdata_Q1`
        WHERE 
                member_casual = 'casual' ) 
        AS 
                average_ride_length_casual,
        ( SELECT 
                AVG(ride_length) 
        FROM 
                `cyclistic.tripdata_Q1`
        WHERE 
                member_casual = 'member' ) 
        AS 
                average_ride_length_member

#Repeat for all quarter

#Calculating maximum ride length of casual riders trips and annual members trips per quarter year

SELECT 
        member_casual,
        MAX(ride_length) AS max_ride_Length
FROM 
        `cyclistic.tripdata_Q1`
GROUP BY 
        member_casual
ORDER BY 
        max_ride_length DESC

#Repeat for all quarter

#Calculating median ride length of casual riders trips and annual members trips per quarter year

SELECT
        DISTINCT member_casual,
        median_ride_length
FROM 
        ( SELECT 
                ride_id,
                member_casual,
                ride_length,
                PERCENTILE_DISC(ride_length, 0.5 IGNORE NULLS) OVER(PARTITION BY member_casual) 
                #percentiles disc to calculate the percentile based on a discrete distribution of the 
                --column values
        AS  
                median_ride_length
        FROM 
                `cyclistic.tripdata_Q1`
        )
ORDER BY 
        median_ride_length DESC

#Repeat for all quarter

#Calculating total trips in a day of the week for casual riders and annual members in each quarter of the year 

SELECT  
        day_of_week,
        COUNT(DISTINCT ride_id) AS total_trips,
        COUNTIF(member_casual='casual') AS casual_trips,
        COUNTIF(member_casual='member') AS member_trips
FROM 
        `cyclistic.tripdata_Q1`
GROUP BY 
        1
ORDER BY 
        total_trips DESC

#Repeat for all quarter

#Determine busiest day of the week for casual riders and annual members in each quarter of the year 

SELECT
        member_casual, 
        day_of_week AS busiest_day #number of day_of_week with the highest total trips 
FROM 
        ( SELECT
        DISTINCT 
                member_casual, day_of_week, 
        ROW_NUMBER() OVER (PARTITION BY member_casual ORDER BY COUNT(day_of_week) DESC) RN
        #row number to assign each row as sequential number based on partition order by certain column
        FROM
                `cyclistic.tripdata_Q1`
        GROUP BY
                member_casual, day_of_week )
WHERE
        RN = 1 #row number starts from 1st row

#Repeat for all quarter

#Calculating median ride length per day for casual riders and annual members per quarter year

SELECT
        DISTINCT day_of_week,
        median_ride_length
FROM 
        ( SELECT 
                ride_id,
                day_of_week,
                ride_length,
                PERCENTILE_DISC(ride_length, 0.5 IGNORE NULLS) OVER(PARTITION BY day_of_week) 
                AS median_ride_length
        FROM 
                `cyclistic.tripdata_Q1`
        WHERE 
                member_casual = 'casual' ) #casual/member
ORDER BY 
        median_ride_length DESC;

#Repeat for all quarter

#Calculating top 5 stations that popular for casual riders and annual members to start and end their trips

SELECT 
        DISTINCT start_station_name,
        COUNT(ride_id = ride_id AND start_station_name = start_station_name) AS total_trips,
        COUNTIF(member_casual='casual' AND start_station_name = start_station_name) AS casual_trips,
        COUNTIF(member_casual='member' AND start_station_name = start_station_name) AS member_trips
FROM 
        `cyclistic.tripdata_Q1`
GROUP BY 
        start_station_name
ORDER BY 
        total_trips DESC 
LIMIT 5;

SELECT 
        DISTINCT end_station_name,
        COUNT(ride_id = ride_id AND end_station_name = end_station_name) AS total_trips,
        COUNTIF(member_casual='casual' AND end_station_name = end_station_name) AS casual_trips,
        COUNTIF(member_casual='member' AND end_station_name = end_station_name) AS member_trips
FROM 
        `cyclistic.tripdata_Q1`
GROUP BY 
        end_station_name
ORDER BY 
        total_trips DESC 
LIMIT 5;

SELECT 
        DISTINCT start_station_name,
        COUNT(ride_id = ride_id AND start_station_name = start_station_name) AS total_trips,
        COUNTIF(member_casual='casual' AND start_station_name = start_station_name) AS casual_trips,
        COUNTIF(member_casual='member' AND start_station_name = start_station_name) AS member_trips
FROM 
        `cyclistic.tripdata_Q1`
GROUP BY 
        start_station_name
ORDER BY 
        casual_trips DESC #casual/member
LIMIT 5;

SELECT 
        DISTINCT end_station_name,
        COUNT(ride_id = ride_id AND end_station_name = end_station_name) AS total_trips,
        COUNTIF(member_casual='casual' AND end_station_name = end_station_name) AS casual_trips,
        COUNTIF(member_casual='member' AND end_station_name = end_station_name) AS member_trips
FROM 
        `cyclistic.tripdata_Q1`
GROUP BY 
        end_station_name
ORDER BY 
        casual_trips DESC #casual/member
LIMIT 5;

#Repeat for all quarter

#Determining the minimum and maximum of latitude and longitude of stations available for trips


SELECT  
        MAX(start_lat) AS start_lat_max,
        MIN(start_lat) AS start_lat_min,
        MAX(start_lng) AS start_lng_max,
        MIN(start_lng) AS start_lng_min,
        MAX(end_lat) AS end_lat_max,
        MAX(end_lat) AS end_lat_min,
        MAX(end_lng) AS end_lng_max,
        MIN(end_lng) AS end_lng_min
FROM
        `cyclistic.tripdata_Q1`

#Repeat for all quarter

#Determining the most used rideable_type by casual riders and annual members per quarter year

SELECT 
        rideable_type, 
        member_casual, 
        COUNT(*) AS total_trips
FROM 
        `cyclistic.tripdata_Q1`
GROUP BY 
        rideable_type, member_casual
ORDER BY 
        total_trips DESC

#Repeat for all quarter

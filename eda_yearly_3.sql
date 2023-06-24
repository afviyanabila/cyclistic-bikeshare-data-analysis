#Combining total trip percentage per quarter into one table

WITH Q1 AS 
      (
        SELECT 
	        'trippercentage_Q1' AS quarter,
                total_trips, total_casual_trips, total_member_trips, 
                casual_percentage, member_percentage
        FROM 
                `cyclistic.trippercentage_Q1`
        ), Q2 AS 
        (
        SELECT 
                'trippercentage_Q2' AS quarter, 
                total_trips, total_casual_trips, total_member_trips, 
                casual_percentage, member_percentage
        FROM 
                `cyclistic.trippercentage_Q2`

        ), Q3 AS 
        (
        SELECT 
                'trippercentage_Q3' AS quarter, 
                total_trips, total_casual_trips, total_member_trips, 
                casual_percentage, member_percentage
        FROM 
                `cyclistic.trippercentage_Q3`

        ), Q4 AS 
        (
        SELECT 
                'trippercentage_Q4' AS quarter, 
                total_trips, total_casual_trips, total_member_trips, 
                casual_percentage, member_percentage
        FROM 
                `cyclistic.trippercentage_Q4`

        )
SELECT 
        *
FROM 
        Q1
UNION DISTINCT
SELECT
        *
FROM
        Q2
UNION DISTINCT
SELECT
        *
FROM
        Q3
UNION DISTINCT
SELECT
        *
FROM
        Q4
ORDER BY 
        1 ASC

#Combining average trips per quarter into one table

WITH Q1 AS 
      (
        SELECT 
	        'avgtrips_Q1' AS quarter,
                average_ride_length_overall, 
                average_ride_length_casual, 
                average_ride_length_member
        FROM 
                `cyclistic.avgtrips_Q1`
        ), Q2 AS 
        (
        SELECT 
                'avgtrips_Q2' AS quarter, 
                average_ride_length_overall, 
                average_ride_length_casual, 
                average_ride_length_member
        FROM 
                `cyclistic.avgtrips_Q2`

        ), Q3 AS 
        (
        SELECT 
                'avgtrips_Q3' AS quarter, 
                average_ride_length_overall, 
                average_ride_length_casual, 
                average_ride_length_member
        FROM 
                `cyclistic.avgtrips_Q3`

        ), Q4 AS 
        (
        SELECT 
                'avgtrips_Q4' AS quarter, 
                average_ride_length_overall, 
                average_ride_length_casual, 
                average_ride_length_member
        FROM 
                `cyclistic.avgtrips_Q4`

        )
SELECT 
        *
FROM 
        Q1
UNION DISTINCT
SELECT
        *
FROM
        Q2
UNION DISTINCT
SELECT
        *
FROM
        Q3
UNION DISTINCT
SELECT
        *
FROM
        Q4
ORDER BY 
        1 ASC

#Combining maximum ride length per quarter into one table

WITH Q1 AS 
      (
        SELECT 
	              'maxridelength_Q1' AS quarter,
                member_casual,
                max_ride_Length
        FROM 
                `cyclistic.maxridelength_Q1`
        ), Q2 AS 
        (
        SELECT 
                'maxridelength_Q2' AS quarter,
                member_casual,
                max_ride_Length
        FROM 
                `cyclistic.maxridelength_Q2`

        ), Q3 AS 
        (
        SELECT 
                'maxridelength_Q3' AS quarter,
                member_casual,
                max_ride_Length
        FROM 
                `cyclistic.maxridelength_Q3`

        ), Q4 AS 
        (
        SELECT 
                'maxridelength_Q4' AS quarter,
                member_casual,
                max_ride_Length
        FROM 
                `cyclistic.maxridelength_Q4`

        )
SELECT 
        *
FROM 
        Q1
UNION DISTINCT
SELECT
        *
FROM
        Q2
UNION DISTINCT
SELECT
        *
FROM
        Q3
UNION DISTINCT
SELECT
        *
FROM
        Q4
ORDER BY 
        1 ASC

#Combining median ride length per quarter into one table

WITH Q1 AS 
      (
        SELECT 
	        'medianridelength_Q1' AS quarter,
                member_casual,
                median_ride_length
        FROM 
                `cyclistic.medianridelength_Q1`
        ), Q2 AS 
        (
        SELECT 
                'medianridelength_Q2' AS quarter,
                member_casual,
                median_ride_length
        FROM 
                `cyclistic.medianridelength_Q2`

        ), Q3 AS 
        (
        SELECT 
                'medianridelength_Q3' AS quarter,
                member_casual,
                median_ride_length
        FROM 
                `cyclistic.medianridelength_Q3`

        ), Q4 AS 
        (
        SELECT 
                'medianridelength_Q4' AS quarter,
                member_casual,
                median_ride_length
        FROM 
                `cyclistic.medianridelength_Q4`

        )
SELECT 
        *
FROM 
        Q1
UNION DISTINCT
SELECT
        *
FROM
        Q2
UNION DISTINCT
SELECT
        *
FROM
        Q3
UNION DISTINCT
SELECT
        *
FROM
        Q4
ORDER BY 
        1 ASC

#Combining busiest day of the week for each quarter of the year into one table

WITH Q1 AS 
      (
        SELECT 
	        'busiestday_Q1' AS quarter,
                member_casual, 
                busiest_day
        FROM 
                `cyclistic.busiestday_Q1`
        ), Q2 AS 
        (
        SELECT 
                'busiestday_Q2' AS quarter,
                member_casual, 
                busiest_day
        FROM 
                `cyclistic.busiestday_Q2`

        ), Q3 AS 
        (
        SELECT 
                'busiestday_Q3' AS quarter,
                member_casual, 
                busiest_day
        FROM 
                `cyclistic.busiestday_Q3`

        ), Q4 AS 
        (
        SELECT 
                'busiestday_Q4' AS quarter,
                member_casual, 
                busiest_day
        FROM 
                `cyclistic.busiestday_Q4`

        )
SELECT 
        *
FROM 
        Q1
UNION DISTINCT
SELECT
        *
FROM
        Q2
UNION DISTINCT
SELECT
        *
FROM
        Q3
UNION DISTINCT
SELECT
        *
FROM
        Q4
ORDER BY 
        1 ASC

#Combining median ride length per day for casual riders/annual members per quarter year into one table (repeat for member)

WITH Q1 AS 
      (
        SELECT 
	        'casual'AS member_casual,
                'mediandayofweek_Q1' AS quarter,
                day_of_week,
                median_ride_length
        FROM 
                `cyclistic.mediandayofweek_cQ1`
        ), Q2 AS 
        (
        SELECT 
                'casual'AS member_casual,
                'mediandayofweek_Q2' AS quarter,
                day_of_week,
                median_ride_length
        FROM 
                `cyclistic.mediandayofweek_cQ2`

        ), Q3 AS 
        (
        SELECT 
                'casual'AS member_casual,
                'mediandayofweek_Q3' AS quarter,
                day_of_week,
                median_ride_length
        FROM 
                `cyclistic.mediandayofweek_cQ3`

        ), Q4 AS 
        (
        SELECT 
                'casual'AS member_casual,
                'mediandayofweek_Q4' AS quarter,
                day_of_week,
                median_ride_length
        FROM 
                `cyclistic.mediandayofweek_cQ4`

        )
SELECT 
        *
FROM 
        Q1
UNION DISTINCT
SELECT
        *
FROM
        Q2
UNION DISTINCT
SELECT
        *
FROM
        Q3
UNION DISTINCT
SELECT
        *
FROM
        Q4
ORDER BY 
        2 ASC

#Combining top start and end station for casual riders/annual members per quarter year into one table (repeat for member)

WITH Q1 AS 
      (
        SELECT 
	        'casual'AS member_casual,
                'startstation_cQ1' AS quarter,
                start_station_name, casual_trips
        FROM 
                `cyclistic.startstation_cQ1`
        ), Q2 AS 
        (
        SELECT 
	        'casual'AS member_casual,
                'startstation_cQ2' AS quarter,
                start_station_name, casual_trips
        FROM 
                `cyclistic.startstation_cQ2`
        ), Q3 AS 
        (
        SELECT 
	        'casual'AS member_casual,
                'startstation_cQ3' AS quarter,
                start_station_name, casual_trips
        FROM 
                `cyclistic.startstation_cQ3`

        ), Q4 AS 
        (
        SELECT 
                'casual'AS member_casual,
                'startstation_cQ4' AS quarter,
                start_station_name, casual_trips
        FROM 
                `cyclistic.startstation_cQ4`

        )
SELECT 
        *
FROM 
        Q1
UNION DISTINCT
SELECT
        *
FROM
        Q2
UNION DISTINCT
SELECT
        *
FROM
        Q3
UNION DISTINCT
SELECT
        *
FROM
        Q4
ORDER BY 
        4 DESC

#Combining most rideable type used by casual riders/annual members per quarter year into one table

WITH Q1 AS 
      (
        SELECT 
	              'rideabletype_Q1' AS quarter,
                rideable_type, member_casual, total_trips
        FROM 
                `cyclistic.rideabletype_Q1`
        ), Q2 AS 
        (
        SELECT 
	              'rideabletype_Q2' AS quarter,
                rideable_type, member_casual, total_trips
        FROM 
                `cyclistic.rideabletype_Q2`
        ), Q3 AS 
        (
        SELECT 
	              'rideabletype_Q3' AS quarter,
                rideable_type, member_casual, total_trips
        FROM 
                `cyclistic.rideabletype_Q3`

        ), Q4 AS 
        (
        SELECT 
                'rideabletype_Q4' AS quarter,
                rideable_type, member_casual, total_trips
        FROM 
                `cyclistic.rideabletype_Q4`

        )
SELECT 
        *
FROM 
        Q1
UNION DISTINCT
SELECT
        *
FROM
        Q2
UNION DISTINCT
SELECT
        *
FROM
        Q3
UNION DISTINCT
SELECT
        *
FROM
        Q4
ORDER BY 
        4 DESC

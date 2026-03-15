WITH TRIPS AS (

SELECT 
    BIKEID, 
    usertype, 
    DATE(TO_TIMESTAMP(starttime)) as trip_date, 
    Start_station_id as start_station_id, 
    end_station_id, 
    TIMESTAMPDIFF(seconds,TO_TIMESTAMP(starttime), TO_TIMESTAMP(stoptime)) as trip_duration_seconds
FROM {{ source('demo', 'bike2') }}
WHERE bikeid != 'bikeid'


)

SELECT * FROM trips
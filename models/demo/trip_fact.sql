WITH TRIPS AS (

SELECT 
    RIDE_ID, 
    rideable_type, 
    DATE(TO_TIMESTAMP(started_at)) as started_at, 
    Start_statio_id as start_station_id, 
    end_station_id, 
    TIMESTAMPDIFF(seconds,TO_TIMESTAMP(started_at), TO_TIMESTAMP(ended_at)) as trip_duration_seconds
FROM {{ source('demo', 'bike') }}
WHERE ride_id != 'ride_id'
limit 10

)

SELECT * FROM trips
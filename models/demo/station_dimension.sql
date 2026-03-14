WITH BIKE AS (

SELECT 
    distinct
    start_statio_id as start_station_id,
    Start_station_name,
    start_lat,
    start_lng
FROM {{ source('demo', 'bike') }}
WHERE ride_id != 'ride_id'
limit 10

)

SELECT * FROM BIKE 
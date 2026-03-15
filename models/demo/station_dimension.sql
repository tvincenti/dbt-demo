WITH BIKE AS (

SELECT 
    distinct
    start_station_id as start_station_id,
    Start_station_name,
    start_station_latitude,
    start_station_longitude
FROM {{ source('demo', 'bike2') }}



)

SELECT * FROM BIKE 
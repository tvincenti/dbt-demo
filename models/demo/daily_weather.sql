WITH daily_weather AS (


SELECT 
    date(time) as daily_weather,
    weather, 
    temp, 
    pressure, 
    humidity, 
    clouds
FROM {{ source('demo', 'weather') }}




),


daily_weather_agg as(

SELECT 
    daily_weather,
    weather, 
    --count(weather),
    --ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) DESC)
    ROUND(avg(temp),2) as avg_temp, 
    ROUND(avg(pressure),2) as avg_pressure, 
    ROUND(avg(humidity),2) as avg_humidity, 
    ROUND(avg(clouds),2) as avg_clouds
FROM daily_weather
GROUP BY daily_weather, weather
qualify  ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) DESC) = 1


)

SELECT * from daily_weather_agg
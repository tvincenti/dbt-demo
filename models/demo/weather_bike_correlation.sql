WITH CTE AS (

SELECt * FROM {{ ref('trip_fact') }} t
LEFT JOIN {{ ref('daily_weather') }} dw
ON t.trip_date = dw.daily_weather


)
SELECT * FROM CTE
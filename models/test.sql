
SELECT * FROM
{{ source('demo', 'bikes') }}
LIMIT 10
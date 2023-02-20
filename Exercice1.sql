SELECT COUNT(film_id), rating 
FROM film 
GROUP BY rating;

SELECT * 
FROM film 
WHERE rating 
IN ('G', 'PG-13') 
AND rental_rate < 3 
AND rental_duration < 2
ORDER BY title ASC;

UPDATE customer
SET first_name = 'zozoalonita@gmail.com', last_name = 'sarah', email = 'zozoalonita@gmail.com'
WHERE customer_id = 1;

UPDATE customer
SET address_id = 10
WHERE customer_id = 1;
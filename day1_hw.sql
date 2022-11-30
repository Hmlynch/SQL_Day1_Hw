-- 1. How many actors are there with the last name 'Wahlberg'? Answer: 2
SELECT *
FROM actor 
WHERE last_name = 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99? Answer: 3,431
SELECT count(*)
FROM payment 
WHERE amount > 3.99 AND amount < 5.99;

-- 3. What film does the store have the most of? (Still couldn't asnwer...)
SELECT film_id, count(inventory_id) AS film_stock
FROM inventory 
group BY film_id ;

-- 4. How many customers have the last name ‘William’? 0 with just 'William', 2 being Williams and Williamson
SELECT *
FROM customer 
WHERE last_name LIKE 'William%';

-- 5. What store employee (get the id) sold the most rentals?
SELECT count(payment_id)
FROM payment 
GROUP BY staff_id;

-- 6. How many different district names are there?
SELECT DISTINCT district
FROM address 
GROUP BY district;

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, count(actor_id) AS total_actors
FROM film_actor 
GROUP BY film_id;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table) Answer: 21
SELECT last_name  
FROM customer 
WHERE last_name LIKE '%es';

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customerswith ids between 380 and 430? 
-- (use group by and having > 250)
SELECT amount, count(customer_id)
FROM payment 
WHERE customer_id > 380 AND customer_id < 430
GROUP BY amount 
HAVING count(customer_id) > 250
ORDER BY count(customer_id) DESC;

-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total?
SELECT rating, count(film_id)
FROM film 
GROUP BY rating
ORDER BY count(film_id) DESC;

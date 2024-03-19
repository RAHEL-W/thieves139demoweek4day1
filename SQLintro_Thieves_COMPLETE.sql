-- Verify connection to DB using the Actor Table
SELECT *
FROM amount;

-- Query for first_name and last_name from the actor table
SELECT first_name, last_name
FROM actor;

-- Query first_name which equals 'Nick'
-- Using the WHERE Clause
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';


-- Query first_name which equals 'Nick'
-- Using LIKE clause
-- NOTE: ( = ) is looking for a literal string
-- while the LIKE Clause allows use for wildcards
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick';


-- Using LIKE Clause and WILD CARD ( % )
-- Get all J names
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%';


-- Single Character Wild Card ( _ )
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J___';


-- Query for all first_names that start with 'K__%' has two letters, anything goes after
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__%';


----- Comparasion Operators:
-- = Equals to
-- > Greater Than
-- < Less Than
-- >= Greater Than or Equal to
-- <= Less Than or Equal to
-- <> Not equals

-- Using Comparasion Operators with the Payment Table


-- Query WHERE amount GREATER THAN $10.
SELECT customer_id, amount
FROM payment
WHERE amount > 10;

-- Query amounts BETWEEN $10-$15
-- NOTE: When using BETWEEN both values are inclusive
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 10 AND 15;


-- Order the payments by amount
-- Using the ORDER BY
-- ASC for ascending order (Default)
-- DESC for decending order


-- Query all payments NOT EQUAL to 2.99
SELECT customer_id, amount
FROM payment
WHERE amount <> 2.99
ORDER BY amount ASC;


----- Aggregate Functions
-- MIN()
-- MAX()
-- SUM()
-- AVG()
-- COUNT()

-- Query the SUM of amounts GREATER THAN OR EQUAL TO 5.99
SELECT SUM(amount)
FROM payment
WHERE amount >= 5.99;

-- Query the AVG of amounts GREATER THAN OR EQUAL TO 5.99
SELECT AVG(amount)
FROM payment
WHERE amount >= 5.99;

-- Query the COUNT of amounts GREATER THAN OR EQUAL TO 5.99
SELECT COUNT(amount)
FROM payment
WHERE amount >= 5.99;


-- Query to display the count of DISTINCT amounts paid
SELECT COUNT(DISTINCT amount)
FROM payment;


-- Query to display the MIN paid using alias
SELECT MIN(amount) as min_amount_paid
FROM payment;

-- Query to display the MAX paid using alias
SELECT MAX(amount) as Max_Amount
FROM payment;


-- GROUP BY (Used with aggregate functions)
SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount
ORDER BY COUNT(amount) DESC;



-- Query the customer that paid the most
SELECT customer_id, SUM(amount)
FROM payment
WHERE payment_date > '2007-04-01'
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

--SUB


SELECT *
FROM payment
WHERE payment_date BETWEEN '2007-01-01' AND '2007-04-14'
ORDER BY payment_date DESC;



-- 1. How many actors are there with the last name ‘Wahlberg’?




--A) There are blank actors with the last name blah




                --   Week 5 - Monday Questions

-- 1. How many actors are there with the last name ‘Wahlberg’?

SELECT first_name, last_name 
FROM actor
WHERE last_name = 'Wahlberg';

    -- or
SELECT first_name, last_name 
FROM actor
WHERE last_name LIKE 'Wahlberg';


-- 1_A) I got two actors with last_name "nick Wahlberg and daryl Wahlberg "

-- 2. How many payments were made between $3.99 and $5.99?

SELECT amount, COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99
GROUP BY amount
ORDER BY COUNT(amount) DESC;

-- ORDER BY COUNT(amount);

-- there are in 4.99 :3420 payments,5.99 :1187 payments, 3.99 :988 payments, 5.98 :7 payments
-- 3. What film does the store have the most of? (search in inventory)

SELECT film_id, COUNT(film_id) as film_count
FROM  inventory
GROUP BY film_id
ORDER BY film_count DESC LIMIT 1;

-- 3 film_id 350
-- 4. How many customers have the last name ‘William’?
SELECT first_name,last_name 
FROM customer
WHERE last_name like 'William';

-- 4_A) it show me no data but when i put 's' in the last like 'Williams' i found 1 name"linda williams"


-- 5. What store employee (get the id) sold the most rentals?


SELECT staff_id, COUN(rental_id) as most_rental
FROM rental
GROUP BY staff_id
ORDER BY  most_rental  DESC LIMIT 1 ;

--5_A) staff_id 1  sold most rentals 

-- 6. different district names are there?

SELECT rental_id,first_name, last_name
FROM rental,staff


-- 6_A) How many different district names are there?
  SELECT COUNT(DISTINCT district) 
  FROM address;
-- 6A   378 different districts
-- 7. What film has the most actors in it? (use film_actor table and get film_id)

SELECT film_id, max(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY max(actor_id) DESC;

-- 7_A)film_id 544,419,993.....has most actors(200)
-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT store_id, last_name
FROM customer
WHERE store_id =1 AND last_name like '%es';

-- 8_A) there are store_id 1, 13 last_name name end with es 

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)


SELECT amount, COUNT(*) AS rental_count
FROM payment 
JOIN rental ON payment.rental_id = rental.rental_id
WHERE rental.customer_id BETWEEN 380 AND 430 
GROUP BY amount
HAVING COUNT(*) > 250;

-- 9_A) there is only one 4.99 amout having 281


-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT  COUNT( DISTINCT rating)
FROM film;

SELECT rating, COUNT(title)
FROM  film
GROUP BY rating
ORDER BY COUNT(title) DESC;


 5 rating categories and PG-13 has 223
SELECT* FROM actor



SELECT customer_id,sum(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) >  175



SELECT first_name, last_name
FROM customer
WHERE customer_id = 144



SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
     SELECT customer_id
     FROM payment
     GROUP BY payment.customer_id
     HAVING SUM(amount) > 175

)


SELECT first_name, last_name, SUM(amount)
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
GROUP by customer.first_name, customers.last_name
HAVING SUM(amount) >  175

-- 1. Retreive the latest rental for each customer's first and last name and emial address. 
select DISTINCT ON (first_name, last_name, email) first_name, last_name, email, rental_date
from rental
inner join customer ON customer.customer_id = rental.customer_id
order by first_name,last_name,email,rental_date ASC

-- 2. Retrieve the latest rental date for each title. 


-- Bonus:
-- Query 2 only returned 958 movies, which means 42 movies are not being rented. 
-- We know that there are 1,000 movies in the `film` table. 
-- Retrieve the film titles of the 42 movies that are not in the `inventory` table. 
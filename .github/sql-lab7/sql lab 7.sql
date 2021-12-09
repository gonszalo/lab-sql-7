-- In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
use sakila;

select count(distinct last_name) from actor;
select last_name from actor group by last_name having count(*) = 1;

-- Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once

select last_name from actor group by last_name having count(*) > 1;

-- Using the rental table, find out how many rentals were processed by each employee.

select distinct(staff_id), sum(rental_id)
over(partition by staff_id)
from sakila.rental
order by staff_id;

-- Using the film table, find out how many films were released each year.

select count(film_id), sum(release_year)
from sakila.film
group by release_year;

-- Using the film table, find out for each rating how many films were there.

select rating, count(film_id)
from sakila.film
group by rating;

-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places

select lenght, film_id, rating,
avg(lenght) over(partition by film_id) as mean_length
from sakila.film
group by rating;

-- Which kind of movies (rating) have a mean duration of more than two hours?

select rating, count(film_id)
from sakila.film
where length > 120
group by rating;




-- This entire file is runnable as a query
-- Jon Rippe
    -- CSCE A360
    -- Chapter 7
    -- 1
SELECT
    CONCAT_WS(" ", c.first_name, c.last_name) AS "Customer",
    city.city AS "City",
    country.country AS "Country",
    COUNT(rental.rental_id) AS "Rentals"
FROM
    customer AS c
JOIN address ON c.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
JOIN rental ON c.customer_id = rental.customer_id
GROUP BY
    c.customer_id
ORDER BY
    Rentals DESC,
    c.last_name ASC
LIMIT 10



;-- Jon Rippe
    -- CSCE A360
    -- Chapter 7
    -- 2
SELECT
    inventory.inventory_id AS "Inventory ID",
    film.film_id AS "Film ID",
    film.title AS "Film Title",
    film.rental_rate AS "Rental Rate",
    store.store_id AS "Store ID",
    CONCAT_WS(", ", city.city, country.country) AS "City Location"
FROM
    inventory
JOIN film ON inventory.film_id = film.film_id
JOIN store ON inventory.store_id = store.store_id
JOIN address ON store.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id
WHERE
    rental.rental_id IS NULL



;-- Jon Rippe
    -- CSCE A360
    -- Chapter 7
    -- 3
SELECT
    COUNT(
        CASE WHEN DATEDIFF(
            rental.return_date,
            rental.rental_date
        ) > film.rental_duration THEN 1
    END
    ) AS "Returned Late",
    COUNT(
        CASE WHEN DATEDIFF(
            rental.return_date,
            rental.rental_date
        ) <= film.rental_duration THEN 1
    END
    ) AS "Returned On Time",
    COUNT(1) - COUNT(rental.return_date) AS "Not Returned",
    COUNT(rental_id) AS "Total Rentals"
FROM
    rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id


;    -- Another Way (subquery)
SELECT
    COUNT(r.late) AS "Returned Late",
    COUNT(r.ontime) AS "Returned On Time",
    COUNT(1) - COUNT(r.return_date) AS "Not Returned",
    COUNT(r.rental_id) AS "Total Rentals"
FROM
    (
    SELECT
        rental.rental_id,
        rental.return_date,
        IF(
            DATEDIFF(
                rental.return_date,
                rental.rental_date
            ) > film.rental_duration,
            1,
            NULL
        ) AS "late",
        IF(
            DATEDIFF(
                rental.return_date,
                rental.rental_date
            ) <= film.rental_duration,
            1,
            NULL
        ) AS "ontime"
    FROM
        rental
    JOIN inventory ON rental.inventory_id = inventory.inventory_id
    JOIN film ON inventory.film_id = film.film_id
) AS r



;-- Jon Rippe
    -- CSCE A360
    -- Chapter 7
    -- 4
SELECT
    CONCAT_WS(
        ", ",
        customer.last_name,
        customer.first_name
    ) AS "Customer",
    inventory.inventory_id AS "Inventory ID",
    film.title AS "Film Title",
    DATEDIFF(
        NOW(),
        DATE_ADD(
            rental.rental_date,
            INTERVAL film.rental_duration DAY
        )
    ) AS "Days Overdue",
    film.replacement_cost AS "Replacement Cost"
FROM
    customer
JOIN rental ON customer.customer_id = rental.customer_id
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
WHERE
    rental.return_date IS NULL
ORDER BY
    Customer ASC


;-- Jon Rippe
    -- CSCE A360
    -- Chapter 7
    -- 5
SELECT
    category.category_id AS "Category ID",
    category.name AS "Category",
    COUNT(rental.rental_id) AS "Rental Count",
    SUM(payment.amount) AS "Total Sales"
FROM
    rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY
    category.category_id
ORDER BY
    `Total Sales` DESC
    


;-- Jon Rippe
    -- CSCE A360
    -- Chapter 7
    -- 6
SELECT
    film.film_id AS "Film ID",
    film.title AS "Film Title",
    COUNT(
        DISTINCT inventory.inventory_id
    ) AS Copies,
    SUM(payment.amount) AS "Total Sales",
    COUNT(
        DISTINCT inventory.inventory_id
    ) * film.replacement_cost AS "Replacement Value",
    SUM(payment.amount) - (
        COUNT(
            DISTINCT inventory.inventory_id
        ) * film.replacement_cost
    ) AS "Net Profit"
FROM
    film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY
    film.film_id
ORDER BY
    `Net Profit` DESC
LIMIT 25



;-- Jon Rippe
    -- CSCE A360
    -- Chapter 7
    -- 7
    -- Modified to use CTE in addition to changed ordering
WITH
    filmStats(
        film_id,
        title,
        copies,
        total_sales,
        replacement_cost
    ) AS(
    SELECT
        film.film_id,
        film.title,
        COUNT(
            DISTINCT inventory.inventory_id
        ) AS Copies,
        SUM(payment.amount) AS "Total Sales",
        film.replacement_cost
    FROM
        film
    JOIN inventory ON film.film_id = inventory.film_id
    JOIN rental ON inventory.inventory_id = rental.inventory_id
    JOIN payment ON rental.rental_id = payment.rental_id
    GROUP BY
        film.film_id
)
SELECT
    film_id AS "Film ID",
    title AS "Film Title",
    copies AS "Copies",
    total_sales AS "Total Sales",
    copies * replacement_cost AS "Replacement Value",
    total_sales -(copies * replacement_cost) AS "Net Profit"
FROM
    filmStats
ORDER BY
    `Net Profit` ASC
LIMIT 25
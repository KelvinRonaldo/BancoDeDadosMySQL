desc actor;
SELECT * FROM actor;
SELECT * FROM category;
SELECT * FROM film;
SELECT * FROM film__category;
SELECT * FROM actor;
SELECT * FROM film_actor;
DESC film_category;
SELECT * FROM store;
SELECT * FROM customer order by customer_id desc;
SELECT * FROM address;
SELECT * FROM staff;
SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM rental ORDER BY inventory_id;
SELECT * FROM rental;
SELECT * FROM inventory;

DESC film;

INSERT INTO film (title, release_year, language_id, rental_duration, rental_rate, replacement_cost, last_update)
		VALUES ('MIRANHA', 2018, 1, 6, 1.99, 25.99, '2019-02-12 22:15:55');
        
INSERT INTO inventory (film_id, store_id, last_update) VALUES (1001, 2, '2019-01-12 22:18:12');

-- PEGAR FILMES QUE NUNCA FORAM ALUGADOS
SELECT f.title,
 i.inventory_id,
 r.rental_id
 FROM rental AS r 
	RIGHT JOIN inventory AS i
 ON r.inventory_id = i.inventory_id
	JOIN film AS f
 ON f.film_id = i.film_id
 WHERE r.rental_id IS NULL;
 
-- PEGAR FILMES QUE NUNCA FORAM ALUGADOS 
SELECT f.title,
 f.film_id,
 i.inventory_id,
 r.rental_id
 FROM rental AS r 
	RIGHT JOIN inventory AS i
 ON r.inventory_id = i.inventory_id
	JOIN film AS f
 ON i.film_id = f.film_id
 WHERE r.inventory_id IS NULL;

-- FILMES NÃO INVENTARIADOS
SELECT 
 f.film_id,
 f.title,
 i.inventory_id,
 i.store_id
FROM 
 film AS f LEFT JOIN inventory AS i
ON
 f.film_id = i.film_id
WHERE i.film_id IS NULL
ORDER BY f.film_id;


INSERT INTO customer (store_id, first_name, last_name, email, address_id, active, create_date, last_update)
				VALUES (1, 'Kelvin', 'Ferreira', 'kelvin@r.com', 3, 1, '2019-04-03 14:17:55', '2019-04-03 14:18:55');
                
-- CLIENTES QUE NUNCA ALUGARAM NA LOCADOURA                
SELECT  concat_ws(" ", c.first_name, c.last_name) AS Nome,
		r.rental_id
        FROM rental AS r RIGHT JOIN customer AS c
        ON r.customer_id = c.customer_id
        WHERE r.customer_id IS NULL;


SELECT c.store_id AS Store,
	concat_ws(" ", c.first_name, c.last_name) AS Name,
    ct.city AS City,
    co.country AS Country
    FROM customer AS c
		JOIN address AS a
	ON c.address_id = a.address_id
		JOIN city AS ct
	ON ct.city_id = a.city_id
		JOIN country AS co
	ON ct.country_id = co.country_id
	WHERE co.country LIKE 'G%y';
    /*_ = Uma caracter */
    /*% = QUALQUER QUANTIDADE DE CARACTERES*/
    /*PARA COMPARAÇÕES COMSTRINGS É CERTO USAR O LIKE*/
	/*WHERE co.country LIKE 'Brazil'
		OR co.country LIKE 'Argentina'
		OR co.country LIKE 'Chile'
        OR co.country LIKE 'Colombia';*/
        
	/*WHERE co.country = 'Brazil'
		OR co.country = 'Argentina'
		OR co.country = 'Chile'
        OR co.country = 'Colombia';*/
    /*WHERE co.country IN ('Brazil', 'Argentina', 'Chile', 'Colombia');*/
    

SELECT s.store_id,
	st.first_name,
	st.last_name
    FROM store AS s
		JOIN staff AS st
	ON s.manager_staff_id = st.staff_id;


SELECT  f.title AS Título,
        c.name AS Categoria,
		fc.category_id AS 'Código da Categoria'
        FROM film AS f
            JOIN film_category AS fc
        ON f.film_id = fc.film_id
			JOIN category AS  c
		ON fc.category_id = c.category_id
	ORDER BY f.title LIMIT 10;
    
    
/* CONSULTA DE ATORES POR FILME*/
SELECT  f.title AS Título,
        f.description AS Descrição,
        a.first_name AS Primeiro_Nome,
        a.last_name AS Último_Nome
        FROM film AS f
            JOIN film_actor AS fa
        ON f.film_id = fa.film_id
			JOIN actor AS a
		ON fa.actor_id = a.actor_id
        WHERE f.film_id = 1000;
            
/*CONSULTA FILMES POR ATOR*/
SELECT  f.title AS Título,
        f.description AS Descrição,
        concat_ws(" ", a.first_name, a.last_name) AS Nome
        FROM film AS f
            JOIN film_actor AS fa
        ON f.film_id = fa.film_id
			JOIN actor AS a
		ON fa.actor_id = a.actor_id
        WHERE a.actor_id = 67;
        
        
        
/*RELATORIO DE ATORES POR FILME*/
SELECT f.film_id,
	f.title,
	a.first_name,
    a.last_name
	FROM film AS f
		JOIN film_actor AS fa
	ON f.film_id = fa.film_id
		JOIN actor AS a
	ON fa.actor_id = a.actor_id
    WHERE f.film_id = 625;
    
SELECT f.film_id,
	f.title,
	a.first_name,
    a.last_name
	FROM film AS f
		JOIN film_actor AS fa
	ON f.film_id = fa.film_id
		JOIN actor AS a
	ON fa.actor_id = a.actor_id
    WHERE a.actor_id = 2;
    
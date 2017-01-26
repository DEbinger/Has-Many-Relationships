--1
SELECT * FROM users;

--2
SELECT * FROM posts WHERE users_id = 100;

--3

SELECT first_name, last_name, posts.*
FROM users
INNER JOIN posts on posts.users_id = users_id
WHERE users_id = 200;

--4
SELECT username, posts.*
FROM users
INNER JOIN posts on posts.users_id = users_id
WHERE first_name = 'Norene' and last_name = 'Schmitt';

--5
SELECT username
FROM users
INNER JOIN posts on posts.users_id = users_id
WHERE posts.created_at >='2015-01-01 00:00:00-10';
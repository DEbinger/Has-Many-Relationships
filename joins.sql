--1
SELECT * FROM users;

--2
SELECT * FROM posts WHERE users_id = 100;

--3
SELECT username, posts.*
FROM users
INNER JOIN posts on posts.users_id = users_id
WHERE users_id = 200;

--4
SELECT username, posts.*
FROM users
INNER JOIN posts on posts.users_id = users.id
WHERE first_name = 'Norene' and last_name = 'Schmitt';

--5
SELECT username
FROM users
INNER JOIN posts p
on p.users_id = users.id
WHERE p.created_at > '2015-01-01 00:00:00-10';

--6
SELECT COUNT (p.title) FROM users u
INNER JOIN posts p
ON p.users_id = u.id
WHERE u.created_at < '2015-01-01 00:00:00-10';

--7
SELECT comments.*, posts.title as post_title
FROM posts
INNER JOIN comments
on comments.posts_id = posts.id;

--8
SELECT comments.*, posts.title as post_title, posts.url as post_url, comments.body as comment_body
FROM posts
INNER JOIN comments
ON comments.posts_id = posts.id
WHERE posts.created_at < '2015-01-01 00:00:00-10';

--9
SELECT comments.*, posts.title as post_title, posts.url as post_url, comments.body as comment_body
FROM posts
INNER JOIN comments
ON comments.posts_id = posts.id
WHERE posts.created_at > '2015-01-01 00:00:00-10';

--10
SELECT comments.*, posts.title as post_title, posts.url as post_url, comments.body as comment_body
FROM posts
INNER JOIN comments
ON comments.posts_id = posts.id
WHERE comments.body LIKE '%USB%';

--11
SELECT posts.title as post_title, comments.body as comment_body, users.first_name, users.last_name
FROM users
INNER JOIN posts
ON posts.users_id = users.id
INNER JOIN comments
ON comments.posts_id = posts.id
WHERE comments.body LIKE '%matrix%';

--12
SELECT posts.title as post_title, comments.body as comment_body, users.first_name, users.last_name
FROM users
INNER JOIN comments
ON comments.users_id = users.id
INNER JOIN posts
ON posts.id = comments.posts_id
WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%dolorum%';

--13
SELECT posts.title as post_title, comments.body as comment_body, users.first_name as "posts_author_first_name", users.last_name as "posts_author_last_name", users.username as "comment_author_username"
FROM users
INNER JOIN posts
ON users.id = posts.users_id
INNER JOIN comments
ON posts.id = comments.posts_id
WHERE (comments.body LIKE '%SSL%' or comments.body LIKE '%firewall%') AND posts.content LIKE '%nemo%';
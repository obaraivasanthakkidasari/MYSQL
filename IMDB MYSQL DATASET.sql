use imdb;

SHOW TABLES;

#DESCRIBE
DESCRIBE roles;
DESCRIBE actors;

#SELECT
SELECT * from movies;
SELECT name,year from movies;
SELECT name,year from movies LIMIT 10;
SELECT * from movies LIMIT 10 OFFSET 40;

#ORDER BY
SELECT name,year,rankscore FROM movies ORDER BY year DESC LIMIT 10;
SELECT name,rankscore,year FROM movies ORDER BY year  LIMIT 10;

#DISTINCT
SELECT DISTINCT genre FROM movies_genres;
SELECT DISTINCT first_name,last_name  FROM directors;

 #WHERE
 SELECT name,rankscore,year FROM movies WHERE rankscore>9;
 SELECT * FROM movies WHERE rankscore>9;
 SELECT name,rankscore,year FROM movies WHERE rankscore>9 ORDER BY rankscore DESC LIMIT 20;

#COMPARISION OPERATORS
SELECT * FROM movies_genres WHERE genre=  'Comedy';
SELECT * FROM movies_genres WHERE genre  <>  'Horror';
SELECT * FROM movies WHERE rankscore IS NULL;
SELECT * FROM movies WHERE rankscore IS NOT NULL LIMIT 20;
SELECT name,rankscore,year FROM movies WHERE rankscore=NULL;
SELECT name,rankscore,year FROM movies WHERE rankscore IS NULL LIMIT 20;
SELECT name,rankscore,year FROM movies WHERE rankscore IS NOT NULL LIMIT 20;
SELECT name,rankscore,year FROM movies WHERE rankscore IS NULL LIMIT 20;

#LOGICAL OPERAROERS AND OR NOT ALL ANY BETWEEN IS LIKE SOME
SELECT name,rankscore,year FROM movies WHERE rankscore>9 AND year>2000;
SELECT name,rankscore,year FROM movies WHERE NOT year<=2000 LIMIT 20;
SELECT name,rankscore,year FROM movies WHERE rankscore>9 OR year>2007;
SELECT name,rankscore,year FROM movies WHERE year BETWEEN 1999 AND 2000;
SELECT name,rankscore,year FROM movies WHERE year BETWEEN 2000 AND 1999;
SELECT director_id,genre FROM directors_genres  WHERE genre IN('Comdey','Horror');
SELECT name,rankscore,year FROM movies WHERE name LIKE 'Tis%';
SELECT first_name,last_name FROM actors WHERE first_name LIKE '%es';
SELECT first_name,last_name FROM actors WHERE first_name LIKE '%es%';

#Aggregate Functions like group by in pandas
SELECT MIN(year) FROM movies;
SELECT MAX(year) FROM movies;
SELECT COUNT(*) FROM movies;
SELECT * FROM movies WHERE  year>2000;
SELECT COUNT(*) FROM movies WHERE  year>2000;

#GROUP BY
SELECT year,COUNT(year) FROM movies GROUP BY year;
SELECT year,COUNT(year) FROM movies GROUP BY year ORDER BY year;
SELECT year,COUNT(year) FROM movies GROUP BY year ORDER BY year DESC;
SELECT year,COUNT(year) year_count FROM movies GROUP BY year ORDER BY year_count;

#HAVING
SELECT year,COUNT(year) year_count FROM movies GROUP BY year HAVING year_count>1000;
SELECT name,year FROM movies HAVING year>2000;
SELECT year,COUNT(year) year_count FROM movies WHERE rankscore>9 GROUP BY year HAVING year_count>20;

#JOINS
SELECT m.name,g.genre from movies m JOIN movies_genres g ON m.id=g.movie_id;
SELECT * FROM actors JOIN directors;
SELECT * FROM actors JOIN directors USING(id);
SELECT m.name,g.genre from movies m LEFT JOIN movies_genres g ON m.id=g.movie_id LIMIT 20;
SELECT a.first_name,a.last_name FROM actors a JOIN roles r ON a.id=r.actor_id JOIN movies m on m.id=r.movie_id AND m.name='Officer444';



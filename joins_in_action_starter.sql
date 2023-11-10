-- <<<<<<<<<<<<<<<<<<<<<< EXAMPLE >>>>>>>>>>>>>>>>>>>>>>>
-- Do a full outer join to see all records from both tables matched where possible.
-- EXPECTED RESULT: 77 Rows Returned

SELECT * FROM movies LEFT JOIN users on movie_id = favorite_movie_id
UNION
SELECT * FROM movies RIGHT JOIN users on movie_id = favorite_movie_id;

-- Because MySQL does not support "OUTER JOIN" syntax, we must use left and right joins that are brought together with "UNION".

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 1 >>>>>>>>>>>>>>>>>>>>>>>
-- Do a left join to see all records from the movies table and matching records from the users table.
-- EXPECTED RESULT: 75 Rows Returned

Select * from movies left join users on movie_id= favorite_movie_id;
-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 2 >>>>>>>>>>>>>>>>>>>>>>>
-- Do a right join to see all records from the users table and matching records from the movies table.
-- EXPECTED RESULT: 16 Rows Returned

Select * from movies right join users on movie_id = favorite_movie_id;
-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 3 >>>>>>>>>>>>>>>>>>>>>>>
-- Do a inner join to get only the rows from the movies tables that have matching rows in the users tables.
-- EXPECTED RESULT: 14 Rows Returned
Select * from movies inner join users on movie_id = favorite_movie_id;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 4 >>>>>>>>>>>>>>>>>>>>>>>
-- Determine which lead studio's movies are favorited by users the most.
-- EXPECTED RESULT: Disney
Select lead_studio, COUNT(lead_studio) AS number_lead_studio from movies_library.movies inner join movies_library.users on movie_id = favorite_movie_id group by lead_studio order by number_lead_studio desc limit 1;


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 5 >>>>>>>>>>>>>>>>>>>>>>>
-- Get the average Rotten Tomatoes score of all movies that are favorited by a user.
-- EXPECTED RESULT: 52.21
Select 	avg(rotten_tomatoes) from movies INNER JOIN users on movie_id = favorite_movie_id;


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 6 >>>>>>>>>>>>>>>>>>>>>>>
-- Determine which two movies are have duplicate entries in the dataset. (HINT: No join is needed for this problem)
-- EXPECTED RESULT: Mamma Mia!, Gnomeo and Juliet
-- It is important to be able to identify dirty data within a dataset!

Select film, COUNT(film) AS countedFilm from movies group by film order by countedFilm desc limit 2;

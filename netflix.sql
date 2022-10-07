-- Exploring the cleaned data from Excel:

SELECT * FROM netflix

SELECT COUNT(*) FROM netflix


--Finding the count of genre's and percentage of genre with respect to Genere1(P1)
--(Converting the no_counts data type to float to perform division)

SELECT Genre1 AS genre,
       COUNT(Genre1) as no_counts,
       ROUND(CAST(COUNT(Genre1) AS FLOAT)/ CAST((SELECT COUNT(*) FROM netflix) AS FLOAT) * 100,2) AS percentage_of_genre

FROM netflix

WHERE Genre1 IS NOT NULL

GROUP BY Genre1

ORDER BY 2 DESC


--Finding the count of Movies and percentage of Movies with respect to Genere1(P2)
--Similar to the above Query but adding a filter to fetch movies alone

SELECT Genre1 AS movie_genre,
       COUNT(Genre1) as count_of_movies,
       ROUND(CAST(COUNT(Genre1) AS FLOAT) / 
	   CAST((SELECT COUNT(*) FROM netflix WHERE [Series OR Movie] = 'Movie') AS FLOAT) * 100,2) AS percentage_of_movies

FROM netflix

WHERE Genre1 IS NOT NULL AND
	  [Series OR Movie] = 'Movie'

GROUP BY Genre1

ORDER BY 2 DESC


--Finding the count of Series and percentage of Series with respect to Genere1(P2)
--Same as above but filtering based on 'Series'

SELECT Genre1 AS series_genre,
       COUNT(Genre1) as count_of_series,
       ROUND(CAST(COUNT(Genre1) AS FLOAT) / 
	   CAST((SELECT COUNT(*) FROM netflix WHERE [Series OR Movie] = 'Series') AS FLOAT) * 100,2) AS percentage_of_series

FROM netflix

WHERE Genre1 IS NOT NULL AND
	  [Series OR Movie] = 'Series'

GROUP BY Genre1

ORDER BY 2 DESC


--Finding the number of series and movies relesed based seperated by language.

SELECT Languages, 
       COUNT(Languages) AS no_counts,
	   ROUND(CAST(COUNT(Languages) AS FLOAT) / CAST((SELECT COUNT(*) FROM netflix) AS FLOAT) * 100,2) AS percent_of_language

FROM netflix 

WHERE Genre1 IS NOT NULL

GROUP BY Languages

ORDER BY 2 DESC


--Finding no of movies and series produced by top production houses

SELECT [Production House],
       COUNT([Production House]) AS no_count

FROM netflix

GROUP BY [Production House]

ORDER BY 2 DESC


--Finding the run time count based on runtime catogery

SELECT Runtime,
       COUNT(Runtime) AS no_counts

FROM netflix

WHERE Genre1 IS NOT NULL AND Runtime IS NOT NULL

GROUP BY Runtime

ORDER BY 2 DESC


--Finding top movies based on their box office collection, IMDB Votes and Award received.

SELECT Title,
       Boxoffine AS boxoffice_collection,
	   [IMDb Votes],
	   [Awards Received]

FROM netflix

WHERE Title IS NOT NULL AND [Awards Received] IS NOT NULL

ORDER BY 2 DESC,4


--Finding top rated IMDb Movies

SELECT title,
	   [IMDb Score] 

FROM netflix

WHERE [Series or Movie] = 'movie'

ORDER BY 2 DESC


--Finding top rated IMDb Movies

SELECT title,
	   [IMDb Score] 

FROM netflix

WHERE [Series or Movie] = 'Series'

ORDER BY 2 DESC,1


--Finding top rated hidden gem (series)

SELECT TOP(10) Title,
       [hidden gem score]

FROM netflix

WHERE [Series OR Movie] = 'Series'

ORDER BY 2 DESC


--Finding top rated hidden gem (movies)


SELECT TOP(10) Title,
       [hidden gem score]

FROM netflix

WHERE [Series OR Movie] = 'Movie'

ORDER BY 2 DESC

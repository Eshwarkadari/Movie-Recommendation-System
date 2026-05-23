-- ============================================================
-- Analysis Queries — Power BI Ready
-- ============================================================

USE movie_recommender;

-- 1. Top 10 Highest Rated Movies
SELECT m.title, m.genre, m.release_year,
       ROUND(AVG(r.rating),2) AS avg_rating,
       COUNT(r.rating_id)     AS total_reviews
FROM ratings r JOIN movies m ON r.movie_id = m.movie_id
GROUP BY m.movie_id, m.title, m.genre, m.release_year
ORDER BY avg_rating DESC, total_reviews DESC
LIMIT 10;

-- 2. Most Watched Movies
SELECT m.title, m.genre,
       COUNT(r.rating_id)     AS watch_count,
       ROUND(AVG(r.watch_pct),1) AS avg_completion_pct
FROM ratings r JOIN movies m ON r.movie_id = m.movie_id
GROUP BY m.movie_id, m.title, m.genre
ORDER BY watch_count DESC;

-- 3. Genre Popularity
SELECT m.genre,
       COUNT(r.rating_id)        AS total_watches,
       ROUND(AVG(r.rating), 2)   AS avg_rating,
       SUM(CASE WHEN r.liked THEN 1 ELSE 0 END) AS total_likes
FROM ratings r JOIN movies m ON r.movie_id = m.movie_id
GROUP BY m.genre
ORDER BY total_watches DESC;

-- 4. Most Active Users
SELECT u.username, u.city, u.subscription,
       COUNT(r.rating_id)        AS movies_watched,
       ROUND(AVG(r.rating), 2)   AS avg_rating_given
FROM ratings r JOIN users u ON r.user_id = u.user_id
GROUP BY u.user_id, u.username, u.city, u.subscription
ORDER BY movies_watched DESC;

-- 5. Monthly Watch Trend
SELECT DATE_FORMAT(watched_date, '%Y-%m') AS month,
       COUNT(*)                           AS watches,
       ROUND(AVG(rating), 2)              AS avg_rating
FROM ratings
GROUP BY DATE_FORMAT(watched_date, '%Y-%m')
ORDER BY month;

-- 6. Language Preference
SELECT m.language,
       COUNT(r.rating_id) AS watches,
       ROUND(AVG(r.rating),2) AS avg_rating
FROM ratings r JOIN movies m ON r.movie_id = m.movie_id
GROUP BY m.language ORDER BY watches DESC;

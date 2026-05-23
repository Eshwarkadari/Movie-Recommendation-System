-- ============================================================
-- Power BI Ready Views
-- ============================================================

USE movie_recommender;

CREATE OR REPLACE VIEW vw_ratings_detail AS
SELECT
    r.rating_id, r.watched_date, r.rating, r.watch_pct, r.liked,
    u.username, u.age, u.gender, u.city, u.subscription,
    m.title, m.genre, m.sub_genre, m.release_year,
    m.director, m.language, m.duration_min
FROM ratings r
JOIN users  u ON r.user_id  = u.user_id
JOIN movies m ON r.movie_id = m.movie_id;

CREATE OR REPLACE VIEW vw_movie_stats AS
SELECT
    m.movie_id, m.title, m.genre, m.sub_genre,
    m.release_year, m.language, m.director,
    COUNT(r.rating_id)           AS total_watches,
    ROUND(AVG(r.rating), 2)      AS avg_user_rating,
    ROUND(AVG(r.watch_pct), 1)   AS avg_completion,
    SUM(r.liked)                 AS total_likes
FROM movies m
LEFT JOIN ratings r ON m.movie_id = r.movie_id
GROUP BY m.movie_id, m.title, m.genre, m.sub_genre,
         m.release_year, m.language, m.director;

SELECT 'Views created!' AS status;

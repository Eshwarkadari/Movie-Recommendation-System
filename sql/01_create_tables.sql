-- ============================================================
-- Movie Recommendation System — Database Schema
-- Author: Kadari Eshwar
-- ============================================================

CREATE DATABASE IF NOT EXISTS movie_recommender;
USE movie_recommender;

-- Movies table
CREATE TABLE IF NOT EXISTS movies (
    movie_id      INT PRIMARY KEY AUTO_INCREMENT,
    title         VARCHAR(200) NOT NULL,
    genre         VARCHAR(100),
    sub_genre     VARCHAR(100),
    release_year  INT,
    director      VARCHAR(100),
    language      VARCHAR(50),
    duration_min  INT,
    avg_rating    DECIMAL(3,1),
    total_votes   INT
);

-- Users table
CREATE TABLE IF NOT EXISTS users (
    user_id       INT PRIMARY KEY AUTO_INCREMENT,
    username      VARCHAR(100),
    age           INT,
    gender        VARCHAR(10),
    city          VARCHAR(100),
    subscription  VARCHAR(20),   -- Free, Basic, Premium
    joined_date   DATE
);

-- Ratings & Watch History
CREATE TABLE IF NOT EXISTS ratings (
    rating_id     INT PRIMARY KEY AUTO_INCREMENT,
    user_id       INT,
    movie_id      INT,
    rating        DECIMAL(2,1),   -- 1.0 to 5.0
    watched_date  DATE,
    watch_pct     INT,            -- % of movie watched (0-100)
    liked         BOOLEAN,
    FOREIGN KEY (user_id)  REFERENCES users(user_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

-- Recommendations Log
CREATE TABLE IF NOT EXISTS recommendations (
    rec_id        INT PRIMARY KEY AUTO_INCREMENT,
    user_id       INT,
    movie_id      INT,
    score         DECIMAL(4,3),   -- similarity score
    method        VARCHAR(50),    -- collaborative / content-based
    created_at    DATE,
    was_watched   BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id)  REFERENCES users(user_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

SELECT 'Tables created successfully!' AS status;

-- ============================================================
-- Sample Data — Movies, Users, Ratings
-- ============================================================

USE movie_recommender;

-- Movies
INSERT INTO movies (title, genre, sub_genre, release_year, director, language, duration_min, avg_rating, total_votes) VALUES
('Inception',              'Sci-Fi',   'Thriller',  2010, 'Christopher Nolan', 'English', 148, 4.8, 25000),
('The Dark Knight',        'Action',   'Crime',     2008, 'Christopher Nolan', 'English', 152, 4.9, 30000),
('Interstellar',           'Sci-Fi',   'Drama',     2014, 'Christopher Nolan', 'English', 169, 4.7, 22000),
('The Matrix',             'Sci-Fi',   'Action',    1999, 'Wachowski Sisters', 'English', 136, 4.7, 28000),
('Avengers: Endgame',      'Action',   'Fantasy',   2019, 'Russo Brothers',    'English', 181, 4.6, 35000),
('Dune',                   'Sci-Fi',   'Adventure', 2021, 'Denis Villeneuve',  'English', 155, 4.5, 18000),
('Blade Runner 2049',      'Sci-Fi',   'Thriller',  2017, 'Denis Villeneuve',  'English', 164, 4.4, 15000),
('Tenet',                  'Sci-Fi',   'Action',    2020, 'Christopher Nolan', 'English', 150, 4.2, 14000),
('Parasite',               'Drama',    'Thriller',  2019, 'Bong Joon-ho',      'Korean',  132, 4.9, 20000),
('The Shawshank Redemption','Drama',   'Crime',     1994, 'Frank Darabont',    'English', 142, 4.9, 32000),
('Forrest Gump',           'Drama',    'Romance',   1994, 'Robert Zemeckis',   'English', 142, 4.8, 29000),
('The Godfather',          'Crime',    'Drama',     1972, 'Francis Coppola',   'English', 175, 4.9, 31000),
('Pulp Fiction',           'Crime',    'Thriller',  1994, 'Quentin Tarantino', 'English', 154, 4.8, 27000),
('Joker',                  'Drama',    'Crime',     2019, 'Todd Phillips',     'English', 122, 4.5, 23000),
('Spider-Man: No Way Home','Action',   'Fantasy',   2021, 'Jon Watts',         'English', 148, 4.6, 26000),
('RRR',                    'Action',   'Historical',2022, 'SS Rajamouli',      'Telugu',  187, 4.7, 19000),
('Baahubali 2',            'Action',   'Historical',2017, 'SS Rajamouli',      'Telugu',  167, 4.6, 21000),
('3 Idiots',               'Comedy',   'Drama',     2009, 'Rajkumar Hirani',   'Hindi',   170, 4.8, 24000),
('Dangal',                 'Drama',    'Sport',     2016, 'Nitesh Tiwari',     'Hindi',   161, 4.7, 20000),
('KGF Chapter 2',          'Action',   'Crime',     2022, 'Prashanth Neel',    'Kannada', 168, 4.5, 17000);

-- Users
INSERT INTO users (username, age, gender, city, subscription, joined_date) VALUES
('ravi_k',     28, 'Male',   'Hyderabad', 'Premium', '2022-01-15'),
('priya_s',    25, 'Female', 'Mumbai',    'Basic',   '2022-03-10'),
('amit_p',     32, 'Male',   'Ahmedabad', 'Premium', '2021-11-05'),
('sneha_r',    27, 'Female', 'Bangalore', 'Free',    '2023-01-20'),
('vikram_s',   35, 'Male',   'Delhi',     'Premium', '2021-08-12'),
('anita_j',    29, 'Female', 'Pune',      'Basic',   '2022-06-18'),
('rahul_n',    31, 'Male',   'Chennai',   'Premium', '2022-02-22'),
('deepika_r',  24, 'Female', 'Kolkata',   'Free',    '2023-04-09'),
('suresh_m',   38, 'Male',   'Kochi',     'Basic',   '2021-09-14'),
('kavya_i',    26, 'Female', 'Hyderabad', 'Premium', '2022-07-30');

-- Ratings
INSERT INTO ratings (user_id, movie_id, rating, watched_date, watch_pct, liked) VALUES
(1,  1,  5.0, '2023-01-05', 100, TRUE),
(1,  2,  5.0, '2023-01-12', 100, TRUE),
(1,  3,  4.5, '2023-02-01', 100, TRUE),
(1,  4,  4.5, '2023-02-15', 100, TRUE),
(1,  8,  4.0, '2023-03-10', 95,  TRUE),
(2,  9,  5.0, '2023-01-08', 100, TRUE),
(2,  10, 5.0, '2023-01-20', 100, TRUE),
(2,  11, 4.5, '2023-02-05', 100, TRUE),
(2,  18, 4.8, '2023-02-20', 100, TRUE),
(2,  19, 4.7, '2023-03-15', 100, TRUE),
(3,  5,  4.5, '2023-01-10', 100, TRUE),
(3,  15, 4.5, '2023-01-25', 100, TRUE),
(3,  16, 4.7, '2023-02-08', 100, TRUE),
(3,  17, 4.6, '2023-02-22', 100, TRUE),
(3,  20, 4.5, '2023-03-18', 95,  TRUE),
(4,  12, 5.0, '2023-01-15', 100, TRUE),
(4,  13, 4.8, '2023-02-01', 100, TRUE),
(4,  14, 4.5, '2023-02-18', 100, TRUE),
(4,  9,  4.9, '2023-03-05', 100, TRUE),
(4,  10, 4.8, '2023-03-20', 100, TRUE),
(5,  1,  4.5, '2023-01-18', 100, TRUE),
(5,  2,  5.0, '2023-02-02', 100, TRUE),
(5,  4,  4.8, '2023-02-16', 100, TRUE),
(5,  5,  4.6, '2023-03-01', 100, TRUE),
(5,  6,  4.5, '2023-03-22', 95,  TRUE),
(6,  18, 5.0, '2023-01-22', 100, TRUE),
(6,  19, 4.8, '2023-02-10', 100, TRUE),
(6,  11, 4.7, '2023-02-25', 100, TRUE),
(6,  9,  4.9, '2023-03-12', 100, TRUE),
(6,  10, 4.8, '2023-03-28', 100, TRUE),
(7,  16, 4.7, '2023-01-28', 100, TRUE),
(7,  17, 4.6, '2023-02-12', 100, TRUE),
(7,  20, 4.5, '2023-02-28', 100, TRUE),
(7,  5,  4.5, '2023-03-15', 100, TRUE),
(7,  15, 4.6, '2023-03-30', 100, TRUE),
(8,  9,  5.0, '2023-02-05', 100, TRUE),
(8,  12, 4.8, '2023-02-20', 100, TRUE),
(8,  13, 4.7, '2023-03-08', 100, TRUE),
(8,  14, 4.5, '2023-03-25', 100, TRUE),
(8,  18, 4.6, '2023-04-10', 100, TRUE),
(9,  3,  4.7, '2023-02-08', 100, TRUE),
(9,  6,  4.5, '2023-02-22', 100, TRUE),
(9,  7,  4.4, '2023-03-10', 95,  TRUE),
(9,  8,  4.2, '2023-03-25', 90,  TRUE),
(9,  1,  4.8, '2023-04-12', 100, TRUE),
(10, 18, 4.9, '2023-02-15', 100, TRUE),
(10, 19, 4.7, '2023-03-01', 100, TRUE),
(10, 16, 4.7, '2023-03-18', 100, TRUE),
(10, 17, 4.6, '2023-04-02', 100, TRUE),
(10, 20, 4.5, '2023-04-18', 100, TRUE);

SELECT 'Data inserted!' AS status;
SELECT COUNT(*) AS total_movies   FROM movies;
SELECT COUNT(*) AS total_users    FROM users;
SELECT COUNT(*) AS total_ratings  FROM ratings;

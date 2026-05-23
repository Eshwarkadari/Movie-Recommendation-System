"""
content_based.py
Content-Based Filtering using Genre Similarity
Author: Kadari Eshwar
"""

import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity

def content_recommend(watched_ids, movies, top_n=5):
    """
    Recommend movies based on genre/metadata similarity.
    Steps:
      1. Create TF-IDF vectors from genre + sub_genre + director
      2. Compute cosine similarity between all movies
      3. Find movies most similar to what the user watched
    """
    movies = movies.copy()
    movies["features"] = (
        movies["genre"].fillna("") + " " +
        movies["sub_genre"].fillna("") + " " +
        movies["director"].fillna("") + " " +
        movies["language"].fillna("")
    )

    tfidf = TfidfVectorizer(stop_words="english")
    tfidf_matrix = tfidf.fit_transform(movies["features"])
    sim_matrix = cosine_similarity(tfidf_matrix, tfidf_matrix)

    sim_df = pd.DataFrame(sim_matrix,
                          index=movies["movie_id"].values,
                          columns=movies["movie_id"].values)

    scores = {}
    for mid in watched_ids:
        if mid in sim_df.index:
            for other_id, score in sim_df[mid].items():
                if other_id not in watched_ids:
                    scores[other_id] = max(scores.get(other_id, 0), score)

    if not scores:
        return pd.DataFrame()

    recs_df = pd.DataFrame(list(scores.items()), columns=["movie_id", "score"])
    recs_df = recs_df.merge(movies[["movie_id", "title", "genre"]], on="movie_id")
    recs_df["method"] = "content-based"
    return recs_df.sort_values("score", ascending=False).head(top_n)

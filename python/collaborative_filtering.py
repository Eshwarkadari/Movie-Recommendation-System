"""
collaborative_filtering.py
User-based Collaborative Filtering
Author: Kadari Eshwar
"""

import pandas as pd
from sklearn.metrics.pairwise import cosine_similarity

def collaborative_recommend(user_id, ratings, movies, top_n=5):
    """
    Recommend movies based on similar users' watch history.
    Steps:
      1. Build a user-movie rating matrix
      2. Compute cosine similarity between users
      3. Find top similar users
      4. Recommend movies they liked that the target user hasn't seen
    """
    # Build user-movie matrix
    matrix = ratings.pivot_table(
        index="user_id", columns="movie_id",
        values="rating", fill_value=0
    )

    if user_id not in matrix.index:
        return pd.DataFrame()

    # Compute similarity
    sim_matrix = cosine_similarity(matrix)
    sim_df = pd.DataFrame(sim_matrix,
                          index=matrix.index,
                          columns=matrix.index)

    # Get top 3 similar users
    similar_users = sim_df[user_id].drop(user_id).nlargest(3).index.tolist()

    # Movies watched by similar users (not watched by target)
    watched_by_user = set(ratings[ratings["user_id"] == user_id]["movie_id"])
    recs = []

    for su in similar_users:
        su_ratings = ratings[ratings["user_id"] == su]
        for _, row in su_ratings.iterrows():
            if row["movie_id"] not in watched_by_user and row["rating"] >= 4.0:
                score = sim_df[user_id][su] * (row["rating"] / 5.0)
                recs.append({
                    "movie_id": row["movie_id"],
                    "score": round(score, 3),
                    "method": "collaborative"
                })

    if not recs:
        return pd.DataFrame()

    recs_df = pd.DataFrame(recs).groupby("movie_id")["score"].max().reset_index()
    recs_df = recs_df.merge(movies[["movie_id", "title", "genre"]], on="movie_id")
    return recs_df.sort_values("score", ascending=False).head(top_n)

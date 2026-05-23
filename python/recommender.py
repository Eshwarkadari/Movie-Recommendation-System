"""
recommender.py  —  Main Recommendation Engine
Netflix-style Movie Recommendation System
Author: Kadari Eshwar
"""

import pandas as pd
from collaborative_filtering import collaborative_recommend
from content_based import content_recommend

# ── Load Data ──────────────────────────────────────────────────────────────
movies  = pd.read_csv("../data/movies.csv")
users   = pd.read_csv("../data/users.csv")
ratings = pd.read_csv("../data/ratings.csv")

def get_recommendations(user_id, top_n=5):
    """Get hybrid recommendations for a user."""
    user = users[users["user_id"] == user_id].iloc[0]
    print(f"\n🎬 Recommendations for: {user['username']}")
    print("━" * 45)

    # Movies already watched
    watched = ratings[ratings["user_id"] == user_id]["movie_id"].tolist()
    watched_titles = movies[movies["movie_id"].isin(watched)]["title"].tolist()
    print("\nBased on your watch history:")
    for t in watched_titles:
        print(f"  ✅ {t}")

    # Collaborative filtering
    cf_recs = collaborative_recommend(user_id, ratings, movies, top_n)

    # Content-based filtering
    cb_recs = content_recommend(watched, movies, top_n)

    # Merge and deduplicate
    all_recs = pd.concat([cf_recs, cb_recs]).drop_duplicates("movie_id")
    all_recs = all_recs[~all_recs["movie_id"].isin(watched)]
    all_recs = all_recs.sort_values("score", ascending=False).head(top_n)

    print("\nWe recommend:")
    for i, (_, row) in enumerate(all_recs.iterrows(), 1):
        print(f"  🎯 {i}. {row['title']:<35} — Score: {row['score']:.2f}")

    return all_recs

if __name__ == "__main__":
    for uid in [1, 2, 3]:
        get_recommendations(uid)
        print()

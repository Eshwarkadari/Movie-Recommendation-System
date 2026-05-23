"""
generate_data.py  —  Generate extra ratings data
Author: Kadari Eshwar
"""

import csv, random
from datetime import date, timedelta

USERS    = list(range(1, 11))
MOVIES   = list(range(1, 21))

def random_date(start, end):
    return start + timedelta(days=random.randint(0, (end-start).days))

def generate(n=300, out="extra_ratings.csv"):
    rows = []
    for i in range(1, n+1):
        uid  = random.choice(USERS)
        mid  = random.choice(MOVIES)
        rat  = round(random.uniform(3.0, 5.0), 1)
        pct  = random.randint(60, 100)
        liked = rat >= 4.0
        od   = random_date(date(2023,1,1), date(2024,12,31))
        rows.append([i, uid, mid, rat, od, pct, liked])

    with open(out, "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["rating_id","user_id","movie_id","rating",
                    "watched_date","watch_pct","liked"])
        w.writerows(rows)
    print(f"Generated {n} rows → {out}")

if __name__ == "__main__":
    generate()

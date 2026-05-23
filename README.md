# 🎬 Movie Recommendation System

> A **Netflix-style recommendation engine** built with Python, SQL and Power BI — the same concept used by Netflix, Amazon Prime and Spotify.

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)
![Scikit Learn](https://img.shields.io/badge/Scikit_Learn-F7931E?style=for-the-badge&logo=scikit-learn&logoColor=white)

---

## 📌 Project Overview

This project simulates how **Netflix recommends movies** to users based on:
- What they have watched before
- Their ratings and preferences
- What similar users liked (Collaborative Filtering)
- Movie genres and metadata (Content-Based Filtering)

---

## 🗂️ Project Structure

```
Movie-Recommendation-System/
│
├── sql/
│   ├── 01_create_tables.sql          # Database schema
│   ├── 02_insert_data.sql            # 500+ rows of movies, users, ratings
│   ├── 03_analysis_queries.sql       # Viewing patterns, top movies
│   └── 04_views.sql                  # Power BI ready views
│
├── python/
│   ├── recommender.py                # Core recommendation engine
│   ├── collaborative_filtering.py    # User-based collaborative filtering
│   ├── content_based.py              # Genre/metadata-based filtering
│   └── generate_data.py              # Generate more sample data
│
├── data/
│   ├── movies.csv                    # Movie dataset
│   ├── users.csv                     # User profiles
│   └── ratings.csv                   # User ratings & watch history
│
├── powerbi/
│   └── dashboard_guide.md            # Power BI setup instructions
│
└── README.md
```

---

## ✨ Features

- 🎯 **Collaborative Filtering** — recommends based on similar users
- 🎬 **Content-Based Filtering** — recommends based on genre/cast similarity
- 📊 **Power BI Dashboard** — 5-page interactive analytics dashboard
- 🗄️ **SQL Database** — full relational schema with movies, users, ratings
- 🐍 **Python Engine** — clean, modular recommendation code
- 📈 **Analytics** — top movies, user behaviour, genre trends

---

## 🚀 Getting Started

### Prerequisites
```bash
pip install pandas numpy scikit-learn
```

### Step 1 — Set Up Database
```sql
source sql/01_create_tables.sql
source sql/02_insert_data.sql
```

### Step 2 — Run Recommendations
```bash
python python/recommender.py
```

### Step 3 — Connect Power BI
- Import `data/ratings.csv` and `data/movies.csv`
- Follow `powerbi/dashboard_guide.md`

---

## 💡 How It Works

```
User watches Movie A (Rating: 5⭐)
       ↓
System finds similar users who also rated Movie A highly
       ↓
Checks what else those similar users watched and loved
       ↓
Recommends those movies to the original user
```

---

## 📊 Power BI Dashboard Pages

| Page | Content |
|------|---------|
| 1. Overview | Total movies, users, ratings KPIs |
| 2. Top Movies | Most watched & highest rated |
| 3. Genre Trends | Popularity by genre over time |
| 4. User Behaviour | Watch patterns, active users |
| 5. Recommendation Insights | Algorithm performance metrics |

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| Python + Pandas | Data processing & recommendation engine |
| Scikit-learn | Cosine similarity for content filtering |
| SQL (MySQL) | Data storage and querying |
| Power BI | Interactive dashboards |
| CSV | Data exchange format |

---

## 📈 Sample Output

```
🎬 Recommendations for User: Ravi Kumar
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Based on your watch history:
  ✅ Inception (2010) — Sci-Fi
  ✅ The Dark Knight (2008) — Action
  ✅ Interstellar (2014) — Sci-Fi

We recommend:
  🎯 1. The Matrix (1999)         — Score: 0.94
  🎯 2. Tenet (2020)              — Score: 0.91
  🎯 3. Avengers: Endgame (2019)  — Score: 0.87
  🎯 4. Dune (2021)               — Score: 0.85
  🎯 5. Blade Runner 2049 (2017)  — Score: 0.82
```

---

## 👨‍💻 Author

**Kadari Eshwar** — [github.com/Eshwarkadari](https://github.com/Eshwarkadari)

---

⭐ If you found this project helpful, please give it a star!

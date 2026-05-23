# Power BI Dashboard Guide 📊

## Step 1 — Import Data
1. Open Power BI Desktop
2. **Home → Get Data → Text/CSV**
3. Import all 3 files:
   - `data/movies.csv`
   - `data/users.csv`
   - `data/ratings.csv`

## Step 2 — Create Relationships
Go to **Model view** and connect:
- `ratings[user_id]`  → `users[user_id]`
- `ratings[movie_id]` → `movies[movie_id]`

## Step 3 — DAX Measures
```dax
Total Watches   = COUNTROWS(ratings)
Avg Rating      = AVERAGE(ratings[rating])
Total Users     = DISTINCTCOUNT(ratings[user_id])
Total Movies    = DISTINCTCOUNT(ratings[movie_id])
Completion Rate = AVERAGE(ratings[watch_pct])
```

## Step 4 — Dashboard Pages

### Page 1 — Overview
- 4 KPI Cards: Total Watches, Avg Rating, Total Users, Total Movies
- Bar Chart: Top 10 Most Watched Movies
- Donut Chart: Watches by Genre

### Page 2 — Movie Performance
- Table: Movie, Genre, Watches, Avg Rating, Completion %
- Bar Chart: Rating Distribution
- Scatter: Avg Rating vs Total Watches

### Page 3 — Genre Trends
- Line Chart: Monthly watches by genre
- Bar Chart: Genre vs Avg Rating
- Treemap: Genre popularity

### Page 4 — User Behaviour
- Bar Chart: Most Active Users
- Donut Chart: Subscription Type breakdown
- Map: Users by City

### Page 5 — Insights
- Bar Chart: Language preferences
- Line Chart: Watch trend over time
- Matrix: User × Genre watch heatmap

---
Built by **Kadari Eshwar** — [github.com/Eshwarkadari](https://github.com/Eshwarkadari)

#SQL aggregation function to count the number of rows in the table.
USE recommendation_spark;

SELECT * FROM Rating
LIMIT 15;

SELECT COUNT(*) AS num_ratings
FROM Rating;

#Average review rating of accommodations

SELECT
    COUNT(userId) AS num_ratings,
    COUNT(DISTINCT userId) AS distinct_user_ratings,
    MIN(rating) AS worst_rating,
    MAX(rating) AS best_rating,
    AVG(rating) AS avg_rating
FROM Rating;

#Which users have provided the most ratings.

SELECT
    userId,
    COUNT(rating) AS num_ratings
FROM Rating
GROUP BY userId
ORDER BY num_ratings DESC;


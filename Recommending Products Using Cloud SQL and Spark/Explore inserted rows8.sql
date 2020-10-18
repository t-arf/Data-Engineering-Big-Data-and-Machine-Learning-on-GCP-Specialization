#RUN IN CLOUD SHELL: gcloud sql connect rentals --user=root --quiet

USE recommendation_spark;

SELECT COUNT(*) AS count FROM Recommendation;

#Find the recommendations for a user:

SELECT
    r.userid,
    r.accoid,
    r.prediction,
    a.title,
    a.location,
    a.price,
    a.rooms,
    a.rating,
    a.type
FROM Recommendation as r
JOIN Accommodation as a
ON r.accoid = a.id
WHERE r.userid = 10;

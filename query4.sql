CREATE OR REPLACE VIEW ensembles_seats_next_week AS
SELECT
    TO_CHAR(ensembles.time, 'Dy') AS "Day",
    genres.genre AS "Genre",
CASE
    WHEN ensembles.max_students = COUNT(student_ensembles.student_id) THEN 'No Seats'
    WHEN ensembles.max_students - COUNT(student_ensembles.student_id) BETWEEN 1 AND 2 THEN '1 or 2 Seats'
    ELSE 'Many Seats'
END AS "No of Free Seats"
FROM ensembles
JOIN genres ON ensembles.genre_id = genres.id
JOIN student_ensembles on ensembles.id = student_ensembles.ensembles_id
WHERE time BETWEEN NOW() AND NOW() + INTERVAL '1 WEEK'
GROUP BY 
    genres.genre,
    ensembles.time,
    ensembles.max_students;

SELECT *
FROM ensembles_seats_next_week;
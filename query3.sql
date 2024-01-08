CREATE OR REPLACE VIEW instructors_lesson_num AS
SELECT
    instructor.id AS "Instructor Id",
    instructor.first_name AS "First Name",
    instructor.last_name AS "Last Name",
    COUNT(instructor.id) AS "Total"
FROM (
    SELECT availability.instructor_id
    FROM booking
    JOIN availability ON availability.id = booking.availability_id
    WHERE EXTRACT(MONTH FROM booking.time) = EXTRACT(MONTH FROM current_date)

    UNION ALL

    SELECT group_lesson.instructor_id
    FROM group_lesson
    WHERE EXTRACT(MONTH FROM group_lesson.time) = EXTRACT(MONTH FROM current_date)

    UNION ALL

    SELECT ensembles.instructor_id
    FROM ensembles
    WHERE EXTRACT(MONTH FROM ensembles.time) = EXTRACT(MONTH FROM current_date)
) AS data
LEFT JOIN instructor ON instructor.id = data.instructor_id
GROUP BY
    instructor.id,
    instructor.first_name,
    instructor.last_name
HAVING COUNT(instructor.id) >= 2 -- Minimum number of lessons to show up
ORDER BY COUNT(instructor.id) DESC;

SELECT *
FROM instructors_lesson_num;
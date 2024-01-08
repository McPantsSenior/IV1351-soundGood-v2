CREATE OR REPLACE VIEW num_lessons_per_month AS
SELECT
    month AS "Month",
    SUM(Booking + grouplesson + ensembles) AS "Total",
    SUM(Booking) AS "Individual",
    SUM(grouplesson) AS "Group",
    SUM(ensembles) AS "Ensemble"
FROM (
    SELECT
        EXTRACT(MONTH FROM time) AS month,
        COUNT(*) AS Booking,
        0 AS grouplesson,
        0 AS ensembles
    FROM
        booking
    WHERE
        EXTRACT(YEAR FROM time) = 2024
    GROUP BY
        EXTRACT(MONTH FROM time)

    UNION ALL

    SELECT
        EXTRACT(MONTH FROM time) AS month,
        0 AS booking,
        COUNT(*) AS grouplesson,
        0 AS ensembles
    FROM
        group_lesson
    WHERE
        EXTRACT(YEAR FROM time) = 2024
    GROUP BY
        EXTRACT(MONTH FROM time)

    UNION ALL

    SELECT
        EXTRACT(MONTH FROM time) AS month,
        0 AS booking,
        0 AS grouplesson,
        COUNT(*) AS ensembles
    FROM
        ensembles
    WHERE
        EXTRACT(YEAR FROM time) = 2024
    GROUP BY
        EXTRACT(MONTH FROM time)
)
GROUP BY
    month
ORDER BY
    month;

SELECT *
FROM num_lessons_per_month;
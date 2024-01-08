CREATE OR REPLACE VIEW num_of_siblings AS
SELECT 
    no_of_siblings, 
    COUNT(*) AS students
FROM (
    SELECT 
        student.id, 
        COUNT(siblings.student_id) AS no_of_siblings
    FROM 
        student 
    LEFT JOIN siblings ON student.id = siblings.student_id
    GROUP BY 
        student.id
) 
GROUP BY 
    no_of_siblings
ORDER BY 
    no_of_siblings ASC;

SELECT * 
FROM num_of_siblings;
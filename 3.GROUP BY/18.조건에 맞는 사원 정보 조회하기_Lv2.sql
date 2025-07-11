-- ✅ MySQL 버전
WITH TOTAL_SCORE AS (
    SELECT 
        EMP_NO,
        SUM(SCORE) AS SCORE
    FROM HR_GRADE
    WHERE YEAR = 2022
    GROUP BY EMP_NO
),
MAX_SCORE AS (
    SELECT MAX(SCORE) AS MAX_SCORE
    FROM TOTAL_SCORE
)
SELECT 
    T.SCORE,
    E.EMP_NO,
    E.EMP_NAME,
    E.POSITION,
    E.EMAIL
FROM TOTAL_SCORE T
JOIN HR_EMPLOYEES E ON T.EMP_NO = E.EMP_NO
JOIN MAX_SCORE M ON T.SCORE = M.MAX_SCORE
ORDER BY E.EMP_NO;

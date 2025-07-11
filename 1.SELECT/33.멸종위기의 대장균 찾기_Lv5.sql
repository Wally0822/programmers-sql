-- ✅ MySQL 버전
WITH RECURSIVE Generation AS (
    -- 1세대: 부모가 없는 개체
    SELECT ID, PARENT_ID, 1 AS GENERATION
    FROM ECOLI_DATA
    WHERE PARENT_ID IS NULL

    UNION ALL

    -- 부모로부터 세대 증가시키며 자식 찾기
    SELECT E.ID, E.PARENT_ID, G.GENERATION + 1
    FROM ECOLI_DATA E
    JOIN Generation G ON E.PARENT_ID = G.ID
)

-- 세대별 자식 없는 개체 개수 세기
SELECT COUNT(*) AS COUNT, GENERATION
FROM Generation G
WHERE G.ID NOT IN (SELECT DISTINCT PARENT_ID FROM ECOLI_DATA WHERE PARENT_ID IS NOT NULL)
GROUP BY GENERATION
ORDER BY GENERATION;

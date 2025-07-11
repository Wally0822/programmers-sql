-- ✅ MySQL 버전
SELECT f.ID,
       n.FISH_NAME,
       f.LENGTH
FROM FISH_INFO f
JOIN FISH_NAME_INFO n ON f.FISH_TYPE = n.FISH_TYPE
JOIN (
    SELECT FISH_TYPE, MAX(LENGTH) AS MAX_LENGTH
    FROM FISH_INFO
    GROUP BY FISH_TYPE
) m ON f.FISH_TYPE = m.FISH_TYPE AND f.LENGTH = m.MAX_LENGTH
ORDER BY f.ID;

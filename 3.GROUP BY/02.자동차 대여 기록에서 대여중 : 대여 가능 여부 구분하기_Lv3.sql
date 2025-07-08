-- ✅ MySQL 버전
SELECT 
    CAR_ID,
    MAX(
        CASE 
            WHEN '2022-10-16' BETWEEN DATE_FORMAT(START_DATE, '%Y-%m-%d') 
                                AND DATE_FORMAT(END_DATE, '%Y-%m-%d') 
            THEN '대여중' 
            ELSE '대여 가능' 
        END
    ) AS AVAILBILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
ORDER BY CAR_ID DESC;

-- ✅ Oracle 버전
SELECT 
    CAR_ID,
    MAX(
        CASE 
            WHEN TO_DATE('2022-10-16', 'YYYY-MM-DD') BETWEEN START_DATE AND END_DATE 
            THEN '대여중' 
            ELSE '대여 가능' 
        END
    ) AS AVAILBILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
ORDER BY CAR_ID DESC;

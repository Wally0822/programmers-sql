-- ✅ MySQL 버전
SELECT 
    CASE 
        WHEN PRICE < 10000 THEN 0
        ELSE TRUNCATE(PRICE, -4)
    END AS PRICE_GROUP,
    COUNT(PRODUCT_ID) AS CNT
FROM PRODUCT
GROUP BY 
    CASE 
        WHEN PRICE < 10000 THEN 0
        ELSE TRUNCATE(PRICE, -4)
    END
ORDER BY PRICE_GROUP;

-- ✅ Oracle 버전
SELECT 
    CASE 
        WHEN PRICE < 10000 THEN 0
        ELSE FLOOR(PRICE / 10000) * 10000
    END AS PRICE_GROUP,
    COUNT(PRODUCT_ID) AS CNT
FROM PRODUCT
GROUP BY 
    CASE 
        WHEN PRICE < 10000 THEN 0
        ELSE FLOOR(PRICE / 10000) * 10000
    END
ORDER BY PRICE_GROUP;

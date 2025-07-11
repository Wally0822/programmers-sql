-- ✅ MySQL 버전
SELECT 
    FP.CATEGORY,
    FP.PRICE AS MAX_PRICE,
    FP.PRODUCT_NAME
FROM 
    FOOD_PRODUCT FP
JOIN (
    SELECT CATEGORY, MAX(PRICE) AS MAX_PRICE
    FROM FOOD_PRODUCT
    WHERE CATEGORY IN ('과자', '국', '김치', '식용유')
    GROUP BY CATEGORY
) AS MP ON FP.CATEGORY = MP.CATEGORY AND FP.PRICE = MP.MAX_PRICE
ORDER BY 
    MAX_PRICE DESC;

-- ✅ Oracle 버전
SELECT 
    FP.CATEGORY,
    FP.PRICE AS MAX_PRICE,
    FP.PRODUCT_NAME
FROM 
    FOOD_PRODUCT FP
JOIN (
    SELECT CATEGORY, MAX(PRICE) AS MAX_PRICE
    FROM FOOD_PRODUCT
    WHERE CATEGORY IN ('과자', '국', '김치', '식용유')
    GROUP BY CATEGORY
) MP ON FP.CATEGORY = MP.CATEGORY AND FP.PRICE = MP.MAX_PRICE
ORDER BY 
    MAX_PRICE DESC;

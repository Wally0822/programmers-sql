-- ✅ MySQL 버전 / - ✅ Oracle 버전
SELECT COUNT(DISTINCT NAME)
FROM ANIMAL_INS
WHERE NAME IS NOT NULL;

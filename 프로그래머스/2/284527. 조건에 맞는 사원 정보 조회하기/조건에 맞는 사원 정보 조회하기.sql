-- 코드를 작성해주세요


SELECT SUM(SCORE) SCORE, EMP_NO, EMP_NAME, POSITION, EMAIL
FROM HR_EMPLOYEES
JOIN HR_GRADE USING(EMP_NO)
GROUP BY EMP_NO
ORDER BY SCORE DESC
LIMIT 1

# MAX 쓰면 에러남
/*
SELECT SUM(HG.SCORE) AS SCORE, HE.EMPNO, HE.EMPNAME, HE.POSITION, HE.EMAIL
FROM HREMPLOYEES AS HE
INNER JOIN HRGRADE AS HG
ON HE.EMPNO = HG.EMPNO
WHERE YEAR = 2022
GROUP BY HE.EMP_NO
ORDER BY SCORE DESC
LIMIT 1
*/
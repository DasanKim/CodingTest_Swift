-- 코드를 작성해주세요
SELECT 
    ROUTE, 
    CONCAT(ROUND(SUM(D_BETWEEN_DIST), 1),'km') AS TOTAL_DISTANCE, 
    CONCAT(ROUND(AVG(D_BETWEEN_DIST), 2),'km') AS AVERAGE_DISTANCE
FROM SUBWAY_DISTANCE
GROUP BY ROUTE
ORDER BY SUM(D_BETWEEN_DIST) DESC

# 문자열 형태로 만들어서 ORDER_BY 가 적용되지 않는 것이 아닙니다. SUM 값을 반올림한 값으로 정렬을 했기때문에 순서가 틀린 것입니다.
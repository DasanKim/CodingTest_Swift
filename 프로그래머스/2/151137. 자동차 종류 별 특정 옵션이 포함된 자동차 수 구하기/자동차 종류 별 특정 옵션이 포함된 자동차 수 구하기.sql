-- 코드를 입력하세요
SELECT CAR_TYPE, COUNT(CAR_ID) AS 'CARS'
FROM CAR_RENTAL_COMPANY_CAR
WHERE OPTIONS LIKE '%시트%'
GROUP BY CAR_TYPE
ORDER BY CAR_TYPE

/*
where OPTIONS IN ('통풍시트', '열선시트', '가죽시트')가 오답인 이유
위 코드는 옵션으로 통풍시트만 있거나, 열선시트만 있거나, 가죽시트만 있어야 그 결과값이 나옵니다.
즉, 차량 옵션으로 '통풍시트', '네비게이션'이 있을때, 비록 '통풍시트'가 있지만 네비게이션 때문에 조회되지않습니다.

=> 'IN' 연산자가 포함된 'WHERE' 절이 SQL에서 작동하는 방식 때문
=> `WHERE OPTIONS IN ('통풍 시트', '열선 시트', '가죽 시트')'를 사용하면 'OPTIONS' 열이
지정된 값('환기 시트', '열선 시트') 중 하나와 정확히 일치하는 행을 필터링합니다.
좌석'또는 '가죽 좌석'. 즉, 행에 이 세 가지 옵션 외에 다른 옵션이 포함되어 있으면 해당 행은 결과에 포함되지 않습니다
*/
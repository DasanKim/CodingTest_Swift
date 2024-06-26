-- 코드를 작성해주세요
SELECT COUNT(*) FISH_COUNT, FISH_NAME
FROM FISH_INFO JOIN FISH_NAME_INFO USING(FISH_TYPE)
GROUP BY FISH_NAME
ORDER BY FISH_COUNT DESC

# GROUP BY FISH_TYPE은 왜 안되지?
/*
SELECT COUNT(TIME) AS FISH_COUNT, FISH_NAME
FROM FISH_INFO
JOIN FISH_NAME_INFO
USING(FISH_TYPE)
GROUP BY FISH_NAME
ORDER BY FISH_COUNT DESC
*/

/*
저또한 FISH_NAME으로 GROUP BY하는 것이 마음에 들지 않아서
FISH_TYPE으로 GROUP BY 이후 FISH_NAME_INFO와 JOIN을 수행하도록 고쳤더니 오답이 나왔습니다.

추측해본 결과 아마도 FISH_NAME_INFO에 같은 FISH_NAME이지만 다른 FISH_TYPE인 row가 있는 것 같습니다.
*/
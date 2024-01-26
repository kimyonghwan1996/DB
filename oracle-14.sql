SELECT SNO, SNAME, RESULT
FROM(
    SELECT SNO, round(AVG(RESULT),2) as RESULT
    FROM SCORE
    GROUP by SNO
    )
join STUDENT USING(sno)
where RESULT >= 60;


SELECT SNO, SNAME, RESULT
FROM(
    SELECT SNO, AVG(RESULT) as RESULT
    FROM SCORE
    GROUP by SNO
    )
join STUDENT USING(sno);

SELECT SNO, RESULT
FROM SCORE
join COURSE USING(CNO)
where CNAME = '핵화학';

SELECT *
FROM (
    SELECT SNO, SNAME,CNO, RESULT
    FROM SCORE
    join STUDENT USING(sno))
WHERE (SNO,CNO,RESULT) =any (
    SELECT SNO,CNO, RESULT
    FROM SCORE
    join COURSE USING(CNO)
    where CNAME = '핵화학');

SELECT *
FROM (SELECT SNO,CNO, RESULT
    FROM SCORE
    join COURSE USING(CNO)
    where CNAME = '핵화학')
WHERE (SNO,CNO,RESULT) =any(
    SELECT SNO, SNAME,CNO, RESULT
    FROM SCORE
    join STUDENT USING(sno));


SELECT SNO,CNO, RESULT
    FROM SCORE
    join COURSE USING(CNO)
    where CNAME = '핵화학';
----------------------------------------
SELECT A.CNO
       , A.CNAME
       , A.RESULT
       , B.PNO
       , B.PNAME
FROM (
        SELECT C.CNO
                , C.CNAME
                , C.PNO
                , ROUND(AVG(D.RESULT), 2) AS RESULT
        FROM COURSE C, SCORE D
        WHERE C.CNO = D.CNO
        GROUP BY C.CNO, C.CNAME, C.PNO
        ) A
        , PROFESSOR B
WHERE A.PNO = B.PNO AND A.RESULT > (
                                    SELECT ROUND(AVG(D.RESULT), 2)
                                    FROM COURSE C, SCORE D
                                    WHERE C.CNO = D.CNO
                                    GROUP BY C.CNO, C.CNAME
                                    HAVING C.CNAME = '핵화학'
                                    );

    
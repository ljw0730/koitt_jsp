select * from mvc_board;   

-- 게시판 페이징을 할때 순차적으로 정렬한 후 1~10 개의 게시글을 가져오는 쿼리
select * from
    (select rownum rnum, bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent from
        (select * from mvc_board m order by bGroup desc, bId asc)
    )
where rnum >=1 and rnum<=10;

select * from mvc_board order by bGroup desc, bStep asc;

select count(*) as count from mvc_board;

-- 게시판 페이징을 할때 순차적으로 정렬한 후 1~10 개의 게시글을 가져오는 쿼리
select * from 
(select row_number() over(order by a.bid desc) rnum, a.*
from mvc_board a order by a.bgroup desc, a.bid asc)
where rnum between 1 and 10;
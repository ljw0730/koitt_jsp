-- 게시판 검색 SQL --


select * from mvc_board;

select * from mvc_board
where bTitle like '%답변%' or bContent like '%답변%';

select * from mvc_board where bTitle like '%테스트%';
select * from mvc_board where bContent like '%테스트%';

select * from mvc_board
where bTitle like '%테스트%' or bContent like '%테스트%';

select rownum, m.* from mvc_board m where bTitle like '%테스트%';
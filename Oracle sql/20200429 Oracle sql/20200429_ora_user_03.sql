-- �Խ��� �˻� SQL --


select * from mvc_board;

select * from mvc_board
where bTitle like '%�亯%' or bContent like '%�亯%';

select * from mvc_board where bTitle like '%�׽�Ʈ%';
select * from mvc_board where bContent like '%�׽�Ʈ%';

select * from mvc_board
where bTitle like '%�׽�Ʈ%' or bContent like '%�׽�Ʈ%';

select rownum, m.* from mvc_board m where bTitle like '%�׽�Ʈ%';
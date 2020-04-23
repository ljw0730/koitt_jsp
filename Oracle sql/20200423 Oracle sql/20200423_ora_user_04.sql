select * from stu_score;

alter table stu_score
add(stu_hak varchar2(1));

update stu_score set stu_hak=(
select
case
when stu_avg >= 90 then 'A'
when stu_avg >= 80 and stu_avg < 90 then 'B'
when stu_avg >= 70 and stu_avg < 80 then 'C'
when stu_avg > 70 then 'D'
end as stu_hak from stu_score where stu_num='s0001')
where stu_num='s0001';


INSERT INTO lesson VALUES ( 1, 'BEGINNER' ,80000,'Gabriel Medina'); 
INSERT INTO lesson VALUES ( 2, 'LEARNNER' ,100000,'John Florence');
INSERT INTO lesson VALUES ( 3, 'APPRENTICE' ,120000,'Kelly Slater');

select *
from lesson;

select * from reserve;

-- 예약 테이블에서 예약날짜 컬럼 데이터 타입 변경
ALTER TABLE reserve
MODIFY reserve_date varchar2(30);

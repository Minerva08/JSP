select rownum, board2.* from board2 where rownum between 1 and 20;
select * from member2;

insert into member2 values ('iu930516', 'iu', '이지은', 'iu@itbank.com', '여성');
insert into member2 values ('test', '1234', '테스트', 'test@itbank.com', '남성');
insert into member2 values ('danbi', '1234', '나단비', 'danbi@itbank.com', '여성');
insert into member2 values ('ssamza', '1234', '민경훈', 'ssamza@itbank.com', '남성');

insert into board2 (writer, title, content, ipAddress) 
    select writer, title, content, ipAddress from board2;

select count(*) as boardCount from board2 where writer like '%yellow%';      -- 총 게시글의 개수를 파악하는 SQL

-- 1) rownum과 중첩쿼리문(subquery)를 활용한 페이징 구문
-- where 에는 1=1 대신 다른 조건을 넣어도 된다
select * from 
    (select rownum as st, A.* from
        (select * from board2 where 1=1 order by idx desc) A        
    where rownum <= 20)
where st >= 11;

-- 2) oracle 12c 이상 버전에서 사용 가능한 offset
select * from board2
    where writer like '%%'
    order by idx desc
    offset 1 rows      -- 시작지점 이후 10번째 글에서
    fetch first 10 rows only;    -- 5개만큼 가져와라

commit;

select 2 * 10 from dual;

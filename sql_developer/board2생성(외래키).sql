drop sequence board2_seq;
drop table board2;

create sequence board2_seq
    start with 1
    maxvalue 999999999
    increment by 1
    nocycle
    nocache;

create table board2 (
	idx			number			default board2_seq.nextval primary key,
	writer		varchar2(500)	not null,
	title		varchar2(500)	not null,
	content		varchar2(2000)	not null,
	writeDate	date			default sysdate,
	ipAddress	varchar2(50)	not null,
    
    constraint board2_member_fk foreign key(writer) -- board2_member_fk 라는 이름의 제약조건을 writer 컬럼에 설정한다
    references member2(userid)                       -- member 테이블의 userid에 있는 값만 writer에 쓸수 있는 규칙
    on delete set null                              -- 만약 부모키(계정)이 삭제되면 자식키(작성자)는 null로 처리한다
);

insert into board2 
    (writer, title, content, ipAddress)
    values ('test', '외래키 테스트 1', '내용', '1.1.1.1');   -- member 테이블에 userid값중 emperor 가 없다

insert into board2 
    (writer, title, content, ipAddress)
    values ('iu930516', '외래키 테스트 2', '내용', '2.2.2.2');    -- member 테이블에 userid값중 yellow가 있다

commit;

select * from board2 order by idx desc;

select * from member2;


desc member;
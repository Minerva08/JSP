drop sequence reply_seq;
drop table reply;

create sequence reply_seq
    start with 1
    maxvalue 999999999
    increment by 1
    nocache
    nocycle;
    
create table reply (
    	idx		    number		    default reply_seq.nextval primary key,
        board_idx	number		    not null, --~ references board2(idx) ~
        writer		varchar2(500)	not null, --~ references member(writer) ~
        content		varchar2(2000)	not null,
        writeDate	date		    default sysdate,
        
        constraint reply_board_fk   -- 제약 조건의 이름
        foreign key (board_idx)     -- 외래키로 지정할 컬럼
        references board2(idx),      -- 외래키가 참조할 대상 테이블과 컬럼
        
        constraint reply_member_fk 
        foreign key (writer)
        references member2(userid)
);

insert into reply values (reply_seq.nextval, 394, 'danbi', '다 내꺼야 !!', sysdate);
insert into reply values (reply_seq.nextval, 394, 'danbi', '테스트도 내가 다 할꺼야 !!', sysdate);
insert into reply values (reply_seq.nextval, 393, 'danbi', '배불러', sysdate);
commit;
select * from reply where board_idx = 382 order by idx;

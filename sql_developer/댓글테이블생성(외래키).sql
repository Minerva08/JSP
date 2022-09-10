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
        
        constraint reply_board_fk   -- ���� ������ �̸�
        foreign key (board_idx)     -- �ܷ�Ű�� ������ �÷�
        references board2(idx),      -- �ܷ�Ű�� ������ ��� ���̺�� �÷�
        
        constraint reply_member_fk 
        foreign key (writer)
        references member2(userid)
);

insert into reply values (reply_seq.nextval, 394, 'danbi', '�� ������ !!', sysdate);
insert into reply values (reply_seq.nextval, 394, 'danbi', '�׽�Ʈ�� ���� �� �Ҳ��� !!', sysdate);
insert into reply values (reply_seq.nextval, 393, 'danbi', '��ҷ�', sysdate);
commit;
select * from reply where board_idx = 382 order by idx;

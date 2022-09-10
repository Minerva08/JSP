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
    
    constraint board2_member_fk foreign key(writer) -- board2_member_fk ��� �̸��� ���������� writer �÷��� �����Ѵ�
    references member2(userid)                       -- member ���̺��� userid�� �ִ� ���� writer�� ���� �ִ� ��Ģ
    on delete set null                              -- ���� �θ�Ű(����)�� �����Ǹ� �ڽ�Ű(�ۼ���)�� null�� ó���Ѵ�
);

insert into board2 
    (writer, title, content, ipAddress)
    values ('test', '�ܷ�Ű �׽�Ʈ 1', '����', '1.1.1.1');   -- member ���̺� userid���� emperor �� ����

insert into board2 
    (writer, title, content, ipAddress)
    values ('iu930516', '�ܷ�Ű �׽�Ʈ 2', '����', '2.2.2.2');    -- member ���̺� userid���� yellow�� �ִ�

commit;

select * from board2 order by idx desc;

select * from member2;


desc member;
drop sequence book_seq;
drop table book;


create sequence book_seq
	start with 1
	maxvalue 999999999
	increment by 1
	NOCYCLE
	nocache;


create table book(
	idx 		number		default book_seq.nextval primary key,
	name		varchar2(100)	not null,	
	author		varchar2(200)	not null,
	publisher	varchar2(100)	not null,
	publishdate	date		not null,
	price	number		check(price>0),
    description varchar2(500) not null
);

insert into book values(
    book_seq.nextval,
    '������ : ������ 5%���ڰ� �Ǵ� ����',
    '����ȯ',
    '�������ǻ�',
    '21/07/01',
    '9791197220586',
    11700,
    8910,
    9.75
);

select * from book order by idx;

insert into book values(
    book_seq.nextval,
    '�λ��� �����̴�',
    '�ſ���, �־��',
    '�������',
    '21/09/08',
    16650,
    'description1'
);

insert into book values(
    book_seq.nextval,
    '�ۺ����� �ʴ´�',
    '�Ѱ�',
    '���е���',
    '21/09/09',
    12600,
    'description1'
);

insert into book values(
    book_seq.nextval,
    '��ũ���׽� �ͽ�������',
    '���� ���̳�',
    '��ũ�ν�',
    '21/04/28',
    16200,
    'description1'
);

insert into book values(
    book_seq.nextval,
    '�޷���Ʈ �� ��ȭ�� 2',
    '�̹̿�',
    '���丮����',
    '21/07/27',
    12420,
    'description1'
);

insert into book values(
    book_seq.nextval,
    '��Ű',
    '�赵��',
    '�Ϸθ���',
    '21/08/25',
    14400,
   'description1'
);

insert into book values(
    book_seq.nextval,
    '�˰����� ����ϴ� �� ���� �ʹ� ������',
    'GAZEROSHIN',
    '��',
    '21/09/14',
    14850,
    'description1'
   
);

insert into book values(
    book_seq.nextval,
    '�޺��� �����ϰ� �λ��� ���ϴϱ��',
    '����',
    '�迵��',
    '21/08/18',
    13320,
    'description1'
);

insert into book values(
    book_seq.nextval,
    '1�ð��� ������ ��ȭ�� ���',
    '�����',
    '���帮������',
    '21/09/24',
    14220,
   'description1'
);

insert into book values(
    book_seq.nextval,
    '�̵峪�� ���̺귯��',
    '��Ʈ ���̱�',
    '���÷翣��',
    '21/04/28',
    14220,
    'description1'
);

commit;

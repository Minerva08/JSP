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
    '오케팅 : 누구나 5%부자가 되는 전략',
    '오두환',
    '대한출판사',
    '21/07/01',
    '9791197220586',
    11700,
    8910,
    9.75
);

select * from book order by idx;

insert into book values(
    book_seq.nextval,
    '인생은 실전이다',
    '신영준, 주언규',
    '상상스퀘어',
    '21/09/08',
    16650,
    'description1'
);

insert into book values(
    book_seq.nextval,
    '작별하지 않는다',
    '한강',
    '문학동네',
    '21/09/09',
    12600,
    'description1'
);

insert into book values(
    book_seq.nextval,
    '소크라테스 익스프레스',
    '에릭 와이너',
    '어크로스',
    '21/04/28',
    16200,
    'description1'
);

insert into book values(
    book_seq.nextval,
    '달러구트 꿈 백화점 2',
    '이미예',
    '팩토리나인',
    '21/07/27',
    12420,
    'description1'
);

insert into book values(
    book_seq.nextval,
    '럭키',
    '김도윤',
    '북로망스',
    '21/08/25',
    14400,
   'description1'
);

insert into book values(
    book_seq.nextval,
    '촉감으로 기억하는 네 얼굴은 너무 잔인해',
    'GAZEROSHIN',
    '쿵',
    '21/09/14',
    14850,
    'description1'
   
);

insert into book values(
    book_seq.nextval,
    '햇빛은 찬란하고 인생은 귀하니까요',
    '장명숙',
    '김영사',
    '21/08/18',
    13320,
    'description1'
);

insert into book values(
    book_seq.nextval,
    '1시간에 끝내는 대화의 기술',
    '리상룽',
    '리드리드출판',
    '21/09/24',
    14220,
   'description1'
);

insert into book values(
    book_seq.nextval,
    '미드나잇 라이브러리',
    '매트 헤이그',
    '인플루엔셜',
    '21/04/28',
    14220,
    'description1'
);

commit;

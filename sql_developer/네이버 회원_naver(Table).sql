drop SEQUENCE naver_seq;


create sequence naver_seq
    increment by 1
    start with 1
    minvalue 1
    maxvalue 999999999
    nocycle
    nocache;
    
    
create table naver(
    idx     number          default book_seq.nextval,
    name        VARCHAR2(20)    not null,
    id          VARCHAR2(200)   not null primary key,
    pw          VARCHAR2(500)   not null,
    email       VARCHAR2(700)   not null,
    brith       Date            not null,
    gender      varchar(6)      not null);
    
insert into naver values(naver_seq.nextval,'샘플','sample','1111','test@naver.com','21/10/30','여자');

desc naver;

select * from naver;
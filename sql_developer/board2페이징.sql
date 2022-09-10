select rownum, board2.* from board2 where rownum between 1 and 20;
select * from member2;

insert into member2 values ('iu930516', 'iu', '������', 'iu@itbank.com', '����');
insert into member2 values ('test', '1234', '�׽�Ʈ', 'test@itbank.com', '����');
insert into member2 values ('danbi', '1234', '���ܺ�', 'danbi@itbank.com', '����');
insert into member2 values ('ssamza', '1234', '�ΰ���', 'ssamza@itbank.com', '����');

insert into board2 (writer, title, content, ipAddress) 
    select writer, title, content, ipAddress from board2;

select count(*) as boardCount from board2 where writer like '%yellow%';      -- �� �Խñ��� ������ �ľ��ϴ� SQL

-- 1) rownum�� ��ø������(subquery)�� Ȱ���� ����¡ ����
-- where ���� 1=1 ��� �ٸ� ������ �־ �ȴ�
select * from 
    (select rownum as st, A.* from
        (select * from board2 where 1=1 order by idx desc) A        
    where rownum <= 20)
where st >= 11;

-- 2) oracle 12c �̻� �������� ��� ������ offset
select * from board2
    where writer like '%%'
    order by idx desc
    offset 1 rows      -- �������� ���� 10��° �ۿ���
    fetch first 10 rows only;    -- 5����ŭ �����Ͷ�

commit;

select 2 * 10 from dual;

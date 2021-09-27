-- �����Խ��� : ���̺�2�� (���α�����, �������)

create  table freeboard(
	idx int not null auto_increment,
	name varchar(30) not null, 		-- �ۼ���
	password varchar(10) not null, 	-- �� ��й�ȣ (�ʿ��Ҷ��� ���)
	subject varchar(40) not null, 	-- �� ����
	content varchar(2000) not null, -- ����
	readCount int default 0, 		-- ��ȸ��
	wdate datetime default current_timestamp,	-- ������ ���糯¥
	ip varchar(15) default '127.0.0.1',			-- �ۼ��� ip 
	commentCount smallint default 0,			-- ��� ����
	primary key(idx)
);

insert into freeboard (name,password,subject,content,ip)
	values ('honey','1111','����~~','���� �ݰ���','192.168.17.3');
insert into freeboard (name,password,subject,content,ip)
	values ('�糪','1111','welcome my home ~~','���� �ݰ��� ���','192.168.22.3');
insert into freeboard (name,password,subject,content,ip)
	values ('����','1111','�¹��� ~~','�߰� �Ǻ�','192.168.23.3');
insert into freeboard (name,password,subject,content,ip)
	values ('nayeon','1111','����~~','���� �ݰ���','192.168.24.3');
insert into freeboard (name,password,subject,content,ip)
	values ('����ȣ','1111','��ο�~~','��� ����','192.168.25.4');
insert into freeboard (name,password,subject,content,ip)
	values ('������','1111','���� ~~','��Ϸ� ������','192.168.26.7');
	

select * from freeboard;

-- mysql ���� limit Ű���� : limit ��ȣ,����
-- mysql, oracle select ����� ���� ���࿡ ������� ��ȣ�� �ο��ϴ� �÷�(row num)
-- �� ��������ϴ�. limit �� ��ȣ�� row num �Դϴ�. (mysql �� 0���� ����)
select * from freeboard f order by idx desc;
select * from freeboard f order by idx desc limit 0,15; -- 1������ ���
select * from freeboard f order by idx desc limit 15,15; -- 2������ ���
select * from freeboard f order by idx desc limit 30,15; -- 3������ ���
select * from freeboard f order by idx desc limit 45,15; -- 4������ ���
select * from freeboard f order by idx desc limit 60,15; -- 5������ ���
select * from freeboard f order by idx desc limit 135,15; -- 10������ ���
-- ���� : n=10������ ����? (n-1)*15
commit;

-- �� ���� : subject, contet ����. idx �÷��� �������� �մϴ�.

update freeboard set subject = '�³���~', content = '���ڰ� ���Ϻ���' where idx =1;

-- ��ȸ�� ���� : ���� ������(url ��û�� �߻�) ī��Ʈ +1

update freeboard set readCount= +1 where idx=1;

-- �� ���� : �ۺ�й�ȣ 1)���� �� 2)���� ��

delete from freeboard where idx=145 and password = '1111';
delete from freeboard where idx=145;

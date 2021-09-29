-- 자유게시판 : 테이블2개 (메인글저장, 댓글저장)

create  table freeboard(
	idx int not null auto_increment,
	name varchar(30) not null, 		-- 작성자
	password varchar(10) not null, 	-- 글 비밀번호
	subject varchar(40) not null, 	-- 글 제목
	content varchar(2000) not null, -- 내용
	readCount int default 0, 		-- 조회수
	wdate datetime default current_timestamp,	-- 서버의 현재날짜
	ip varchar(15) default '127.0.0.1',			-- 작성자 ip 
	commentCount smallint default 0,			-- 댓글 갯수
	primary key(idx)
);
alter table freeboard modify column wdate timestamp 
default current_timestamp;  -- timezone에 따라 설정

insert into freeboard (name,password,subject,content,ip)
	values ('honey','1111','웰컴~~','하이 반가워','192.168.17.3');
insert into freeboard (name,password,subject,content,ip)
	values ('사나','1111','welcome my home ~~','하이 반가워 어서와','192.168.22.3');
insert into freeboard (name,password,subject,content,ip)
	values ('나나','1111','굿바이 ~~','잘가 또봐','192.168.23.3');
insert into freeboard (name,password,subject,content,ip)
	values ('nayeon','1111','웰컴~~','하이 반가워','192.168.24.3');
insert into freeboard (name,password,subject,content,ip)
	values ('박찬호','1111','헬로우~~','운동좀 하자','192.168.25.4');
insert into freeboard (name,password,subject,content,ip)
	values ('세리박','1111','하이 ~~','운동하러 가야지','192.168.26.7');
	

select * from freeboard;

-- mysql 에는 limit 키워드 : limit 번호,갯수
-- mysql, oracle select 결과에 대해 각행에 순서대로 번호를 부여하는 컬럼(row num)
-- 이 만들어집니다. limit 의 번호는 row num 입니다. (mysql 은 0부터 시작)
select * from freeboard f order by idx desc;
select * from freeboard f order by idx desc limit 0,15; -- 1페이지 목록
select * from freeboard f order by idx desc limit 15,15; -- 2페이지 목록
select * from freeboard f order by idx desc limit 30,15; -- 3페이지 목록
select * from freeboard f order by idx desc limit 45,15; -- 4페이지 목록
select * from freeboard f order by idx desc limit 60,15; -- 5페이지 목록
select * from freeboard f order by idx desc limit 135,15; -- 10페이지 목록
-- 계산식 : n=10페이지 글은? (n-1)*15
commit;

-- 글 수정 : subject, contet 수정. idx 컬럼을 조건으로 합니다.

update freeboard set subject = '굿나잇~', content = '잘자고 내일보자' where idx =1;

-- 조회수 변경 : 읽을 때마다(url 요청이 발생) 카운트 +1

update freeboard set readCount = readCount+1 where idx=1;

-- 글 삭제 : 글비밀번호 1)있을 때 2)없을 때

delete from freeboard where idx=145 and password = '1111';
delete from freeboard where idx=145;

-- 로그인 기능 : 비밀번호 체크
select * from freeboard f where idx= 1 and password = '1211'; -- 잘못된 비밀번호 : 쿼리결과 null
select * from freeboard f where idx= 1 and password = '1111'; -- 올바른 비밃너호 : 쿼리결과 1개 행 조회


-- 댓글 테이블 : board_comment

create  table board_comment(
	idx int not null auto_increment,
	mref int not null, 				-- 메인 글(부모글)의 idx값
	name varchar(30) not null, 		-- 작성자
	password varchar(10) not null, 	-- 글 비밀번호
	content varchar(2000) not null, -- 내용
	wdate timestamp default current_timestamp,	-- 서버의 현재날짜
	ip varchar(15) default '127.0.0.1',			-- 작성자 ip 
	primary key(idx),
	foreign key(mref) references freeboard(idx)
);

-- 1)
insert into board_comment(mref,name,password,content,ip)
	values (144,'다현','1234','오늘 하루도 무사히','192.168.11.11');
insert into board_comment(mref,name,password,content,ip)
	values (143,'사나','1234','오늘 하루도 무사히!','192.168.11.11');
insert into board_comment(mref,name,password,content,ip)
	values (144,'다현','1234','오늘 하루도 무사히','192.168.11.11');
insert into board_comment(mref,name,password,content,ip)
	values (143,'사나','1234','오늘 하루도 무사히!','192.168.11.11');

-- 댓글 개수 (글목록에서 필요합니다.)
select count(*) from board_comment bc where mref=144;	-- 144번글의 댓글 갯수
select count(*) from board_comment bc where mref=143;	-- 143번글의 댓글 갯수
select count(*) from board_comment bc where mref=100; 	-- 100번글의 댓글 갯수

-- 2) 댓글 리스트
select * from board_comment where mref = 144;
select * from board_comment where mref = 143;
select * from board_comment where mref = 100;
-- 3) 글목록 실행하는 dao.getList() 보다 앞에서 댓글갯수를 update
update freeboard set commentCount = 
	(select count(*) from board_comment  where mref=144) 
	where idx=144;
update freeboard set commentCount = 
	(select count(*) from board_comment  where mref=143) 
	where idx=143;

-- 4) 글 상세보기에서 댓글 입력 후 저장할 때
update freeboard set commentCount = commentCount + 1 where idx=0;

select * from freeboard;




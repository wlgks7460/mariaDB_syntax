-- DML - INSERT문 실습

-- author 데이터 5개 추가 (adress는 데이터 넣지 말것)
INSERT  INTO author(id, name, email, password, role) values(2, 'kim', 'abc@naver.com', '123', 'king1');
INSERT  INTO author(id, name, email, password, role) values(3, 'lee', 'dfg@naver.com', '234', 'king2');
INSERT  INTO author(id, name, email, password, role) values(4, 'park', 'hij@naver.com','456', 'king3');
INSERT  INTO author(id, name, email, password, role) values(5, 'choi', 'klm@naver.com','123', 'king4');
INSERT  INTO author(id, name, email, password, role) values(6, 'yoon', 'nop@naver.com', '123', 'king5');

-- post 데이터 5개 추가
-- 2개는 저자가 있는 데이터
INSERT  INTO post(id, title, contents, author_id) values(1, 'hello', 'hello world', 1);
INSERT  INTO post(id, title, contents, author_id) values(2, 'hello2', 'hello world2',2);
-- 2개는 저자가 비어있는 데이터 -> author_id
INSERT  INTO post(id, title, contents) values(3, 'hello3', 'hello world3');
INSERT  INTO post(id, title, contents) values(4, 'hello4', 'hello world4');
-- 1개는 저자가 author테이블에 없는 데이터 추가 -> 에러발생 확인하기
INSERT  INTO post(id, title, contents, author_id) values(5, 'hello2', 'hello world2',10);



-- DML - UPDATE문, DELETE문 실습

-- author 데이터중 id가 4인 데인터를 email을 abc@naver.com, name을 abc로 변경
UPDATE author set email='abc@naver.com', name='abc' WHERE id =4;

-- post에 글쓴 적이 없는 author 데이터를 1개 삭제
delete from author where id=4;

-- post에 글쓴적이 있는 author 데이터 1개 삭제 -> 에러 -> 조치후 삭제 (post에서 먼저 삭제후 author 삭제)
-- 방법1
delete from author where id=1;
-- 오류
delete from post where id=2;
-- 조치
delete from author where id=1;
-- 해결

-- 방법2
delete from author where id=1;
-- 오류
UPDATE post set author_id = null where author_id=2;
-- 조치
delete from author where id=1;
-- 해결

-- date_format, like, between,비교연산자를 활용하여 2023년에 생성된 데이터 비교하는 실습
select * from post where date_format(created_time, '%Y') ='2023'; 
select * from post where created_time like '2023%';
select * from post where created_time between '2023-01-01%' and '2023-12-31%';
-- now()를 활용하여 오늘 날짜에 출력된 데이터 값 출력
select * from post where date_format(created_time, '%Y-%m-%d') = date_format(now(), '%Y-%m-%d');

-- AUTO_INCREMENT 키워드와 함께 새로운 데이터가 추가될 떄마다1씩 증가시키고
-- post 테이블에 id 없이 insert, 
-- insert한 데이터 삭제
-- 다시 데이터 insert
ALTER table post MODIFY column id INT AUTO_INCREMENT;
INSERT INTO post(title, contents) values('v4', 't1win');
delete from post where id=11;
INSERT INTO post(title, contents) values('v5', 't1win');

-- 제약조건 UNIQUE 실습

-- author 테이블에 email에 unique 제약조건 추가 (제약조건 생성하면 index 생성)
-- 컬럼 제약조건으로 추가
-- 제약조건 제거 및 index 제거
ALTER TABLE author MODIFY COLUMN email varchar(255) UNIQUE;
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME = 'author';
SHOW INDEX FROM author;
ALTER TABLE author DROP index email;
-- 테이블 제약조건 추가 형식으로 추가
ALTER TABLE author ADD CONSTRAINT author_unique unique(email);

-- 제약조건 - on update cascade
-- 외래키 제약조건에서 ON UPDATE CASCADE등의 옵션
-- POST 테이블에 ON UPDATE CASCADE 설정
-- 먼저 기존의 foreign key 제약조건을 조회 후 삭제
select * from INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME ='post';
ALTER TABLE post DROP FOREIGN KEY post_ibfk_1;
SHOW INDEX from post;
ALTER TABLE post DROP INDEX author_id;

-- 새롭게 제약조건 추가
ALTER TABLE post ADD CONSTRAINT post_author_fk FOREIGN KEY (author_id) REFERENCES author(id) ON UPDATE CASCADE;

-- 테스트
-- 삭제
-- 삭제불가
-- restrict와 동일 
-- 수정
-- author 테이블의 id 수정시 post 테이블의 id도 같이 수정

-- 제약조건 - ON DELETE CASCADE 실습



-- ON DELETE SET NULL, ON UPDATE SET NULL 또한 동일 방법으로 테스트
ALTER TABLE post ADD CONSTRAINT post_author_fk FOREIGN KEY (author_id) REFERENCES author(id) ON DELETE SET NULL ON UPDATE SET NULL;

-- 흐름제어 실습

-- POST 테이블에 id, title, contents 그리고 author_id의 경우 author_type이라는 이름으로 조회 author_id가 만약
-- 1이면 first_author, 2이면 second_author로 조회가 되도록 하고 3이상 그외의 경우 etc_author로 조회되도록 하여라
-- 1. case when 사용
select id, title, contents,
CASE  
    WHEN author_id = 1 THEN 'First_author'
    WHEN author_id = 2 THEN 'second_author'
    when author_id is null then 'Anonymous'
else 'Others'
end
as author_type from post;

-- 2. if문 사용하여 동일하게 출력
select id, title, contents,
if(author_id=1, 'First_author', 'Others')
as author_type from post;

-- 3. 위에서 사용한 ifnull의 결과 값을 동일하게 if문으로 출력하도록
select id, title, contents, ifnull(author_id, 'anonymous') from post;
select id, title, contents, if( author_id is null , 'Anonymous', author_id) from post;

-- INNER JOIN 실습
SELECT a.*, p.* FROM tableA INNER JOIN tableB ON tableA.ID = tableB.A_ID;
SELECT * FROM tableA AS a INNER JOIN tableB AS b on a.ID = b.a_id;

SELECT * FROM author INNER JOIN post ON author.id = post.author_id;
SELECT * FROM author AS a INNER JOIN post AS p on a.id = p.author_id;

-- 예제
-- post 테이블에는 author_id, 글쓴이명, 글제목

-- left (outer) JOIN 실습
-- author의 테이블은 일단 다 조회하고 author가 작성한 글정보를 JOIN 추가적으로 조회
SELECT * FROM tableA a LEFT JOIN tableB b ON a.id = b.a_id;



-- 실습

-- author 테이블과 post 테이블을 JOIN하여, 글을 작성한 모든 저자의 이름(name)과 해당 글의 제목(title)을 조회하시오.
-- author 는 alias a, post alias p

select a.name, p.title from author AS a INNER JOIN post AS p on a.id = p.author_id;

-- author 테이블을 기준으로 post 테이블과 join하여, 모든 저자의 이름과 해당저자가 작성한 글의 제목을 조회하시오.
-- 글을 작성하지 않은 저자의 경우, 글제목은 NULL로 표시
select a.name, p.title from author a left join post p on a.id = p.author_id;

-- 위의 예제와 동일하게 모든 저자의 이름과 해당 저자가 작성한 글의 제목을조회. 단, 저자의 나이가 25세 이상인 저자만 조회
SELECT a.name, p.title from author a left join post p on a.id = p.author_id where a.age >= 25;

-- not null 이 아닌 경우 둘이 같음
select * from author INNER join post;
select a.*, p* from post left join author;

-- UNION 실습
A테이블의 조회 결과 UNION
SELECT 컬럼1, 컬럼2 FROM TABLE1 UNION SELECT 컬럼1, 컬럼2 FROM TABLE2;
-- AUTHOR 테이블에서 NAME, EMAIL POST 테이블 TITLE, CONTENTS UNION UNION ALL

SELECT name, email from author union all select title, contents from post;

-- post의 price에 적적한 값을 넣어놓고 avg(정수값), min, max, sum
-- 소수점 -> round(대상값, 원하는소숫점자릿수)
select count(*) from author;
select round(avg(price),0) from post;
select min(price) from post;
select max(price) from post;
select sum(price) from post;

-- group by
-- author_id별 count 값
-- author_id별 price sum, avg
select author_id from post group by author_id;
select author_id, count(*) from post group by author_id;
select author_id, avg(price) from post group by author_id;

-- 1)author_id 별로 price 평균값을 구하시오 단 건별로 4000원 이상인 데이터만 평균을 내서 출력하시오
select author_id, avg(price) from post where price >= 4000 group by author_id;
-- 2)author_id 별로 price 평균값을 구하되 평균값이 4000원 이상건만 출력하시오.
select author_id, avg(price) from post group by author_id having avg(price) >= 4000;
select author_id, avg(price) as price from post group by author_id having price > 4000;
-- 3) 1+2
select author_id, avg(price) as price from post where price >= 4000 group by author_id having price > 4000;

-- 재귀문
WITH RECURSIVE number_sequence(HOUR) AS (
    SELECT 0
    UNION ALL
    SELECT HOUR +1 FROM number_sequence WHERE HOUR < 23
)
select HOUR, 0 as COUNT from number_sequence;

-- index 실습
-- 1) author name으로 단일 컬럼 index
CREATE INDEX index_name ON author(name);
-- 2) 복합컬럼 index : author의 name, email index (정렬한 순서대로 우선순위 부여)
CREATE INDEX index_name ON 테이블명(컬럼1, 컬럼2);


-- 사용자 관리
-- 사용자 목록 조회
select * from  mysql.user;
-- 권한 조회
show grants for 'testuser'@'localhost';
-- user 생성
CREATE USER 'testuser'@'localhost' IDENTIFIED BY '1234';
-- insert 권한 부여 및 삭제
GRANT insert ON board.author TO 'testuser'@'localhost';
revoke insert ON board.author from 'testuser'@'localhost';
-- user 삭제
drop user 'testuser'@'localhost';

-- view 만들고 조회하기
CREATE VIEW author_for_view AS SELECT name, email from author;
select * from author_for_view; 

-- 저장 프로시저 기본 문법
-- 프로시저 생성
-- 프로시저네임 : getUser(IN userId INT)
DELIMITER // CREATE PROCEDURE procedure_name (parameters) begin SQL 문법 END // DELIMITER;

-- 프로시저 호출시 
CALL 프로시저명();

-- 생성된 프로시저 확인
SHOW CREATE PROCEDURE 프로시저명;

-- 파라미터는 생략가능하고, 함수와 같이 parameter를 전달하여 실행하는 것도 가능
기본형식은 (IN 변수명 변수타입)
-- 프로시저 실습
-- post 테이블에 쉽게 insert할 수 있는 post 관련 프로시저 생성
-- 사용자에게 title, contents, author_id 만 입력받아 insert하는 insert문 생성
DELIMITER // 
CREATE PROCEDURE easy_user (in title varchar(255), contents varchar(3000), author_id int(11)) 
begin 
INSERT INTO post(title, contents, author_id) values (title, contents, author_id)  
END 
// DELIMITER;


-- 변수 선언
DECLARE 변수명 변수타입 [DEFAULT default_value];
-- 반드시 프로시저나 함수의 본문 시작 부분, 즉 BEGIN 바로 밑에 위치
-- 변수 수정
SET 변수명 = 수정할 값;
-- 제어문 
-- if 문
if 조건식 then 
조건이 참일때 실행할 명령
ELSE
조건이 거짓일 때 실행할 명령
END IF;
"SELECT 컬럼명 INTO 변수"문과 함께 많이 사용

-- PROCEDURE IF문 예제
DELIMITER // 
CREATE PROCEDURE pay_user (in a_id int(11)) 
begin 
DECLARE avg_pay int default 0 ;
select avg(price) into avg_pay from post where author_id = a_id ;

if avg_pay >= '4000' then
select "고액 원고료 작가입니다." as pay;
else
select " 고액 원고료 작가가 아닙니다." as pay;
end if;
END 
// DELIMITER ;


-- while문 
while 조건식 DO
조건이 참일 동안 반복 실행할 명령
END WHILE;

-- PROCEDURE while문 예제 테이블에 while문을 활용하여 데이터 대량 insert 100건

DELIMITER // 
CREATE PROCEDURE create_post()
begin
DECLARE a int DEFAULT 0 ;
WHILE a < 10 DO
    SET a = a+1;
    insert into post(contents) values(concat('hellos world',i));
END while;
END
// DELIMITER ;

-- db 다시 생성
mysql -u root -p board < dumpfile.sql;

-- 윈도우
-- db dump 실습
-- 구축된 database를 sql파일화하고 전체DB 다시생성
mysqldump -u root -p --default-character-set=utf8mb4 board > dumpfile.sql
-- github에 dump 파일 업로드

-- 리눅스 linux에 db 구축 (mariaDB 설치 및 데이터베이스 생성)
-- 리눅스에 mariadb 설치
sudo apt install mariadb-server -y 
-- 설치 확인
sudo mariadb -v
-- github에서 소스코드 clone
git clone https://github.com/wlgks7460/mariaDB_syntax.git
-- 해당 폴더로 이동하여 덤프 복원 명령어 실행
sudo mysql -u root -p board < dumpfile.sql;
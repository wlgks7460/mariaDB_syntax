-- insert, select, update, delete


-- DML - INSERT문
-- 문자열은 '', 숫자는 그냥
INSERT INTO 테이블이름(필드이름1, 필드이름2, 필드이름3,...) values(데이터값1, 데이터값2, 데이터값3,...);

-- 예제
INSERT INTO author(id, name, email) values(1, 'kim', 'abc@naver.com');

-- DML - UPDATE문
-- 테이블의 레코드의 내용을 수정
-- 만약 WHERE 절을 생략하면, 해당 테이블의 모든 레코드 값이 위 설정대로 수정되므로 유의
-- where문 뒤에 나오는 비교문은 java기준으로 ==로
-- 어떤 값을 set 할때도 =을 사용하여 대입
UPDATE 테이블이름 SET 필드이름1=데이커값1, 필드이름2=데이터값2, ... WHERE 필드이름=데이터값1

-- 예제
UPDATE author set email='hello@naver.com' WHERE id =2;

-- DML - DELETE문
-- WHERE절을 생략하면, 해당 테이블에 저장된 모든 데이터가 삭제
-- DELETE, TRUCATE, DROP차이
-- DROP은 테이블 구조까지 전체 삭제
-- delete는 storage까지 삭제하지 않고 복구가 가능
-- delete는 log를 남김
-- delete의 삭제속도는 trucate보다 느림
DELETE FROM 테이블이름;

-- 예제
delete from author where author_id=5;

-- DML - SELECT문
-- 모든 필드 선택 (* = ALL)
SELECT * FROM 테이블이름 [WHERE 조건];

-- 예제
SELECT * FROM author;
select name from author;
select * from author where id=1;
select name, email from author where id=1;
select * from author from where password=123;
select * from author where id> AND name = 'kim';

-- SELECT시 중복되는 이름 제거하고 조회
select distinct name from author;

-- 선택한 결과의 정렬
-- SELETE문으로 선택한 결과를 ORDER BY 절을 사용하여 정렬
-- 기본 설정은 s오름차순(ASC)이며, 내림차순시 DESC
-- 여러 필드의 데이터를 쉼표(,)를 사용하여 여러기준으로 정렬
-- order by를 생략시 pk를 기준으로 오름차순 정렬한 값 변환

-- order by
select * from author order by name desc;

-- order by 멀티 : 먼저쓴 컬럼 우선정렬, asc/desc 생략시 asc 적용
select * from author order by name desc, email desc;

--  limte number : 특정숫자로 결과값 개수 제한
select * from author order by id desc limit 2;

-- allias(별칭)을 이용한 처리
-- 테이블과 필드에 임시로 allias을 부여하고, 해당 allias을 SELECTE에서 사용 (as 생략 가능)

SELECT 필드이름 AS 별칭 FROM 테이블명;
-- 예제
select name as 이름 from author;

SELECT 필드이름 FROM 테이블이름 AS 별칭;
-- 예제 
select name, email from author as a;

-- TINYINT UNSIGEN 컬럼 생성
alter table author ADD column age tinyint unsigned; 

-- DECIMAL 컬럼 생성
alter table post ADD column price decimal(10, 3); 

-- 다양한 타입의 바이너리 데이터를 저장할 수 있는 BOLB 컬럼 생성 및 데이터 입력, 확인 
create table table_blob(id int, myimg longblob);
INSERT INTO table_blob(id, myimg) values(2, LOAD_FILE('C:\\test_picture'));
select HEX(myimg) from table_blob where id =1;

-- 특정 데이터 값 지정
alter table author modify column role ENUM('admin', 'user') not null default 'user';

-- created_time 컬럼 생성 후 날짜와 시간를 지정
alter table post add column created_time datetime(6) default current_timestamp(6);

--비교연산자
-- author 테이블의 id가 1,2,4는 아닌 데이터 조회(not in) 
select * FROM author where id NOT IN(1,2,4);
-- post 테이블의 id가 2~4까지의 데이터 조회
-- between
select * FROM post where id between 2 and 4;
-- and
select * from post where (id >=2 and id <=4);
--or
select * from post where NOT (id <2 or id > 4);

-- 검색 패턴
-- LIKE , NOT LIKE
select * from author where name LIKE '홍%';
select * from author where name LIKE '%동';
select * from author where name LIKE '%길%';
-- REGEXP
SELECT * FROM author WHERE name REGEXP '[a-z]';
SELECT * FROM author WHERE name REGEXP '[가-힣]';

-- 타입변환 (CAST 값 AS 데이터형식)
SELECT CAST(20200101 AS DATE); => 2020-01-01
SELECT CONVERT('2020-01-01', DATE); =>2020-01-01
SELECT DATE_FORMAT('2020-01-01 17:12:00', '%Y-%m-%d'); =>2020-01-01
SELECT * FROM post where DATE_FORMAT (created_time, '%Y-%m-%d') = '20202-01-03';

-- 제약조건 - UNIQUE
-- UNIQUE 제약 조건을 별도로 정의하며, 선택적으로 제약 조전에 이름을 부여하는 방법
CREATE TABLE 테이블이름 (필드이름 필드 타입,..., [CONSTRAINT 제야조건이름] UNIQUE(필드이름));
-- UNIQUE 제약 조건을 설정하면, 해당 필드는 자동으로 인데스(INDEX)로 설정, 제약조건 삭제시 index 삭제, index 삭제시 제약조건 삭제
SHOW INDEX FROM 테이블명;
index 삭제 : ALTER TABLE 테이블이름 DROP INDEX 인덱스명;

-- UNIQUE ALTER문
-- 방법1 
ALTER TABLE 테이블이름 MODIFY COLUMN 필드이름 필드타입 UNIQUE
-- 방법2 별도의 제야조건이름 옵션
ALTER TABLE 테이블이름 ADD CONSTRAINT 제약조건이름 unique
-- 제약조건 제거
-- 제약조건 목록 조회
ALTER TABLE 테이블명 DROP CONSTRAINT email;
ALTER TABLE 테이블명 DROP FOREIGN KEY UNIQUE 제약조건이름;

-- 제약조건 - primary key

-- primary key 제약조건을 가진 컬럼을 기본키(pk)라함
-- NOT NULL과 UNIQUE 제약 조건의 특징을 모두가진다
-- PRIMARY KEY는 테이블다 오직하나의 필드에만 설정
-- UNIQUE는 한테이블의 여러 필드에 설정 가능
-- NOT NULL도 물론 여러필드 설정 가능

-- 제약조건 - FOREIGN KEY

-- 외래키라고 부르며, 한 테이블을 다른 테이블과 연결해주는 역할
-- 하나의 테이블을 다른 테이블에 의존하게 만드는것
-- 다른 테이블의 필드는 반드시 UNIQUE나 PRIMARY KEY 제약조건이어야함
-- 문법
CREATE TABLE(필드이름 필드타입,..., [CONSTRAINT 제약조건이름] FOREIGN KEY)

-- 참조되는 테이블에서 데이터의 수정이나 삭제가 발생시 영향
-- ON DELETE
-- ON UPDATE
-- 기본값은 delete, update 모두 restrict 옵션이 걸려 있으므로, 변경하고 싶다면 각각 지정 필요

-- 위 설정시 동작옵션
-- CASCADE 참조되는 테이블에서 데이터를 삭제/ 수정하면 같이 삭제/수정
-- SET NULL 참조되는 테이블에서 데이터를 삭제/수정하면 데이터는 NULL로 변결
-- RESTRICT fk로 잡은 테이블의 데이터가 남아 있으면, fk 대상 데이터를 

-- 제약조건 - default
-- 데이터를 입력할 때 해당 필드 값을 전달하지 않으면, 자동으로 설정된 기본값을 정장
-- 문법 
create table test1( ID INT, NAME VARCHAR(30) DEFAULT 'Anoymous');

-- 시간 세팅시 가장 많이 사용
-- ALTER TABLE author ADD create_at DATETIME DEFAULT;

-- 흐름제어
-- CASE -switch
-- CASE와 END로 이루어져있고, 원하는 조건내에 존재하지 않으면 ELSE문을 타고, ELSE문이 없을 경우 null을 return
CASE value 
WHEN [compare_value] THEN result 
WHEN [compare_value] THEN result ....
ELSE result
END

-- if
-- if(a,b,c) a-조건, b-참일경우 반환값, c는 거짓일 경우 반환값
-- 만약 a 조건이 참이면 b를 반환하고, 거짓이면 c를 반환합니다.
SELECT IF(0<1, 'yes', 'no');

-- IFNULL(a,b)
-- 만약 a 값이 NULL이 아니면 a 그 자체를 반환하고, NULL이며 b를 반환
select id, title, contents, ifnull(author_id, 'anonymous') from post;

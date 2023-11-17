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
-- 기본 설정은 오름차순(ASC)이며, 내림차순시 DESC
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
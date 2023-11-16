-- insert, select, update, delete

select * from author;

-- DML - INSERT문
INSERT INTO 테이블이름(필드이름1, 필드이름2, 필드이름3,...) values(데이터값1, 데이터값2, 데이터값3,...);

-- 예제
INSERT  INTO author(id, name, email) values(1, 'kim', 'abc@naver.com');

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
SELECT * FROM 테이블이름 [WHERE 조건];

-- 모든 필드 선택
SELECT * FROM author;

-- 예제 
select name from author;
select * from author where id=1;
select name, email from author where id=1;
select * from author from where password=123;
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
DELETE FROM 테이블이름;

-- 예제
delete from author where author_id=5;
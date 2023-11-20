-- DML - INSERT문 실습

-- author 데이터 5개 추가 (adress는 데이터 넣지 말것)
INSERT  INTO author(id, name, email, password, role) values(2, 'kim', 'abc@naver.com', '123', 'king1');
INSERT  INTO author(id, name, email, password, role) values(3, 'lee', 'dfg@naver.com', '234', 'king2');
INSERT  INTO author(id, name, email, password, role) values(4, 'park', 'hij@naver.com','456', 'king3');
INSERT  INTO author(id, name, email, password, role) values(5, 'choi', 'klm@naver.com','123', 'king4');
INSERT  INTO author(id, name, email, password, role) values(6, 'yoon', 'nop@naver.com', '123', 'king5');

-- post 데이터 5개 추가
-- 2개는 저자가 있는 데이터
INSERT  INTO post(id, title, contents, auhtor_id) values(1, 'hello', 'hello world', 1);
INSERT  INTO post(id, title, contents, auhtor_id) values(2, 'hello2', 'hello world2',2);
-- 2개는 저자가 비어있는 데이터 -> author_id
INSERT  INTO post(id, title, contents) values(3, 'hello3', 'hello world3');
INSERT  INTO post(id, title, contents) values(4, 'hello4', 'hello world4');
-- 1개는 저자가 author테이블에 없는 데이터 추가 -> 에러발생 확인하기
INSERT  INTO post(id, title, contents, auhtor_id) values(5, 'hello2', 'hello world2',10);



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
UPDATE post set author_id = null where auhtor_id=2;
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
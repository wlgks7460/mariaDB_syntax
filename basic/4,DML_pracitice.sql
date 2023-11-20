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


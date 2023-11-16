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
delete from author where id=1;
-- 오류
delete from post where id=2;
-- 조치
delete from author where id=1;
-- 해결

-- 다른 방법
delete from author where id=1;
-- 오류
UPDATE post set author_id = null where auhtor_id=2;
-- 조치
delete from author where id=1;
-- 해결

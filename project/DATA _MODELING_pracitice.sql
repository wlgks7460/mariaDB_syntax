-- 데이터 모델링 실습1

-- 스키마 추가 및 변경
-- author 테이블을 나누어 author_address 테이블 추가
-- coountry, state_city, detail, zip code, phonenumber
-- on delete cascade 옵션
-- 1대 1 관계 설정 (author_address에 유니크)
-- author와 post의 관계가 N:M 즉, 여러명이서 한 post를 수정할 수 있도록 스키마 수정

ALTER TABLE author DROP COLUMN address;

CREATE TABLE author_address
(id INT PRIMARY KEY, country VARCHAR(255), state_city VARCHAR(255), zip_code VARCHAR(255),
 phonenumber VARCHAR(255), author_id INT, FOREIGN KEY(author_id) REFERENCES author(id));

 ALTER TABLE author_address ADD CONSTRAINT 
 author_address_ibfk_1 FOREIGN KEY (author_id) REFERENCES author(id) ON DELETE CASCADE;


CREATE TABLE post_authors
(id INT PRIMARY KEY, author_id INT, post_id INT,FOREIGN KEY(author_id) REFERENCES author(id), FOREIGN KEY(post_id) REFERENCES post(id) );


-- 데이터 모델링 실습2
-- 스키마 설계
-- 요구 사항
-- 모든테이블 컬럼 자유 설계
-- ordersystem 데이터베이스 생성
-- 해당 서비스에서는 회원가입이 가능
-- MEMBERRS
-- 회원의 종류가 USER, admin, seller로 구성
-- 회원이 상품과 재고수량을 등록
-- items
-- 상품명, 상품가격, 재고
-- 누가 등록헸는지에 대한 정보가 남아야 함에 유의
-- 회원이 여러상품을 한꺼번에 주문 가능
-- order, order_details

seller 회원가입
seller가 상품등록(사과,바나나)

customer가 회원가입
order테이블 insert, order_details insert, 재고 update




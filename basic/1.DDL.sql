-- 데이터베이스 생성
CREATE DATABASE board;
-- 데이터베이스 선택
USE board;
-- 테이블 신규 생성
CREATE TABLE author(id INT name VARCHAR(255),
 email VARCHAR(255), password VARCHAR(255), test1 VARCHAR(255), PRIMARY KEY (id));
--  테이블 목록 조회
SHOW TABLES;
-- 테이블
DESCRIBE author;
-- 데이터베이스 생성
CREATE DATABASE board;
-- 데이터베이스 선택
USE board;
-- author 테이블 신규 생성
-- 컬럼의
-- primary key를 걸게되는 컬럼에 대해서는 unqie, not null 제약조건 부여
CREATE TABLE author(id INT, name VARCHAR(255),
 email VARCHAR(255), password VARCHAR(255), test1 VARCHAR(255), PRIMARY KEY (id));
--  테이블 목록 조회
SHOW TABLES;
-- 테이블 컬럼조회
DESCRIBE author;
-- post 테이블 신규 생성
-- 외래키가 설정되면 post,author 테이블 데이터의 생성, 삭제, 수정에대해 제약이 발생
-- 만약 fkdp not null 조건이 있다면 auhtor_id가 없는 데이터는 post에 생성 불가
-- author가 상제 될때 post에 대이터가 남아있으면 author 삭제 불가
-- author의 id가 수정될때 post에 데이터가 남아있으면 author 수정불가
CREATE TABLE posts(id INT PRIMARY KEY, title VARCHAR(255) not null, conntent VARCHAR(255), author_id INT, FOREIGN KEY(author_id) REFERENCES author(id));


-- 테이블 컬럼 정보조회
-- 테이블 생성후 조회
SHOW TABLE
-- 컬럼 정보 조회
DESCRIBE author;
-- 테이블 컬럼 상세조회
SHOW FULL columns FROM author;
-- 테이블 생성문 조회
SHOW CREATE TABLE posts;

-- 테이블 제약조건 조회
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME = 'posts';

-- 테이블 index 조회
-- 제약 조건 정보 조회와 인덱스조회는 상당수 일치(주요제약조건[pf,fk]은 index를 자동 생성)
-- index는 검색 속도 향상을 위해
SHOW INDEX FROM posts;

-- DDL - CREATE문

-- 테이블 생성
CREATE TABLE 테이블 이름
(
    필드이름1 필드타입1 [제약조건],
    필드 이름2 필드타입2 [제약조건],
    ....
    [테이블 제약 조건]
)

-- DDL - ALTER문

-- 테이블 정보 변경
-- 테이블 이름 변경
ALTER TABLE 테이블명 RENAME 새로운테이블명;
ALTER TABLE posts RENAME post;

-- 테이블 컬럼 추가 (Add)
ALTER TABLE 테이블명 ADD COLUMN 컬럼명 자료형 [NULL 또는 NOTNULL]
ALTER TABLE author ADD COLUMN role VARCHAR(50);

-- 필드 타입 변경(Modify) 덮어쓰기이므로 제약조건 줘야함
ALTER TABLE 테이블명 MODIFY COLUMN 컬럼명 타입 [제약조건];
ALTER TABLE author MODIFY COLUMN name VARCHAR(100) NOT NULL;

-- 컬럼 이름 변경 -> contents
ALTER TABLE 테이블명 CHANGE COLUMN 기존컬럼명 새로운컬럼명 타입 [제약조건];
ALTER TABLE post CHANGE COLUMN content contents VARCHAR(255) NULL;

-- 컬럼 삭제 -> test1 컬럼 삭제
ALTER TABLE 테이블명 DROP COLUMN 컬럼명;
ALTER TABLE author DROP COLUMN test1;

-- DDL - DROP문

-- 데이터베이스 삭제
DROP DATABASE 데이터베이스명;

-- 테이블 삭제
DROP TABLE 테이블이름;

-- 테이블 데이터만 지우고 싶을 떄
DELETE FROM 테이블이름
TRUNCATE TABLE 테이블이름

-- IF EXSIST
-- 특정 객체가 존재하는 경우에만 명령어를 실행
DROP DATABASE 또는 TABLE IF EXISTS 테이블명 또는 데이터베이스명; 


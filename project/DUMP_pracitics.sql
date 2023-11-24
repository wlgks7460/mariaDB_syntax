-- mariadb에서 git을 통해 데이버베이스 dump하기
-- 윈도우
-- db dump 실습
-- 구축된 database를 sql파일화하고 전체DB 다시생성
mysqldump -u root -p --default-character-set=utf8mb4 board > dumpfile.sql
-- github에 dump 파일 업로드

-- mariadb 설치
sudo apt-get update
sudo apt-get upgrade
sudo apt install mariadb-server -y 

-- 설치 확인
sudo mariadb -v

-- MARIADB 시작하는 옵션
sudo systemctl start mariadb
sudo systemctl enable mariadb

sudo mariadb -u root -p

-- 리눅스 linux에 db 구축 (mariaDB 설치 및 데이터베이스 생성)
CREATE DATABASE board;
use board;
exit;

-- github에서 소스코드 clone
git clone (레파지토리주소)
git clone https://github.com/wlgks7460/mariaDB_syntax.git

-- 해당 폴더로 이동하여 덤프 복원 명령어 실행
cd 이동할 폴더
sudo mysql -u root -p board < dumpfile.sql;

-- scp 파일전송관련 명령어 내컴퓨터-> 원격컴퓨터
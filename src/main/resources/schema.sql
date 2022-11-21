-- 스프링부트는 
-- 클래스패스 루트에 schema.sql 또는 data.sql 파일이 존재하면,
-- 애플리케이션 실행(시작)시 해당 파일 내의 SQL문들을 자동 실행

-- 회원정보 테이블 생성
CREATE TABLE IF NOT EXISTS member(
mem_id VARCHAR(50) PRIMARY KEY, --회원아이디
mem_pass VARCHAR(50), --비밀번호
mem_name VARCHAR(50), --이름
mem_point INT --포인트
);

-- 게시판 테이블 생성  
-- MySQL 5.6.5, MariaDB 10.0 버전부터 DEFAULT CURRENT_TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP 설정 가능
CREATE TABLE if not exists bbs
( bbs_no INT PRIMARY KEY AUTO_INCREMENT, --게시글번호
  bbs_title VARCHAR(100), --제목
  bbs_content TEXT, --내용
  bbs_writer VARCHAR(50) REFERENCES member (mem_id),  --작성자
  bbs_reg_date DATETIME DEFAULT CURRENT_TIMESTAMP  --등록일시
-- , bbs_mod_date DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
-- , bbs_count NUMERIC(10,0)
-- , FOREIGN KEY ('bbs_writer') REFERENCES 'member' ('mem_id')
);

-- 댓글 테이블 생성  
CREATE TABLE if not exists reply
( rep_no INT PRIMARY KEY AUTO_INCREMENT ,  --댓글번호
  rep_content TEXT, --내용
  rep_writer VARCHAR(50) REFERENCES member (mem_id), --작성자
  rep_date DATETIME DEFAULT CURRENT_TIMESTAMP, --등록일시
  rep_bbs_no INT REFERENCES bbs (bbs_no) --게시글번호
-- , PRIMARY KEY (rep_no) 
-- , FOREIGN KEY (rep_bbs_no) REFERENCES bbs (bbs_no)
-- , FOREIGN KEY (rep_writer) REFERENCES member (mem_id)
);
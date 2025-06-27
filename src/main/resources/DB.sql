DROP DATABASE IF EXISTS `25_05_Spring`;
CREATE DATABASE `25_05_Spring`;
USE `25_05_Spring`;

# 게시글 테이블 생성
CREATE TABLE article (
	id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	regDate DATETIME NOT NULL,
	updateDate DATETIME NOT NULL,
	title CHAR(100) NOT NULL,
	`body` TEXT NOT NULL
);
ALTER TABLE article MODIFY `body` LONGTEXT;

# 회원 테이블 생성
CREATE TABLE `member` (
	id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	regDate DATETIME NOT NULL,
	updateDate DATETIME NOT NULL,
	loginId CHAR(30) NOT NULL,
	loginPw CHAR(100) NOT NULL,
	`authLevel` SMALLINT(2) UNSIGNED DEFAULT 3 COMMENT '권한 레벨 (3=일반,7=관리자)', 
	`name` CHAR(20) NOT NULL,
	nickname CHAR(20) NOT NULL,
	cellphoneNum CHAR(20) NOT NULL,
	email CHAR(50) NOT NULL,
	gender CHAR(20) NOT NULL,
	team CHAR(20) NOT NULL,
	introduce CHAR(100),
	delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴 여부 (0=탈퇴 전, 1=탈퇴 후)',
	delDate DATETIME COMMENT '탈퇴 날짜'
);

ALTER TABLE `member` ADD COLUMN `profileImg` VARCHAR(255) DEFAULT NULL COMMENT '프로필 이미지 경로';

# 게시판(board) 테이블 생성
CREATE TABLE board (
	id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	regDate DATETIME NOT NULL,
	updateDate DATETIME NOT NULL,
	`code` CHAR(50) NOT NULL UNIQUE COMMENT 'notice(공지사항) free(자유) QnA(질의응답)...',
	`name` CHAR(20) NOT NULL UNIQUE COMMENT '게시판 이름',
	delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '삭제 여부 (0=삭제 전, 1=삭제 후)',
	delDate DATETIME COMMENT '삭제 날짜'
);

# 댓글 테이블 생성
CREATE TABLE `comment` (
	id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	regDate DATETIME NOT NULL,
	updateDate DATETIME NOT NULL,
	`body` TEXT NOT NULL,
	relTypeCode CHAR(20) NOT NULL COMMENT '관련 데이터 타입 코드'
);

#스타일 테이블 생성
CREATE TABLE `survey` (
  id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  memberId INT(10) UNSIGNED NOT NULL COMMENT '설문 작성자 (회원 id)',
  regDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  seatPreference VARCHAR(50) COMMENT '선호 좌석 (콤마로 구분 가능)',
  mateGender ENUM('여자', '남자', '상관없음') NOT NULL COMMENT '동반자 성별',
  cheeringStyle VARCHAR(100) COMMENT '야구관람 스타일 (콤마로 구분 가능)',

  FOREIGN KEY (memberId) REFERENCES MEMBER(id) ON DELETE CASCADE
);


#채팅방 테이블
CREATE TABLE `chat_room` (
  id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  createdDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updateDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  roomName VARCHAR(50) NOT NULL COMMENT '채팅방 이름 또는 고유키',
  createdBy INT(10) UNSIGNED NOT NULL COMMENT '채팅방 생성자 (member.id)',

  FOREIGN KEY (createdBy) REFERENCES MEMBER(id)
);

#채팅 테이블
CREATE TABLE `chat_message` (
  id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  roomId INT(10) UNSIGNED NOT NULL COMMENT '채팅방 id',
  senderId INT(10) UNSIGNED NOT NULL COMMENT '보낸 사람 (member.id)',
  message TEXT NOT NULL COMMENT '메시지 내용',
  sentDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '보낸 날짜/시간',

  FOREIGN KEY (roomId) REFERENCES chat_room(id),
  FOREIGN KEY (senderId) REFERENCES MEMBER(id)
);

ALTER TABLE chat_message
ADD COLUMN is_read BOOLEAN NOT NULL DEFAULT FALSE COMMENT '읽음 여부';
# memberId 추가
ALTER TABLE article ADD COLUMN memberId INT(10) UNSIGNED NOT NULL AFTER updateDate;
ALTER TABLE `comment` ADD COLUMN memberId INT(10) UNSIGNED NOT NULL AFTER updateDate;

# 게시판(board) 테스트 데이터 생성
INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'FREE',
`name` = '자유 게시판';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'MISSING',
`name` = '공지사항';


# 게시글 테스트 데이터 생성
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목1',
`body` = '내용1';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목2',
`body` = '내용2';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목3',
`body` = '내용3';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목4',
`body` = '내용4';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목5',
`body` = '내용5';

# 댓글 테스트 데이터 생성
INSERT INTO `comment`
SET regDate = NOW(),
updateDate = NOW(),
`body` = '내용1',
relTypeCode = 'article';

INSERT INTO `comment`
SET regDate = NOW(),
updateDate = NOW(),
`body` = '내용2',
relTypeCode = 'article';

INSERT INTO `comment`
SET regDate = NOW(),
updateDate = NOW(),
`body` = '내용3',
relTypeCode = 'article';

INSERT INTO `comment`
SET regDate = NOW(),
updateDate = NOW(),
`body` = '내용4',
relTypeCode = 'article';

INSERT INTO `comment`
SET regDate = NOW(),
updateDate = NOW(),
`body` = '내용5',
relTypeCode = 'article';

# 회원 테스트 데이터 생성
# 관리자
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'admin',
loginPw = SHA2('admin',256),
`authLevel` = 7,
`name` = '관리자',
nickname = '관리자_닉네임',
cellphoneNum = '01012341234',
email = 'abc@gmail.com',
gender = '여자',
team = '한화 이글스';

# 회원
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test1',
loginPw = SHA2('test1',256),
`name` = '회원1_이름',
nickname = '회원1_닉네임',
cellphoneNum = '01043214321',
email = 'abcd@gmail.com',
gender = '남자',
team = 'LG 트윈스';

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test2',
loginPw = SHA2('test2',256),
`name` = '회원2_이름',
nickname = '회원2_닉네임',
cellphoneNum = '01056785678',
email = 'abcde@gmail.com',
gender = '여자',
team = '삼성 라이온즈';



UPDATE article 
SET memberId = 2
WHERE id IN (1,2);

UPDATE article 
SET memberId = 3
WHERE id IN (3,4,5);

UPDATE `comment` 
SET memberId = 2
WHERE id IN (1,2);

UPDATE `comment`
SET memberId = 3
WHERE id IN (3,4,5);

# boardId 추가
ALTER TABLE article ADD COLUMN boardId INT(10) NOT NULL AFTER `memberId`;
ALTER TABLE `comment` ADD COLUMN articleId INT(10) NOT NULL AFTER `memberId`;


UPDATE article 
SET boardId = 1
WHERE id IN (1,2);

UPDATE article 
SET boardId = 2
WHERE id IN (3,4);

UPDATE article 
SET boardId = 3
WHERE id = 5;

UPDATE `comment` 
SET articleId = 1
WHERE id IN (1,2);

UPDATE `comment` 
SET articleId = 2
WHERE id IN (3,4);

UPDATE `comment` 
SET articleId = 3
WHERE id = 5;

# 조회수 추가
ALTER TABLE article ADD COLUMN `view` INT(100) NOT NULL AFTER `body`;

UPDATE article 
SET `view` = 0;


# reactionPoint 테이블 생성

CREATE TABLE reactionPoint (
	id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	regDate DATETIME NOT NULL,
	updateDate DATETIME NOT NULL,
	memberId INT(10) UNSIGNED NOT NULL,
	relTypeCode CHAR(50) NOT NULL COMMENT '관련 데이터 타입 코드',
	relId INT(10) NOT NULL COMMENT '관련 데이터 번호',
	`point` INT(10) NOT NULL
);

# reactionPoint 테스트 데이터 생성
# 1번 회원이 1번 글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'article',
relId = 1,
`point` = -1;

# 1번 회원이 2번 글에 좋아요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'article',
relId = 2,
`point` = 1;

# 2번 회원이 1번 글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 1,
`point` = -1;

# 2번 회원이 2번 글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 2,
`point` = -1;

# 3번 회원이 1번 글에 좋아요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 3,
relTypeCode = 'article',
relId = 1,
`point` = 1;

ALTER TABLE article ADD COLUMN goodReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE article ADD COLUMN badReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;

UPDATE article AS A
INNER JOIN (
	SELECT RP.relTypeCode, RP.relId,
	SUM(IF(RP.point > 0, RP.point, 0)) AS goodReactionPoint,
	SUM(IF(RP.point < 0, RP.point * -1, 0)) AS badReactionPoint
	FROM reactionPoint AS RP
	GROUP BY RP.relTypeCode, RP.relId
) AS RP_SUM
ON A.id = RP_SUM.relId
SET A.goodReactionPoint = RP_SUM.goodReactionPoint,
A.badReactionPoint = RP_SUM.badReactionPoint;


ALTER TABLE `comment` ADD COLUMN goodReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `comment` ADD COLUMN badReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;

UPDATE `comment` AS C
INNER JOIN (
	SELECT RP.relTypeCode, RP.relId,
	SUM(IF(RP.point > 0, RP.point, 0)) AS goodReactionPoint,
	SUM(IF(RP.point < 0, RP.point * -1, 0)) AS badReactionPoint
	FROM reactionPoint AS RP
	GROUP BY RP.relTypeCode, RP.relId
) AS RP_SUM
ON C.id = RP_SUM.relId
SET C.goodReactionPoint = RP_SUM.goodReactionPoint,
C.badReactionPoint = RP_SUM.badReactionPoint
WHERE RP.relTypeCode = 'comment';

######################################################################

SELECT *
FROM article
ORDER BY id DESC;

SELECT *
FROM `member`;

SELECT *
FROM `comment`
ORDER BY id DESC;

SELECT *
FROM board;

SELECT *
FROM reactionPoint;

SELECT *
FROM `survey`;

SELECT *
FROM `chat_room`;

SELECT *
FROM `chat_message`;

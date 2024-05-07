/* ddl (data definition language) */ 

/* create */
CREATE TABLE IF NOT EXISTS tb1(
	pk int primary key ,
	fk int ,
	col1 varchar(255) ,
	check(col1 IN('y', 'n'))
) ENGINE = INNODB ;

DESCRIBE tb1 ;

INSERT INTO tb1 VALUES(2, 10, 'N');

SELECT * FROM tb1 ;

-- ALTER 
-- 테이블에 추가/변경/수정/삭제하는 모든 것을 alter 명령어를 사용해 적용한다.
-- 종류가 너무 많고 복잡하기 때문에 대표적인 것만 사용해볼 것이다.

ALTER TABLE tb1
-- coumn을 추가하는 경우
ADD col2 int NOT NULL ;
-- not null 제약조건으로 인해 null을 포함할 수 없다.
-- INSERT INTO tb1 VALUES(2, 10, 'N', null);
DESCRIBE tb1 ;

-- column을 삭제하는 경우
ALTER TABLE tb1
DROP column col2 ;
DESCRIBE tb1 ;

-- 열 이름 및 데이터 형식 변경
ALTER TABLE tb1
CHANGE COLUMN fk change_fk int NOT NULL ;

DESCRIBE tb1 ;

-- 테이블 생성
CREATE TABLE IF NOT EXISTS tb2(
	pk int primary key auto_increment,
	fk int ,
	col1 varchar(255) ,
	check(col1 IN('y', 'n'))
) ENGINE = INNODB ;

DESCRIBE tb2 ;

-- auto_increment가 걸려 있는 컬럼은 primary key 제거가 안되므로 auto_increment를 modify 명령어로 제거한다.
-- modify는 컬럼의 정의를 바꾸는 것이다.
ALTER TABLE tb2
MODIFY pk int ;

DESCRIBE tb2 ;

-- 테이블의 primary key는 하나만 가질 수 있어 별도의 컬럼을 지정하지 않아도 primary삭제가 가능하다.
ALTER TABLE tb2
DROP PRIMARY KEY;

DESCRIBE tb2 ;

CREATE TABLE IF NOT EXISTS tb5( -- 3, 4, 5 변경해서 테이블 만들
	pk int primary key auto_increment,
	fk int ,
	col1 varchar(255) ,
	check(col1 IN('y', 'n'))
) ENGINE = INNODB ;

DROP TABLE IF EXISTS tb3, tb4, tb5;

SHOW tables;

-- truncate 확인을 위한 테이블 생성
CREATE TABLE IF NOT EXISTS tb3(
	pk int primary key auto_increment,
	fk int ,
	col1 varchar(255) ,
	check(col1 IN('y', 'n'))
) ENGINE = INNODB ;

-- 데이터 insert
INSERT INTO tb3 VALUES(null, 10, 'N');
INSERT INTO tb3 VALUES(null, 10, 'N');
INSERT INTO tb3 VALUES(null, 10, 'N');
INSERT INTO tb3 VALUES(null, 10, 'N');

SELECT * FROM tb3 ;
DELETE FROM tb3 ;

-- truncate
truncate tb3 ;

-- delete의 차이
-- auto_increment의 남겨진 정보를 전부 날려 버린다(공장 초기화)


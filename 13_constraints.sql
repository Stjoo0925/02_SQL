/* CONSTRAINTS */
-- 수업 목표 : 제약 조건을 이해한다.

-- 제약조건
-- 테이블 작성 시 각 컬럼에 값 기록에 대한 제약조건을 설정할 수 있다.
-- 입력/수정 하는데이터에 문제가 없는 지 자동으로 검사해 주게 하기 위한 목적
-- primary key, not null, unique, check, foreign key

/* not null */
DROP TABLE IF EXISTS user_notnull;
CREATE TABLE IF NOT EXISTS user_notnull (
	user_no1 int NOT NULL ,
	user_id varchar(255) NOT NULL ,
	user_pwd varchar(255) NOT NULL , 
	user_name varchar(255) NOT NULL ,
	gender varchar(3) ,
	phone varchar(255) NOT NULL ,
	email varchar(255)
) ENGINE = innodb ;

INSERT INTO user_notnull (
	user_no1, user_id, user_pwd, user_name, gender, phone, email
) VALUES
(1, 'user', 'pass', '홍길동', '남', '010-2323-2323', 'hong123@gmail.com') ,
(2, 'user01', 'pass', '유관순', '여', '010-7777-7777', 'you123@gmail.com') ;

SELECT * FROM user_notnull ;

-- not null 제약 조건에 의해 에러가 발생
-- INSERT INTO user_notnull (
-- 	user_no1, user_id, user_pwd, user_name, gender,email
-- ) VALUES
-- (3, 'user03', 'pass03', '홍길동', '남','hong123@gmail.com') ;


/* unique */
-- 중복값을  허용하지 않는다.
CREATE TABLE IF NOT EXISTS user_unique (
	user_no int NOT NULL UNIQUE ,
	user_id varchar(255) NOT NULL ,
	user_pwd varchar(255) NOT NULL , 
	user_name varchar(255) NOT NULL ,
	gender varchar(3) ,
	phone varchar(255) NOT NULL ,
	email varchar(255)
) ENGINE = innodb ;

INSERT INTO user_unique (
	user_no, user_id, user_pwd, user_name, gender, phone, email
) VALUES
(1, 'user', 'pass', '홍길동', '남', '010-2323-2323', 'hong123@gmail.com') ,
(2, 'user01', 'pass', '유관순', '여', '010-7777-7777', 'you123@gmail.com') ;

-- INSERT INTO user_unique (
-- 	user_no, user_id, user_pwd, user_name, gender, phone, email
-- ) VALUES
-- (1, 'user', 'pass', '홍길동', '남', '010-2323-2323', 'hong123@gmail.com') ;

SELECT * FROM user_unique ;

-- primary key 
/* 테이블에서 한 행의 정보를 찾기 위해서 사용할 컬럼을 의미한다.
 * 테이블에 대한 식별자 역할을 한다(한 행씩 구분하는 역할을 한다.)
 * not null + unique 제약조건의 의미
 * 한 테이블 한 개만 설정할 수 있음
 * 컬럼 레벨, 테이블 레벨 둘 다 설정 가능함
 * 한 개 컬럼에 설정할 수도 있고, 여러 개의 컬럼을 묶어서 설정할 수도 있다(복합키)
 */

DROP TABLE If EXISTS user_primaykey;
CREATE TABLE IF NOT EXISTS user_primaykey (
	user_no int PRIMARY KEY ,
	user_id varchar(255) NOT NULL ,
	user_pwd varchar(255) NOT NULL , 
	user_name varchar(255) NOT NULL ,
	gender varchar(3) ,
	phone varchar(255) NOT NULL ,
	email varchar(255)
) ENGINE = innodb ;

INSERT INTO user_primaykey (
	user_no, user_id, user_pwd, user_name, gender, phone, email
) VALUES
(1, 'user', 'pass', '홍길동', '남', '010-2323-2323', 'hong123@gmail.com') ,
(2, 'user01', 'pass', '유관순', '여', '010-7777-7777', 'you123@gmail.com') ;

-- primary key는 not null 과 unique 제약조건을 갖는다.
-- INSERT INTO user_primaykey (
-- 	user_id, user_pwd, user_name, gender, phone, email
-- ) VALUES
-- ('user', 'pass', '홍길동', '남', '010-2323-2323', 'hong123@gmail.com') ;

SELECT * FROM user_primaykey ;

/* foreign key */
-- 참조(references)된 다른 테이블에서 제공하는 값만 사용할 수 있음
-- 참조 무성을 위배하지 않기 위해 사용
-- FORIEGN KEY제약조건에 의해서
-- 테이블 간의 관계가 형성됨
-- 제공되는 값 이외에는 null을 사용할 수 있음
DROP TABLE IF EXISTS user_grade ;

CREATE TABLE IF NOT EXISTS user_grade(
	grade_code int primary key ,
	grade_name varchar(255) not null
) ENGINE =innodb ;

INSERT INTO user_grade
VALUES
(10, '보통강사') ,
(20, '만족강사') ,
(30, '매우만족강사') ;

SELECT * FROM user_grade ;

DROP TABLE IF EXISTS instructor_foreingkey ;

CREATE TABLE IF NOT EXISTS instructor_foreingkey(
	user_no int primary key ,
	user_name varchar(255) not null ,
	gender varchar(3) ,
	phone varchar(255) ,
	grade_code int ,
	foreign key(grade_code)
	REFERENCES user_grade(grade_code)
) ENGINE = innodb ;
	
SELECT * FROM instructor_foreingkey ;

INSERT INTO instructor_foreingkey
VALUES (1, '왕강사', '남', '010-2322-2323', 10) ;

SELECT 
	b.grade_name ,
	a.user_name 
  FROM instructor_foreingkey a
  JOIN user_grade b ON a.grade_code = b.grade_code ;
 
 
	

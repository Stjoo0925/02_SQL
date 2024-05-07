/* DML(data manipulatoin language) = 트렌젝션 */

-- INSERT UPDATE, DELETE, SELECT(DQL)
-- : 데이터 조작 언어, 테이블에 값을 삽입하거나, 수정하거나
-- 삭제하거나, 조회하는 언어

-- INSERT
-- 새로운 행을 추가하는 구문이다.
-- 테이블 행의 수가 증가한다.
INSERT INTO TBL_MENU VALUES(NULL, '바나나해장국', 8500, 4, 'Y');

INSERT INTO TBL_MENU
	(
		MENU_NAME , MENU_PRICE , CATEGORY_CODE , ORDERABLE_STATUS 
	) VALUES (
		'초콜릿죽', 6000, 7, 'Y'
	);

INSERT INTO TBL_MENU
	(
		MENU_NAME , ORDERABLE_STATUS , CATEGORY_CODE , MENU_PRICE
	) VALUES (
		'뺵사이즈 아메리카노' , 'Y', 7, 3000
	);

SELECT  * FROM TBL_MENU ;


-- multi inset
INSERT INTO TBL_MENU VALUES(NULL, '해장국', 8500, 4, 'Y'), 
							(NULL, '뼈다귀 해장국', 8500, 4, 'Y'), 
							(NULL, '왕뚝배기 해장국', 8500, 4, 'Y') ;

SELECT  * FROM TBL_MENU ;


-- update
-- 테이블에 기록된 컬럼의 값을 수정하는 구문이다.
-- 테이블의 전체 행 갯수는 변화가 없다.
SELECT
	menu_code ,
	category_code
  FROM TBL_MENU
WHERE MENU_NAME ="바나나 해장국" ;

UPDATE TBL_MENU 
	SET menu_name = "바나나 탕후루"
WHERE menu_code = 22 ;

-- 가상의 view를 형성해서 조회
-- mysql은 oracle과 달리 update나 delete시 자기 자신 테이블의 데이터를 사용하면 1093 에러가 발생한다.
UPDATE TBL_MENU 
	SET CATEGORY_CODE  = 6
WHERE menu_code = (SELECT 
					 tmp.MENU_CODE 
				   FROM (
				   		SELECT
				   			MENU_CODE
				   		  FROM TBL_MENU 
				  	    WHERE menu_name ="바나나 탕후루"
				  	    ) AS tmp
);

SELECT * FROM TBL_MENU ;

-- delete

DELETE FROM tbl_menu
 ORDER BY menu_price DESC
 LIMIT 2 ;

SELECT * FROM TBL_MENU ORDER BY MENU_PRICE DESC ;

DELETE FROM tbl_menu 
 WHERE menu_price = 8500 ;

-- replace
-- insert시 primary key 또는 unique key가 충돌이 발생할 수 있다면
-- replace를 통해 중복된 데이터를 덮어 쓸 수 있다.
REPLACE INTO tbl_menu VALUES (12, '참기름라떼', 5000, 10, 'Y') ;
-- INSERT INTO tbl_menu VALUES (12, '참기름라떼', 5000, 10, 'Y') ;

SELECT * FROM tbl_menu ;


	
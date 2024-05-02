SELECT
	menu_code ,
	menu_name ,
	menu_price
  FROM tbl_menu

-- ORDER BY menu_price ASC;  -- ASC : 오름 차순 정렬 , DESC : 내림차순 정렬
  
-- ORDER BY menu_price DESC;  

SELECT 
	menu_code ,
	menu_name ,
	menu_price
  FROM tbl_menu
ORDER BY 
	menu_price DESC ,
	menu_name ASC;
	
-- 메뉴의 코드, 이름, 메뉴 코드 곱하기 가격 화면에 코드를 기준으로 정렬한다.
-- 정렬의 기준은 코드의 오름차순으로 정렬해주세요.
SELECT 
	menu_code ,
	menu_name ,
	menu_code * menu_price
  FROM tbl_menu
ORDER BY menu_code ASC;

--
SELECT 
	FIELD('C', 'A', "B", "C");
	
SELECT 
	FIELD(orderable_status, 'N', 'Y') 
  FROM tbl_menu;


SELECT 
	category_code ,
	category_name ,
	ref_category_code
  FROM tbl_category
ORDER BY ref_category_code is null desc;
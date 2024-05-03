-- distinct

-- 단일 열 distinct
-- 아래의 데이터를 조회시 중복되는 category_code가 출력된다.

SELECT 
	category_code
  FROM tbl_menu
ORDER BY category_code;

-- distinct를 이용하면 중복값을 제거하고 력할 수 있게 된다.
SELECT 
    DISTINCT category_code
  FROM tbl_menu;
  
 SELECT 
 	ref_category_code
   FROM tbl_category;
   
SELECT 
	DISTINCT ref_category_code
  FROM tbl_category;
 
SELECT 
	category_code ,
	orderable_status
  FROM tbl_menu;
 
SELECT DISTINCT 
	menu_name ,
	category_code ,
	orderable_status
  FROM tbl_menu;
 
SELECT DISTINCT 
	orderable_status ,
	category_code
  FROM tbl_menu;
 

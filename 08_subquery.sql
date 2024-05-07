SELECT
	category_code
  FROM tbl_menu
WHERE menu_name = '우럭스무디';
	
SELECT
	menu_code ,
	menu_name ,
	category_code ,
	orderable_status
	  FROM tbl_menu
	  WHERE category_code IN (SELECT
	  							CATEGORY_CODE
	  						   FROM tbl_menu);
	  						WHERE menu_name = "우럭스무디");
	  					

-- from 절에 쓰인 서브쿼리
SELECT 
	max(COUNT)
  FROM (
  	SELECT
  		count(*) AS 'count'
  	  FROM TBL_MENU
  	  GROUP BY category_code
) AS countmenu;

-- 카테고리별 평균 가격보다 높은 가격의 메뉴 조회
SELECT
	menu_code ,
	menu_name ,
	menu_price ,
	category_code ,
	orderable_status
  FROM TBL_MENU a
WHERE menu_price > (SELECT
						avg (MENU_PRICE)
					  FROM TBL_MENU
					WHERE CATEGORY_CODE = a.CATEGORY_CODE );
/* EXISTS */
-- 조회 결과가 있을 떄 true 아니면 false
				
SELECT 
	category_name
  FROM TBL_CATEGORY a
  WHERE EXISTS (
  		  SELECT 
  		  	1
  		   FROM TBL_MENU b
  		  WHERE b.category_code = a.CATEGORY_CODE 
  		    );
  		    


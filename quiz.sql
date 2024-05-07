-- 1. tbl_menu 테이블과 tbl_category 테이블을 join하여 카테고리 명(category_name)과 메뉴 명(menu_name), 메뉴 가격(menu_price)을 조회하고, 메뉴 가격으로 오름차순 정렬하여 조회하세요.

SELECT 
	a.menu_name ,
	a.menu_price ,
	b.category_name
  FROM tbl_menu a
JOIN tbl_category b ON a.category_code = b.category_code
ORDER BY menu_price ASC;

-- 2. tbl_menu테이블을 이용하여 주문 금액(menu_price)가 5000원 이상이고 메뉴 카테고리(category_name)가 음료인 메뉴들의 총 주문 금액(SUM_PRICE)을 조회해 보세요.

SELECT 
	SUM(a.menu_price) AS SUM_PRICE
FROM tbl_menu a
JOIN tbl_category b ON a.category_code = b.category_code
WHERE a.menu_price >= 5000 AND b.category_name = '음료'
GROUP BY b.category_code;


-- 3. tbl_menu테이블을 이용하여 주문 금액(menu_price)가 5000원 이상이고 주문 가능(orderable_status)한 메뉴들의 총 주문 금액의 평균(AVG_PRICE)를 조회해 보세요.

SELECT 
	category_code, 
	AVG(menu_price) AS AVG_PRICE
FROM tbl_menu 
WHERE menu_price >= 5000 AND orderable_status = 'Y'
GROUP BY category_code;

-- 출제자 : 주순태

-- 4. 동양 음식과 서양 음식 중 평균가가 높은 쪽으로 메뉴명을 가격별로 내림차순으로 정렬.

SELECT
	IF(AVG(CASE WHEN b.category_name = '동양' THEN a.menu_price END) < AVG(CASE WHEN b.category_name = '서양' THEN a.menu_price END), AVG(CASE WHEN b.category_name = '서양' THEN a.menu_price END), AVG(CASE WHEN b.category_name = '동양' THEN a.menu_price END)) AS avg_price
  FROM tbl_menu a
  JOIN tbl_category b ON a.menu_code = b.category_code

-- 5. 테이블 메뉴에 테이블 카테고리를 조인했을 경우 널의 총 곗수를 구하고 두 테이블중의 널이 많은 애를 컬럼명으로 갯수를 출력한다.

  
-- 출제자 : 홍서우
  
SELECT * FROM tbl_category;
  
 SELECT * FROM tbl_menu ORDER BY category_code ASC;
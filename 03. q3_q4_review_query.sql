
CREATE TABLE q3_q4_review ( 
purchase_date DATE,
item_name VARCHAR,
category VARCHAR,
quantity int,
promo_name VARCHAR,
total_price bigint,
price_after_promo bigint,
promo_code text)


WITH 
	rekap_data as (
			SELECT st.purchase_date,
				mt.item_name,
				mt.category,
				st.quantity,
				COALESCE (pc.promo_name, 'TIDAK ADA PROMO') AS promo_name,
				(st.quantity * mt.price) AS total_price,
				COALESCE(((st.quantity * mt.price) - pc.price_deduction), 0) AS price_after_promo

			FROM sales_table AS st
			LEFT JOIN marketplace_table AS mt ON st.item_id = mt.item_id
			LEFT JOIN promo_code AS pc ON st.promo_id = pc.promo_id
			WHERE st.purchase_date >= '2022-07-01'
				AND st.purchase_date <= '2022-12-31'
			ORDER BY purchase_date 
	)
	
INSERT INTO q3_q4_review
	
SELECT rekap_data.*,
	case
		when promo_name = 'TIDAK ADA PROMO' THEN 'TIDAK ADA PROMO' ELSE 'PROMO'
	END AS promo_code
FROM rekap_data


SELECT *
FROM q3_q4_review

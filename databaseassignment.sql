
/*question one */
select 
pod.order_id,
	pod.customer_id,
	pod.order_status,
	-- Order status: 1 = Pending; 2 = Processing; 3 = Rejected; 4 = Completed
	pod.order_date ,
	pod.required_date,
	pod.shipped_date ,
	pod.store_id ,
	pod.staff_id,
	poh.customer_id,
	poh.first_name,
	poh.last_name,
	pof.staff_id,
	pof.first_name,
	pof.last_name
	From sales.orders pod
	INNER JOIN
 sales.customers poh
 ON pod.customer_id = poh.customer_id
 INNER JOIN 
 sales.staffs pof
 ON pod.staff_id = pof.staff_id



 /*question 2 */

 CREATE OR ALTER VIEW sales.daily_sales_product
 AS
 SELECT
    
	p.product_id,
	product_name,
	quantity,
	quantity * i.list_price AS sales
	FROM 
	   sales.orders AS o
    INNER JOIN sales.order_items AS i
	   ON o.order_id = i.order_id
    INNER JOIN production.products as p
	 ON p.product_id = i.product_id

	 select * from sales.daily_sales_product




	 /*question 3 */


	 CREATE PROCEDURE sales.total_number_sales     
(@cust_id INT)
AS
BEGIN
    SELECT @cust_id AS customer_id, COUNT(*) AS orders_made
    FROM sales.orders
    WHERE customer_id = @cust_id
    GROUP BY customer_id
    
END;

EXEC sales.total_number_sales @cust_id = 2;



/*question 4 */
 SELECT TOP 5
 customer_id,
 count(*) AS orders_made
FROM   sales.orders
GROUP  BY customer_id
ORDER  BY customer_id 

/*question 5 */

CREATE OR ALTER VIEW sales.daily_sales
 AS
 SELECT
    year(order_date) AS y,
	month(order_date) AS m,
	day(order_date) AS  d,
	p.product_id,
	product_name,
	quantity,
	quantity * i.list_price AS sales
	FROM 
	   sales.orders AS o
    INNER JOIN sales.order_items AS i
	   ON o.order_id = i.order_id
    INNER JOIN production.products as p
	 ON p.product_id = i.product_id

	 select * from sales.daily_sales














 
  






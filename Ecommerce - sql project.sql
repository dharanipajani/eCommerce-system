create database ecommerce;
use ecommerce;

select * from customers;

-- task1
update customers
SET loyalty_points = 10
where age < 25 AND loyalty_points IS not NULL;
update customers
set loyalty_points = 20
where age between 25 and 40 And loyalty_points is not null;
update customers 
set loyalty_points =5
where age>40 and loyalty_points is not null;
select * from customers;

-- task2
select sum(order_value) from orders;
select country from customers;

select c.country,
  sum(o.order_value) as total_order_value,
  case 
    when sum(o.order_value) > 100000 then 'High'
    when sum(o.order_value) between  50000 and 100000 then 'Medium'
    else 'Low'
  end as sales_category
from customers c join orders o on c.customer_id = o.customer_id
group by c.country;

-- task3
SELECT 
  sum(case when payment_method = 'credit card' then quantity end) as Credit_Card_Qty,
  sum(case when payment_method = 'paypal' then quantity end) as PayPal_Qty,
  sum(case when payment_method = 'cash' then quantity end) as Cash_Qty
from orders;

-- task4

select c.customer_id, c.customer_name, customer_totals.total_order_value
from (
    select o.customer_id, sum(o.order_value) as total_order_value
    from orders o group by o.customer_id) as customer_totals
join customers c on c.customer_id = customer_totals.customer_id
order by  customer_totals.total_order_value desc limit 3;

-- task5
select * from products;
SELECT p.product_name,p.product_id, SUM(o.quantity) AS total_quantity
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(o.quantity) > (
    SELECT AVG(total_qty)
    FROM (
        SELECT SUM(quantity) AS total_qty
        FROM orders
        GROUP BY product_id
    ) AS avg_quantities
);

-- task6

DELIMITER //
CREATE PROCEDURE GetCustomerOrders(IN cid INT)
BEGIN
  SELECT * FROM orders WHERE customer_id = cid;
END //
DELIMITER ;

CALL GetCustomerOrders(101);

-- task7
DELIMITER //
CREATE PROCEDURE GetCustomerSpending(IN cid INT, INOUT total_spent DECIMAL(10,2))
BEGIN
  SELECT SUM(order_value) INTO total_spent
  FROM orders
  WHERE customer_id = cid;
END //
DELIMITER ;

SET @spending = 0;
CALL GetCustomerSpending(101, @spending);
SELECT @spending;

-- task8

DELIMITER //
CREATE TRIGGER set_default_loyalty_points
BEFORE INSERT ON customers
FOR EACH ROW
BEGIN
  IF NEW.loyalty_points IS NULL THEN
    SET NEW.loyalty_points = 0;
  END IF;
END //
DELIMITER ;
insert into customers values(1,'Norma Fisher','jessicacollins@harding.biz','Female',69,	'Bahamas','South Marioview','16-05-2021','15-11-2024',4001),
              (2,'Jorge Sullivan','archerchristopher@hotmail.com','Female',69,	'Myanmar','North Rogerfort','05-09-2021',	'04-10-2024',null);

select * from customers where loyalty_points = 0;
show triggers;

-- task9



DELIMITER //
CREATE TRIGGER deduct_after_order
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
  UPDATE products
  SET stock_quantity = stock_quantity - NEW.quantity
  WHERE product_id = NEW.product_id;
END //
delimiter ;

INSERT INTO products (product_id,product_name,category,brand,unit_price,stock_quantity,warehouse_id)VALUES (501,'Wireless Mouse','Electronics',         
  'Logitech',299.99,150,1);


SELECT product_name, stock_quantity
FROM products
WHERE product_id = 501;





















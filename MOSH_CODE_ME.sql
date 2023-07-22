-- USE sql_store;
-- SELECT * FROM sql_store.customers;
-- SELECT * FROM CUSTOMERS WHERE ID =1 ORDER BY FIRST_NAME;
-- SELECT * FROM CUSTOMERS ORDER BY LAST_NAME;
	
                              --   AS
-- SELECT name , unit_price , unit_price*1.1 AS "Unit_price_new" FROM products ;

                                 -- OPERATORS
-- SELECT * FROM CUSTOMERS WHERE POINTS>1000;
-- SELECT * FROM CUSTOMERS WHERE STATE = 'VA';
-- SELECT * FROM CUSTOMERS WHERE STATE <> 'VA';
-- SELECT * FROM CUSTOMERS WHERE BIRTH_DATE > '1990-01-01';
-- SELECT * FROM ORDERS WHERE ORDER_DATE >= '201/-01-01' AND ORDER_DATE <= '2019-01-01';
-- SELECT * FROM CUSTOMERS WHERE BIRTH_DATE >= "2019-01-01" OR POINTS >1000;
-- SELECT * FROM CUSTOMERS WHERE (customer_id > 0 OR points > 0) AND CITY = 'VA';quantity
-- SELECT * FROM CUSTOMERS WHERE (customer_id > 0 AND points > 2000) OR CITY = 'VA';
-- SELECT * FROM CUSTOMERS WHERE NOT(customer_id > 0 AND points > 2000) OR CITY = 'VA';
-- SELECT * FROM ORDER_ITEMS;
-- SELECT * FROM ORDER_ITEMS WHERE ORDER_ID = 6 AND UNIT_PRICE * QUANTITY >30;

                               --   IN CLAUSE
-- SELECT * FROM PRODUCTS;
-- SELECT * FROM PRODUCTS WHERE QUANTITY_IN_STOCK = 49 OR QUANTITY_IN_STOCK =38 OR QUANTITY_IN_STOCK =70; 
-- SELECT * FROM PRODUCTS WHERE QUANTITY_IN_STOCK IN (49 , 38 , 70)ORDER BY UNIT_PRICE ;
-- SELECT * FROM PRODUCTS WHERE QUANTITY_IN_STOCK IN (49 , 38 , 70) AND UNIT_PRICE*10>93 ORDER BY UNIT_PRICE ;

                                   --  BETWEEN CLAUSE
-- SELECT * FROM CUSTOMERS;
-- -- SELECT * FROM CUSTOMERS WHERE BIRTH_DATE BETWEEN "1990-01-01" AND "2000-01-01";

									-- LIKE CLAUSE
--  SELECT * FROM CUSTOMERS WHERE ADDRESS LIKE '%TRAIL%' OR
-- 								ADDRESS LIKE '%AVENUE%' OR 
--                                 PHONE LIKE '%9';
                              
-- SELECT * FROM CUSTOMERS WHERE ADDRESS LIKE '%TRAIL%' OR '%AVENUE%';
-- SELECT * FROM CUSTOMERS WHERE CITY LIKE 'C%';
-- SELECT * FROM CUSTOMERS WHERE CITY LIKE '%G%';
-- SELECT * FROM CUSTOMERS WHERE CITY LIKE '%O';
-- SELECT * FROM CUSTOMERS WHERE CITY LIKE 'O_____O';
-- SELECT * FROM CUSTOMERS WHERE CITY LIKE 'C______';
-- SELECT * FROM CUSTOMERS WHERE CITY LIKE '______O';
                               --   REGEXP CLAUSE
-- USE SQL_STORE;
-- SELECT * FROM CUSTOMERS WHERE LAST_NAME REGEXP 'EY$|ON$';
-- SELECT * FROM CUSTOMERS WHERE  LAST_NAME REGEXP 'SE|^MY';
-- SELECT * FROM CUSTOMERS WHERE LAST_NAME REGEXP 'B[RU]';
							 -- LAST_NAME REGEXP 'EY$|ON$' OR
                             
                             -- ORDER BY CLAUSE
-- SELECT * FROM ORDERS;
-- SELECT * FROM ORDERS WHERE SHIPPER_ID IS NULL;
-- SELECT FIRST_NAME , LAST_NAME , 10 AS POINTS FROM CUSTOMERS  ORDER BY POINTS;
-- SELECT FIRST_NAME , STATE , 10 AS POINTS FROM CUSTOMERS  ORDER BY 1 DESC,2;

-- SELECT FIRST_NAME , STATE , 10 AS POINTS FROM CUSTOMERS  ORDER BY 1,2;
-- SELECT * FROM ORDER_ITEMS WHERE ORDER_ID = 2 ORDER BY QUANTITY * UNIT_PRICE>18 DESC;
-- SELECT * , QUANTITY*UNIT_PRICE AS TOTAL FROM ORDER_ITEMS WHERE ORDER_ID =2 ORDER BY TOTAL;
-- SELECT * , QUANTITY*UNIT_PRICE AS TOTAL FROM ORDER_ITEMS WHERE ORDER_ID =2 ORDER BY TOTAL DESC;

                                 -- limit clause
-- SELECT * FROM CUSTOMERS LIMIT 4;
-- SELECT * FROM CUSTOMERS WHERE POINTS > 1000 ORDER BY CUSTOMER_ID DESC LIMIT 2,3;
                          
                                 -- join
-- SELECT NAME , O.ORDER_ID , ORDER_ID , O.UNIT_PRICE FROM ORDER_ITEMS O JOIN PRODUCTS P ON O.PRODUCT_ID = P.PRODUCT_ID;

-- SELECT ORDER_ID ,FIRST_NAME FROM ORDERS JOIN CUSTOMERS ON ORDERS.CUSTOMER_ID = CUSTOMERS.CUSTOMER_ID WHERE CUSTOMERS.CUSTOMER_ID =6 ;-

									-- ACROSS DTATBASES
-- SELECT * FROM ORDER_ITEMS C JOIN SQL_INVENTORY.PRODUCTS P ON C.PRODUCT_ID = P.PRODUCT_ID;
-- USE SQL_INVENTORY;
-- SELECT * FROM sql_store.ORDER_ITEMS C JOIN PRODUCTS P ON C.PRODUCT_ID = P.PRODUCT_ID;      EXACTLY SAME
-- USE SQL_HR;
-- SELECT M.FIRST_NAME , E.FIRST_NAME FROM EMPLOYEES E JOIN EMPLOYEES M ON E.REPORTS_TO = M.EMPLOYEE_ID;

										-- MULTIPLE JOIN
-- USE SQL_INVOICING;
-- SELECT C.NAME , I.CLIENT_ID , I.INVOICE_ID, PM.NAME AS METHOD_NAME FROM CLIENTS C 
--                         JOIN INVOICES I ON C.CLIENT_ID = I.CLIENT_ID
--                         JOIN PAYMENTS P ON C.CLIENT_ID = P.CLIENT_ID 
--                         JOIN PAYMENT_METHODS PM ON P.PAYMENT_METHOD = PM.PAYMENT_METHOD_ID; 

-- SELECT P.DATE , P.INVOICE_ID , C.NAME , PM.NAME , P.AMOUNT FROM PAYMENTS P
--                       JOIN CLIENTS C ON P.CLIENT_ID = C.CLIENT_ID
--                       JOIN PAYMENT_METHODS PM ON P.PAYMENT_METHOD = PM.PAYMENT_METHOD_ID;
-- 				-- COMPOUND JOIN CONDITIONS
-- USE SQL_STORE;
-- SELECT * FROM ORDER_ITEMS OI
-- 						JOIN ORDER_ITEM_NOTES OIM 
--                         ON OI.ORDER_ID = OIM.ORDER_ID
--                         AND OI.PRODUCT_ID = OIM.PRODUCT_ID;
--                                    -- OUTER JOIN
-- USE SQL_STORE;
-- SELECT * FROM PRODUCTS P LEFT JOIN ORDER_ITEMS O ON P.PRODUCT_ID = O.PRODUCT_ID;

-- SELECT O.ORDER_DATE , O.ORDER_ID , C.FIRST_NAME ,S.NAME ,OS.NAME FROM ORDERS O JOIN CUSTOMERS C ON C.CUSTOMER_ID = O.CUSTOMER_ID
-- 																LEFT JOIN SHIPPERS S ON O.SHIPPER_ID = S.SHIPPER_ID 
--                                                                 JOIN ORDER_STATUSES OS ON O.STATUS = OS.ORDER_STATUS_ID 

														-- SELF OUTER JOIN
-- USE SQL_HR;
-- SELECT E.EMPLOYEE_ID,E.FIRST_NAME,E.REPORTS_TO ,M.FIRST_NAME  FROM EMPLOYEES E LEFT JOIN EMPLOYEES M ON M.EMPLOYEE_ID = E.REPORTS_TO; 
-- USE SQL_INVOICING;
-- SELECT P.DATE , C.NAME , P.AMOUNT , PM.NAME FROM CLIENTS C JOIN PAYMENTS P USING (CLIENT_ID)
-- 												JOIN PAYMENT_METHODS PM ON P.PAYMENT_METHOD = PM.PAYMENT_METHOD_ID ;
-- USE SQL_STORE;
-- SELECT * FROM ORDERS NATURAL JOIN CUSTOMERS; -- DEFAULTLLY CHECK FOR COMMON COLUMN NAME AND JOIN BOTH OF THEM WITHOUT ANY CONDITIONS
-- 							-- EXPLICIT SYNTAX CROSS JOIN
-- USE SQL_STORE;
--  SELECT P.NAME AS PRODUCT_NAME , S.NAME AS SHIP FROM PRODUCTS P CROSS JOIN SHIPPERS S ;
--  SELECT P.NAME , S.NAME FROM SHIPPERS S CROSS JOIN PRODUCTS P;
--                             -- IMPLICIT SYNTAX CRSOO JOIN 
-- SELECT  S.NAME , P.NAME  FROM PRODUCTS P , SHIPPERS S ORDER BY PRODUCT_ID;

--                                                    -- UNION
-- SELECT CUSTOMER_ID , FIRST_NAME , POINTS , 'BRONZE' AS TYPE FROM CUSTOMERS WHERE POINTS <=2000
-- UNION 
-- SELECT CUSTOMER_ID , FIRST_NAME , POINTS , 'SILVER' AS TYPE FROM CUSTOMERS WHERE POINTS BETWEEN 2000 AND 3000
-- UNION
-- SELECT CUSTOMER_ID , FIRST_NAME , POINTS , 'GOLD' AS TYPE FROM CUSTOMERS WHERE POINTS >=3000 ORDER BY FIRST_NAME;

--                                       -- INSERT 
-- INSERT INTO CUSTOMERS(FIRST_NAME ,LAST_NAME ,ADDRESS, CITY,STATE,POINTS) VALUES('PRANESH' , 'THANGAMANI' ,'TRICHY','NATIVE',"CA" , '90');
-- INSERT INTO CUSTOMERS VALUES(DEFAULT , 'RAM' , 'KAVI',DEFAULT , DEFAULT , 'KARUR','KARUR DIS','TN',DEFAULT);
-- SELECT * FROM CUSTOMERS;
--                                  -- MULTIPLE INSERT 
-- INSERT INTO PRODUCTS VALUES (DEFAULT , 'PRANESH;',3,1.22),
-- 						     (DEFAULT , 'PRANESH;',3,1.22),
--                              (DEFAULT , 'PRANESH;',3,1.22);
-- SELECT * FROM PRODUCTS;

--                                    -- INSERT HIERARCHICAL ROWS
-- INSERT INTO ORDERS (CUSTOMER_ID , ORDER_DATE , STATUS) VALUES (2,'2000-03-09',1);
-- INSERT INTO ORDER_ITEMS VALUES(LAST_INSERT_ID() , 2 ,5,1.900);

                                    -- COPYING OF DATABASE
-- USE SQL_INVOICING;
-- -- CREATE TABLE INVOICE_ARCHIEVE AS 
-- -- SELECT I.CLIENT_ID , C.NAME FROM INVOICES I
-- -- 		JOIN CLIENTS C ON I.CLIENT_ID = C.CLIENT_ID WHERE I.PAYMENT_DATE IS NOT NULL;
-- -- INSERT INTO  INVOICE_ARCHIEVE 
-- -- SELECT *,I.CLIENT_ID , C.NAME FROM INVOICES I
-- -- 		JOIN CLIENTS C ON I.CLIENT_ID = C.CLIENT_ID WHERE I.PAYMENT_DATE IS NOT NULL;
-- CREATE TABLE INVOICES_ACHIEVED AS
-- SELECT C.CLIENT_ID , C.NAME , I.INVOICE_ID,I.NUMBER  FROM INVOICES I JOIN CLIENTS C USING(CLIENT_ID) WHERE I.PAYMENT_DATE IS NOT NULL;     

                                        -- UPDATE METHOD

-- USE SQL_STORE;

-- -- UPDATE CUSTOMERS SET FIRST_NAME = 'THANGAMANI' WHERE  FIRST_NAME = 'RAM';
-- -- SELECT FIRST_NAME FROM CUSTOMERS WHERE FIRST_NAME = 'RAM';

                               -- ALL & ANY
                               
-- USE SQL_STORE;
-- select * from customers;
-- SELECT first_name , address from customers where customer_id = any(select customer_id from customers where city in ("karur" ,"trichy"));
-- SELECT first_name , address from customers where customer_id <> all (select customer_id from customers where city in ("karur" ,"trichy"));


                          -- view 
                          
-- use sql_store;
--                       -- create 
-- create view cus_add as (Select * from customers where points > 500);
-- select * from cus_add ;
-- select * from cus_add where city = "karur";
--                      -- modify
-- create or replace view cus_add as(select * from customers where points>1000);
--                          -- drop 
-- drop view cus_add;


              -- on delete
-- create database ondelete;
-- use ondelete;
-- -- create table employee (name varchar(9) , id integer(3) primary key  auto_increment, phone integer(10));
-- alter table employee add tid integer(3);



                            -- AVANACED SQL
                            
                            -- STORED PROCEDURE
-- use sql_store;
-- delimiter $$
-- create procedure getbirt()
-- begin
-- 	select birth_date from customers;
-- end $$

-- delimiter ;
-- call getbirt();

--                 -- drop
--                 
-- drop procedure getbirt;
--     -- or
-- drop procedure if exists getbirt;


-- use sql_store;
-- delimiter $$
-- create procedure hi()
-- begin
--     declare total int default 0;  -- declaring a variable and assigning its value as 0
--     select count(customer_id) into total from customers;
--     select total;
-- end $$
                         -- variable declaration
-- call hi();
-- delimiter ;
                             -- session variable & IN OUT INOUT
                             -- session varible -> have validate upto session end-> ex : @total
-- use sql_store;
-- delimiter ##
-- create procedure sessions(
--  inout adds int, 
--  in count int ,
--  out total int
--  )

-- begin
--   -- out
--   select count(*) into total from customers where customer_id = count;
--   set total=total+5; -- we can also set the value
-- -- select * into total from customers where customer_id = count; -> it returns single value but it may contain more values it is group of returns but it accepts single int in it bcz it store sinle attributes
--   set adds = adds +count; -- inout 
-- end ##
-- delimiter ;
-- set @total = 1; -- session varibles
-- set @adds = 4;
-- call sessions(@adds,2,@total);
-- select @total;
-- select @adds;
--    
   
                                      --  if else
                                      
-- use sql_store;
-- delimiter $$
-- create procedure ifelse(
-- in num int)
-- begin
--  if num=2 then
--    select customer_id from customers;
--  elseif num=3 then
--    select state from customers;
-- else
--    select address from customers;
-- end if;
-- end $$
-- call ifelse(3);


 --                              -- switch case
-- use sql_store;
-- delimiter $$
-- create procedure switchcase(
-- in i int
-- )
-- begin
-- case i 
--    when 2 then
--      select city from customers;
--    else 
--       select phone from customers;
-- end case;

-- -- case 
-- --    when i=2 then
-- --      select city from customers;
-- --    else 
-- --       select phone from customers;
-- -- end case;
-- end $$
-- delimiter ;

-- call switchcase(8);

         -- loop
-- use sql_store;
-- delimiter $$
-- create procedure loops(
-- in l int
-- )
-- begin
-- declare k varchar(50);
-- declare h varchar(10);
-- declare t varchar(10);
-- set k = '';
-- loopname: LOOP
--   if l>10 then
--     leave loopname;
--   end if;
--  set  k = concat(k,l,'');
--  -- select l; 
--   -- everytime it create a new tab to avoid  
--   set l = l+1;
-- end loop;
-- set l =1;
--                  -- while loop
-- set h = '';
-- while l>10 do
-- set  h = concat(h,l,'');
-- set l =l+1;
-- end while;
-- select k;
--                                -- repeat
-- set t = '';
-- set l =0;
-- repeat
-- set t = concat(t,l,'');
-- set l = l+1;
-- until l>20

-- end repeat;
-- select t;
-- end$$
--  delimiter ;
--  call loops(2);

                                    -- function
-- USE SQL_STORE;								
-- select first_name , getcusname(customer_id) from customers;
-- delimiter ##
-- create function getcusname(oid int)
-- returns varchar(580)
-- deterministic   -- important one
-- begin
-- declare n varchar(580);
--    select concat(name ,'',product_id) into n from products  where product_id = (select product_id from ORDER_ITEMS F where F.order_id = (select order_id from orders where customer_id = 7));
--    return n;
-- end ##
-- DELIMITER ;

                                   -- error handling
use sql_store;
delimiter ##
create procedure errorhandleing(in i int)
begin
     declare continue handler for 1062 
     begin
       select "hi";
       end;
     insert into customers(customer_id) values(i);
     select * from customers;
end ##
             
	

    
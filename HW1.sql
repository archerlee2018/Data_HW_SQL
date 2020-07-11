-- Single entity
-- 1.Prepare a list of offices sorted by country, state, city.
select *
from offices
order by country, state, city;

-- 2.How many employees are there in the company?
select count(distinct employeenumber) as employee_total
from employees;

-- 3.What is the total of payments received?
select sum(amount) as amount_total
from payments;

-- 4.List the product lines that contain 'Cars'.
select *
from productlines
where productline like '%Cars%';

-- 5.Report total payments for October 28, 2004.
select sum(amount) as payment_on_a_day
from payments
where paymentdate='2004-10-28';

-- 6.Report those payments greater than $100,000.
select *
from payments
where amount>100000;

-- 7.List the products in each product line.
select *
from products
group by productline, productname
order by productline, productname;

-- 8.How many products in each product line?
select productline,
	count(distinct productcode) as product_cnt
from products
group by productline;

-- 9.What is the minimum payment received?
select *
from payments
order by amount
limit 1;

-- 10.List all payments greater than twice the average payment.
select *
from payments
where amount > (select 2*avg(amount) from payments);

-- 11.What is the average percentage markup of the MSRP on buyPrice? /*MSRP stands for manufacturer's suggested retail price*/
select round(100*avg(msrp/buyprice-1),2) as avg_percent_markup
from products;

-- 12.How many distinct products does ClassicModels sell?
select count(distinct productname) as prod_num
from products
where productvendor='Classicmodels';

-- 13.Report the name and city of customers who don't have sales representatives?
select customername,
		city
from customers
where salesrepemployeenumber is null;

-- 14.What are the names of executives with VP or Manager in their title? Use the CONCAT function to combine the employee's first name and last name into a single field for reporting.
select concat(firstname, ' ', lastname) as excutives_name,
		jobtitle
from employees
where jobtitle like '%VP%' or
	jobtitle like '%manager%';
    
-- 15.Which orders have a value greater than $5,000?
select ordernumber,
		sum(quantityordered*priceeach) as order_amt
from orderdetails
group by ordernumber
having order_amt>5000;

-- One to many relationship
-- 1.Report the account representative for each customer.
-- 2.Report total payments for Atelier graphique.
-- 3.Report the total payments by date
-- 4.Report the products that have not been sold.
-- 5.List the amount paid by each customer.
-- 6.How many orders have been placed by Herkku Gifts?
-- 7.Who are the employees in Boston?
-- 8.Report those payments greater than $100,000. Sort the report so the customer who made the highest payment appears first.
-- 9.List the value of 'On Hold' orders.
-- 10.Report the number of orders 'On Hold' for each customer.

-- Many to many relationship
-- 1.List products sold by order date.
-- 2.List the order dates in descending order for orders for the 1940 Ford Pickup Truck.
-- 3.List the names of customers and their corresponding order number where a particular order from that customer has a value greater than $25,000?
-- 4.Are there any products that appear on all orders?
-- 5.Reports those products that have been sold with a markup of 100% or more (i.e.,  the priceEach is at least twice the buyPrice)
-- 6.List the products ordered on a Monday.
-- 7.What is the quantity on hand for products listed on 'On Hold' orders?

-- Regular expressions
-- 1.Find products containing the name 'Ford'.
-- 2.List products ending in 'ship'.
-- 3.Report the number of customers in Denmark, Norway, and Sweden.
-- 4.What are the products with a product code in the range S700_1000 to S700_1499?
-- 5.Which customers have a digit in their name?
-- 6.List the names of employees called Dianne or Diane.
-- 7.List the products containing ship or boat in their product name.
-- 8.List the products with a product code beginning with S700.
-- 9.List the names of employees called Larry or Barry.
-- 10.List the names of employees with non-alphabetic characters in their names.
-- 11.List the vendors whose name ends in Diecast


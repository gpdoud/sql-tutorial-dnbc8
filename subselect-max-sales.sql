select avg(sales) from customers;

select * from customers where sales > 56951;

select * from customers where sales > 97036;

select * from customers where sales > 59536;

select * from customers
	where sales > (select avg(sales) from customers)

select * from customers
	where sales > (
		select max(sales) from customers	
			where city = 'Cleveland'
	)


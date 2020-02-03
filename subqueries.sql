select * from customers
	where id = 8 or id = 11 or id = 12;

select id from customers
	where charindex('bank', Name) > 0

select * from customers
	where id in (select id from customers
	where charindex('bank', Name) > 0) or charindex('eagle', Name) > 0
			or charindex('cardinal', Name) > 0;

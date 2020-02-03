INSERT into Orders (CustomerId, Date, Description)
	VALUES (1, '2020-02-01', 'My first inserted order');

INSERT into OrderLines (OrdersId, Product, Description, Quantity, Price)
	values (28, 'Echo', 'Amazon Echo', 3, 99.99);
	
INSERT into OrderLines (OrdersId, Product, Description, Quantity, Price)
	values (28, 'EchoDot', 'Amazon Echo Dot', 5, 39.99); 

select top 2 * from orders
 order by id desc

 INSERT into customers (Name, City, State, Sales, Active)
 values ('Doud LLC', 'Loveland', 'OH', 0, 1);

 INSERT into Orders (CustomerId, Description)
 values ((Select id from Customers
			where name = 'Doud LLC'), 'An order');

INSERT into OrderLines (OrdersId, Product, Quantity, Price)
	values (
	(Select id from orders where Description = 'An order')
	, 'Dell 5991', 1, 1500);
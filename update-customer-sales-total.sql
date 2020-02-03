select * 
	from orders o
	join customers c
		on c.id = o.CustomerId
	where c.name  = 'Doud LLC';

Update customers set
	sales = 
		(select sum(ol.Quantity * ol.Price)
			from OrderLines ol 
			where ol.OrdersId = 29)
	where name = 'DOUD LLC';



SELECT *
	from Orders o
	join OrderLines ol
		on ol.OrdersId = o.Id
	join Customers c
		on c.Id = o.CustomerId
	where c.Name = 'Doud LLC';


Update Customers set
	sales = (select sum(ol.Price * ol.Quantity) 
				from OrderLines ol
				join Orders o
					on o.id = ol.OrdersId
				join Customers c
					on c.Id = o.CustomerId
					where c.Name = 'Doud LLC')
	where name = 'Doud LLC';


UPDATE Customers Set
	Sales = sales * 1.1
	where city = 'Columbus';

SELECT * from Customers
	where sales > 90000;

select * from OrderLines

UPDATE OrderLines Set
	Price = Price * 0.9
	Where id = (
		SELECT ol.Id  , ol.Price, (ol.Price * 0.9) as 'New Price'
			from Customers c
			join Orders o
				on c.Id = o.CustomerId
			join OrderLines ol
				on ol.OrdersId = o.Id
			where c.Sales > 90000
	)
Update OrderLines set
	price = price * 0.9
	where id in (
		select ol.id
			from customers c
			join orders o
				on c.Id = o.CustomerId
			join orderlines ol
				on ol.OrdersId = o.Id
			where c.Sales > 90000
		)

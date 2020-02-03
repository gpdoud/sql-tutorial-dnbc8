select city, sum(sales) as 'Total sales for Cincy & Cle' ,
		max(sales) as 'Highest sales',
		min(sales) as 'Lowest sales',
		avg(sales) as 'Average sales',
		count(*) as 'Nbr of customers'

	from customers
	group by city
	having sum(sales) > 600000

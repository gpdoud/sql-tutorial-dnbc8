alter procedure SalesRangeByCity
	@city varchar(30) = 'Cleveland',
	@lowsales decimal(8,2) = 30000,
	@highsales decimal (8,2) = 85000
as
BEGIN

	select * from customers
		where city = @city AND
				sales between @lowsales and @highsales;

END
select distinct Description from OrderLines

delete from OrderLines where id in (
	select id from OrderLines where Description = 'Timex'
)
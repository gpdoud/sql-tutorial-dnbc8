select s.*, m.* 
	from major m
	join student s
		on s.MajorId = m.Id

select * from student s, major m
where s.MajorId = m.id;
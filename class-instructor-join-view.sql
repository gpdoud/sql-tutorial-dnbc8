select concat(firstname, ' ', lastname) as 'Instructor', YearsExperience, 
		c.Id as 'Course Code', i.IsTenured,
		concat(subject, ' ', section) as 'Class'
	from Instructor i
	join Class c
		on i.Id = c.InstructorId
	where not i.IsTenured = 1
	order by i.Lastname
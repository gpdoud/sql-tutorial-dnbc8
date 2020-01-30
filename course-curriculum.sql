SELECT s.Id as 'Student Id', concat(s.Firstname, ' ', s.Lastname) as 'Name', 
		m.Description as 'Major',
		c.Id as 'Course Number', concat(c.Subject, ' ', c.Section) as 'Class',
		concat(i.Firstname, ' ', i.Lastname) as 'Instructor'
	from Student s
	join Major m
		on m.Id = s.MajorId
	join StudentClassRel sc
		on s.Id = sc.StudentId
	join Class c
		on sc.ClassId = c.Id
	join Instructor i
		on i.Id = c.InstructorId


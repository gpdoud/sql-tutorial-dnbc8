SELECT Id, concat(Firstname,' ',lastname) as 'Full Name', gpa, sat 
from student
where sat >= 1200
order by lastname asc;

SELECT * FROM Student
where gpa < 3.0
order by sat desc

select * from student;
select * from major;

SELECT student.id, concat(firstname, ' ', lastname) as 'Name', SAT, GPA, 
			isnull(Description, 'Undecided') as 'Major', 
			isnull(MinSAT, '') as 'Min SAT Required'
	from Student
	left join Major
		on major.id = student.MajorId
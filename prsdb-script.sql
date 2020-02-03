use master;
go
drop database if exists testcapstone;
go
create database testcapstone;
go
use testcapstone;
go
create table Users (
	Id int primary key identity(1,1),
	Username nvarchar(30) not null unique,
	Password nvarchar(30) not null,
	Firstname nvarchar(30) not null,
	Lastname nvarchar(30) not null,
	Phone nvarchar(12) not null,
	Email nvarchar(255) not null,
	IsAdmin bit not null default 0,
	IsReviewer bit not null default 0
);
go
Insert into Users (Username, Password, Firstname, Lastname, Phone, Email, IsAdmin, IsReviewer)
	values ('sa', 'sa', 'System', 'Admin', '513-555-1212', 'sys@admin.com', 1, 1);
Insert into Users (Username, Password, Firstname, Lastname, Phone, Email, IsReviewer)
	values ('rv', 'rv', 'System', 'Reviewer', '513-555-1212', 'sys@reviewer.com', 1);
Insert into Users (Username, Password, Firstname, Lastname, Phone, Email)
	values ('us', 'us', 'System', 'User', '513-555-1212', 'sys@user.com');
go
create table Vendors (
	Id int primary key identity(1,1),
	Code nvarchar(30) not null unique,
	Name nvarchar(30) not null,
	Address nvarchar(30) not null,
	City nvarchar(30) not null,
	State nvarchar(2) not null,
	Zip nvarchar(5) not null,
	Phone nvarchar(12)  null,
	Email nvarchar(255)  null
);
insert into Vendors (Code, Name, Address, City, State, Zip)
	values ('AMAZ', 'Amazon', '123 Amazon Way', 'Seattle', 'WA', '54321');
insert into Vendors (Code, Name, Address, City, State, Zip)
	values ('MSFT', 'Microsoft', '1 Microsoft Way', 'Redmond', 'WA', '54321');
insert into Vendors (Code, Name, Address, City, State, Zip)
	values ('TARG', 'Target', '99 Target Dr', 'Minneapolic', 'MN', '64583');
insert into Vendors (Code, Name, Address, City, State, Zip)
	values ('KROG', 'Kroger', '63 7th St.', 'Cincinnati', 'OH', '43201');
go
create table Products (
	Id int primary key identity(1,1),
	PartNbr nvarchar(30) not null unique,
	Name nvarchar(30) not null,
	Price decimal(11,2) not null default 10,
	Unit nvarchar(30) not null,
	PhotoPath nvarchar(255) null,
	VendorId int not null foreign key references Vendors(Id)
);
go
insert into Products (PartNbr, Name, Price, Unit, VendorId)
	values ('ECHO', 'Amazon Echo', 99.99, 'Each', (Select id from Vendors where Code = 'AMAZ'));
insert into Products (PartNbr, Name, Price, Unit, VendorId)
	values ('ECHODOT', 'Amazon Echo Dot', 39.99, 'Each', (Select id from Vendors where Code = 'AMAZ'));
insert into Products (PartNbr, Name, Price, Unit, VendorId)
	values ('WORD', 'Microsoft WORD', 119.99, 'Each', (Select id from Vendors where Code = 'MSFT'));
insert into Products (PartNbr, Name, Price, Unit, VendorId)
	values ('EXCEL', 'Microsoft EXCEL', 119.99, 'Each', (Select id from Vendors where Code = 'MSFT'));
insert into Products (PartNbr, Name, Price, Unit, VendorId)
	values ('PWPT', 'Microsoft PowerPoint', 119.99, 'Each', (Select id from Vendors where Code = 'MSFT'));
go
create table Requests (
	Id int primary key identity(1,1),
	Description nvarchar(80) not null,
	Justification nvarchar(80) not null,
	RejectionReason nvarchar(80) null,
	DeliveryMode nvarchar(20) not null default 'Pickup',
	Status nvarchar(10) not null default 'NEW',
	Total decimal(11,2) not null default 0,
	UserId int not null foreign key references Users(Id)
);
go
insert into Requests (Description, Justification, UserId)
	values ('1st Request', 'None needed', (Select id from Users where Username = 'us'));
insert into Requests (Description, Justification, UserId)
	values ('2nd Request', 'None needed', (Select id from Users where Username = 'us'));
insert into Requests (Description, Justification, UserId)
	values ('3rd Request', 'None needed', (Select id from Users where Username = 'rv'));
go
create table RequestLines (
	Id int primary key identity(1,1),
	RequestId int not null,
	ProductId int not null,
	Quantity int not null default 1
);
go
insert into RequestLines (RequestId, ProductId, Quantity)
	values (
		(select id from Requests where Description = '1st Request'),
		(select id from Products where PartNbr = 'ECHO'), 1
	);
insert into RequestLines (RequestId, ProductId, Quantity)
	values (
		(select id from Requests where Description = '1st Request'),
		(select id from Products where PartNbr = 'ECHODOT'), 3
	);
go
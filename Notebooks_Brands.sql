create database Notebooks_Brands

use Notebooks_Brands

create table Notebooks(
	ID int primary key identity,
	[Name] nvarchar(30) not null,
	Price int
)

alter table Notebooks
	add constraint DF_Price default 200 for Price

create table Brands(
	Brands_ID int primary key identity,
	Brands_Name nvarchar(30) not null
) 

alter table Brands
	add constraint CK_Name check(LEN (Brands_Name)>=3)

insert into Brands(Brands_Name)	 
	values ('MSI'),
		   ('ASUS'),
		   ('LENOVO'),
		   ('APPLE'),
		   ('PANASONIC')

insert into Notebooks([Name],Price)
	values ('GF-65 THIN',2100),
		   ('TUF505', 1800),
		   ('LEGION', 500 ),
		   ('MACKBOOK', 800),
		   ('TOUGHBOOK', 400)

alter table Notebooks
	add Brand_ID int foreign key references Brands(Brands_ID)

select Notebooks.Name, Brands.Brands_Name, Notebooks.Price from Notebooks

inner join Brands
	on Notebooks.Brand_Id=Brands.Brands_ID

	select * from Brands where Brands.Brands_Name like '%a%'

	select * from Notebooks where Price between 100 and 500 or Price>1000


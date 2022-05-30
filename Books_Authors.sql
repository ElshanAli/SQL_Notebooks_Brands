create database Books_Authors

use Books_Authors

create table Books(
	ID int primary key identity,
	Name nvarchar(100)check (len (Name)>2) not null,
	AuthorId int foreign key references Authors(Id),
	PageCount int check (PageCount>10)

)
create table Authors(
	Id int primary key identity,
	[Name] nvarchar(40) ,
	Surname nvarchar(40) 
)

create view vw_AboutAuthorandBooks
as
select * from
(select k.ID , k.Name, k.PageCount, m.[Name] + ' ' + m.Surname as AuthorFullName from Books as k
	join Authors as m 
	on k.AuthorId=m.Id
)
as AuthorsandBooks
select * from vw_AboutAuthorandBooks

create procedure usp_Searching

@Name nvarchar(30)
as
select b.ID, b.Name,b.PageCount,a.Name + ' ' + a.Surname as AuthorsFullName from Books as b
 join Authors as a
 on b.AuthorId=a.Id
 where a.Name=@Name
 exec usp_Searching 'Megan'
 create procedure Chagne_AuthorsFullName
 @Id int,
 @Name nvarchar(30)
 as
 update Authors 
 set Name=@Name where Id=@Id

 create procedure Add_AuthorsFullName
 @Name nvarchar(30),
 @Surname nvarchar(30)
  as
 insert into Authors(Name,Surname)
 values (@Name,@Surname)

 create procedure Romove_Author
@Id int
as 
delete from Authors where Id=@Id

create table BooksAutors(
	Id int primary key identity,
	Books_Id int foreign key references Books(ID),
	Authors_Id int foreign key references Authors(Id)
	
)
create view vw_BooksandAuthors
as
select * from (
select a.Id, a.Name + ' ' + a.Surname as FullName,b.Name as BooksName, b.PageCount as MaxPageCount  from BooksAutors as ab

left join Authors as a 
on ab.Authors_Id=a.Id
right join Books as b
on ab.Books_Id=b.ID
)
as Books_Authors
select * from vw_BooksandAuthors


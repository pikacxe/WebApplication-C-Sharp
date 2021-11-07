create database Deca;

use Deca;

create table [dbo].[Dete](
	[ID] int primary key identity not null,
	[Ime] varchar(20) null,
	[Prezime] varchar(30) null,
	[Pol] varchar(10) null,
	[DatumRodjenja] Date null,
	[ImeOca] varchar(20) null,
	[ImeMajke] varchar(20) null,
	[Slika] varchar(150) null
);


create procedure [dbo].[GetDete]
as
begin 
	select * from Dete
end

create procedure [dbo].[AddDete] (
	@Ime varchar(20),
	@Prezime varchar(30),
	@Pol varchar(10),
	@DatumRodjenja Date,
	@ImeOca varchar(20),
	@ImeMajke varchar(20),
	@Slika varchar(150)
	)
as
begin 
	insert into Dete values(@Ime,@Prezime,@Pol,@DatumRodjenja,@ImeOca,@ImeMajke,@Slika)
end

create procedure [dbo].[UpdateDete] (
	@ID int,
	@Ime varchar(20),
	@Prezime varchar(30),
	@Pol varchar(10),
	@DatumRodjenja Date,
	@ImeOca varchar(20),
	@ImeMajke varchar(20),
	@Slika varchar(150)
	)
as
begin 
	update Dete set Ime=@Ime,Prezime = @Prezime, Pol=@Pol,DatumRodjenja = @DatumRodjenja,ImeOca = @ImeOca,ImeMajke=@ImeMajke,Slika=@Slika where ID=@ID;
end

create procedure [dbo].[DeleteDete]
(
	@ID int
)
as
begin
 delete from Dete where ID=@ID;
end
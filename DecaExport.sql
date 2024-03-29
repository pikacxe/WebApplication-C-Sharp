USE [master]
GO
/****** Object:  Database [Deca]    Script Date: 28-Mar-20 1:04:26 PM ******/
CREATE DATABASE [Deca]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Deca', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Deca.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Deca_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Deca_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Deca] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Deca].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Deca] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Deca] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Deca] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Deca] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Deca] SET ARITHABORT OFF 
GO
ALTER DATABASE [Deca] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Deca] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Deca] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Deca] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Deca] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Deca] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Deca] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Deca] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Deca] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Deca] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Deca] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Deca] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Deca] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Deca] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Deca] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Deca] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Deca] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Deca] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Deca] SET  MULTI_USER 
GO
ALTER DATABASE [Deca] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Deca] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Deca] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Deca] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Deca] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Deca] SET QUERY_STORE = OFF
GO
USE [Deca]
GO
/****** Object:  Table [dbo].[Dete]    Script Date: 28-Mar-20 1:04:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dete](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [varchar](20) NULL,
	[Prezime] [varchar](30) NULL,
	[Pol] [varchar](10) NULL,
	[DatumRodjenja] [date] NULL,
	[ImeOca] [varchar](20) NULL,
	[ImeMajke] [varchar](20) NULL,
	[Slika] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Dete] ON 

INSERT [dbo].[Dete] ([ID], [Ime], [Prezime], [Pol], [DatumRodjenja], [ImeOca], [ImeMajke], [Slika]) VALUES (1, N'Marko', N'Markovic', N'Musko', CAST(N'2004-04-25' AS Date), N'Jovan', N'Milunka', NULL)
INSERT [dbo].[Dete] ([ID], [Ime], [Prezime], [Pol], [DatumRodjenja], [ImeOca], [ImeMajke], [Slika]) VALUES (2, N'Dejan', N'Savic', N'Musko', CAST(N'2006-08-08' AS Date), N'Milan', N'Zorica', NULL)
INSERT [dbo].[Dete] ([ID], [Ime], [Prezime], [Pol], [DatumRodjenja], [ImeOca], [ImeMajke], [Slika]) VALUES (3, N'Dusan', N'Marinkovic', N'Musko', CAST(N'2007-10-12' AS Date), N'Goran', N'Milica', NULL)
INSERT [dbo].[Dete] ([ID], [Ime], [Prezime], [Pol], [DatumRodjenja], [ImeOca], [ImeMajke], [Slika]) VALUES (4, N'Andjela', N'Gorcic', N'Zensko', CAST(N'2006-05-30' AS Date), N'Milos', N'Dragana', NULL)
INSERT [dbo].[Dete] ([ID], [Ime], [Prezime], [Pol], [DatumRodjenja], [ImeOca], [ImeMajke], [Slika]) VALUES (5, N'Marija', N'Ilic', N'Zensko', CAST(N'2005-07-26' AS Date), N'Dusan', N'Sanja', NULL)
SET IDENTITY_INSERT [dbo].[Dete] OFF
/****** Object:  StoredProcedure [dbo].[AddDete]    Script Date: 28-Mar-20 1:04:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  StoredProcedure [dbo].[DeleteDete]    Script Date: 28-Mar-20 1:04:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteDete]
(
	@ID int
)
as
begin
 delete from Dete where ID=@ID;
end
GO
/****** Object:  StoredProcedure [dbo].[GetDete]    Script Date: 28-Mar-20 1:04:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetDete]
as
begin 
	select * from Dete
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateDete]    Script Date: 28-Mar-20 1:04:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
USE [master]
GO
ALTER DATABASE [Deca] SET  READ_WRITE 
GO

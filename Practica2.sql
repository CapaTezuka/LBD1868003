USE [PonceBoletosBus]
GO
/****** Object:  Index [INDX_Boletos_IdBoleto]    Script Date: 03/03/2020 11:01:07 p. m. ******/
DROP INDEX IF EXISTS [INDX_Boletos_IdBoleto] ON [dbo].[Boletos]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 03/03/2020 11:01:07 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Sucursal]
GO
/****** Object:  Table [dbo].[Pasajeros]    Script Date: 03/03/2020 11:01:07 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Pasajeros]
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 03/03/2020 11:01:07 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Compra]
GO
/****** Object:  Table [dbo].[Boletos]    Script Date: 03/03/2020 11:01:07 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Boletos]
GO
/****** Object:  Table [dbo].[Asientos]    Script Date: 03/03/2020 11:01:07 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Asientos]
GO
USE [master]
GO
/****** Object:  Database [PonceBoletosBus]    Script Date: 03/03/2020 11:01:07 p. m. ******/
DROP DATABASE IF EXISTS [PonceBoletosBus]
GO
/****** Object:  Database [PonceBoletosBus]    Script Date: 03/03/2020 11:01:07 p. m. ******/
CREATE DATABASE [PonceBoletosBus]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PonceBoletosBus', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PonceBoletosBus.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PonceBoletosBus_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PonceBoletosBus_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PonceBoletosBus] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PonceBoletosBus].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PonceBoletosBus] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PonceBoletosBus] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PonceBoletosBus] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PonceBoletosBus] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PonceBoletosBus] SET ARITHABORT OFF 
GO
ALTER DATABASE [PonceBoletosBus] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PonceBoletosBus] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PonceBoletosBus] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PonceBoletosBus] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PonceBoletosBus] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PonceBoletosBus] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PonceBoletosBus] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PonceBoletosBus] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PonceBoletosBus] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PonceBoletosBus] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PonceBoletosBus] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PonceBoletosBus] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PonceBoletosBus] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PonceBoletosBus] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PonceBoletosBus] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PonceBoletosBus] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PonceBoletosBus] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PonceBoletosBus] SET RECOVERY FULL 
GO
ALTER DATABASE [PonceBoletosBus] SET  MULTI_USER 
GO
ALTER DATABASE [PonceBoletosBus] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PonceBoletosBus] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PonceBoletosBus] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PonceBoletosBus] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PonceBoletosBus] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PonceBoletosBus', N'ON'
GO
ALTER DATABASE [PonceBoletosBus] SET QUERY_STORE = OFF
GO
USE [PonceBoletosBus]
GO
/****** Object:  Table [dbo].[Asientos]    Script Date: 03/03/2020 11:01:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asientos](
	[Asiento_id] [varchar](50) NOT NULL,
	[Activo] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[PrimerApellido] [varchar](50) NOT NULL,
	[SegundoApellido] [varchar](50) NOT NULL,
	[NombreCompleto]  AS (((([Nombre]+' ')+[PrimerApellido])+'')+[SegundoApellido]),
PRIMARY KEY CLUSTERED 
(
	[Asiento_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Boletos]    Script Date: 03/03/2020 11:01:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boletos](
	[IdBoleto] [int] NOT NULL,
	[Destino] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
	[Status] [char](1) NULL,
	[Asiento] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdBoleto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 03/03/2020 11:01:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[NombreComp] [varchar](80) NOT NULL,
	[Precio] [int] NOT NULL,
	[Trayecto] [varchar](100) NULL,
	[SaldoCC] [int] NULL,
	[Unidades] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NombreComp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pasajeros]    Script Date: 03/03/2020 11:01:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pasajeros](
	[Pasajero_id] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[PrimerApellido] [varchar](50) NOT NULL,
	[SegundoApellido] [varchar](50) NOT NULL,
	[NombreCompleto]  AS (((([Nombre]+' ')+[PrimerApellido])+'')+[SegundoApellido]),
PRIMARY KEY CLUSTERED 
(
	[Pasajero_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 03/03/2020 11:01:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[Sucursal_id] [varchar](50) NOT NULL,
	[Municipio] [varchar](50) NOT NULL,
	[NumSucursales] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Sucursal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [INDX_Boletos_IdBoleto]    Script Date: 03/03/2020 11:01:07 p. m. ******/
CREATE NONCLUSTERED INDEX [INDX_Boletos_IdBoleto] ON [dbo].[Boletos]
(
	[IdBoleto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [PonceBoletosBus] SET  READ_WRITE 
GO

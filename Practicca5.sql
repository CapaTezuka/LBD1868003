USE [Autobuses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ruta]') AND type in (N'U'))
ALTER TABLE [dbo].[Ruta] DROP CONSTRAINT IF EXISTS [FK_Ruta_Origen]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ruta]') AND type in (N'U'))
ALTER TABLE [dbo].[Ruta] DROP CONSTRAINT IF EXISTS [FK_Ruta_Destino]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Camion]') AND type in (N'U'))
ALTER TABLE [dbo].[Camion] DROP CONSTRAINT IF EXISTS [FK_Camion_Chofer]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Camion]') AND type in (N'U'))
ALTER TABLE [dbo].[Camion] DROP CONSTRAINT IF EXISTS [FK_Camion_Asiento]
GO
/****** Object:  Table [dbo].[Ruta]    Script Date: 01/04/2020 11:09:38 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Ruta]
GO
/****** Object:  Table [dbo].[RegistroDeVenta]    Script Date: 01/04/2020 11:09:38 p. m. ******/
DROP TABLE IF EXISTS [dbo].[RegistroDeVenta]
GO
/****** Object:  Table [dbo].[Pasajero]    Script Date: 01/04/2020 11:09:38 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Pasajero]
GO
/****** Object:  Table [dbo].[Origen]    Script Date: 01/04/2020 11:09:38 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Origen]
GO
/****** Object:  Table [dbo].[Destino]    Script Date: 01/04/2020 11:09:38 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Destino]
GO
/****** Object:  Table [dbo].[Descuento]    Script Date: 01/04/2020 11:09:38 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Descuento]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 01/04/2020 11:09:38 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Cliente]
GO
/****** Object:  Table [dbo].[Chofer]    Script Date: 01/04/2020 11:09:38 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Chofer]
GO
/****** Object:  Table [dbo].[Camion]    Script Date: 01/04/2020 11:09:38 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Camion]
GO
/****** Object:  Table [dbo].[Asiento]    Script Date: 01/04/2020 11:09:38 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Asiento]
GO
USE [master]
GO
/****** Object:  Database [Autobuses]    Script Date: 01/04/2020 11:09:38 p. m. ******/
DROP DATABASE IF EXISTS [Autobuses]
GO
/****** Object:  Database [Autobuses]    Script Date: 01/04/2020 11:09:38 p. m. ******/
CREATE DATABASE [Autobuses]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Autobuses', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Autobuses.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Autobuses_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Autobuses_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Autobuses] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Autobuses].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Autobuses] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Autobuses] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Autobuses] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Autobuses] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Autobuses] SET ARITHABORT OFF 
GO
ALTER DATABASE [Autobuses] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Autobuses] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Autobuses] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Autobuses] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Autobuses] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Autobuses] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Autobuses] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Autobuses] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Autobuses] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Autobuses] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Autobuses] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Autobuses] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Autobuses] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Autobuses] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Autobuses] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Autobuses] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Autobuses] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Autobuses] SET RECOVERY FULL 
GO
ALTER DATABASE [Autobuses] SET  MULTI_USER 
GO
ALTER DATABASE [Autobuses] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Autobuses] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Autobuses] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Autobuses] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Autobuses] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Autobuses', N'ON'
GO
ALTER DATABASE [Autobuses] SET QUERY_STORE = OFF
GO
USE [Autobuses]
GO
/****** Object:  Table [dbo].[Asiento]    Script Date: 01/04/2020 11:09:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asiento](
	[id_Asiento] [int] NOT NULL,
	[letra] [char](1) NOT NULL,
	[fila] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Asiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Camion]    Script Date: 01/04/2020 11:09:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Camion](
	[id_Camion] [int] NOT NULL,
	[id_Chofer] [int] NOT NULL,
	[id_Asiento] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Camion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chofer]    Script Date: 01/04/2020 11:09:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chofer](
	[id_Chofer] [int] NOT NULL,
	[cNombre] [varchar](20) NOT NULL,
	[cEdad] [int] NOT NULL,
	[cTelefono] [bigint] NOT NULL,
	[cLicencia] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Chofer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 01/04/2020 11:09:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id_Cliente] [int] NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Contraseña] [varchar](16) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Correo] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Descuento]    Script Date: 01/04/2020 11:09:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Descuento](
	[id_Descuento] [int] NOT NULL,
	[descripcion] [varchar](10) NOT NULL,
	[porcentaje] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Descuento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destino]    Script Date: 01/04/2020 11:09:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destino](
	[id_Destino] [int] NOT NULL,
	[CiduadDestino] [varchar](25) NOT NULL,
	[EstadoDestino] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Origen]    Script Date: 01/04/2020 11:09:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Origen](
	[id_Origen] [int] NOT NULL,
	[CiduadOrigen] [varchar](25) NOT NULL,
	[EstadoOrigen] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Origen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pasajero]    Script Date: 01/04/2020 11:09:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pasajero](
	[id_Pasajero] [int] NOT NULL,
	[pNombre] [varchar](30) NOT NULL,
	[pCorreo] [varchar](30) NOT NULL,
	[pTelefono] [bigint] NOT NULL,
	[pNacionalidad] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Pasajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroDeVenta]    Script Date: 01/04/2020 11:09:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroDeVenta](
	[id_Venta] [int] NOT NULL,
	[Precio_Venta] [int] NOT NULL,
	[Fecha_Venta] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ruta]    Script Date: 01/04/2020 11:09:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ruta](
	[id_Ruta] [int] NOT NULL,
	[id_Origen] [int] NOT NULL,
	[id_Destino] [int] NOT NULL,
	[Distancia_KM] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Ruta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (1, N'A', 1)
GO
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (2, N'B', 1)
GO
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (3, N'C', 1)
GO
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (4, N'D', 1)
GO
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (6, N'F', 1)
GO
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (7, N'G', 1)
GO
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (8, N'H', 1)
GO
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (9, N'I', 1)
GO
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (10, N'J', 1)
GO
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (50, N'E', 1)
GO
INSERT [dbo].[Chofer] ([id_Chofer], [cNombre], [cEdad], [cTelefono], [cLicencia]) VALUES (2, N'Juan', 36, 33261381, N'Si')
GO
INSERT [dbo].[Chofer] ([id_Chofer], [cNombre], [cEdad], [cTelefono], [cLicencia]) VALUES (3, N'Juan', 36, 33261382, N'Si')
GO
INSERT [dbo].[Chofer] ([id_Chofer], [cNombre], [cEdad], [cTelefono], [cLicencia]) VALUES (4, N'Juan', 36, 33261383, N'Si')
GO
INSERT [dbo].[Chofer] ([id_Chofer], [cNombre], [cEdad], [cTelefono], [cLicencia]) VALUES (5, N'Juan', 36, 33261384, N'Si')
GO
INSERT [dbo].[Chofer] ([id_Chofer], [cNombre], [cEdad], [cTelefono], [cLicencia]) VALUES (6, N'Juan', 36, 33261385, N'Si')
GO
INSERT [dbo].[Chofer] ([id_Chofer], [cNombre], [cEdad], [cTelefono], [cLicencia]) VALUES (7, N'Juan', 36, 33261387, N'Si')
GO
INSERT [dbo].[Chofer] ([id_Chofer], [cNombre], [cEdad], [cTelefono], [cLicencia]) VALUES (8, N'Juan', 36, 33261388, N'Si')
GO
INSERT [dbo].[Chofer] ([id_Chofer], [cNombre], [cEdad], [cTelefono], [cLicencia]) VALUES (9, N'Juan', 36, 33261389, N'Si')
GO
INSERT [dbo].[Chofer] ([id_Chofer], [cNombre], [cEdad], [cTelefono], [cLicencia]) VALUES (10, N'Juan', 36, 33261380, N'Si')
GO
INSERT [dbo].[Cliente] ([id_Cliente], [Usuario], [Contraseña], [Nombre], [Correo]) VALUES (1, N'Pedro', N'123', N'Pedro', N'1@hotmail.com')
GO
INSERT [dbo].[Cliente] ([id_Cliente], [Usuario], [Contraseña], [Nombre], [Correo]) VALUES (2, N'Pedro', N'123', N'Pedro', N'2@hotmail.com')
GO
INSERT [dbo].[Cliente] ([id_Cliente], [Usuario], [Contraseña], [Nombre], [Correo]) VALUES (3, N'Pedro', N'123', N'Pedro', N'3@hotmail.com')
GO
INSERT [dbo].[Cliente] ([id_Cliente], [Usuario], [Contraseña], [Nombre], [Correo]) VALUES (4, N'Pedro', N'123', N'Pedro', N'4@hotmail.com')
GO
INSERT [dbo].[Cliente] ([id_Cliente], [Usuario], [Contraseña], [Nombre], [Correo]) VALUES (6, N'Pedro', N'123', N'Pedro', N'6@hotmail.com')
GO
INSERT [dbo].[Cliente] ([id_Cliente], [Usuario], [Contraseña], [Nombre], [Correo]) VALUES (7, N'Pedro', N'123', N'Pedro', N'7@hotmail.com')
GO
INSERT [dbo].[Cliente] ([id_Cliente], [Usuario], [Contraseña], [Nombre], [Correo]) VALUES (8, N'Pedro', N'123', N'Pedro', N'8@hotmail.com')
GO
INSERT [dbo].[Cliente] ([id_Cliente], [Usuario], [Contraseña], [Nombre], [Correo]) VALUES (9, N'Pedro', N'123', N'Pedro', N'9@hotmail.com')
GO
INSERT [dbo].[Cliente] ([id_Cliente], [Usuario], [Contraseña], [Nombre], [Correo]) VALUES (10, N'Pedro', N'123', N'Pedro', N'10@hotmail.com')
GO
INSERT [dbo].[Cliente] ([id_Cliente], [Usuario], [Contraseña], [Nombre], [Correo]) VALUES (12, N'Pedro', N'123', N'Pedro', N'5@hotmail.com')
GO
INSERT [dbo].[Descuento] ([id_Descuento], [descripcion], [porcentaje]) VALUES (1, N'Si', 30)
GO
INSERT [dbo].[Descuento] ([id_Descuento], [descripcion], [porcentaje]) VALUES (2, N'Si', 70)
GO
INSERT [dbo].[Descuento] ([id_Descuento], [descripcion], [porcentaje]) VALUES (3, N'Si', 10)
GO
INSERT [dbo].[Descuento] ([id_Descuento], [descripcion], [porcentaje]) VALUES (4, N'Si', 30)
GO
INSERT [dbo].[Descuento] ([id_Descuento], [descripcion], [porcentaje]) VALUES (5, N'Si', 80)
GO
INSERT [dbo].[Descuento] ([id_Descuento], [descripcion], [porcentaje]) VALUES (7, N'Si', 10)
GO
INSERT [dbo].[Descuento] ([id_Descuento], [descripcion], [porcentaje]) VALUES (8, N'Si', 20)
GO
INSERT [dbo].[Descuento] ([id_Descuento], [descripcion], [porcentaje]) VALUES (9, N'Si', 60)
GO
INSERT [dbo].[Descuento] ([id_Descuento], [descripcion], [porcentaje]) VALUES (10, N'Si', 40)
GO
INSERT [dbo].[Destino] ([id_Destino], [CiduadDestino], [EstadoDestino]) VALUES (1, N'Mazatlan', N'Sinaloa')
GO
INSERT [dbo].[Destino] ([id_Destino], [CiduadDestino], [EstadoDestino]) VALUES (2, N'Guadalupe', N'Nuevo Leon')
GO
INSERT [dbo].[Destino] ([id_Destino], [CiduadDestino], [EstadoDestino]) VALUES (3, N'Jalisco', N'Guadalajara')
GO
INSERT [dbo].[Destino] ([id_Destino], [CiduadDestino], [EstadoDestino]) VALUES (4, N'Ciudad victoria', N'Tamaulipas')
GO
INSERT [dbo].[Destino] ([id_Destino], [CiduadDestino], [EstadoDestino]) VALUES (5, N'Parras de la fuente', N'Coahuila')
GO
INSERT [dbo].[Destino] ([id_Destino], [CiduadDestino], [EstadoDestino]) VALUES (6, N'Iracuato', N'Puebla')
GO
INSERT [dbo].[Destino] ([id_Destino], [CiduadDestino], [EstadoDestino]) VALUES (7, N'tehuacan', N'Puebla')
GO
INSERT [dbo].[Destino] ([id_Destino], [CiduadDestino], [EstadoDestino]) VALUES (8, N'Ciudad de Mexico', N'Mexico')
GO
INSERT [dbo].[Destino] ([id_Destino], [CiduadDestino], [EstadoDestino]) VALUES (9, N'Culiacan', N'Sinaloa')
GO
INSERT [dbo].[Origen] ([id_Origen], [CiduadOrigen], [EstadoOrigen]) VALUES (2, N'Guadalupe', N'Nuevo Leon')
GO
INSERT [dbo].[Origen] ([id_Origen], [CiduadOrigen], [EstadoOrigen]) VALUES (3, N'Jalisco', N'Guadalajara')
GO
INSERT [dbo].[Origen] ([id_Origen], [CiduadOrigen], [EstadoOrigen]) VALUES (4, N'Ciudad victoria', N'Tamaulipas')
GO
INSERT [dbo].[Origen] ([id_Origen], [CiduadOrigen], [EstadoOrigen]) VALUES (5, N'Parras de la fuente', N'Coahuila')
GO
INSERT [dbo].[Origen] ([id_Origen], [CiduadOrigen], [EstadoOrigen]) VALUES (6, N'Iracuato', N'Puebla')
GO
INSERT [dbo].[Origen] ([id_Origen], [CiduadOrigen], [EstadoOrigen]) VALUES (7, N'tehuacan', N'Puebla')
GO
INSERT [dbo].[Origen] ([id_Origen], [CiduadOrigen], [EstadoOrigen]) VALUES (8, N'Ciudad de Mexico', N'Mexico')
GO
INSERT [dbo].[Origen] ([id_Origen], [CiduadOrigen], [EstadoOrigen]) VALUES (9, N'Culiacan', N'Sinaloa')
GO
INSERT [dbo].[Origen] ([id_Origen], [CiduadOrigen], [EstadoOrigen]) VALUES (10, N'Santiago', N'Nuevo Leon')
GO
INSERT [dbo].[Pasajero] ([id_Pasajero], [pNombre], [pCorreo], [pTelefono], [pNacionalidad]) VALUES (1, N'Raul', N'xkcjhfgcb@hotmail.com', 8186694, N'Mexicano')
GO
INSERT [dbo].[Pasajero] ([id_Pasajero], [pNombre], [pCorreo], [pTelefono], [pNacionalidad]) VALUES (4, N'Pedro', N'xkcjh5fgcb@hotmail.com', 8186694, N'Mexicano')
GO
INSERT [dbo].[Pasajero] ([id_Pasajero], [pNombre], [pCorreo], [pTelefono], [pNacionalidad]) VALUES (5, N'Enrique', N'xk4cjhfgcb@hotmail.com', 8186694, N'Peruano')
GO
INSERT [dbo].[Pasajero] ([id_Pasajero], [pNombre], [pCorreo], [pTelefono], [pNacionalidad]) VALUES (6, N'Juan', N'xkcj3hfgcb@hotmail.com', 8186694, N'Mexicano')
GO
INSERT [dbo].[Pasajero] ([id_Pasajero], [pNombre], [pCorreo], [pTelefono], [pNacionalidad]) VALUES (7, N'Francisco', N'xkcjhfg3cb@hotmail.com', 8186694, N'Mexicano')
GO
INSERT [dbo].[Pasajero] ([id_Pasajero], [pNombre], [pCorreo], [pTelefono], [pNacionalidad]) VALUES (8, N'Diego', N'xkcjhfgcnb@hotmail.com', 8186694, N'Mexicano')
GO
INSERT [dbo].[Pasajero] ([id_Pasajero], [pNombre], [pCorreo], [pTelefono], [pNacionalidad]) VALUES (9, N'Tamaulipo', N'xkcjhfg3cb@hotmail.com', 8186694, N'Mexicano')
GO
INSERT [dbo].[Pasajero] ([id_Pasajero], [pNombre], [pCorreo], [pTelefono], [pNacionalidad]) VALUES (10, N'Guadalupe', N'xkcjhfghb@hotmail.com', 8186694, N'Mexicano')
GO
ALTER TABLE [dbo].[Camion]  WITH CHECK ADD  CONSTRAINT [FK_Camion_Asiento] FOREIGN KEY([id_Asiento])
REFERENCES [dbo].[Asiento] ([id_Asiento])
GO
ALTER TABLE [dbo].[Camion] CHECK CONSTRAINT [FK_Camion_Asiento]
GO
ALTER TABLE [dbo].[Camion]  WITH CHECK ADD  CONSTRAINT [FK_Camion_Chofer] FOREIGN KEY([id_Chofer])
REFERENCES [dbo].[Chofer] ([id_Chofer])
GO
ALTER TABLE [dbo].[Camion] CHECK CONSTRAINT [FK_Camion_Chofer]
GO
ALTER TABLE [dbo].[Ruta]  WITH CHECK ADD  CONSTRAINT [FK_Ruta_Destino] FOREIGN KEY([id_Destino])
REFERENCES [dbo].[Destino] ([id_Destino])
GO
ALTER TABLE [dbo].[Ruta] CHECK CONSTRAINT [FK_Ruta_Destino]
GO
ALTER TABLE [dbo].[Ruta]  WITH CHECK ADD  CONSTRAINT [FK_Ruta_Origen] FOREIGN KEY([id_Origen])
REFERENCES [dbo].[Origen] ([id_Origen])
GO
ALTER TABLE [dbo].[Ruta] CHECK CONSTRAINT [FK_Ruta_Origen]
GO
USE [master]
GO
ALTER DATABASE [Autobuses] SET  READ_WRITE 
GO

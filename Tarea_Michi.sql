USE [master]
GO
/****** Object:  Database [Tarea_Michi]    Script Date: 16-02-2022 23:54:47 ******/
CREATE DATABASE [Tarea_Michi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tarea_Michi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.JAVIER\MSSQL\DATA\Tarea_Michi.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Tarea_Michi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.JAVIER\MSSQL\DATA\Tarea_Michi_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Tarea_Michi] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tarea_Michi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tarea_Michi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tarea_Michi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tarea_Michi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tarea_Michi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tarea_Michi] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tarea_Michi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tarea_Michi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tarea_Michi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tarea_Michi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tarea_Michi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tarea_Michi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tarea_Michi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tarea_Michi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tarea_Michi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tarea_Michi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tarea_Michi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tarea_Michi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tarea_Michi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tarea_Michi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tarea_Michi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tarea_Michi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tarea_Michi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tarea_Michi] SET RECOVERY FULL 
GO
ALTER DATABASE [Tarea_Michi] SET  MULTI_USER 
GO
ALTER DATABASE [Tarea_Michi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tarea_Michi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tarea_Michi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tarea_Michi] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Tarea_Michi] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Tarea_Michi', N'ON'
GO
USE [Tarea_Michi]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 16-02-2022 23:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categorias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[descripcion] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 16-02-2022 23:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Rut] [varchar](255) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Telefonos] [varchar](225) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Detalle]    Script Date: 16-02-2022 23:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Venta] [int] NULL,
	[Id_Cliente] [int] NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_Detalle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Direccion_Cliente]    Script Date: 16-02-2022 23:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Direccion_Cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Calle] [varchar](255) NOT NULL,
	[Numero] [nchar](255) NOT NULL,
	[Comuna] [varchar](255) NOT NULL,
	[Ciudad] [varchar](255) NOT NULL,
	[Id_Cliente] [int] NOT NULL,
 CONSTRAINT [PK_Direccion_Cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Direccion_Proveedor]    Script Date: 16-02-2022 23:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Direccion_Proveedor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Calle] [varchar](255) NOT NULL,
	[Numero] [varchar](255) NOT NULL,
	[Comuna] [varchar](255) NOT NULL,
	[Cuidad] [varchar](255) NOT NULL,
	[Id_Proveedor] [int] NOT NULL,
 CONSTRAINT [PK_Direccion_Proveedor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 16-02-2022 23:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Precio] [int] NOT NULL,
	[Stock] [varchar](255) NOT NULL,
	[Id_Proveedor] [int] NOT NULL,
	[Id_Categoria] [int] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Producto] SET (LOCK_ESCALATION = AUTO)
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 16-02-2022 23:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proveedor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Rut] [varchar](255) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Telefono] [varchar](255) NOT NULL,
	[Pagina_Web] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 16-02-2022 23:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descuento] [int] NULL,
	[Monto_Total] [int] NULL,
	[Precio] [int] NULL,
	[Id_Produco] [int] NULL,
	[Fecha] [date] NULL,
	[Cantidad] [int] NULL,
	[Id_Cliente] [int] NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([id], [nombre], [descripcion]) VALUES (1, N'Snack', N'Sirven para comer con bedidas')
INSERT [dbo].[Categorias] ([id], [nombre], [descripcion]) VALUES (2, N'Bebidas', N'Sirver para comer con snacks')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([id], [Rut], [Nombre], [Telefonos]) VALUES (1, N'190763684', N'Javier Albino', N'+569 62842772 ,+569 46985576')
INSERT [dbo].[Cliente] ([id], [Rut], [Nombre], [Telefonos]) VALUES (2, N'17604517-5', N'Alonso', N'986592087')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([Id], [Nombre], [Precio], [Stock], [Id_Proveedor], [Id_Categoria]) VALUES (2, N'Papas Fritas', 1000, N'100', 1, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Precio], [Stock], [Id_Proveedor], [Id_Categoria]) VALUES (3, N'Doritos', 1000, N'100', 1, 1)
SET IDENTITY_INSERT [dbo].[Producto] OFF
SET IDENTITY_INSERT [dbo].[Proveedor] ON 

INSERT [dbo].[Proveedor] ([Id], [Rut], [Nombre], [Telefono], [Pagina_Web]) VALUES (1, N'78.202.168-1', N'Palazeti', N'+56988622', N'www.palazeti.cl')
SET IDENTITY_INSERT [dbo].[Proveedor] OFF
ALTER TABLE [dbo].[Detalle]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Cliente] FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[Cliente] ([id])
GO
ALTER TABLE [dbo].[Detalle] CHECK CONSTRAINT [FK_Detalle_Cliente]
GO
ALTER TABLE [dbo].[Detalle]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Venta] FOREIGN KEY([Id_Venta])
REFERENCES [dbo].[Venta] ([Id])
GO
ALTER TABLE [dbo].[Detalle] CHECK CONSTRAINT [FK_Detalle_Venta]
GO
ALTER TABLE [dbo].[Direccion_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Cliente_Cliente] FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[Cliente] ([id])
GO
ALTER TABLE [dbo].[Direccion_Cliente] CHECK CONSTRAINT [FK_Direccion_Cliente_Cliente]
GO
ALTER TABLE [dbo].[Direccion_Proveedor]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Proveedor_Proveedor] FOREIGN KEY([Id_Proveedor])
REFERENCES [dbo].[Proveedor] ([Id])
GO
ALTER TABLE [dbo].[Direccion_Proveedor] CHECK CONSTRAINT [FK_Direccion_Proveedor_Proveedor]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Categorias] FOREIGN KEY([Id_Categoria])
REFERENCES [dbo].[Categorias] ([id])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Categorias]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Proveedor] FOREIGN KEY([Id_Proveedor])
REFERENCES [dbo].[Proveedor] ([Id])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Proveedor]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Cliente] FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[Cliente] ([id])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Cliente]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Producto] FOREIGN KEY([Id_Produco])
REFERENCES [dbo].[Producto] ([Id])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Producto]
GO
USE [master]
GO
ALTER DATABASE [Tarea_Michi] SET  READ_WRITE 
GO

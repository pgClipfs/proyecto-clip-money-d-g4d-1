USE [master]
GO
/****** Object:  Database [DBbilletera]    Script Date: 21/1/2021 23:17:04 ******/
CREATE DATABASE [DBbilletera]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBbilletera', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLCLIPLAU\MSSQL\DATA\DBbilletera.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBbilletera_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLCLIPLAU\MSSQL\DATA\DBbilletera_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBbilletera] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBbilletera].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBbilletera] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBbilletera] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBbilletera] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBbilletera] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBbilletera] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBbilletera] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBbilletera] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBbilletera] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBbilletera] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBbilletera] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBbilletera] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBbilletera] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBbilletera] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBbilletera] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBbilletera] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBbilletera] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBbilletera] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBbilletera] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBbilletera] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBbilletera] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBbilletera] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBbilletera] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBbilletera] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBbilletera] SET  MULTI_USER 
GO
ALTER DATABASE [DBbilletera] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBbilletera] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBbilletera] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBbilletera] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBbilletera] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBbilletera] SET QUERY_STORE = OFF
GO
USE [DBbilletera]
GO
/****** Object:  Table [dbo].[Destinos]    Script Date: 21/1/2021 23:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destinos](
	[idUserOrigen] [int] NOT NULL,
	[idUserDestino] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[alias] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Destinos] PRIMARY KEY CLUSTERED 
(
	[idUserDestino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 21/1/2021 23:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[idFactura] [int] IDENTITY(1,1) NOT NULL,
	[monto] [int] NULL,
	[fecha] [date] NULL,
	[idServicio] [int] NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[idFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FondoComun]    Script Date: 21/1/2021 23:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FondoComun](
	[idFondoComun] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[monto] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
 CONSTRAINT [PK_FondoComun] PRIMARY KEY CLUSTERED 
(
	[idFondoComun] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 21/1/2021 23:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidad](
	[idLocalidad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[idProvincia] [int] NOT NULL,
 CONSTRAINT [PK_Localidad] PRIMARY KEY CLUSTERED 
(
	[idLocalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Moneda]    Script Date: 21/1/2021 23:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moneda](
	[idMoneda] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[cotizacion] [int] NOT NULL,
 CONSTRAINT [PK_Moneda] PRIMARY KEY CLUSTERED 
(
	[idMoneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movimiento]    Script Date: 21/1/2021 23:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimiento](
	[idMovimiento] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[idTipoMov] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[monto] [int] NOT NULL,
	[numComprobante] [int] NOT NULL,
 CONSTRAINT [PK_Movimiento] PRIMARY KEY CLUSTERED 
(
	[idMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 21/1/2021 23:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[idPais] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[idPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlazoFijo]    Script Date: 21/1/2021 23:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlazoFijo](
	[idOperacionPlazo] [int] IDENTITY(1,1) NOT NULL,
	[monto] [int] NOT NULL,
	[tiempo] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
 CONSTRAINT [PK_PlazoFijo] PRIMARY KEY CLUSTERED 
(
	[idOperacionPlazo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 21/1/2021 23:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[idProvincia] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[idPais] [int] NOT NULL,
 CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED 
(
	[idProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Saldo]    Script Date: 21/1/2021 23:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Saldo](
	[idSaldo] [int] IDENTITY(1,1) NOT NULL,
	[monto] [int] NOT NULL,
	[idMoneda] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Saldo] PRIMARY KEY CLUSTERED 
(
	[idSaldo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 21/1/2021 23:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio](
	[idServicio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[idUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Servicio] PRIMARY KEY CLUSTERED 
(
	[idServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimiento]    Script Date: 21/1/2021 23:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimiento](
	[idTipoMovimento] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoMovimiento] PRIMARY KEY CLUSTERED 
(
	[idTipoMovimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transferencia]    Script Date: 21/1/2021 23:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transferencia](
	[idTransferencia] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[monto] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idDestino] [int] NOT NULL,
	[idMoneda] [int] NOT NULL,
 CONSTRAINT [PK_Transferencia] PRIMARY KEY CLUSTERED 
(
	[idTransferencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 21/1/2021 23:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1000000,1) NOT NULL,
	[alias] [varchar](50) NOT NULL,
	[dni] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[telefono] [int] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[nomUsuario] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[idProvincia] [int] NOT NULL,
	[idLocalidad] [int] NOT NULL,
	[idPais] [int] NOT NULL,
	[calle] [varchar](50) NOT NULL,
	[altura] [int] NOT NULL,
	[tokenMail] [varchar](150) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Destinos] ([idUserOrigen], [idUserDestino], [nombre], [apellido], [email], [alias]) VALUES (1000012, 1000013, N'Pepe', N'Ruiz', N'pepe@gmail.com', N'pepe.ruiz.tata')
INSERT [dbo].[Destinos] ([idUserOrigen], [idUserDestino], [nombre], [apellido], [email], [alias]) VALUES (1000014, 1000015, N'Pepe', N'Ruiz', N'laubus@gmail.com', N'pepe.ruiz.tata')
GO
SET IDENTITY_INSERT [dbo].[Localidad] ON 

INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (1, N'Capital', 1)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (2, N'Diadema', 2)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (3, N'San Andrés', 2)
SET IDENTITY_INSERT [dbo].[Localidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Moneda] ON 

INSERT [dbo].[Moneda] ([idMoneda], [nombre], [cotizacion]) VALUES (1, N'pesos', 85)
SET IDENTITY_INSERT [dbo].[Moneda] OFF
GO
SET IDENTITY_INSERT [dbo].[Movimiento] ON 

INSERT [dbo].[Movimiento] ([idMovimiento], [fecha], [idTipoMov], [idUsuario], [monto], [numComprobante]) VALUES (0, CAST(N'2021-01-20' AS Date), 1, 1000014, 10000, 112541)
INSERT [dbo].[Movimiento] ([idMovimiento], [fecha], [idTipoMov], [idUsuario], [monto], [numComprobante]) VALUES (1, CAST(N'2021-01-20' AS Date), 3, 1000014, 2500, 112541)
INSERT [dbo].[Movimiento] ([idMovimiento], [fecha], [idTipoMov], [idUsuario], [monto], [numComprobante]) VALUES (2, CAST(N'2021-01-20' AS Date), 1, 1000014, 10000, 112541)
INSERT [dbo].[Movimiento] ([idMovimiento], [fecha], [idTipoMov], [idUsuario], [monto], [numComprobante]) VALUES (3, CAST(N'2021-01-20' AS Date), 1, 1000014, 100, 112541)
SET IDENTITY_INSERT [dbo].[Movimiento] OFF
GO
SET IDENTITY_INSERT [dbo].[Pais] ON 

INSERT [dbo].[Pais] ([idPais], [nombre]) VALUES (1, N'Argentina')
INSERT [dbo].[Pais] ([idPais], [nombre]) VALUES (2, N'Brasil')
SET IDENTITY_INSERT [dbo].[Pais] OFF
GO
SET IDENTITY_INSERT [dbo].[Provincia] ON 

INSERT [dbo].[Provincia] ([idProvincia], [nombre], [idPais]) VALUES (1, N'Cordoba', 1)
INSERT [dbo].[Provincia] ([idProvincia], [nombre], [idPais]) VALUES (2, N'San Pablo', 2)
INSERT [dbo].[Provincia] ([idProvincia], [nombre], [idPais]) VALUES (1003, N'buzios', 2)
INSERT [dbo].[Provincia] ([idProvincia], [nombre], [idPais]) VALUES (1004, N'Rio de janeiro', 2)
SET IDENTITY_INSERT [dbo].[Provincia] OFF
GO
SET IDENTITY_INSERT [dbo].[Saldo] ON 

INSERT [dbo].[Saldo] ([idSaldo], [monto], [idMoneda], [idUsuario]) VALUES (2011, 12600, 1, 1000014)
INSERT [dbo].[Saldo] ([idSaldo], [monto], [idMoneda], [idUsuario]) VALUES (2012, 7500, 1, 1000015)
SET IDENTITY_INSERT [dbo].[Saldo] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoMovimiento] ON 

INSERT [dbo].[TipoMovimiento] ([idTipoMovimento], [nombre]) VALUES (1, N'Ingreso')
INSERT [dbo].[TipoMovimiento] ([idTipoMovimento], [nombre]) VALUES (3, N'Transferencia')
SET IDENTITY_INSERT [dbo].[TipoMovimiento] OFF
GO
SET IDENTITY_INSERT [dbo].[Transferencia] ON 

INSERT [dbo].[Transferencia] ([idTransferencia], [fecha], [monto], [idUsuario], [idDestino], [idMoneda]) VALUES (22, CAST(N'2021-01-20' AS Date), 2500, 1000014, 1000015, 1)
SET IDENTITY_INSERT [dbo].[Transferencia] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idUsuario], [alias], [dni], [nombre], [apellido], [telefono], [email], [nomUsuario], [password], [idProvincia], [idLocalidad], [idPais], [calle], [altura], [tokenMail]) VALUES (1000014, N'lau.tapa.tbus', 7275257, N'Lautaro', N'Bustos', 888888, N'laubus1234@gmail.com', N'laubus', N'123', 1, 1, 1, N'Nuñes', 145, N'cf327d2feae5c318e6d36e4c17c30ccb6d792afd0adbadfdb18f835207c7477f')
INSERT [dbo].[Usuario] ([idUsuario], [alias], [dni], [nombre], [apellido], [telefono], [email], [nomUsuario], [password], [idProvincia], [idLocalidad], [idPais], [calle], [altura], [tokenMail]) VALUES (1000015, N'pepe.ruiz.tata', 56565855, N'Pepe', N'Ruiz', 99999, N'pepe@gmail.com', N'peperuiz', N'123', 2, 2, 2, N'Lopez', 424, NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Servicio] FOREIGN KEY([idServicio])
REFERENCES [dbo].[Servicio] ([idServicio])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Servicio]
GO
ALTER TABLE [dbo].[FondoComun]  WITH CHECK ADD  CONSTRAINT [FK_FondoComun_1_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[FondoComun] CHECK CONSTRAINT [FK_FondoComun_1_Usuario]
GO
ALTER TABLE [dbo].[Localidad]  WITH CHECK ADD  CONSTRAINT [FK_Localidad_Provincia] FOREIGN KEY([idProvincia])
REFERENCES [dbo].[Provincia] ([idProvincia])
GO
ALTER TABLE [dbo].[Localidad] CHECK CONSTRAINT [FK_Localidad_Provincia]
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD  CONSTRAINT [FK_Movimiento_TipoMovimiento] FOREIGN KEY([idTipoMov])
REFERENCES [dbo].[TipoMovimiento] ([idTipoMovimento])
GO
ALTER TABLE [dbo].[Movimiento] CHECK CONSTRAINT [FK_Movimiento_TipoMovimiento]
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD  CONSTRAINT [FK_Movimiento_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Movimiento] CHECK CONSTRAINT [FK_Movimiento_Usuario]
GO
ALTER TABLE [dbo].[PlazoFijo]  WITH CHECK ADD  CONSTRAINT [FK_PlazoFijo_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[PlazoFijo] CHECK CONSTRAINT [FK_PlazoFijo_Usuario]
GO
ALTER TABLE [dbo].[Provincia]  WITH CHECK ADD  CONSTRAINT [FK_Provincia_Pais] FOREIGN KEY([idPais])
REFERENCES [dbo].[Pais] ([idPais])
GO
ALTER TABLE [dbo].[Provincia] CHECK CONSTRAINT [FK_Provincia_Pais]
GO
ALTER TABLE [dbo].[Saldo]  WITH CHECK ADD  CONSTRAINT [FK_Saldo_Moneda] FOREIGN KEY([idMoneda])
REFERENCES [dbo].[Moneda] ([idMoneda])
GO
ALTER TABLE [dbo].[Saldo] CHECK CONSTRAINT [FK_Saldo_Moneda]
GO
ALTER TABLE [dbo].[Saldo]  WITH CHECK ADD  CONSTRAINT [FK_Saldo_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Saldo] CHECK CONSTRAINT [FK_Saldo_Usuario]
GO
ALTER TABLE [dbo].[Servicio]  WITH CHECK ADD  CONSTRAINT [FK_Servicio_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Servicio] CHECK CONSTRAINT [FK_Servicio_Usuario]
GO
ALTER TABLE [dbo].[Transferencia]  WITH CHECK ADD  CONSTRAINT [FK_Transferencia_Destinos] FOREIGN KEY([idDestino])
REFERENCES [dbo].[Destinos] ([idUserDestino])
GO
ALTER TABLE [dbo].[Transferencia] CHECK CONSTRAINT [FK_Transferencia_Destinos]
GO
ALTER TABLE [dbo].[Transferencia]  WITH CHECK ADD  CONSTRAINT [FK_Transferencia_Moneda] FOREIGN KEY([idMoneda])
REFERENCES [dbo].[Moneda] ([idMoneda])
GO
ALTER TABLE [dbo].[Transferencia] CHECK CONSTRAINT [FK_Transferencia_Moneda]
GO
ALTER TABLE [dbo].[Transferencia]  WITH CHECK ADD  CONSTRAINT [FK_Transferencia_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Transferencia] CHECK CONSTRAINT [FK_Transferencia_Usuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Localidad] FOREIGN KEY([idLocalidad])
REFERENCES [dbo].[Localidad] ([idLocalidad])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Localidad]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Pais] FOREIGN KEY([idPais])
REFERENCES [dbo].[Pais] ([idPais])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Pais]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Provincia] FOREIGN KEY([idProvincia])
REFERENCES [dbo].[Provincia] ([idProvincia])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Provincia]
GO
USE [master]
GO
ALTER DATABASE [DBbilletera] SET  READ_WRITE 
GO

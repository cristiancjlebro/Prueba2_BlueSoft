USE [master]
GO
/****** Object:  Database [BlueSoft]    Script Date: 24/07/2020 2:38:26 p. m. ******/
CREATE DATABASE [BlueSoft]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BlueSoft', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HPITBF\MSSQL\DATA\BlueSoft.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BlueSoft_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HPITBF\MSSQL\DATA\BlueSoft_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BlueSoft] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BlueSoft].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BlueSoft] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BlueSoft] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BlueSoft] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BlueSoft] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BlueSoft] SET ARITHABORT OFF 
GO
ALTER DATABASE [BlueSoft] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BlueSoft] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BlueSoft] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BlueSoft] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BlueSoft] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BlueSoft] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BlueSoft] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BlueSoft] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BlueSoft] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BlueSoft] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BlueSoft] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BlueSoft] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BlueSoft] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BlueSoft] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BlueSoft] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BlueSoft] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BlueSoft] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BlueSoft] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BlueSoft] SET  MULTI_USER 
GO
ALTER DATABASE [BlueSoft] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BlueSoft] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BlueSoft] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BlueSoft] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BlueSoft] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BlueSoft] SET QUERY_STORE = OFF
GO
USE [BlueSoft]
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 24/07/2020 2:38:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo](
	[CargoId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion_Cargo] [nvarchar](80) NULL,
	[Salario_Cargo] [money] NULL,
 CONSTRAINT [PK_Cargo] PRIMARY KEY CLUSTERED 
(
	[CargoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 24/07/2020 2:38:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[EmpleadoId] [int] IDENTITY(1,1) NOT NULL,
	[GeneroId] [int] NOT NULL,
	[CargoId] [int] NOT NULL,
	[Nombre_Empleado] [nvarchar](50) NULL,
	[NumeroDocumento_Empleado] [nvarchar](15) NULL,
	[FechaNacimiento_Empleado] [date] NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[EmpleadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asignacion]    Script Date: 24/07/2020 2:38:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignacion](
	[AsignacionId] [int] IDENTITY(1,1) NOT NULL,
	[EmpleadoId] [int] NOT NULL,
	[TiendaId] [int] NOT NULL,
	[Fecha_Asignacion] [date] NULL,
 CONSTRAINT [PK_Asignacion] PRIMARY KEY CLUSTERED 
(
	[AsignacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tienda]    Script Date: 24/07/2020 2:38:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tienda](
	[TiendaId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Tienda] [nvarchar](50) NOT NULL,
	[Telefono_Tienda] [nvarchar](15) NOT NULL,
	[Direccion_Tienda] [nchar](80) NULL,
 CONSTRAINT [PK_Tienda] PRIMARY KEY CLUSTERED 
(
	[TiendaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[agenda]    Script Date: 24/07/2020 2:38:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[agenda]
AS
SELECT        dbo.Empleado.EmpleadoId, dbo.Empleado.Nombre_Empleado, dbo.Empleado.NumeroDocumento_Empleado, dbo.Cargo.Descripcion_Cargo, dbo.Tienda.Nombre_Tienda, dbo.Tienda.Telefono_Tienda, 
                         dbo.Tienda.Direccion_Tienda
FROM            dbo.Empleado INNER JOIN
                         dbo.Cargo ON dbo.Empleado.CargoId = dbo.Cargo.CargoId INNER JOIN
                         dbo.Asignacion ON dbo.Empleado.EmpleadoId = dbo.Asignacion.EmpleadoId INNER JOIN
                         dbo.Tienda ON dbo.Asignacion.TiendaId = dbo.Tienda.TiendaId
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 24/07/2020 2:38:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero](
	[GeneroId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion_Genero] [nvarchar](15) NULL,
 CONSTRAINT [PK_Genero] PRIMARY KEY CLUSTERED 
(
	[GeneroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Asignacion] ON 

INSERT [dbo].[Asignacion] ([AsignacionId], [EmpleadoId], [TiendaId], [Fecha_Asignacion]) VALUES (1, 1, 1, CAST(N'2020-07-21' AS Date))
INSERT [dbo].[Asignacion] ([AsignacionId], [EmpleadoId], [TiendaId], [Fecha_Asignacion]) VALUES (2, 2, 2, CAST(N'2020-07-22' AS Date))
INSERT [dbo].[Asignacion] ([AsignacionId], [EmpleadoId], [TiendaId], [Fecha_Asignacion]) VALUES (3, 3, 1, CAST(N'2020-07-22' AS Date))
INSERT [dbo].[Asignacion] ([AsignacionId], [EmpleadoId], [TiendaId], [Fecha_Asignacion]) VALUES (4, 4, 3, CAST(N'2020-07-21' AS Date))
INSERT [dbo].[Asignacion] ([AsignacionId], [EmpleadoId], [TiendaId], [Fecha_Asignacion]) VALUES (5, 5, 2, CAST(N'2020-07-20' AS Date))
INSERT [dbo].[Asignacion] ([AsignacionId], [EmpleadoId], [TiendaId], [Fecha_Asignacion]) VALUES (6, 6, 2, CAST(N'2020-07-19' AS Date))
INSERT [dbo].[Asignacion] ([AsignacionId], [EmpleadoId], [TiendaId], [Fecha_Asignacion]) VALUES (7, 7, 3, CAST(N'2020-07-22' AS Date))
INSERT [dbo].[Asignacion] ([AsignacionId], [EmpleadoId], [TiendaId], [Fecha_Asignacion]) VALUES (8, 8, 2, CAST(N'2020-07-18' AS Date))
INSERT [dbo].[Asignacion] ([AsignacionId], [EmpleadoId], [TiendaId], [Fecha_Asignacion]) VALUES (9, 9, 1, CAST(N'2020-07-15' AS Date))
INSERT [dbo].[Asignacion] ([AsignacionId], [EmpleadoId], [TiendaId], [Fecha_Asignacion]) VALUES (10, 1, 2, CAST(N'2020-07-15' AS Date))
INSERT [dbo].[Asignacion] ([AsignacionId], [EmpleadoId], [TiendaId], [Fecha_Asignacion]) VALUES (11, 1, 2, CAST(N'2020-07-16' AS Date))
INSERT [dbo].[Asignacion] ([AsignacionId], [EmpleadoId], [TiendaId], [Fecha_Asignacion]) VALUES (12, 1, 2, CAST(N'2020-07-17' AS Date))
INSERT [dbo].[Asignacion] ([AsignacionId], [EmpleadoId], [TiendaId], [Fecha_Asignacion]) VALUES (13, 2, 2, CAST(N'2020-07-18' AS Date))
INSERT [dbo].[Asignacion] ([AsignacionId], [EmpleadoId], [TiendaId], [Fecha_Asignacion]) VALUES (14, 3, 1, CAST(N'2020-07-15' AS Date))
INSERT [dbo].[Asignacion] ([AsignacionId], [EmpleadoId], [TiendaId], [Fecha_Asignacion]) VALUES (15, 9, 2, CAST(N'2020-07-18' AS Date))
INSERT [dbo].[Asignacion] ([AsignacionId], [EmpleadoId], [TiendaId], [Fecha_Asignacion]) VALUES (16, 1, 1, CAST(N'2020-07-20' AS Date))
INSERT [dbo].[Asignacion] ([AsignacionId], [EmpleadoId], [TiendaId], [Fecha_Asignacion]) VALUES (17, 6, 3, CAST(N'2020-07-20' AS Date))
INSERT [dbo].[Asignacion] ([AsignacionId], [EmpleadoId], [TiendaId], [Fecha_Asignacion]) VALUES (18, 5, 3, CAST(N'2020-07-21' AS Date))
INSERT [dbo].[Asignacion] ([AsignacionId], [EmpleadoId], [TiendaId], [Fecha_Asignacion]) VALUES (19, 7, 2, CAST(N'2020-07-19' AS Date))
INSERT [dbo].[Asignacion] ([AsignacionId], [EmpleadoId], [TiendaId], [Fecha_Asignacion]) VALUES (20, 7, 1, CAST(N'2020-07-18' AS Date))
SET IDENTITY_INSERT [dbo].[Asignacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Cargo] ON 

INSERT [dbo].[Cargo] ([CargoId], [Descripcion_Cargo], [Salario_Cargo]) VALUES (1, N'Caja', 1500000.0000)
INSERT [dbo].[Cargo] ([CargoId], [Descripcion_Cargo], [Salario_Cargo]) VALUES (2, N'Empacador', 980000.0000)
INSERT [dbo].[Cargo] ([CargoId], [Descripcion_Cargo], [Salario_Cargo]) VALUES (3, N'Administrador', 1500000.0000)
INSERT [dbo].[Cargo] ([CargoId], [Descripcion_Cargo], [Salario_Cargo]) VALUES (4, N'Almacenista', 9800000.0000)
INSERT [dbo].[Cargo] ([CargoId], [Descripcion_Cargo], [Salario_Cargo]) VALUES (5, N'Domiciliario', 1000000.0000)
INSERT [dbo].[Cargo] ([CargoId], [Descripcion_Cargo], [Salario_Cargo]) VALUES (6, N'Oficios Varios', 1000000.0000)
SET IDENTITY_INSERT [dbo].[Cargo] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleado] ON 

INSERT [dbo].[Empleado] ([EmpleadoId], [GeneroId], [CargoId], [Nombre_Empleado], [NumeroDocumento_Empleado], [FechaNacimiento_Empleado]) VALUES (1, 1, 1, N'Cristian Camilo Jimenez', N'1024490133', CAST(N'1989-04-11' AS Date))
INSERT [dbo].[Empleado] ([EmpleadoId], [GeneroId], [CargoId], [Nombre_Empleado], [NumeroDocumento_Empleado], [FechaNacimiento_Empleado]) VALUES (2, 1, 2, N'Pruebas', N'1102555458', CAST(N'1987-08-08' AS Date))
INSERT [dbo].[Empleado] ([EmpleadoId], [GeneroId], [CargoId], [Nombre_Empleado], [NumeroDocumento_Empleado], [FechaNacimiento_Empleado]) VALUES (3, 2, 1, N'Andrea ', N'546874684', CAST(N'1983-02-01' AS Date))
INSERT [dbo].[Empleado] ([EmpleadoId], [GeneroId], [CargoId], [Nombre_Empleado], [NumeroDocumento_Empleado], [FechaNacimiento_Empleado]) VALUES (4, 2, 3, N'Gabriela', N'1105648956', CAST(N'1992-06-05' AS Date))
INSERT [dbo].[Empleado] ([EmpleadoId], [GeneroId], [CargoId], [Nombre_Empleado], [NumeroDocumento_Empleado], [FechaNacimiento_Empleado]) VALUES (5, 1, 5, N'Andres', N'89653256', CAST(N'1980-04-05' AS Date))
INSERT [dbo].[Empleado] ([EmpleadoId], [GeneroId], [CargoId], [Nombre_Empleado], [NumeroDocumento_Empleado], [FechaNacimiento_Empleado]) VALUES (6, 1, 4, N'Javier', N'1023658964', CAST(N'1990-08-11' AS Date))
INSERT [dbo].[Empleado] ([EmpleadoId], [GeneroId], [CargoId], [Nombre_Empleado], [NumeroDocumento_Empleado], [FechaNacimiento_Empleado]) VALUES (7, 1, 6, N'Camilo', N'1025636587', CAST(N'1991-09-12' AS Date))
INSERT [dbo].[Empleado] ([EmpleadoId], [GeneroId], [CargoId], [Nombre_Empleado], [NumeroDocumento_Empleado], [FechaNacimiento_Empleado]) VALUES (8, 2, 3, N'Marcela', N'1023658858', CAST(N'1988-09-12' AS Date))
INSERT [dbo].[Empleado] ([EmpleadoId], [GeneroId], [CargoId], [Nombre_Empleado], [NumeroDocumento_Empleado], [FechaNacimiento_Empleado]) VALUES (9, 1, 1, N'Prueba1 ', N'2152545454', CAST(N'1989-01-01' AS Date))
INSERT [dbo].[Empleado] ([EmpleadoId], [GeneroId], [CargoId], [Nombre_Empleado], [NumeroDocumento_Empleado], [FechaNacimiento_Empleado]) VALUES (10, 1, 2, N'Prueba2 ', N'568998477', CAST(N'1956-09-02' AS Date))
SET IDENTITY_INSERT [dbo].[Empleado] OFF
GO
SET IDENTITY_INSERT [dbo].[Genero] ON 

INSERT [dbo].[Genero] ([GeneroId], [Descripcion_Genero]) VALUES (1, N'Masculino')
INSERT [dbo].[Genero] ([GeneroId], [Descripcion_Genero]) VALUES (2, N'Femenino')
SET IDENTITY_INSERT [dbo].[Genero] OFF
GO
SET IDENTITY_INSERT [dbo].[Tienda] ON 

INSERT [dbo].[Tienda] ([TiendaId], [Nombre_Tienda], [Telefono_Tienda], [Direccion_Tienda]) VALUES (1, N'Tienda Norte', N'7856532', N'Calle 100 No 15-34                                                              ')
INSERT [dbo].[Tienda] ([TiendaId], [Nombre_Tienda], [Telefono_Tienda], [Direccion_Tienda]) VALUES (2, N'Tienda Sur', N'5685698', N'Cra 72 sur No 69f-48                                                            ')
INSERT [dbo].[Tienda] ([TiendaId], [Nombre_Tienda], [Telefono_Tienda], [Direccion_Tienda]) VALUES (3, N'Tienda Oriente', N'3112586965', N'Calle 4 No 13-65                                                                ')
INSERT [dbo].[Tienda] ([TiendaId], [Nombre_Tienda], [Telefono_Tienda], [Direccion_Tienda]) VALUES (4, N'Tienda Occidente', N'3118896532', N'Calle 12C no 79a -25                                                            ')
SET IDENTITY_INSERT [dbo].[Tienda] OFF
GO
ALTER TABLE [dbo].[Asignacion]  WITH CHECK ADD  CONSTRAINT [FK_Asignacion_Empleado] FOREIGN KEY([EmpleadoId])
REFERENCES [dbo].[Empleado] ([EmpleadoId])
GO
ALTER TABLE [dbo].[Asignacion] CHECK CONSTRAINT [FK_Asignacion_Empleado]
GO
ALTER TABLE [dbo].[Asignacion]  WITH CHECK ADD  CONSTRAINT [FK_Asignacion_Tienda] FOREIGN KEY([TiendaId])
REFERENCES [dbo].[Tienda] ([TiendaId])
GO
ALTER TABLE [dbo].[Asignacion] CHECK CONSTRAINT [FK_Asignacion_Tienda]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Cargo] FOREIGN KEY([CargoId])
REFERENCES [dbo].[Cargo] ([CargoId])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Cargo]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Genero] FOREIGN KEY([GeneroId])
REFERENCES [dbo].[Genero] ([GeneroId])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Genero]
GO
/****** Object:  StoredProcedure [dbo].[Sp_agenda]    Script Date: 24/07/2020 2:38:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_agenda]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        
dbo.Asignacion.AsignacionId AS 'Id', 
dbo.Empleado.Nombre_Empleado AS 'Nombre', 
dbo.Empleado.NumeroDocumento_Empleado AS 'Documento', 
dbo.Cargo.Descripcion_Cargo AS 'Cargo', 
dbo.Tienda.Nombre_Tienda AS 'Tienda', 
dbo.Tienda.Telefono_Tienda AS 'Telefono Tienda', 
dbo.Tienda.Direccion_Tienda AS 'Dirección Tienda', 
CONVERT(varchar, dbo.Asignacion.Fecha_Asignacion,103) AS 'Fecha Asignación'
FROM dbo.Empleado INNER JOIN dbo.Cargo 
ON dbo.Empleado.CargoId = dbo.Cargo.CargoId 
INNER JOIN dbo.Asignacion 
ON dbo.Empleado.EmpleadoId = dbo.Asignacion.EmpleadoId 
INNER JOIN dbo.Tienda 
ON dbo.Asignacion.TiendaId = dbo.Tienda.TiendaId
ORDER BY Nombre ASC, Asignacion.Fecha_Asignacion ASC
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_FiltroCargo]    Script Date: 24/07/2020 2:38:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_FiltroCargo]
	-- Add the parameters for the stored procedure here
	@cargoId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT    -- Insert statements for procedure here
dbo.Empleado.EmpleadoId AS 'Id Empleado', 
dbo.Empleado.Nombre_Empleado AS 'Nombre', 
dbo.Empleado.NumeroDocumento_Empleado AS 'Documento', 
dbo.Cargo.Descripcion_Cargo AS 'Cargo', 
dbo.Tienda.Nombre_Tienda AS 'Tienda', 
dbo.Tienda.Telefono_Tienda AS 'Telefono Tienda', 
dbo.Tienda.Direccion_Tienda AS 'Dirección Tienda', 
CONVERT(varchar, dbo.Asignacion.Fecha_Asignacion,103) AS 'Fecha Asignación'
FROM dbo.Empleado INNER JOIN dbo.Cargo 
ON dbo.Empleado.CargoId = dbo.Cargo.CargoId 
INNER JOIN dbo.Asignacion 
ON dbo.Empleado.EmpleadoId = dbo.Asignacion.EmpleadoId 
INNER JOIN dbo.Tienda 
ON dbo.Asignacion.TiendaId = dbo.Tienda.TiendaId
where Cargo.CargoId = @cargoId
ORDER BY Asignacion.Fecha_Asignacion ASC, Empleado.Nombre_Empleado ASC
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Empleado"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 292
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Cargo"
            Begin Extent = 
               Top = 6
               Left = 330
               Bottom = 119
               Right = 518
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tienda"
            Begin Extent = 
               Top = 6
               Left = 556
               Bottom = 136
               Right = 735
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Asignacion"
            Begin Extent = 
               Top = 120
               Left = 330
               Bottom = 250
               Right = 514
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'agenda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'agenda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'agenda'
GO
USE [master]
GO
ALTER DATABASE [BlueSoft] SET  READ_WRITE 
GO

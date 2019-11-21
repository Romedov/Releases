USE [master]
GO
/****** Object:  Database [CashboxDB]    Script Date: 07.11.2019 23:35:12 ******/
CREATE DATABASE [CashboxDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CashboxDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.HOMESERVER\MSSQL\DATA\CashboxDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CashboxDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.HOMESERVER\MSSQL\DATA\CashboxDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CashboxDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CashboxDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CashboxDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CashboxDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CashboxDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CashboxDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CashboxDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CashboxDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CashboxDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CashboxDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CashboxDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CashboxDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CashboxDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CashboxDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CashboxDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CashboxDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CashboxDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CashboxDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CashboxDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CashboxDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CashboxDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CashboxDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CashboxDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CashboxDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CashboxDB] SET RECOVERY FULL 
GO
ALTER DATABASE [CashboxDB] SET  MULTI_USER 
GO
ALTER DATABASE [CashboxDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CashboxDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CashboxDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CashboxDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CashboxDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CashboxDB] SET QUERY_STORE = OFF
GO
USE [CashboxDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [CashboxDB]
GO
/****** Object:  Table [dbo].[FreeItems]    Script Date: 07.11.2019 23:35:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FreeItems](
	[SId] [bigint] NOT NULL,
	[CashSum] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_FreeItems] PRIMARY KEY CLUSTERED 
(
	[SId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 07.11.2019 23:35:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[IId] [varchar](50) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Number] [bigint] NOT NULL,
	[Discount] [int] NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[IId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Returns]    Script Date: 07.11.2019 23:35:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Returns](
	[SId] [bigint] NOT NULL,
	[IId] [varchar](50) NOT NULL,
	[Number] [bigint] NOT NULL,
 CONSTRAINT [PK_Returns] PRIMARY KEY CLUSTERED 
(
	[SId] ASC,
	[IId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 07.11.2019 23:35:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[SId] [bigint] NOT NULL,
	[IId] [varchar](50) NOT NULL,
	[Number] [bigint] NOT NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[SId] ASC,
	[IId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shifts]    Script Date: 07.11.2019 23:35:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shifts](
	[SId] [bigint] IDENTITY(1,1) NOT NULL,
	[UId] [varchar](50) NOT NULL,
	[StartDateTime] [datetime] NOT NULL,
	[EndDateTime] [datetime] NULL,
	[CashReceived] [decimal](18, 2) NOT NULL,
	[CashReturned] [decimal](18, 2) NOT NULL,
	[CashAdded] [decimal](18, 2) NOT NULL,
	[CashWithdrawn] [decimal](18, 2) NOT NULL,
	[CurrentCash] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Shift] PRIMARY KEY CLUSTERED 
(
	[SId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 07.11.2019 23:35:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UId] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[SurName] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[FatherName] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (0, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (46, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (47, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (48, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (49, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (50, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (51, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (52, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (53, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (54, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (55, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (56, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (57, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (58, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (59, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (60, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (61, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (62, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (63, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (64, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (65, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (66, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (67, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (68, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (69, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (70, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (71, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (72, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (73, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (74, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (75, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (76, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (77, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (78, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (79, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (80, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (81, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (82, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (83, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (84, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (85, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (86, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (87, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (88, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (89, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (90, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[FreeItems] ([SId], [CashSum]) VALUES (91, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([IId], [Name], [Price], [Number], [Discount]) VALUES (N'123456', N'Молоко "Норов"', CAST(35.90 AS Decimal(18, 2)), 50, 10)
INSERT [dbo].[Items] ([IId], [Name], [Price], [Number], [Discount]) VALUES (N'555555', N'Хлеб "Мокшанский"', CAST(29.50 AS Decimal(18, 2)), 30, 0)
INSERT [dbo].[Items] ([IId], [Name], [Price], [Number], [Discount]) VALUES (N'666666', N'Клей "Момент"', CAST(14.00 AS Decimal(18, 2)), 20, 5)
SET IDENTITY_INSERT [dbo].[Shifts] ON 

INSERT [dbo].[Shifts] ([SId], [UId], [StartDateTime], [EndDateTime], [CashReceived], [CashReturned], [CashAdded], [CashWithdrawn], [CurrentCash]) VALUES (87, N'root', CAST(N'2019-11-07T22:23:53.357' AS DateTime), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Shifts] ([SId], [UId], [StartDateTime], [EndDateTime], [CashReceived], [CashReturned], [CashAdded], [CashWithdrawn], [CurrentCash]) VALUES (88, N'root', CAST(N'2019-11-07T22:34:27.200' AS DateTime), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Shifts] ([SId], [UId], [StartDateTime], [EndDateTime], [CashReceived], [CashReturned], [CashAdded], [CashWithdrawn], [CurrentCash]) VALUES (89, N'root', CAST(N'2019-11-07T23:17:32.120' AS DateTime), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(28.50 AS Decimal(18, 2)), CAST(14.00 AS Decimal(18, 2)), CAST(14.50 AS Decimal(18, 2)))
INSERT [dbo].[Shifts] ([SId], [UId], [StartDateTime], [EndDateTime], [CashReceived], [CashReturned], [CashAdded], [CashWithdrawn], [CurrentCash]) VALUES (90, N'root', CAST(N'2019-11-07T23:27:07.997' AS DateTime), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(14.50 AS Decimal(18, 2)))
INSERT [dbo].[Shifts] ([SId], [UId], [StartDateTime], [EndDateTime], [CashReceived], [CashReturned], [CashAdded], [CashWithdrawn], [CurrentCash]) VALUES (91, N'root', CAST(N'2019-11-07T23:32:27.103' AS DateTime), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(14.50 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Shifts] OFF
INSERT [dbo].[Users] ([UId], [Password], [SurName], [Name], [FatherName]) VALUES (N'root', N'1243', N'Куроедов', N'Роман', N'Александрович')
ALTER TABLE [dbo].[Shifts] ADD  CONSTRAINT [DF_Shifts_EndDateTime]  DEFAULT (NULL) FOR [EndDateTime]
GO
ALTER TABLE [dbo].[Shifts] ADD  CONSTRAINT [DF_Shifts_CashReceived]  DEFAULT ((0)) FOR [CashReceived]
GO
ALTER TABLE [dbo].[Shifts] ADD  CONSTRAINT [DF_Shifts_CashReturned]  DEFAULT ((0)) FOR [CashReturned]
GO
ALTER TABLE [dbo].[Shifts] ADD  CONSTRAINT [DF_Shifts_CashAdded]  DEFAULT ((0)) FOR [CashAdded]
GO
ALTER TABLE [dbo].[Shifts] ADD  CONSTRAINT [DF_Shifts_CashWithdrawn]  DEFAULT ((0)) FOR [CashWithdrawn]
GO
USE [master]
GO
ALTER DATABASE [CashboxDB] SET  READ_WRITE 
GO

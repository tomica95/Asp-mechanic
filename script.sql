USE [master]
GO
/****** Object:  Database [MechanicsV3]    Script Date: 26-Aug-20 12:12:51 PM ******/
CREATE DATABASE [MechanicsV3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MechanicsV3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MechanicsV3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MechanicsV3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MechanicsV3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MechanicsV3] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MechanicsV3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MechanicsV3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MechanicsV3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MechanicsV3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MechanicsV3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MechanicsV3] SET ARITHABORT OFF 
GO
ALTER DATABASE [MechanicsV3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MechanicsV3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MechanicsV3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MechanicsV3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MechanicsV3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MechanicsV3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MechanicsV3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MechanicsV3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MechanicsV3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MechanicsV3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MechanicsV3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MechanicsV3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MechanicsV3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MechanicsV3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MechanicsV3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MechanicsV3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MechanicsV3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MechanicsV3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MechanicsV3] SET  MULTI_USER 
GO
ALTER DATABASE [MechanicsV3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MechanicsV3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MechanicsV3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MechanicsV3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MechanicsV3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MechanicsV3] SET QUERY_STORE = OFF
GO
USE [MechanicsV3]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 26-Aug-20 12:12:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 26-Aug-20 12:12:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[BrandName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 26-Aug-20 12:12:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[RegPlate] [nvarchar](60) NOT NULL,
	[UserId] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarUser]    Script Date: 26-Aug-20 12:12:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarUser](
	[CarId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_CarUser] PRIMARY KEY CLUSTERED 
(
	[CarId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Repairs]    Script Date: 26-Aug-20 12:12:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repairs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[Name] [nvarchar](80) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[Status] [int] NOT NULL,
	[Priority] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CarId] [int] NOT NULL,
 CONSTRAINT [PK_Repairs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 26-Aug-20 12:12:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 26-Aug-20 12:12:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[UseCaseName] [nvarchar](max) NULL,
	[Actor] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 26-Aug-20 12:12:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[FullName] [nvarchar](60) NOT NULL,
	[Username] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](70) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 26-Aug-20 12:12:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200821212839_initial', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200821231040_role config', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200822142821_user', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200823211046_update user and add user-usercases', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200823234725_UseCaseLog', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200824145614_update-use-case', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200824154435_cars-table-car-user', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200824213248_repairs_table', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200824213450_repairs_table_updated', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200824230555_update_user_conf', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200826083457_brands', N'3.1.7')
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [BrandName]) VALUES (1, CAST(N'2020-08-26T17:20:59.8628838' AS DateTime2), NULL, NULL, N'Audi')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [BrandName]) VALUES (2, CAST(N'2020-08-25T17:20:59.8628838' AS DateTime2), NULL, NULL, N'Bmw')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [BrandName]) VALUES (3, CAST(N'2020-08-25T17:20:59.8628838' AS DateTime2), NULL, NULL, N'Alfa Rome')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [BrandName]) VALUES (4, CAST(N'2020-08-25T17:20:59.8628838' AS DateTime2), NULL, NULL, N'Opel')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [BrandName]) VALUES (5, CAST(N'2020-08-25T17:20:59.8628838' AS DateTime2), NULL, NULL, N'Nissan')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [BrandName]) VALUES (6, CAST(N'2020-08-25T17:20:59.8628838' AS DateTime2), NULL, NULL, N'Seat')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [BrandName]) VALUES (7, CAST(N'2020-08-25T17:20:59.8628838' AS DateTime2), NULL, NULL, N'VW')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [BrandName]) VALUES (8, CAST(N'2020-08-25T17:20:59.8628838' AS DateTime2), NULL, NULL, N'Skoda')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [BrandName]) VALUES (9, CAST(N'2020-08-25T17:20:59.8628838' AS DateTime2), NULL, NULL, N'Varburg')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [BrandName]) VALUES (10, CAST(N'2020-08-25T17:20:59.8628838' AS DateTime2), NULL, NULL, N'Ferari')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [BrandName]) VALUES (11, CAST(N'2020-08-25T17:20:59.8628838' AS DateTime2), NULL, NULL, N'Lamborgihni')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [BrandName]) VALUES (12, CAST(N'2020-08-25T17:20:59.8628838' AS DateTime2), NULL, NULL, N'Isuzu')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [BrandName]) VALUES (13, CAST(N'2020-08-25T17:20:59.8628838' AS DateTime2), NULL, NULL, N'Fiat')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [BrandName]) VALUES (14, CAST(N'2020-08-25T17:20:59.8628838' AS DateTime2), NULL, NULL, N'Lancia')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [BrandName]) VALUES (15, CAST(N'2020-08-25T17:20:59.8628838' AS DateTime2), NULL, NULL, N'Maserati')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [BrandName]) VALUES (16, CAST(N'2020-08-25T17:20:59.8628838' AS DateTime2), NULL, NULL, N'Kia')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [BrandName]) VALUES (17, CAST(N'2020-08-25T17:20:59.8628838' AS DateTime2), NULL, NULL, N'Japanac')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [BrandName]) VALUES (18, CAST(N'2020-08-25T17:20:59.8628838' AS DateTime2), NULL, NULL, N'Bentley')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [BrandName]) VALUES (19, CAST(N'2020-08-25T17:20:59.8628838' AS DateTime2), NULL, NULL, N'Chevrolet')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [BrandName]) VALUES (20, CAST(N'2020-08-25T17:20:59.8628838' AS DateTime2), NULL, NULL, N'Citroen')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [RegPlate], [UserId], [BrandId]) VALUES (4, CAST(N'2020-08-26T11:29:27.7532561' AS DateTime2), CAST(N'2020-08-26T11:33:56.6535991' AS DateTime2), NULL, N'Audii', N'Mali servis', N'BG 321 HI', 2, 1)
INSERT [dbo].[Cars] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [RegPlate], [UserId], [BrandId]) VALUES (5, CAST(N'2020-08-26T11:48:11.8114259' AS DateTime2), NULL, NULL, N'Alfa Romeo', N'Broken fly wheel', N'BG 1927-PS', 2, 3)
INSERT [dbo].[Cars] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [RegPlate], [UserId], [BrandId]) VALUES (6, CAST(N'2020-08-26T11:48:26.0799712' AS DateTime2), NULL, NULL, N'Alfa Romeo 2', N'Broken fly wheel', N'BG 1762-PS', 2, 3)
INSERT [dbo].[Cars] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [RegPlate], [UserId], [BrandId]) VALUES (7, CAST(N'2020-08-26T11:48:56.7061826' AS DateTime2), NULL, NULL, N'Bmw', N'Turbo', N'BG 1763-PS', 2, 2)
INSERT [dbo].[Cars] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [RegPlate], [UserId], [BrandId]) VALUES (8, CAST(N'2020-08-26T11:49:24.0986818' AS DateTime2), NULL, NULL, N'Bmw 2', N'Turbo2', N'BG 1777-KT', 2, 2)
INSERT [dbo].[Cars] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [RegPlate], [UserId], [BrandId]) VALUES (9, CAST(N'2020-08-26T11:50:55.2151869' AS DateTime2), NULL, NULL, N'Skoda Fabia 2', N'Turbo2', N'BG 555-KT', 2, 8)
INSERT [dbo].[Cars] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [RegPlate], [UserId], [BrandId]) VALUES (10, CAST(N'2020-08-26T11:51:02.8829270' AS DateTime2), NULL, NULL, N'Skoda Fabia 1', N'Turbo2', N'BG 5545-KT', 2, 8)
INSERT [dbo].[Cars] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [RegPlate], [UserId], [BrandId]) VALUES (11, CAST(N'2020-08-26T11:51:11.3390219' AS DateTime2), NULL, NULL, N'Skoda Fabia 4', N'Turbo2', N'BG 5525-KT', 2, 8)
INSERT [dbo].[Cars] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [RegPlate], [UserId], [BrandId]) VALUES (12, CAST(N'2020-08-26T11:51:40.5289055' AS DateTime2), NULL, NULL, N'Skoda Fabia 5', N'Lag', N'BG 5515-KT', 2, 8)
INSERT [dbo].[Cars] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [RegPlate], [UserId], [BrandId]) VALUES (13, CAST(N'2020-08-26T11:52:08.5888843' AS DateTime2), NULL, NULL, N'Skoda Fabia 6', N'Lag', N'BG 1515-RS', 2, 8)
INSERT [dbo].[Cars] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [RegPlate], [UserId], [BrandId]) VALUES (14, CAST(N'2020-08-26T11:53:07.0585259' AS DateTime2), NULL, NULL, N'Fiat Stilo 1', N'Broken Arm', N'BG 1515-IO', 2, 13)
INSERT [dbo].[Cars] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [RegPlate], [UserId], [BrandId]) VALUES (15, CAST(N'2020-08-26T11:53:14.4585532' AS DateTime2), NULL, NULL, N'Fiat Stilo 2', N'Broken Arm', N'BG 1515-AA', 2, 13)
INSERT [dbo].[Cars] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [RegPlate], [UserId], [BrandId]) VALUES (16, CAST(N'2020-08-26T11:53:29.3671755' AS DateTime2), NULL, NULL, N'Fiat Stilo 4', N'Broken Wheel', N'BG 1515-BB', 2, 13)
INSERT [dbo].[Cars] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [RegPlate], [UserId], [BrandId]) VALUES (17, CAST(N'2020-08-26T11:54:39.9547291' AS DateTime2), NULL, NULL, N'Fiat Stilo 5', N'Broken Wheel', N'BG 122-BB', 2, 13)
INSERT [dbo].[Cars] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [RegPlate], [UserId], [BrandId]) VALUES (18, CAST(N'2020-08-26T11:54:49.8054841' AS DateTime2), NULL, NULL, N'Fiat Stilo 6', N'Broken Engine', N'BG 222-BB', 2, 13)
INSERT [dbo].[Cars] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [RegPlate], [UserId], [BrandId]) VALUES (19, CAST(N'2020-08-26T11:55:04.8016892' AS DateTime2), NULL, NULL, N'Fiat Stilo 7', N'Broken Engine', N'BG 333-BB', 2, 13)
INSERT [dbo].[Cars] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [RegPlate], [UserId], [BrandId]) VALUES (20, CAST(N'2020-08-26T11:56:11.1611310' AS DateTime2), NULL, NULL, N'VW Golf 7', N'Broken Turbo And Fly Wheel', N'BG 444-AA', 2, 7)
INSERT [dbo].[Cars] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [RegPlate], [UserId], [BrandId]) VALUES (21, CAST(N'2020-08-26T11:56:38.6250637' AS DateTime2), NULL, NULL, N'VW Golf 6', N'Broken Turbo And Fly Wheel', N'BG 555-AA', 2, 7)
INSERT [dbo].[Cars] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [RegPlate], [UserId], [BrandId]) VALUES (22, CAST(N'2020-08-26T11:56:52.3384741' AS DateTime2), NULL, NULL, N'VW Golf 5', N'Broken Turbo And Fly Wheel', N'BG 888-XX', 2, 7)
INSERT [dbo].[Cars] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [RegPlate], [UserId], [BrandId]) VALUES (23, CAST(N'2020-08-26T11:58:12.7980901' AS DateTime2), NULL, NULL, N'VW Golf 4', N'Broken Turbo And Fly Wheel', N'BG 222-XX', 2, 7)
SET IDENTITY_INSERT [dbo].[Cars] OFF
GO
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (4, 2)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (5, 2)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (6, 2)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (7, 2)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (8, 2)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (9, 2)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (10, 2)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (11, 2)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (12, 2)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (13, 2)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (14, 2)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (15, 2)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (16, 2)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (17, 2)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (18, 2)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (19, 2)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (20, 2)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (21, 2)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (22, 2)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (23, 2)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (4, 3)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (5, 3)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (6, 3)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (4, 4)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (5, 4)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (6, 4)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (7, 4)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (8, 4)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (9, 4)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (10, 4)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (11, 4)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (12, 4)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (13, 4)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (14, 4)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (15, 4)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (16, 4)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (4, 5)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (17, 5)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (18, 5)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (19, 5)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (20, 5)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (21, 5)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (22, 5)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (23, 5)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (17, 6)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (18, 6)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (19, 6)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (20, 6)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (21, 6)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (22, 6)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (23, 6)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (9, 7)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (10, 7)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (11, 7)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (12, 7)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (13, 7)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (14, 7)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (15, 7)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (16, 7)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (17, 9)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (18, 9)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (19, 9)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (20, 9)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (21, 9)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (22, 9)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (23, 9)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (17, 10)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (18, 10)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (19, 10)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (20, 10)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (21, 10)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (22, 10)
INSERT [dbo].[CarUser] ([CarId], [UserId]) VALUES (23, 10)
GO
SET IDENTITY_INSERT [dbo].[Repairs] ON 

INSERT [dbo].[Repairs] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [Status], [Priority], [UserId], [CarId]) VALUES (1, CAST(N'2020-08-26T11:35:09.8525586' AS DateTime2), NULL, NULL, N'Change Oil', N'Change OIl and oil filter', 1, 1, 2, 4)
INSERT [dbo].[Repairs] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [Status], [Priority], [UserId], [CarId]) VALUES (2, CAST(N'2020-08-26T11:35:29.1441852' AS DateTime2), NULL, NULL, N'Change Filter', N'Change Filter', 1, 1, 2, 4)
INSERT [dbo].[Repairs] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [Status], [Priority], [UserId], [CarId]) VALUES (3, CAST(N'2020-08-26T11:35:46.4165936' AS DateTime2), NULL, NULL, N'Change', N'Change', 1, 1, 2, 4)
INSERT [dbo].[Repairs] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [Status], [Priority], [UserId], [CarId]) VALUES (4, CAST(N'2020-08-26T11:35:56.2896640' AS DateTime2), NULL, NULL, N'Change2', N'Change2', 1, 1, 2, 4)
INSERT [dbo].[Repairs] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [Status], [Priority], [UserId], [CarId]) VALUES (5, CAST(N'2020-08-26T11:36:09.5490215' AS DateTime2), NULL, NULL, N'Change3', N'Change3', 1, 1, 2, 4)
INSERT [dbo].[Repairs] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [Status], [Priority], [UserId], [CarId]) VALUES (6, CAST(N'2020-08-26T11:36:18.7826246' AS DateTime2), NULL, NULL, N'Change4', N'Change4', 1, 1, 2, 4)
INSERT [dbo].[Repairs] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [Status], [Priority], [UserId], [CarId]) VALUES (7, CAST(N'2020-08-26T11:36:28.3949838' AS DateTime2), NULL, NULL, N'Change5', N'Change5', 1, 1, 2, 4)
INSERT [dbo].[Repairs] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [Status], [Priority], [UserId], [CarId]) VALUES (8, CAST(N'2020-08-26T11:36:37.4806001' AS DateTime2), NULL, NULL, N'Change6', N'Change6', 1, 1, 2, 4)
INSERT [dbo].[Repairs] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [Status], [Priority], [UserId], [CarId]) VALUES (9, CAST(N'2020-08-26T12:02:05.0507728' AS DateTime2), NULL, NULL, N'Change All', N'Change All', 2, 2, 2, 7)
INSERT [dbo].[Repairs] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [Status], [Priority], [UserId], [CarId]) VALUES (10, CAST(N'2020-08-26T12:02:09.7399162' AS DateTime2), NULL, NULL, N'Change All', N'Change All', 2, 2, 2, 8)
INSERT [dbo].[Repairs] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [Status], [Priority], [UserId], [CarId]) VALUES (11, CAST(N'2020-08-26T12:02:14.7738070' AS DateTime2), NULL, NULL, N'Change All', N'Change All', 2, 2, 2, 9)
INSERT [dbo].[Repairs] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [Status], [Priority], [UserId], [CarId]) VALUES (12, CAST(N'2020-08-26T12:02:19.0686167' AS DateTime2), NULL, NULL, N'Change All', N'Change All', 2, 2, 2, 10)
INSERT [dbo].[Repairs] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [Status], [Priority], [UserId], [CarId]) VALUES (13, CAST(N'2020-08-26T12:03:00.5782543' AS DateTime2), NULL, NULL, N'Change All 1', N'Change All whats needed', 1, 1, 2, 11)
INSERT [dbo].[Repairs] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [Status], [Priority], [UserId], [CarId]) VALUES (14, CAST(N'2020-08-26T12:03:21.1914447' AS DateTime2), NULL, NULL, N'Change All 1', N'Change All whats needed', 0, 1, 2, 12)
INSERT [dbo].[Repairs] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [Status], [Priority], [UserId], [CarId]) VALUES (15, CAST(N'2020-08-26T12:03:25.0413824' AS DateTime2), NULL, NULL, N'Change All 1', N'Change All whats needed', 0, 1, 2, 13)
INSERT [dbo].[Repairs] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [Status], [Priority], [UserId], [CarId]) VALUES (16, CAST(N'2020-08-26T12:03:27.4018167' AS DateTime2), NULL, NULL, N'Change All 1', N'Change All whats needed', 0, 1, 2, 14)
INSERT [dbo].[Repairs] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [Status], [Priority], [UserId], [CarId]) VALUES (17, CAST(N'2020-08-26T12:03:31.6620996' AS DateTime2), NULL, NULL, N'Change All 1', N'Change All whats needed', 0, 2, 2, 14)
INSERT [dbo].[Repairs] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [Status], [Priority], [UserId], [CarId]) VALUES (18, CAST(N'2020-08-26T12:03:51.9759452' AS DateTime2), NULL, NULL, N'Electrical problems', N'Change All whats needed', 0, 2, 2, 15)
INSERT [dbo].[Repairs] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [Status], [Priority], [UserId], [CarId]) VALUES (19, CAST(N'2020-08-26T12:03:55.4821648' AS DateTime2), NULL, NULL, N'Electrical problems', N'Change All whats needed', 0, 2, 2, 16)
INSERT [dbo].[Repairs] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [Status], [Priority], [UserId], [CarId]) VALUES (20, CAST(N'2020-08-26T12:03:58.7082461' AS DateTime2), NULL, NULL, N'Electrical problemss', N'Change All whats needed', 0, 2, 2, 16)
INSERT [dbo].[Repairs] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [Status], [Priority], [UserId], [CarId]) VALUES (21, CAST(N'2020-08-26T12:04:01.6958665' AS DateTime2), NULL, NULL, N'Electrical problemss', N'Change All whats needed', 0, 2, 2, 16)
INSERT [dbo].[Repairs] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [Status], [Priority], [UserId], [CarId]) VALUES (22, CAST(N'2020-08-26T12:04:09.6373571' AS DateTime2), NULL, NULL, N'Electrical problemss', N'Change All whats needed', 0, 2, 2, 17)
INSERT [dbo].[Repairs] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [Status], [Priority], [UserId], [CarId]) VALUES (23, CAST(N'2020-08-26T12:04:12.9085443' AS DateTime2), NULL, NULL, N'Electrical problemss', N'Change All whats needed', 0, 2, 2, 18)
INSERT [dbo].[Repairs] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [Status], [Priority], [UserId], [CarId]) VALUES (24, CAST(N'2020-08-26T12:04:16.7163288' AS DateTime2), NULL, NULL, N'Electrical problemss', N'Change All whats needed', 0, 2, 2, 19)
INSERT [dbo].[Repairs] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name], [Description], [Status], [Priority], [UserId], [CarId]) VALUES (25, CAST(N'2020-08-26T12:04:20.1714758' AS DateTime2), NULL, NULL, N'Electrical problemss', N'Change All whats needed', 0, 2, 2, 20)
SET IDENTITY_INSERT [dbo].[Repairs] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name]) VALUES (1, CAST(N'2020-08-26T17:20:59.8628838' AS DateTime2), NULL, NULL, N'Manager')
INSERT [dbo].[Roles] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name]) VALUES (2, CAST(N'2020-08-26T17:20:59.8628838' AS DateTime2), NULL, NULL, N'Mechanic')
INSERT [dbo].[Roles] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name]) VALUES (3, CAST(N'2020-08-26T17:20:59.8628838' AS DateTime2), NULL, NULL, N'Assistant')
INSERT [dbo].[Roles] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name]) VALUES (4, CAST(N'2020-08-26T12:07:29.5407929' AS DateTime2), NULL, NULL, N'Director')
INSERT [dbo].[Roles] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name]) VALUES (5, CAST(N'2020-08-26T12:07:37.9870160' AS DateTime2), NULL, NULL, N'Accountance')
INSERT [dbo].[Roles] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name]) VALUES (6, CAST(N'2020-08-26T12:07:52.5048648' AS DateTime2), NULL, NULL, N'Assistant2')
INSERT [dbo].[Roles] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name]) VALUES (7, CAST(N'2020-08-26T12:07:55.2491834' AS DateTime2), NULL, NULL, N'Assistant3')
INSERT [dbo].[Roles] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name]) VALUES (8, CAST(N'2020-08-26T12:07:58.0025479' AS DateTime2), NULL, NULL, N'Assistant4')
INSERT [dbo].[Roles] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [Name]) VALUES (9, CAST(N'2020-08-26T12:08:02.4564307' AS DateTime2), NULL, NULL, N'Assistant5')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (1, CAST(N'2020-08-26T09:05:38.6064343' AS DateTime2), N'Create car', N'sale', N'{"Id":0,"Name":"Audi","Description":"Broken fly wheel","RegPlate":"BG 1928-PS","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (2, CAST(N'2020-08-26T09:07:24.9045116' AS DateTime2), N'Create car', N'sale', N'{"Id":0,"Name":"Audi","Description":"Broken fly wheel","RegPlate":"BG 1928-PS","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (3, CAST(N'2020-08-26T09:11:08.2724405' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"Audi","Description":"Broken fly wheel","RegPlate":"BG 1928-PS","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (4, CAST(N'2020-08-26T09:13:32.5340857' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"Audi","Description":"Broken fly wheel","RegPlate":"BG 1928-PS","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (5, CAST(N'2020-08-26T09:16:17.5230312' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"Audi","Description":"Broken fly wheel","RegPlate":"BG 1928-PS","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (6, CAST(N'2020-08-26T09:22:05.9593769' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"Audi","Description":"Broken fly wheel","RegPlate":"BG 1928-PS","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":1,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (7, CAST(N'2020-08-26T09:26:13.2221856' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"Audi","Description":"Broken fly wheel","RegPlate":"BG 1928-PS","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":1,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (8, CAST(N'2020-08-26T09:28:26.8129411' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"Audi","Description":"Broken fly wheel","RegPlate":"BG 1928-PS","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":1,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (9, CAST(N'2020-08-26T09:29:26.3977858' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"Audi","Description":"Broken fly wheel","RegPlate":"BG 1928-PS","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":1,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (10, CAST(N'2020-08-26T09:31:56.2715481' AS DateTime2), N'Update car', N'ruza', N'{"Id":1,"Name":"Audii","Description":"Mali servis","RegPlate":"BG 321 HI","Leader":null,"Brand":{"Id":1,"BrandName":null},"Users":[{"Id":3,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":4,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (11, CAST(N'2020-08-26T09:32:20.9332006' AS DateTime2), N'Update car', N'ruza', N'{"Id":1,"Name":"Audii","Description":"Mali servis","RegPlate":"BG 321 HI","Leader":null,"Brand":{"Id":1,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (12, CAST(N'2020-08-26T09:32:46.3299322' AS DateTime2), N'Update car', N'ruza', N'{"Id":2,"Name":"Audii","Description":"Mali servis","RegPlate":"BG 321 HI","Leader":null,"Brand":{"Id":1,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (13, CAST(N'2020-08-26T09:33:14.1459493' AS DateTime2), N'Update car', N'ruza', N'{"Id":4,"Name":"Audii","Description":"Mali servis","RegPlate":"BG 321 HI","Leader":null,"Brand":{"Id":1,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (14, CAST(N'2020-08-26T09:33:55.1063284' AS DateTime2), N'Update car', N'ruza', N'{"Id":4,"Name":"Audii","Description":"Mali servis","RegPlate":"BG 321 HI","Leader":null,"Brand":{"Id":1,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (15, CAST(N'2020-08-26T09:35:09.7750010' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Change Oil","Description":"Change OIl and oil filter","Status":1,"Priority":1,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":4,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (16, CAST(N'2020-08-26T09:35:29.1349755' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Change Filter","Description":"Change Filter","Status":1,"Priority":1,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":4,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (17, CAST(N'2020-08-26T09:35:46.4071089' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Change","Description":"Change","Status":1,"Priority":1,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":4,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (18, CAST(N'2020-08-26T09:35:56.2825082' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Change2","Description":"Change2","Status":1,"Priority":1,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":4,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (19, CAST(N'2020-08-26T09:36:09.5339734' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Change3","Description":"Change3","Status":1,"Priority":1,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":4,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (20, CAST(N'2020-08-26T09:36:18.7748765' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Change4","Description":"Change4","Status":1,"Priority":1,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":4,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (21, CAST(N'2020-08-26T09:36:28.3870208' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Change5","Description":"Change5","Status":1,"Priority":1,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":4,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (22, CAST(N'2020-08-26T09:36:37.4753072' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Change6","Description":"Change6","Status":1,"Priority":1,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":4,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (23, CAST(N'2020-08-26T09:44:46.0811248' AS DateTime2), N'Create User', N'ruza', N'{"Id":0,"FullName":"Mechanic1","Username":"Mechanic1","Password":"Mechanic1","Email":"Mechanic1@gmail.com","Role":{"Id":2,"Name":null},"Brand":null,"Cars":[]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (24, CAST(N'2020-08-26T09:44:59.1874905' AS DateTime2), N'Create User', N'ruza', N'{"Id":0,"FullName":"Mechanic2","Username":"Mechanic2","Password":"Mechanic2","Email":"Mechanic2@gmail.com","Role":{"Id":2,"Name":null},"Brand":null,"Cars":[]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (25, CAST(N'2020-08-26T09:45:10.6702109' AS DateTime2), N'Create User', N'ruza', N'{"Id":0,"FullName":"Mechanic3","Username":"Mechanic3","Password":"Mechanic3","Email":"Mechanic3@gmail.com","Role":{"Id":2,"Name":null},"Brand":null,"Cars":[]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (26, CAST(N'2020-08-26T09:45:19.9480277' AS DateTime2), N'Create User', N'ruza', N'{"Id":0,"FullName":"Mechanic4","Username":"Mechanic4","Password":"Mechanic4","Email":"Mechanic4@gmail.com","Role":{"Id":2,"Name":null},"Brand":null,"Cars":[]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (27, CAST(N'2020-08-26T09:45:30.1223164' AS DateTime2), N'Create User', N'ruza', N'{"Id":0,"FullName":"Mechanic5","Username":"Mechanic5","Password":"Mechanic5","Email":"Mechanic5@gmail.com","Role":{"Id":2,"Name":null},"Brand":null,"Cars":[]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (28, CAST(N'2020-08-26T09:45:38.5870191' AS DateTime2), N'Create User', N'ruza', N'{"Id":0,"FullName":"Mechanic6","Username":"Mechanic6","Password":"Mechanic6","Email":"Mechanic6@gmail.com","Role":{"Id":2,"Name":null},"Brand":null,"Cars":[]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (29, CAST(N'2020-08-26T09:45:48.4747386' AS DateTime2), N'Create User', N'ruza', N'{"Id":0,"FullName":"Mechanic7","Username":"Mechanic7","Password":"Mechanic7","Email":"Mechanic7@gmail.com","Role":{"Id":2,"Name":null},"Brand":null,"Cars":[]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (30, CAST(N'2020-08-26T09:46:02.1466382' AS DateTime2), N'Create User', N'ruza', N'{"Id":0,"FullName":"Mechanic8","Username":"Mechanic8","Password":"Mechanic8","Email":"Mechanic8@gmail.com","Role":{"Id":2,"Name":null},"Brand":null,"Cars":[]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (31, CAST(N'2020-08-26T09:46:30.9808264' AS DateTime2), N'Update car', N'ruza', N'{"Id":4,"Name":"Audii","Description":"Mali servis","RegPlate":"BG 321 HI","Leader":null,"Brand":{"Id":1,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":3,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":4,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":5,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (32, CAST(N'2020-08-26T09:46:57.7012031' AS DateTime2), N'Create User', N'ruza', N'{"Id":0,"FullName":"Mechanic9","Username":"Mechanic9","Password":"Mechanic9","Email":"Mechanic9@gmail.com","Role":{"Id":2,"Name":null},"Brand":null,"Cars":[]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (33, CAST(N'2020-08-26T09:48:11.7812340' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"Alfa Romeo","Description":"Broken fly wheel","RegPlate":"BG 1927-PS","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":3,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":3,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":4,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (34, CAST(N'2020-08-26T09:48:26.0755227' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"Alfa Romeo 2","Description":"Broken fly wheel","RegPlate":"BG 1762-PS","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":3,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":3,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":4,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (35, CAST(N'2020-08-26T09:48:56.7023222' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"Bmw","Description":"Turbo","RegPlate":"BG 1763-PS","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":2,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":4,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (36, CAST(N'2020-08-26T09:49:24.0892294' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"Bmw 2","Description":"Turbo2","RegPlate":"BG 1777-KT","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":2,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":4,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (37, CAST(N'2020-08-26T09:50:55.2020639' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"Skoda Fabia 2","Description":"Turbo2","RegPlate":"BG 555-KT","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":8,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":4,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":7,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (38, CAST(N'2020-08-26T09:51:02.8787564' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"Skoda Fabia 1","Description":"Turbo2","RegPlate":"BG 5545-KT","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":8,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":4,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":7,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (39, CAST(N'2020-08-26T09:51:11.3349996' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"Skoda Fabia 4","Description":"Turbo2","RegPlate":"BG 5525-KT","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":8,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":4,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":7,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (40, CAST(N'2020-08-26T09:51:24.8389737' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"Skoda Fabia 5","Description":"Lag","RegPlate":"BG 5525-KT","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":8,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":4,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":7,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (41, CAST(N'2020-08-26T09:51:40.5218706' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"Skoda Fabia 5","Description":"Lag","RegPlate":"BG 5515-KT","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":8,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":4,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":7,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (42, CAST(N'2020-08-26T09:52:08.5856433' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"Skoda Fabia 6","Description":"Lag","RegPlate":"BG 1515-RS","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":8,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":4,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":7,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (43, CAST(N'2020-08-26T09:53:07.0508791' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"Fiat Stilo 1","Description":"Broken Arm","RegPlate":"BG 1515-IO","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":13,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":4,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":7,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (44, CAST(N'2020-08-26T09:53:14.4546389' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"Fiat Stilo 2","Description":"Broken Arm","RegPlate":"BG 1515-AA","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":13,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":4,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":7,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (45, CAST(N'2020-08-26T09:53:29.3629297' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"Fiat Stilo 4","Description":"Broken Wheel","RegPlate":"BG 1515-BB","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":13,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":4,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":7,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (46, CAST(N'2020-08-26T09:54:22.3118846' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"Fiat Stilo 5","Description":"Broken Wheel","RegPlate":"BG 1515-BB","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":13,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":9,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":10,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":6,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":5,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (47, CAST(N'2020-08-26T09:54:39.9509767' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"Fiat Stilo 5","Description":"Broken Wheel","RegPlate":"BG 122-BB","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":13,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":9,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":10,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":6,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":5,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (48, CAST(N'2020-08-26T09:54:49.7957397' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"Fiat Stilo 6","Description":"Broken Engine","RegPlate":"BG 222-BB","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":13,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":9,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":10,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":6,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":5,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (49, CAST(N'2020-08-26T09:55:04.7980897' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"Fiat Stilo 7","Description":"Broken Engine","RegPlate":"BG 333-BB","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":13,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":9,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":10,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":6,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":5,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (50, CAST(N'2020-08-26T09:56:11.1521520' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"VW Golf 7","Description":"Broken Turbo And Fly Wheel","RegPlate":"BG 444-AA","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":7,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":9,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":10,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":6,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":5,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (51, CAST(N'2020-08-26T09:56:21.7427829' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"VW Golf 7","Description":"Broken Turbo And Fly Wheel","RegPlate":"BG 555-AA","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":7,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":9,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":10,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":6,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":5,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (52, CAST(N'2020-08-26T09:56:38.6218466' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"VW Golf 6","Description":"Broken Turbo And Fly Wheel","RegPlate":"BG 555-AA","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":7,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":9,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":10,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":6,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":5,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (53, CAST(N'2020-08-26T09:56:52.3340308' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"VW Golf 5","Description":"Broken Turbo And Fly Wheel","RegPlate":"BG 888-XX","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":7,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":9,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":10,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":6,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":5,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (54, CAST(N'2020-08-26T09:58:12.7876973' AS DateTime2), N'Create car', N'Sale', N'{"Id":0,"Name":"VW Golf 4","Description":"Broken Turbo And Fly Wheel","RegPlate":"BG 222-XX","Leader":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Brand":{"Id":7,"BrandName":null},"Users":[{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":9,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":10,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":6,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},{"Id":5,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]}]}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (55, CAST(N'2020-08-26T10:01:35.1917246' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Change All","Description":"Change All","Status":2,"Priority":2,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":2,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (56, CAST(N'2020-08-26T10:02:03.7878146' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Change All","Description":"Change All","Status":2,"Priority":2,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":7,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (57, CAST(N'2020-08-26T10:02:09.7284313' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Change All","Description":"Change All","Status":2,"Priority":2,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":8,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (58, CAST(N'2020-08-26T10:02:14.7658773' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Change All","Description":"Change All","Status":2,"Priority":2,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":9,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (59, CAST(N'2020-08-26T10:02:19.0619939' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Change All","Description":"Change All","Status":2,"Priority":2,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":10,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (60, CAST(N'2020-08-26T10:02:35.8459072' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Change All 1","Description":"Change All whats needed","Status":3,"Priority":3,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":11,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (61, CAST(N'2020-08-26T10:03:00.5631950' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Change All 1","Description":"Change All whats needed","Status":1,"Priority":1,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":11,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (62, CAST(N'2020-08-26T10:03:21.1827815' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Change All 1","Description":"Change All whats needed","Status":0,"Priority":1,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":12,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (63, CAST(N'2020-08-26T10:03:25.0341962' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Change All 1","Description":"Change All whats needed","Status":0,"Priority":1,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":13,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (64, CAST(N'2020-08-26T10:03:27.3947063' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Change All 1","Description":"Change All whats needed","Status":0,"Priority":1,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":14,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (65, CAST(N'2020-08-26T10:03:31.6571833' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Change All 1","Description":"Change All whats needed","Status":0,"Priority":2,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":14,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (66, CAST(N'2020-08-26T10:03:51.9668760' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Electrical problems","Description":"Change All whats needed","Status":0,"Priority":2,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":15,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (67, CAST(N'2020-08-26T10:03:55.4766610' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Electrical problems","Description":"Change All whats needed","Status":0,"Priority":2,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":16,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (68, CAST(N'2020-08-26T10:03:58.7036604' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Electrical problemss","Description":"Change All whats needed","Status":0,"Priority":2,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":16,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (69, CAST(N'2020-08-26T10:04:01.6915060' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Electrical problemss","Description":"Change All whats needed","Status":0,"Priority":2,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":16,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (70, CAST(N'2020-08-26T10:04:09.6320246' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Electrical problemss","Description":"Change All whats needed","Status":0,"Priority":2,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":17,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (71, CAST(N'2020-08-26T10:04:12.9047513' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Electrical problemss","Description":"Change All whats needed","Status":0,"Priority":2,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":18,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (72, CAST(N'2020-08-26T10:04:16.7124712' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Electrical problemss","Description":"Change All whats needed","Status":0,"Priority":2,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":19,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (73, CAST(N'2020-08-26T10:04:20.1674568' AS DateTime2), N'Create repair', N'ruza', N'{"Id":0,"Name":"Electrical problemss","Description":"Change All whats needed","Status":0,"Priority":2,"User":{"Id":2,"FullName":null,"Username":null,"Password":null,"Email":null,"Role":null,"Brand":null,"Cars":[]},"Car":{"Id":20,"Name":null,"Description":null,"RegPlate":null,"Leader":null,"Brand":null,"Users":[]}}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (74, CAST(N'2020-08-26T10:07:29.5163124' AS DateTime2), N'Create new Role', N'ruza', N'{"Id":0,"Name":"Director"}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (75, CAST(N'2020-08-26T10:07:37.9842499' AS DateTime2), N'Create new Role', N'ruza', N'{"Id":0,"Name":"Accountance"}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (76, CAST(N'2020-08-26T10:07:52.4999638' AS DateTime2), N'Create new Role', N'ruza', N'{"Id":0,"Name":"Assistant2"}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (77, CAST(N'2020-08-26T10:07:55.2462979' AS DateTime2), N'Create new Role', N'ruza', N'{"Id":0,"Name":"Assistant3"}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (78, CAST(N'2020-08-26T10:07:57.9973257' AS DateTime2), N'Create new Role', N'ruza', N'{"Id":0,"Name":"Assistant4"}')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Actor], [Data]) VALUES (79, CAST(N'2020-08-26T10:08:02.4524781' AS DateTime2), N'Create new Role', N'ruza', N'{"Id":0,"Name":"Assistant5"}')
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [FullName], [Username], [Password], [Email], [Image], [RoleId]) VALUES (2, CAST(N'2020-08-26T17:20:59.8628838' AS DateTime2), NULL, NULL, N'Aleksandar', N'Sale', N'Sale', N'sale@gmail.com', N'sale.jpg', 1)
INSERT [dbo].[Users] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [FullName], [Username], [Password], [Email], [Image], [RoleId]) VALUES (3, CAST(N'2020-08-26T11:44:46.1110581' AS DateTime2), NULL, NULL, N'Mechanic1', N'Mechanic1', N'Mechanic1', N'Mechanic1@gmail.com', NULL, 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [FullName], [Username], [Password], [Email], [Image], [RoleId]) VALUES (4, CAST(N'2020-08-26T11:44:59.1975121' AS DateTime2), NULL, NULL, N'Mechanic2', N'Mechanic2', N'Mechanic2', N'Mechanic2@gmail.com', NULL, 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [FullName], [Username], [Password], [Email], [Image], [RoleId]) VALUES (5, CAST(N'2020-08-26T11:45:10.6756442' AS DateTime2), NULL, NULL, N'Mechanic3', N'Mechanic3', N'Mechanic3', N'Mechanic3@gmail.com', NULL, 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [FullName], [Username], [Password], [Email], [Image], [RoleId]) VALUES (6, CAST(N'2020-08-26T11:45:19.9535276' AS DateTime2), NULL, NULL, N'Mechanic4', N'Mechanic4', N'Mechanic4', N'Mechanic4@gmail.com', NULL, 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [FullName], [Username], [Password], [Email], [Image], [RoleId]) VALUES (7, CAST(N'2020-08-26T11:45:30.1260245' AS DateTime2), NULL, NULL, N'Mechanic5', N'Mechanic5', N'Mechanic5', N'Mechanic5@gmail.com', NULL, 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [FullName], [Username], [Password], [Email], [Image], [RoleId]) VALUES (8, CAST(N'2020-08-26T11:45:38.5916977' AS DateTime2), NULL, NULL, N'Mechanic6', N'Mechanic6', N'Mechanic6', N'Mechanic6@gmail.com', NULL, 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [FullName], [Username], [Password], [Email], [Image], [RoleId]) VALUES (9, CAST(N'2020-08-26T11:45:48.4785597' AS DateTime2), NULL, NULL, N'Mechanic7', N'Mechanic7', N'Mechanic7', N'Mechanic7@gmail.com', NULL, 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [FullName], [Username], [Password], [Email], [Image], [RoleId]) VALUES (10, CAST(N'2020-08-26T11:46:02.1549678' AS DateTime2), NULL, NULL, N'Mechanic8', N'Mechanic8', N'Mechanic8', N'Mechanic8@gmail.com', NULL, 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [FullName], [Username], [Password], [Email], [Image], [RoleId]) VALUES (11, CAST(N'2020-08-26T11:46:57.7135074' AS DateTime2), NULL, NULL, N'Mechanic9', N'Mechanic9', N'Mechanic9', N'Mechanic9@gmail.com', NULL, 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserUseCases] ON 

INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1, 2, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2, 2, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (3, 2, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (4, 2, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (5, 2, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (6, 2, 6)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (7, 2, 7)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (8, 2, 8)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (9, 2, 9)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (10, 2, 10)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (11, 2, 11)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (12, 2, 12)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (13, 2, 13)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (14, 2, 14)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (15, 2, 15)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (16, 2, 16)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (17, 2, 17)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (18, 2, 18)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (19, 2, 19)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (20, 2, 20)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (21, 2, 21)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (22, 2, 22)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (24, 2, 23)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (25, 2, 24)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (26, 2, 25)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (27, 2, 99)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (28, 2, 30)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (29, 2, 26)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (30, 2, 27)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (31, 2, 28)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (32, 2, 29)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (33, 3, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (34, 3, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (35, 3, 9)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (36, 3, 10)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (37, 3, 15)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (38, 3, 14)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (39, 3, 19)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (40, 3, 20)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (41, 4, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (42, 4, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (43, 4, 9)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (44, 4, 10)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (45, 4, 15)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (46, 4, 14)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (50, 4, 20)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (51, 4, 24)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (52, 4, 25)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (53, 4, 19)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (54, 4, 20)
SET IDENTITY_INSERT [dbo].[UserUseCases] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Brands_BrandName]    Script Date: 26-Aug-20 12:12:52 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Brands_BrandName] ON [dbo].[Brands]
(
	[BrandName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cars_BrandId]    Script Date: 26-Aug-20 12:12:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_Cars_BrandId] ON [dbo].[Cars]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Cars_Name]    Script Date: 26-Aug-20 12:12:52 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Cars_Name] ON [dbo].[Cars]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Cars_RegPlate]    Script Date: 26-Aug-20 12:12:52 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Cars_RegPlate] ON [dbo].[Cars]
(
	[RegPlate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cars_UserId]    Script Date: 26-Aug-20 12:12:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_Cars_UserId] ON [dbo].[Cars]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CarUser_UserId]    Script Date: 26-Aug-20 12:12:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_CarUser_UserId] ON [dbo].[CarUser]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Repairs_CarId]    Script Date: 26-Aug-20 12:12:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_Repairs_CarId] ON [dbo].[Repairs]
(
	[CarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Repairs_UserId]    Script Date: 26-Aug-20 12:12:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_Repairs_UserId] ON [dbo].[Repairs]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Roles_Name]    Script Date: 26-Aug-20 12:12:52 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Roles_Name] ON [dbo].[Roles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_RoleId]    Script Date: 26-Aug-20 12:12:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_Users_RoleId] ON [dbo].[Users]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 26-Aug-20 12:12:52 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCases_UserId]    Script Date: 26-Aug-20 12:12:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCases_UserId] ON [dbo].[UserUseCases]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cars] ADD  DEFAULT ((0)) FOR [BrandId]
GO
ALTER TABLE [dbo].[Repairs] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Repairs] ADD  DEFAULT ((0)) FOR [Priority]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Brands_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Brands_BrandId]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Users_UserId]
GO
ALTER TABLE [dbo].[CarUser]  WITH CHECK ADD  CONSTRAINT [FK_CarUser_Cars_CarId] FOREIGN KEY([CarId])
REFERENCES [dbo].[Cars] ([Id])
GO
ALTER TABLE [dbo].[CarUser] CHECK CONSTRAINT [FK_CarUser_Cars_CarId]
GO
ALTER TABLE [dbo].[CarUser]  WITH CHECK ADD  CONSTRAINT [FK_CarUser_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[CarUser] CHECK CONSTRAINT [FK_CarUser_Users_UserId]
GO
ALTER TABLE [dbo].[Repairs]  WITH CHECK ADD  CONSTRAINT [FK_Repairs_Cars_CarId] FOREIGN KEY([CarId])
REFERENCES [dbo].[Cars] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Repairs] CHECK CONSTRAINT [FK_Repairs_Cars_CarId]
GO
ALTER TABLE [dbo].[Repairs]  WITH CHECK ADD  CONSTRAINT [FK_Repairs_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Repairs] CHECK CONSTRAINT [FK_Repairs_Users_UserId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [MechanicsV3] SET  READ_WRITE 
GO

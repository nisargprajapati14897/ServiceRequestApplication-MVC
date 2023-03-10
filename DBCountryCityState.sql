USE [master]
GO
/****** Object:  Database [MyApp]    Script Date: 25-11-2022 13:16:19 ******/
CREATE DATABASE [MyApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyApp', FILENAME = N'C:\Users\prajapni\MyApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyApp_log', FILENAME = N'C:\Users\prajapni\MyApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MyApp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyApp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyApp] SET  MULTI_USER 
GO
ALTER DATABASE [MyApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyApp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MyApp] SET QUERY_STORE = OFF
GO
USE [MyApp]
GO
USE [MyApp]
GO
/****** Object:  Sequence [dbo].[ServiceRequestSeq]    Script Date: 25-11-2022 13:16:20 ******/
CREATE SEQUENCE [dbo].[ServiceRequestSeq] 
 AS [bigint]
 START WITH 100
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 99999
 CACHE  10 
GO
USE [MyApp]
GO
/****** Object:  Sequence [dbo].[UsersDetailsSeq]    Script Date: 25-11-2022 13:16:20 ******/
CREATE SEQUENCE [dbo].[UsersDetailsSeq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 99999
 CACHE  10 
GO
/****** Object:  Table [dbo].[City]    Script Date: 25-11-2022 13:16:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityId] [int] NOT NULL,
	[CityName] [varchar](50) NULL,
	[StateId] [int] NULL,
	[CountryId] [int] NULL,
	[IsDelete] [char](1) NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 25-11-2022 13:16:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] NOT NULL,
	[CountryName] [varchar](50) NULL,
	[IsDelete] [char](1) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceRequestTbl]    Script Date: 25-11-2022 13:16:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceRequestTbl](
	[ServiceRequestId] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[MobileNo] [bigint] NULL,
	[Email] [varchar](50) NULL,
	[EnquiryPurpose] [varchar](20) NULL,
	[Comments] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[IsDelete] [char](1) NULL,
 CONSTRAINT [PK_ServiceRequestTbl] PRIMARY KEY CLUSTERED 
(
	[ServiceRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 25-11-2022 13:16:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateId] [int] NOT NULL,
	[StateName] [varchar](50) NULL,
	[CountryId] [int] NULL,
	[IsDelete] [char](1) NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersTbl]    Script Date: 25-11-2022 13:16:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersTbl](
	[UserDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Dob] [nvarchar](50) NULL,
	[ContactNo] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_UsersTbl] PRIMARY KEY CLUSTERED 
(
	[UserDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (1, N'Ahmadabad', 1, 1, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (2, N'Bhavnagar', 1, 1, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (3, N'Mahesana', 1, 1, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (4, N'Junagadh', 1, 1, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (5, N'Ajmer', 2, 1, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (6, N'Jaisalmer', 2, 1, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (7, N'Dungarpur', 2, 1, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (8, N'Bhilwara', 2, 1, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (9, N'Amristar', 3, 1, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (10, N'Bathinda', 3, 1, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (11, N'Firozpur', 3, 1, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (12, N'Jalandhar', 3, 1, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (13, N'Aurangabad', 4, 1, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (14, N'Bhojpur', 4, 1, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (15, N'Kishanganj', 4, 1, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (16, N'Nalanda', 4, 1, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (17, N'Liwan
', 5, 2, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (18, N'Tainhe
', 5, 2, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (19, N'Panyu
', 5, 2, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (20, N'Luogang
', 5, 2, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (21, N'Baoan
', 6, 2, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (22, N'Futian
', 6, 2, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (23, N'Longgang
', 6, 2, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (24, N'Nanshan
', 6, 2, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (25, N'Yantian
', 7, 2, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (26, N'Xiangzhou
', 7, 2, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (27, N'Doumen
', 7, 2, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (28, N'Jinwan
', 7, 2, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (29, N'Auburn
', 8, 3, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (30, N'Bessemer
', 8, 3, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (31, N'Daphne
', 8, 3, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (32, N'Florala
', 8, 3, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (33, N'Grand Junction
', 9, 3, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (34, N'Greeley
', 9, 3, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (35, N'Lakewood
', 9, 3, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (36, N'Las Animas
', 9, 3, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (37, N'Hopewell Township
', 10, 3, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (38, N'Jackson Townshi
', 10, 3, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (39, N'Jersey City
', 10, 3, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (40, N' Keansburg
', 10, 3, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (41, N'Bagdarin
', 11, 4, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (42, N'Gusinoozyorsk
', 11, 4, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (43, N'Kyakhta
', 11, 4, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (44, N'Taksimo
', 11, 4, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (45, N'Cherlak
', 12, 4, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (46, N'Isikul
', 12, 4, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (47, N'Kalachinsk
', 12, 4, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (48, N'Nazyvayevsk
', 12, 4, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (49, N'Bataysk
', 13, 4, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (50, N'Belaya Kalitva
', 13, 4, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (51, N'Millerovo
', 13, 4, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (52, N'Shakhty
', 13, 4, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (53, N'Bad Homburg', 13, 4, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (54, N'Darmstadt', 13, 4, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (55, N'Frankfurt am Main', 13, 4, N'N')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (56, N'EastBerlin', 14, 5, N'Y')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (57, N'WestBerlin', 14, 5, N'Y')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (58, N'NorthBerlin', 14, 5, N'Y')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (59, N'Leipzig', 15, 5, N'Y')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (60, N'Freiberg', 15, 5, N'Y')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (61, N'Bautzen', 15, 5, N'Y')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (62, N'Grolland', 16, 5, N'Y')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (63, N'Huchten', 16, 5, N'Y')
INSERT [dbo].[City] ([CityId], [CityName], [StateId], [CountryId], [IsDelete]) VALUES (64, N'Lesumbrok', 16, 5, N'Y')
GO
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsDelete]) VALUES (1, N'India', N'N')
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsDelete]) VALUES (2, N'China', N'N')
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsDelete]) VALUES (3, N'UnitedStates', N'N')
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsDelete]) VALUES (4, N'Russian', N'N')
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsDelete]) VALUES (5, N'Germany', N'Y')
GO
INSERT [dbo].[ServiceRequestTbl] ([ServiceRequestId], [FirstName], [LastName], [MobileNo], [Email], [EnquiryPurpose], [Comments], [CreatedDate], [CreatedBy], [ModifyDate], [ModifiedBy], [IsDelete]) VALUES (1, N'Nisarg', N'Prajapati', 9104721172, N'Nisarg.Prajapati@synoverg.com', N'Cariour', N'<p>Need to Apply For .net.</p>
', NULL, NULL, CAST(N'2022-11-18T15:42:15.483' AS DateTime), N'dbo', NULL)
INSERT [dbo].[ServiceRequestTbl] ([ServiceRequestId], [FirstName], [LastName], [MobileNo], [Email], [EnquiryPurpose], [Comments], [CreatedDate], [CreatedBy], [ModifyDate], [ModifiedBy], [IsDelete]) VALUES (2, N'Mitesh', N'Gadhiya', 9124578528, N'Mitesh.Gadhiya@synoverg.com', N'Interview', N'<p>Interview at 2:00 AM</p>
', NULL, NULL, CAST(N'2022-11-18T12:53:56.037' AS DateTime), N'dbo', NULL)
INSERT [dbo].[ServiceRequestTbl] ([ServiceRequestId], [FirstName], [LastName], [MobileNo], [Email], [EnquiryPurpose], [Comments], [CreatedDate], [CreatedBy], [ModifyDate], [ModifiedBy], [IsDelete]) VALUES (3, N'Narendra', N'Modi', 9104865794, N'pm@india.com', N'Interview', N'<p>Research for special one</p>
', NULL, NULL, CAST(N'2022-11-18T12:53:42.833' AS DateTime), N'dbo', NULL)
INSERT [dbo].[ServiceRequestTbl] ([ServiceRequestId], [FirstName], [LastName], [MobileNo], [Email], [EnquiryPurpose], [Comments], [CreatedDate], [CreatedBy], [ModifyDate], [ModifiedBy], [IsDelete]) VALUES (4, N'Test', N'User', 9106985794, N'User@Test.com', N'Cariour', N'Apply for PHP', NULL, NULL, CAST(N'2022-11-17T14:24:45.917' AS DateTime), N'dbo', NULL)
INSERT [dbo].[ServiceRequestTbl] ([ServiceRequestId], [FirstName], [LastName], [MobileNo], [Email], [EnquiryPurpose], [Comments], [CreatedDate], [CreatedBy], [ModifyDate], [ModifiedBy], [IsDelete]) VALUES (5, N'Rutvik', N'Shah', 9134978594, N'Rutvik.Shah@gmail.com', N'Cariour', N'<p>Apply for Python</p>
', CAST(N'2022-10-12T16:41:15.940' AS DateTime), N'dbo', CAST(N'2022-11-18T12:55:53.407' AS DateTime), N'dbo', NULL)
INSERT [dbo].[ServiceRequestTbl] ([ServiceRequestId], [FirstName], [LastName], [MobileNo], [Email], [EnquiryPurpose], [Comments], [CreatedDate], [CreatedBy], [ModifyDate], [ModifiedBy], [IsDelete]) VALUES (6, N'Rutvi', N'Shah', 9756131683, N'Rutvi.Shah@gmail.com', N'Interview', N'<p>Appley for React</p>
', CAST(N'2022-10-12T16:43:46.210' AS DateTime), N'dbo', CAST(N'2022-11-18T12:56:17.943' AS DateTime), N'dbo', NULL)
INSERT [dbo].[ServiceRequestTbl] ([ServiceRequestId], [FirstName], [LastName], [MobileNo], [Email], [EnquiryPurpose], [Comments], [CreatedDate], [CreatedBy], [ModifyDate], [ModifiedBy], [IsDelete]) VALUES (7, N'Test', N'User', 9106985794, N'User@Test.com', N'Cariour', N'Apply for PHP', CAST(N'2022-10-12T00:00:00.000' AS DateTime), N'dbo', CAST(N'2022-10-31T11:30:49.100' AS DateTime), N'dbo', NULL)
INSERT [dbo].[ServiceRequestTbl] ([ServiceRequestId], [FirstName], [LastName], [MobileNo], [Email], [EnquiryPurpose], [Comments], [CreatedDate], [CreatedBy], [ModifyDate], [ModifiedBy], [IsDelete]) VALUES (11, N'Dhaval', N'Faldu', 8654794125, N'faldu@gmail.com', N'Interview', N'Applay for .net', CAST(N'2022-10-12T18:57:11.217' AS DateTime), N'dbo', CAST(N'2022-10-18T11:09:33.047' AS DateTime), N'dbo', NULL)
INSERT [dbo].[ServiceRequestTbl] ([ServiceRequestId], [FirstName], [LastName], [MobileNo], [Email], [EnquiryPurpose], [Comments], [CreatedDate], [CreatedBy], [ModifyDate], [ModifiedBy], [IsDelete]) VALUES (12, N'mitesh', N'Gadhya', 864578956, N'mitesh@gmail.com', N'Cariour', N'hi need a job', CAST(N'2022-10-12T18:58:23.000' AS DateTime), N'dbo', CAST(N'2022-10-18T12:19:52.653' AS DateTime), N'dbo', NULL)
INSERT [dbo].[ServiceRequestTbl] ([ServiceRequestId], [FirstName], [LastName], [MobileNo], [Email], [EnquiryPurpose], [Comments], [CreatedDate], [CreatedBy], [ModifyDate], [ModifiedBy], [IsDelete]) VALUES (13, N'John', N'unknown', 9104781178, N'john@myworld.com', N'Cariour', N'expert in all stufs', CAST(N'2022-10-12T18:59:26.073' AS DateTime), N'dbo', CAST(N'2022-10-31T10:45:08.297' AS DateTime), N'dbo', NULL)
INSERT [dbo].[ServiceRequestTbl] ([ServiceRequestId], [FirstName], [LastName], [MobileNo], [Email], [EnquiryPurpose], [Comments], [CreatedDate], [CreatedBy], [ModifyDate], [ModifiedBy], [IsDelete]) VALUES (14, N'aryan', N'patel', 8745921643, N'aryan@gmail.com', N'Cariour', N'need to apply in .net ...', CAST(N'2022-10-12T19:02:13.290' AS DateTime), N'dbo', CAST(N'2022-10-31T10:47:11.267' AS DateTime), N'dbo', NULL)
INSERT [dbo].[ServiceRequestTbl] ([ServiceRequestId], [FirstName], [LastName], [MobileNo], [Email], [EnquiryPurpose], [Comments], [CreatedDate], [CreatedBy], [ModifyDate], [ModifiedBy], [IsDelete]) VALUES (16, N'Jay', N'Thakkar', 957861234, N'Jay@gmail.com', N'Cariour', N'Need to Apply For python', CAST(N'2022-10-12T19:03:18.533' AS DateTime), N'dbo', CAST(N'2022-10-31T10:50:14.840' AS DateTime), N'dbo', NULL)
INSERT [dbo].[ServiceRequestTbl] ([ServiceRequestId], [FirstName], [LastName], [MobileNo], [Email], [EnquiryPurpose], [Comments], [CreatedDate], [CreatedBy], [ModifyDate], [ModifiedBy], [IsDelete]) VALUES (17, N'Dhaval', N'Faldu', 9487561257, N'dhaval@gmail.com ', N'Interview', N'available at 5:00 pm', CAST(N'2022-10-17T18:29:43.380' AS DateTime), N'dbo', CAST(N'2022-10-31T10:51:25.620' AS DateTime), N'dbo', NULL)
INSERT [dbo].[ServiceRequestTbl] ([ServiceRequestId], [FirstName], [LastName], [MobileNo], [Email], [EnquiryPurpose], [Comments], [CreatedDate], [CreatedBy], [ModifyDate], [ModifiedBy], [IsDelete]) VALUES (18, N'rahul', N'gandhi', 8645123795, N'rahul.gamdhi@congress.com', N'Cariour', N'shift in bjp', CAST(N'2022-10-17T18:35:35.447' AS DateTime), N'dbo', NULL, NULL, NULL)
INSERT [dbo].[ServiceRequestTbl] ([ServiceRequestId], [FirstName], [LastName], [MobileNo], [Email], [EnquiryPurpose], [Comments], [CreatedDate], [CreatedBy], [ModifyDate], [ModifiedBy], [IsDelete]) VALUES (19, N'rahul', N'gandhi', 8645123795, N'rahul.gamdhi@congress.com', N'Cariour', N'shift in bjp', CAST(N'2022-10-17T18:46:16.210' AS DateTime), N'dbo', NULL, NULL, NULL)
INSERT [dbo].[ServiceRequestTbl] ([ServiceRequestId], [FirstName], [LastName], [MobileNo], [Email], [EnquiryPurpose], [Comments], [CreatedDate], [CreatedBy], [ModifyDate], [ModifiedBy], [IsDelete]) VALUES (20, N'rahul', N'gandhi', 8645123795, N'rahul.gandhi@congress.com', N'Cariour', N'shift in bjp', CAST(N'2022-10-17T18:47:01.397' AS DateTime), N'dbo', CAST(N'2022-10-31T10:51:42.720' AS DateTime), N'dbo', NULL)
INSERT [dbo].[ServiceRequestTbl] ([ServiceRequestId], [FirstName], [LastName], [MobileNo], [Email], [EnquiryPurpose], [Comments], [CreatedDate], [CreatedBy], [ModifyDate], [ModifiedBy], [IsDelete]) VALUES (23, N'nitish', N'patel', 8647954123, N'rahul.gamdhi@bjp.com', N'Interview', N'Want to shift in bjp', CAST(N'2022-10-17T18:53:38.097' AS DateTime), N'dbo', CAST(N'2022-10-31T10:56:18.957' AS DateTime), N'dbo', NULL)
INSERT [dbo].[ServiceRequestTbl] ([ServiceRequestId], [FirstName], [LastName], [MobileNo], [Email], [EnquiryPurpose], [Comments], [CreatedDate], [CreatedBy], [ModifyDate], [ModifiedBy], [IsDelete]) VALUES (24, N'John', N'Abhram', 9457861234, N'john.abhram@hero.com', N'Cariour', N'want to make Oscar winning new movie', CAST(N'2022-10-17T19:03:40.383' AS DateTime), N'dbo', CAST(N'2022-10-18T12:48:35.840' AS DateTime), N'dbo', NULL)
INSERT [dbo].[ServiceRequestTbl] ([ServiceRequestId], [FirstName], [LastName], [MobileNo], [Email], [EnquiryPurpose], [Comments], [CreatedDate], [CreatedBy], [ModifyDate], [ModifiedBy], [IsDelete]) VALUES (32, N'Rahul', N'Gandhi', 9104721172, N'rahul.gandhi.congress.com', N'Interview', N'Want to shift in bjp', CAST(N'2022-10-21T14:51:43.637' AS DateTime), N'dbo', CAST(N'2022-10-31T11:17:18.250' AS DateTime), N'dbo', NULL)
INSERT [dbo].[ServiceRequestTbl] ([ServiceRequestId], [FirstName], [LastName], [MobileNo], [Email], [EnquiryPurpose], [Comments], [CreatedDate], [CreatedBy], [ModifyDate], [ModifiedBy], [IsDelete]) VALUES (33, N'manish', N'gandhi', 1235467890, N'rahul.gamdhi.congress.com', N'Interview', N'<p>hi need a job for.</p>
', CAST(N'2022-10-21T17:22:45.923' AS DateTime), N'dbo', CAST(N'2022-11-18T15:49:30.290' AS DateTime), N'dbo', NULL)
INSERT [dbo].[ServiceRequestTbl] ([ServiceRequestId], [FirstName], [LastName], [MobileNo], [Email], [EnquiryPurpose], [Comments], [CreatedDate], [CreatedBy], [ModifyDate], [ModifiedBy], [IsDelete]) VALUES (100, N'manish', N'patel', 9741258874, N'manish.patel@google.com', N'hi', N'', CAST(N'2022-11-18T16:25:14.013' AS DateTime), N'dbo', NULL, NULL, NULL)
INSERT [dbo].[ServiceRequestTbl] ([ServiceRequestId], [FirstName], [LastName], [MobileNo], [Email], [EnquiryPurpose], [Comments], [CreatedDate], [CreatedBy], [ModifyDate], [ModifiedBy], [IsDelete]) VALUES (101, N'manish', N'patel', 9104721172, N'manish.patel@gmail.com', N'Cariour', N'<p>hi</p>
', CAST(N'2022-11-18T16:26:46.233' AS DateTime), N'dbo', NULL, NULL, NULL)
GO
INSERT [dbo].[State] ([StateId], [StateName], [CountryId], [IsDelete]) VALUES (1, N'Gujarat', 1, N'N')
INSERT [dbo].[State] ([StateId], [StateName], [CountryId], [IsDelete]) VALUES (2, N'Rajasthan', 1, N'N')
INSERT [dbo].[State] ([StateId], [StateName], [CountryId], [IsDelete]) VALUES (3, N'Punjab', 1, N'N')
INSERT [dbo].[State] ([StateId], [StateName], [CountryId], [IsDelete]) VALUES (4, N'Bihar', 1, N'N')
INSERT [dbo].[State] ([StateId], [StateName], [CountryId], [IsDelete]) VALUES (5, N'Beijing', 2, N'N')
INSERT [dbo].[State] ([StateId], [StateName], [CountryId], [IsDelete]) VALUES (6, N'Chengdu', 2, N'N')
INSERT [dbo].[State] ([StateId], [StateName], [CountryId], [IsDelete]) VALUES (7, N'Chongqing', 2, N'N')
INSERT [dbo].[State] ([StateId], [StateName], [CountryId], [IsDelete]) VALUES (8, N'Alabama', 3, N'N')
INSERT [dbo].[State] ([StateId], [StateName], [CountryId], [IsDelete]) VALUES (9, N'Colorado', 3, N'N')
INSERT [dbo].[State] ([StateId], [StateName], [CountryId], [IsDelete]) VALUES (10, N'New Jersey', 3, N'N')
INSERT [dbo].[State] ([StateId], [StateName], [CountryId], [IsDelete]) VALUES (11, N'Buryat', 4, N'N')
INSERT [dbo].[State] ([StateId], [StateName], [CountryId], [IsDelete]) VALUES (12, N'Omsk', 4, N'N')
INSERT [dbo].[State] ([StateId], [StateName], [CountryId], [IsDelete]) VALUES (13, N'Rostov', 4, N'N')
INSERT [dbo].[State] ([StateId], [StateName], [CountryId], [IsDelete]) VALUES (14, N'Berlin', 5, N'Y')
INSERT [dbo].[State] ([StateId], [StateName], [CountryId], [IsDelete]) VALUES (15, N'Sachsen', 5, N'Y')
INSERT [dbo].[State] ([StateId], [StateName], [CountryId], [IsDelete]) VALUES (16, N'Bremen', 5, N'Y')
GO
SET IDENTITY_INSERT [dbo].[UsersTbl] ON 

INSERT [dbo].[UsersTbl] ([UserDetailsId], [Username], [Password], [Dob], [ContactNo], [Gender], [CreatedDate]) VALUES (1, N'Nisarg@gmail.com', N'nisarg12345', N'14/08/1997', N'9104721172', N'Male', NULL)
INSERT [dbo].[UsersTbl] ([UserDetailsId], [Username], [Password], [Dob], [ContactNo], [Gender], [CreatedDate]) VALUES (2, N'Rutvik', N'rutvik12345', N'20/05/1991', N'7548725966', N'Male', CAST(N'2022-10-19T12:05:39.137' AS DateTime))
INSERT [dbo].[UsersTbl] ([UserDetailsId], [Username], [Password], [Dob], [ContactNo], [Gender], [CreatedDate]) VALUES (3, N'Jaclsparrow@mymail.com', N'jack12345', N'14/08/1997', N'9104721172', N'Male', CAST(N'2022-10-19T12:41:29.883' AS DateTime))
INSERT [dbo].[UsersTbl] ([UserDetailsId], [Username], [Password], [Dob], [ContactNo], [Gender], [CreatedDate]) VALUES (4, N'test.gmail.com', N'nisarg', N'14/08/1997', N'9104721172', N'Male', CAST(N'2022-10-21T11:53:27.167' AS DateTime))
INSERT [dbo].[UsersTbl] ([UserDetailsId], [Username], [Password], [Dob], [ContactNo], [Gender], [CreatedDate]) VALUES (5, N'test.gmail.com', N'nisarg', N'14/08/1997', N'9104721172', N'Male', CAST(N'2022-10-21T11:54:47.710' AS DateTime))
INSERT [dbo].[UsersTbl] ([UserDetailsId], [Username], [Password], [Dob], [ContactNo], [Gender], [CreatedDate]) VALUES (6, N'test.gmail.com', N'nisarg', N'14/08/1997', N'9104721172', N'Male', CAST(N'2022-10-21T11:55:10.080' AS DateTime))
INSERT [dbo].[UsersTbl] ([UserDetailsId], [Username], [Password], [Dob], [ContactNo], [Gender], [CreatedDate]) VALUES (7, N'test.gmail.com', N'nisarg', N'14/08/1997', N'9104721172', N'Male', CAST(N'2022-10-21T12:02:30.320' AS DateTime))
INSERT [dbo].[UsersTbl] ([UserDetailsId], [Username], [Password], [Dob], [ContactNo], [Gender], [CreatedDate]) VALUES (8, N'test.gmail.com', N'nisarg', N'14/08/1997', N'9104721172', N'Male', CAST(N'2022-10-21T12:03:50.950' AS DateTime))
SET IDENTITY_INSERT [dbo].[UsersTbl] OFF
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Country]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([StateId])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_State]
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_Country]
GO
/****** Object:  StoredProcedure [dbo].[AddServiceRequest]    Script Date: 25-11-2022 13:16:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddServiceRequest]
(
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @MobileNo bigint,
    @Email VARCHAR(50),
	@EnquiryPurpose VARCHAR(20),
    @Comments VARCHAR(MAX),
	@CreatedBy VARCHAR(50),
	@CreatedDate Date
)
as
Begin
    Insert into ServiceRequestTbl (ServiceRequestId,FirstName,LastName,MobileNo,Email,EnquiryPurpose,Comments,CreatedBy,CreatedDate)
    Values (NEXT VALUE FOR ServiceRequestSeq,@FirstName,@LastName,@MobileNo,@Email,@EnquiryPurpose,@Comments,CURRENT_USER,CURRENT_TIMESTAMP)
End
GO
/****** Object:  StoredProcedure [dbo].[DeleteCountry]    Script Date: 25-11-2022 13:16:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCountry]
(
	@CountryId int
)
AS
BEGIN
   UPDATE Country 
	SET IsDelete = 'Y'
	WHERE CountryId = @CountryId

   UPDATE State 
	SET IsDelete = 'Y'
	WHERE CountryId = @CountryId

   UPDATE City 
	SET IsDelete = 'Y'
	WHERE CountryId = @CountryId
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteServiceRequest]    Script Date: 25-11-2022 13:16:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[DeleteServiceRequest]
(
   @ServiceRequestId int        
)
as
begin
   Delete from ServiceRequestTbl where ServiceRequestId=@ServiceRequestId
End
GO
/****** Object:  StoredProcedure [dbo].[FetchUser]    Script Date: 25-11-2022 13:16:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FetchUser] 
	-- Add the parameters for the stored procedure here
(
	@Username nvarchar(50),
	@Password nvarchar(50)
)
AS
BEGIN
	
    -- Insert statements for procedure here
	select * from UsersTbl where Username=@Username And Password=@Password
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllCityByState]    Script Date: 25-11-2022 13:16:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllCityByState]
(
@StateId int,
@CountryId int
)
AS
BEGIN
   select
		City.StateId,
        City.CountryId,
        City.CityName
    from City
    Left JOIN State ON City.CityId = State.StateId
    where City.StateId = @StateId And City.CountryId = @CountryId And City.IsDelete = 'N'
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllLocations]    Script Date: 25-11-2022 13:16:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllLocations]
--(
--@TABLENAME varchar(20),
--@CountryId int = null,
--@StateId int = null
--)
AS
BEGIN

--select * from Country
--select * from State
--select * from City

	--IF(@TABLENAME = 'Country')
	--BEGIN
	--	select 
	--	CountryName,
	--	CountryId
	--	from Country Where IsDelete = 'N'
	--END
	--ELSE IF(@TABLENAME = 'State')
	--BEGIN
	--	select 
	--	StateId,
	--	StateName
	--	from State 
	--	Where CountryId = @CountryId And IsDelete = 'N'
	--END
	--ELSE
	--BEGIN
	--	SELECT 
	--	CityName
	--	FROM City 
	--	Where StateId = 1 And IsDelete = 'N'
	--END

   --select
   --     Country.CountryName,
   --     State.StateName,
   --     City.CityName
   -- from City

   --LEFT JOIN State ON City.CityId = State.StateId
   -- LEFT JOIN Country ON City.CityId = Country.CountryId

   --where City.CountryId = 1 And Country.IsDelete = 'N'
   
    select
        Country.CountryName,
        Country.CountryId,
        State.StateName,
        State.StateId,
        City.CityName
    from City
    --Left JOIN City ON Country.CountryId = City.CityId
    LEFT JOIN State ON City.CityId = State.StateId
    LEFT JOIN Country ON City.CityId = Country.CountryId
	   
	where City.CountryId = 1 And City.StateId = 1 And Country.IsDelete = 'N'
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllServiceRequest]    Script Date: 25-11-2022 13:16:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetAllServiceRequest]
as
Begin
    select *
    from ServiceRequestTbl
End
GO
/****** Object:  StoredProcedure [dbo].[GetAllStateByCountry]    Script Date: 25-11-2022 13:16:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllStateByCountry]
(
 @CompanyId int
)
AS
BEGIN
   select
        State.CountryId,
        State.StateId,
        State.StateName
    from State
    Left JOIN Country ON State.StateId = Country.CountryId
    where State.CountryId = @CompanyId And State.IsDelete = 'N'
END
GO
/****** Object:  StoredProcedure [dbo].[GetByServiceRequestId]    Script Date: 25-11-2022 13:16:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[GetByServiceRequestId]
(
   @ServiceRequestId int        
)
as
Begin
    select * from ServiceRequestTbl
    where ServiceRequestId=@ServiceRequestId
End
GO
/****** Object:  StoredProcedure [dbo].[UpdateServiceRequest]    Script Date: 25-11-2022 13:16:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateServiceRequest]
(
	@ServiceRequestId Int,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @MobileNo bigint,
    @Email VARCHAR(50),
	@EnquiryPurpose VARCHAR(20),
    @Comments VARCHAR(MAX),
    @ModifiedBy VARCHAR(50),
    @ModifyDate Datetime
)
as
Begin
    Update ServiceRequestTbl
	set FirstName=@FirstName,
	LastName=@LastName,
	MobileNo=@MobileNo,
	Email=@Email,
	EnquiryPurpose=@EnquiryPurpose,
	Comments=@Comments,
	ModifiedBy=CURRENT_USER,
	ModifyDate=CURRENT_TIMESTAMP
	where ServiceRequestId=@ServiceRequestId 
End
GO
/****** Object:  StoredProcedure [dbo].[UserDetails]    Script Date: 25-11-2022 13:16:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UserDetails] 
	-- Add the parameters for the stored procedure here
	@Username NVARCHAR(Max),
    @Password NVARCHAR(Max),
    @Dob NVARCHAR(50),
    @ContactNo NVARCHAR(50),
	@Gender NVARCHAR(50),
	@CreatedDate DateTime
AS
BEGIN
	set identity_insert UsersTbl on;
	Insert into UsersTbl(UserDetailsId,Username,Password,Dob,ContactNo,Gender,CreatedDate)
    Values (NEXT VALUE FOR UsersDetailsSeq,@Username,@Password,@Dob,@ContactNo,@Gender,CURRENT_TIMESTAMP)
END
GO
USE [master]
GO
ALTER DATABASE [MyApp] SET  READ_WRITE 
GO

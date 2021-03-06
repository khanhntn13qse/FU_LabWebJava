USE [master]
GO
/****** Object:  Database [photographer]    Script Date: 4/27/2020 9:47:38 AM ******/
CREATE DATABASE [photographer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'photographer', FILENAME = N'absolute_path\photographer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'photographer_log', FILENAME = N'absolute_path\photographer_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [photographer] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [photographer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [photographer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [photographer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [photographer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [photographer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [photographer] SET ARITHABORT OFF 
GO
ALTER DATABASE [photographer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [photographer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [photographer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [photographer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [photographer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [photographer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [photographer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [photographer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [photographer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [photographer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [photographer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [photographer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [photographer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [photographer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [photographer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [photographer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [photographer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [photographer] SET RECOVERY FULL 
GO
ALTER DATABASE [photographer] SET  MULTI_USER 
GO
ALTER DATABASE [photographer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [photographer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [photographer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [photographer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [photographer] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'photographer', N'ON'
GO
ALTER DATABASE [photographer] SET QUERY_STORE = OFF
GO
USE [photographer]
GO
/****** Object:  User [saa]    Script Date: 4/27/2020 9:47:38 AM ******/
CREATE USER [saa] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 4/27/2020 9:47:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](300) NULL,
	[address] [nvarchar](300) NULL,
	[city] [nvarchar](300) NULL,
	[country] [nvarchar](300) NULL,
	[telephone] [nvarchar](300) NULL,
	[email] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gallery]    Script Date: 4/27/2020 9:47:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gallery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](300) NULL,
	[description] [nvarchar](max) NULL,
	[photo] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IntroPost]    Script Date: 4/27/2020 9:47:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IntroPost](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](300) NULL,
	[photo] [varchar](100) NULL,
	[about_me] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Photo]    Script Date: 4/27/2020 9:47:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image] [varchar](200) NULL,
	[title] [nvarchar](max) NULL,
	[gallery_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([id], [title], [address], [city], [country], [telephone], [email]) VALUES (1, N'PHOTOGRAPHER', N'FPTU Thach Hoa, Thach That', N'HN', N'Viet Nam', N'12345', N'khanhntn@fpt.edu.vn')
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[Gallery] ON 

INSERT [dbo].[Gallery] ([id], [name], [description], [photo]) VALUES (1, N'Gallery 1', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation', N'og2.jpg')
INSERT [dbo].[Gallery] ([id], [name], [description], [photo]) VALUES (2, N'Gallery 2', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation', N'og1.jpg')
INSERT [dbo].[Gallery] ([id], [name], [description], [photo]) VALUES (3, N'Gallery 3', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation', N'og3.jpg')
SET IDENTITY_INSERT [dbo].[Gallery] OFF
GO
SET IDENTITY_INSERT [dbo].[IntroPost] ON 

INSERT [dbo].[IntroPost] ([id], [title], [photo], [about_me]) VALUES (1, N'The quick brown fox jumps over the lazy dog', N'intro_1.jpg', N'About me
Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim')
SET IDENTITY_INSERT [dbo].[IntroPost] OFF
GO
SET IDENTITY_INSERT [dbo].[Photo] ON 

INSERT [dbo].[Photo] ([id], [image], [title], [gallery_id]) VALUES (1, N'g1.jpg', N'This is a photo', 1)
INSERT [dbo].[Photo] ([id], [image], [title], [gallery_id]) VALUES (2, N'c1.jpg', N'This is a person', 2)
INSERT [dbo].[Photo] ([id], [image], [title], [gallery_id]) VALUES (3, N'd1.jpg', N'Description for photo', 3)
INSERT [dbo].[Photo] ([id], [image], [title], [gallery_id]) VALUES (8, N'g2.jpg', N'Someone at somewhere', 1)
INSERT [dbo].[Photo] ([id], [image], [title], [gallery_id]) VALUES (9, N'c2.jpg', NULL, 2)
INSERT [dbo].[Photo] ([id], [image], [title], [gallery_id]) VALUES (10, N'd2.jpg', N'This is a photo', 3)
INSERT [dbo].[Photo] ([id], [image], [title], [gallery_id]) VALUES (11, N'g3.jpg', N'This is a person', 1)
INSERT [dbo].[Photo] ([id], [image], [title], [gallery_id]) VALUES (12, N'c3.jpg', N'Description for photo', 2)
INSERT [dbo].[Photo] ([id], [image], [title], [gallery_id]) VALUES (13, N'd3.jpg', N'This is a person', 3)
INSERT [dbo].[Photo] ([id], [image], [title], [gallery_id]) VALUES (14, N'g4.jpg', NULL, 1)
INSERT [dbo].[Photo] ([id], [image], [title], [gallery_id]) VALUES (15, N'c4.jpg', N'This is a photo', 2)
INSERT [dbo].[Photo] ([id], [image], [title], [gallery_id]) VALUES (16, N'd4.jpg', N'This is a person', 3)
INSERT [dbo].[Photo] ([id], [image], [title], [gallery_id]) VALUES (17, N'g5.jpg', N'Description for photo', 1)
INSERT [dbo].[Photo] ([id], [image], [title], [gallery_id]) VALUES (18, N'c5.jpg', N'This is a person', 2)
INSERT [dbo].[Photo] ([id], [image], [title], [gallery_id]) VALUES (19, N'd5.jpg', N'This is a photo', 3)
INSERT [dbo].[Photo] ([id], [image], [title], [gallery_id]) VALUES (20, N'g6.jpg', N'Description for photo', 1)
INSERT [dbo].[Photo] ([id], [image], [title], [gallery_id]) VALUES (21, N'c6.jpg', N'This is a photo', 2)
INSERT [dbo].[Photo] ([id], [image], [title], [gallery_id]) VALUES (22, N'd6.jpg', N'This is a person', 3)
INSERT [dbo].[Photo] ([id], [image], [title], [gallery_id]) VALUES (23, N'g7.jpg', N'This is a photo', 1)
INSERT [dbo].[Photo] ([id], [image], [title], [gallery_id]) VALUES (24, N'c7.jpg', N'This is a photo', 2)
INSERT [dbo].[Photo] ([id], [image], [title], [gallery_id]) VALUES (25, N'd7.jpg', N'This is a person', 3)
INSERT [dbo].[Photo] ([id], [image], [title], [gallery_id]) VALUES (26, N'g8.jpg', N'This is a photo', 1)
INSERT [dbo].[Photo] ([id], [image], [title], [gallery_id]) VALUES (27, N'c8.jpg', N'Description for photo', 2)
INSERT [dbo].[Photo] ([id], [image], [title], [gallery_id]) VALUES (28, N'd8.jpg', N'This is a person', 3)
SET IDENTITY_INSERT [dbo].[Photo] OFF
GO
ALTER TABLE [dbo].[Photo]  WITH CHECK ADD  CONSTRAINT [FK_Photo_Gallery] FOREIGN KEY([gallery_id])
REFERENCES [dbo].[Gallery] ([id])
GO
ALTER TABLE [dbo].[Photo] CHECK CONSTRAINT [FK_Photo_Gallery]
GO
USE [master]
GO
ALTER DATABASE [photographer] SET  READ_WRITE 
GO

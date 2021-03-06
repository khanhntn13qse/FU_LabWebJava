USE [master]
GO
/****** Object:  Database [onlinequiz]    Script Date: 4/27/2020 9:14:43 AM ******/
CREATE DATABASE [onlinequiz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'onlinequiz', FILENAME = N'absolute_path\onlinequiz.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'onlinequiz_log', FILENAME = N'absolute_path\onlinequiz_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [onlinequiz] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [onlinequiz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [onlinequiz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [onlinequiz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [onlinequiz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [onlinequiz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [onlinequiz] SET ARITHABORT OFF 
GO
ALTER DATABASE [onlinequiz] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [onlinequiz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [onlinequiz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [onlinequiz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [onlinequiz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [onlinequiz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [onlinequiz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [onlinequiz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [onlinequiz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [onlinequiz] SET  DISABLE_BROKER 
GO
ALTER DATABASE [onlinequiz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [onlinequiz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [onlinequiz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [onlinequiz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [onlinequiz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [onlinequiz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [onlinequiz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [onlinequiz] SET RECOVERY FULL 
GO
ALTER DATABASE [onlinequiz] SET  MULTI_USER 
GO
ALTER DATABASE [onlinequiz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [onlinequiz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [onlinequiz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [onlinequiz] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [onlinequiz] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'onlinequiz', N'ON'
GO
ALTER DATABASE [onlinequiz] SET QUERY_STORE = OFF
GO
USE [onlinequiz]
GO
/****** Object:  User [saa]    Script Date: 4/27/2020 9:14:43 AM ******/
CREATE USER [saa] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[question]    Script Date: 4/27/2020 9:14:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[answer] [nvarchar](max) NOT NULL,
	[created] [date] NULL,
	[opt1] [nvarchar](max) NOT NULL,
	[opt2] [nvarchar](max) NOT NULL,
	[opt3] [nvarchar](max) NOT NULL,
	[opt4] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_question] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quizHistory]    Script Date: 4/27/2020 9:14:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quizHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[studentId] [int] NOT NULL,
	[numOfQuiz] [int] NOT NULL,
	[correctAnswer] [int] NOT NULL,
 CONSTRAINT [PK_quizHistory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 4/27/2020 9:14:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](max) NOT NULL,
	[email] [varchar](max) NOT NULL,
	[type] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[question] ON 

INSERT [dbo].[question] ([id], [content], [answer], [created], [opt1], [opt2], [opt3], [opt4]) VALUES (3, N'3-1', N'2', CAST(N'2020-04-23' AS Date), N'1', N'2', N'3', N'4')
INSERT [dbo].[question] ([id], [content], [answer], [created], [opt1], [opt2], [opt3], [opt4]) VALUES (4, N'1-2', N'4', CAST(N'2020-04-23' AS Date), N'123', N'1', N'0', N'-1')
INSERT [dbo].[question] ([id], [content], [answer], [created], [opt1], [opt2], [opt3], [opt4]) VALUES (6, N'10 + 2', N'3', CAST(N'2020-04-23' AS Date), N'11', N'13', N'12', N'15')
INSERT [dbo].[question] ([id], [content], [answer], [created], [opt1], [opt2], [opt3], [opt4]) VALUES (7, N'1-3', N'1', CAST(N'2020-04-23' AS Date), N'-2', N'1', N'2', N'-1')
INSERT [dbo].[question] ([id], [content], [answer], [created], [opt1], [opt2], [opt3], [opt4]) VALUES (8, N'2-5', N'1', CAST(N'2020-04-24' AS Date), N'-3', N'-2', N'2', N'3')
INSERT [dbo].[question] ([id], [content], [answer], [created], [opt1], [opt2], [opt3], [opt4]) VALUES (9, N'5000 - 2000', N'34', CAST(N'2020-04-25' AS Date), N'1000', N'7000', N'3000', N'2000 + 1000')
INSERT [dbo].[question] ([id], [content], [answer], [created], [opt1], [opt2], [opt3], [opt4]) VALUES (10, N'5000 + 2000', N'14', CAST(N'2020-04-25' AS Date), N'7000', N'3000', N'4000', N'1000 + 6000')
INSERT [dbo].[question] ([id], [content], [answer], [created], [opt1], [opt2], [opt3], [opt4]) VALUES (11, N'20 + 2', N'24', CAST(N'2020-04-25' AS Date), N'202', N'16+6', N'19+4', N'27-5')
INSERT [dbo].[question] ([id], [content], [answer], [created], [opt1], [opt2], [opt3], [opt4]) VALUES (12, N'1-3', N'13', CAST(N'2020-04-25' AS Date), N'-2', N'2+3', N'2-4', N'1+2')
SET IDENTITY_INSERT [dbo].[question] OFF
GO
SET IDENTITY_INSERT [dbo].[quizHistory] ON 

INSERT [dbo].[quizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (1, 1, 2, 2)
INSERT [dbo].[quizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (2, 1, 3, 0)
INSERT [dbo].[quizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (24, 1, 2, 2)
INSERT [dbo].[quizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (25, 3, 2, 2)
INSERT [dbo].[quizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (26, 3, 4, 0)
INSERT [dbo].[quizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (27, 3, 3, 3)
INSERT [dbo].[quizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (28, 1, 2, 1)
INSERT [dbo].[quizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (34, 3, 3, 3)
INSERT [dbo].[quizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (35, 3, 4, 4)
INSERT [dbo].[quizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (36, 1, 3, 2)
SET IDENTITY_INSERT [dbo].[quizHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [password], [email], [type]) VALUES (1, N'khanhntn', N'12345678', N'email@gmail.com', 1)
INSERT [dbo].[users] ([id], [username], [password], [email], [type]) VALUES (2, N'admin123', N'12345678', N'admin@gmail.com', 1)
INSERT [dbo].[users] ([id], [username], [password], [email], [type]) VALUES (3, N'student', N'123456', N'std@gmail.com', 0)
INSERT [dbo].[users] ([id], [username], [password], [email], [type]) VALUES (4, N'admin1', N'zxcvbn', N'admin1@gmail.com', 0)
INSERT [dbo].[users] ([id], [username], [password], [email], [type]) VALUES (5, N'admin12', N'123zxc', N'user@gmail.com', 1)
INSERT [dbo].[users] ([id], [username], [password], [email], [type]) VALUES (6, N'student2', N'zxcvbn', N'user2@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
USE [master]
GO
ALTER DATABASE [onlinequiz] SET  READ_WRITE 
GO

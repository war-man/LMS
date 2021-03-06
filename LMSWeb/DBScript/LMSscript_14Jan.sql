USE [master]
GO
/****** Object:  Database [LMSDB]    Script Date: 1/14/2020 9:21:56 PM ******/
CREATE DATABASE [LMSDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LMSDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LMSDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LMSDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LMSDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LMSDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LMSDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LMSDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LMSDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LMSDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LMSDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LMSDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LMSDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LMSDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LMSDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LMSDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LMSDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LMSDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LMSDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LMSDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LMSDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LMSDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LMSDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LMSDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LMSDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LMSDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LMSDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LMSDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LMSDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LMSDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LMSDB] SET  MULTI_USER 
GO
ALTER DATABASE [LMSDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LMSDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LMSDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LMSDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LMSDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LMSDB] SET QUERY_STORE = OFF
GO
USE [LMSDB]
GO
/****** Object:  User [IIS APPPOOL\DefaultAppPool]    Script Date: 1/14/2020 9:21:56 PM ******/
CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[tblAssignmentAndTracking]    Script Date: 1/14/2020 9:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAssignmentAndTracking](
	[trackingId] [int] IDENTITY(1,1) NOT NULL,
	[courseId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[assignedDate] [date] NULL,
	[validFrom] [date] NULL,
	[validTo] [date] NULL,
	[statusId] [int] NOT NULL,
	[createdBy] [int] NULL,
	[createdOn] [date] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_tblAssignmentAndTracking] PRIMARY KEY CLUSTERED 
(
	[trackingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCourses]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCourses](
	[courseId] [int] IDENTITY(1,1) NOT NULL,
	[courseName] [nvarchar](50) NOT NULL,
	[courseDetails] [nvarchar](250) NULL,
	[courseCategory] [nvarchar](50) NULL,
	[coursePath] [nvarchar](250) NULL,
	[isActive] [bit] NULL,
	[createdBy] [int] NULL,
	[createdOn] [date] NULL,
	[tenantId] [int] NOT NULL,
 CONSTRAINT [PK_tblCourses] PRIMARY KEY CLUSTERED 
(
	[courseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblErrorLog]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblErrorLog](
	[Logid] [bigint] IDENTITY(1,1) NOT NULL,
	[ExceptionMsg] [varchar](100) NULL,
	[ExceptionType] [varchar](100) NULL,
	[ExceptionSource] [nvarchar](max) NULL,
	[ExceptionURL] [varchar](100) NULL,
	[Logdate] [datetime] NULL,
 CONSTRAINT [PK_TblErrorLog] PRIMARY KEY CLUSTERED 
(
	[Logid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLog]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ErrorMessage] [ntext] NULL,
	[StackTrace] [ntext] NULL,
 CONSTRAINT [PK_tblError] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNotificationTemplates]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNotificationTemplates](
	[templateId] [int] IDENTITY(1,1) NOT NULL,
	[templateName] [nvarchar](50) NOT NULL,
	[templateSubject] [nvarchar](500) NOT NULL,
	[templateDescription] [ntext] NOT NULL,
	[isActive] [bit] NULL,
	[createdBy] [int] NULL,
	[createdOn] [date] NULL,
	[tenantId] [int] NULL,
 CONSTRAINT [PK_NotificationTemplates] PRIMARY KEY CLUSTERED 
(
	[templateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuestion]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuestion](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[QuizId] [int] NOT NULL,
	[QuestionTypeId] [int] NOT NULL,
	[QuestionText] [ntext] NOT NULL,
	[CorrectFeedback] [ntext] NULL,
	[InCorrectFeedback] [ntext] NULL,
 CONSTRAINT [PK_tblQuestion] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuestionOption]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuestionOption](
	[OptionId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[OptionText] [nvarchar](max) NOT NULL,
	[CorrectOption] [bit] NULL,
	[OptionFeedback] [ntext] NULL,
 CONSTRAINT [PK_tblQuestionOption] PRIMARY KEY CLUSTERED 
(
	[OptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuestionType]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuestionType](
	[QuestionTypeID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionTypeText] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_tblQuestionType] PRIMARY KEY CLUSTERED 
(
	[QuestionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuiz]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuiz](
	[QuizId] [int] IDENTITY(1,1) NOT NULL,
	[QuizName] [nvarchar](500) NOT NULL,
	[QuizDescription] [ntext] NULL,
	[TenantId] [int] NULL,
 CONSTRAINT [PK_tblQuiz] PRIMARY KEY CLUSTERED 
(
	[QuizId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuizAssignment]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuizAssignment](
	[QuizId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_tblQuizAssignment] PRIMARY KEY CLUSTERED 
(
	[QuizId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuizScore]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuizScore](
	[QuizId] [int] NOT NULL,
	[UserId] [nvarchar](100) NOT NULL,
	[Score] [numeric](18, 0) NOT NULL,
	[AttemptedDate] [datetime] NOT NULL,
	[Attempt] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblResetPassword]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblResetPassword](
	[emailId] [nvarchar](50) NULL,
	[token] [nvarchar](100) NULL,
	[dateCreated] [datetime] NULL,
	[isUsed] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblResponses]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblResponses](
	[ResponseId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[OptionIds] [nvarchar](100) NOT NULL,
	[QuestionFeedback] [ntext] NULL,
	[UserId] [int] NULL,
	[QuizId] [int] NOT NULL,
	[DateCreated] [date] NULL,
	[Attempt] [int] NULL,
 CONSTRAINT [PK_tblResponses] PRIMARY KEY CLUSTERED 
(
	[ResponseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[statusId] [int] NOT NULL,
	[statusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[statusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTenant]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTenant](
	[tenantId] [int] IDENTITY(1,1) NOT NULL,
	[tenantName] [nvarchar](50) NOT NULL,
	[tenantDomain] [nvarchar](50) NOT NULL,
	[activationFrom] [date] NULL,
	[activationTo] [date] NULL,
	[isActive] [bit] NULL,
	[createdBy] [int] NOT NULL,
	[createdOn] [date] NOT NULL,
	[noOfUserAllowed] [int] NULL,
	[Logo] [ntext] NULL,
 CONSTRAINT [PK_tblTenant] PRIMARY KEY CLUSTERED 
(
	[tenantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](50) NULL,
	[lastName] [nvarchar](50) NULL,
	[emailId] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[DOB] [date] NULL,
	[contactNo] [nvarchar](50) NULL,
	[isActive] [bit] NULL,
	[createdBy] [int] NOT NULL,
	[createdOn] [date] NULL,
	[tenantId] [int] NOT NULL,
	[roleId] [int] NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserRoles]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserRoles](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblUserRoles] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCourses] ON 

INSERT [dbo].[tblCourses] ([courseId], [courseName], [courseDetails], [courseCategory], [coursePath], [isActive], [createdBy], [createdOn], [tenantId]) VALUES (1, N'aaa', N'www', N'aaa', N'', 1, 5, CAST(N'2019-11-28' AS Date), 1)
SET IDENTITY_INSERT [dbo].[tblCourses] OFF
SET IDENTITY_INSERT [dbo].[TblErrorLog] ON 

INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (1, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.UserController.Index() in E:\Projects\LMS\LMSWeb\Controllers\UserController.cs:line 23', N'/User/Index', CAST(N'2020-01-13T19:04:29.600' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (2, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.ReportsController.Index() in E:\Projects\LMS\LMSWeb\Controllers\ReportsController.cs:line 26', N'/Reports/Index', CAST(N'2020-01-13T19:37:32.990' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (3, N'111', N'111', N'111', N'/Home', CAST(N'2020-01-14T00:53:27.717' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (4, N'222', N'222', N'222', N'/Home', CAST(N'2020-01-14T00:53:27.720' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (5, N'Don', N'Don', N'Don', N'/Home', CAST(N'2020-01-14T00:53:27.723' AS DateTime))
SET IDENTITY_INSERT [dbo].[TblErrorLog] OFF
SET IDENTITY_INSERT [dbo].[tblLog] ON 

INSERT [dbo].[tblLog] ([Id], [ErrorMessage], [StackTrace]) VALUES (1, N'Procedure or function TenantAdd has too many arguments specified.', N'   at LMSBL.Repository.DataRepository.ExecuteQuery(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 69
   at LMSBL.Repository.TenantRepository.AddTenant(TblTenant obj) in E:\Projects\LMS\LMSBL\Repository\TenantRepository.cs:line 89')
INSERT [dbo].[tblLog] ([Id], [ErrorMessage], [StackTrace]) VALUES (2, N'Object cannot be cast from DBNull to other types.', N'   at System.DBNull.System.IConvertible.ToDateTime(IFormatProvider provider)
   at System.Convert.ToDateTime(Object value)
   at LMSBL.Repository.UserRepository.<>c.<GetAllActiveUsers>b__4_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.UserRepository.GetAllActiveUsers(Int32 tenantId) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54')
INSERT [dbo].[tblLog] ([Id], [ErrorMessage], [StackTrace]) VALUES (3, N'Object cannot be cast from DBNull to other types.', N'   at System.DBNull.System.IConvertible.ToDateTime(IFormatProvider provider)
   at System.Convert.ToDateTime(Object value)
   at LMSBL.Repository.UserRepository.<>c.<GetAllActiveUsers>b__4_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.UserRepository.GetAllActiveUsers(Int32 tenantId) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54')
INSERT [dbo].[tblLog] ([Id], [ErrorMessage], [StackTrace]) VALUES (4, N'Object cannot be cast from DBNull to other types.', N'   at System.DBNull.System.IConvertible.ToDateTime(IFormatProvider provider)
   at System.Convert.ToDateTime(Object value)
   at LMSBL.Repository.UserRepository.<>c.<GetAllActiveUsers>b__4_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.UserRepository.GetAllActiveUsers(Int32 tenantId) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54')
INSERT [dbo].[tblLog] ([Id], [ErrorMessage], [StackTrace]) VALUES (5, N'Object cannot be cast from DBNull to other types.', N'   at System.DBNull.System.IConvertible.ToDateTime(IFormatProvider provider)
   at System.Convert.ToDateTime(Object value)
   at LMSBL.Repository.UserRepository.<>c.<GetAllActiveUsers>b__4_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.UserRepository.GetAllActiveUsers(Int32 tenantId) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54')
INSERT [dbo].[tblLog] ([Id], [ErrorMessage], [StackTrace]) VALUES (6, N'Object cannot be cast from DBNull to other types.', N'   at System.DBNull.System.IConvertible.ToDateTime(IFormatProvider provider)
   at System.Convert.ToDateTime(Object value)
   at LMSBL.Repository.UserRepository.<>c.<GetAllActiveUsers>b__4_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.UserRepository.GetAllActiveUsers(Int32 tenantId) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54')
INSERT [dbo].[tblLog] ([Id], [ErrorMessage], [StackTrace]) VALUES (7, N'Object cannot be cast from DBNull to other types.', N'   at System.DBNull.System.IConvertible.ToDateTime(IFormatProvider provider)
   at System.Convert.ToDateTime(Object value)
   at LMSBL.Repository.UserRepository.<>c.<GetAllActiveUsers>b__4_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.UserRepository.GetAllActiveUsers(Int32 tenantId) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54')
INSERT [dbo].[tblLog] ([Id], [ErrorMessage], [StackTrace]) VALUES (8, N'Object cannot be cast from DBNull to other types.', N'   at System.DBNull.System.IConvertible.ToDateTime(IFormatProvider provider)
   at System.Convert.ToDateTime(Object value)
   at LMSBL.Repository.UserRepository.<>c.<GetAllActiveUsers>b__4_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.UserRepository.GetAllActiveUsers(Int32 tenantId) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54')
INSERT [dbo].[tblLog] ([Id], [ErrorMessage], [StackTrace]) VALUES (9, N'Could not find stored procedure ''RolesGetAll''.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.Fill(DataSet dataSet, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.Fill(DataSet dataSet)
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 42')
INSERT [dbo].[tblLog] ([Id], [ErrorMessage], [StackTrace]) VALUES (10, N'Object reference not set to an instance of an object.', N'   at LMSBL.Repository.RolesRepository.GetAllRoles() in E:\Projects\LMS\LMSBL\Repository\RolesRepository.cs:line 19')
INSERT [dbo].[tblLog] ([Id], [ErrorMessage], [StackTrace]) VALUES (11, N'Object cannot be cast from DBNull to other types.', N'   at System.DBNull.System.IConvertible.ToDateTime(IFormatProvider provider)
   at System.Convert.ToDateTime(Object value)
   at LMSBL.Repository.UserRepository.<>c.<GetAllActiveUsers>b__4_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.UserRepository.GetAllActiveUsers(Int32 tenantId) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54')
INSERT [dbo].[tblLog] ([Id], [ErrorMessage], [StackTrace]) VALUES (12, N'Object cannot be cast from DBNull to other types.', N'   at System.DBNull.System.IConvertible.ToDateTime(IFormatProvider provider)
   at System.Convert.ToDateTime(Object value)
   at LMSBL.Repository.UserRepository.<>c.<GetAllActiveUsers>b__4_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.UserRepository.GetAllActiveUsers(Int32 tenantId) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54')
INSERT [dbo].[tblLog] ([Id], [ErrorMessage], [StackTrace]) VALUES (13, N'Procedure or function ''RolesGetAll'' expects parameter ''@tenantId'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.Fill(DataSet dataSet, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.Fill(DataSet dataSet)
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 42')
INSERT [dbo].[tblLog] ([Id], [ErrorMessage], [StackTrace]) VALUES (14, N'Object cannot be cast from DBNull to other types.', N'   at System.DBNull.System.IConvertible.ToDateTime(IFormatProvider provider)
   at System.Convert.ToDateTime(Object value)
   at LMSBL.Repository.UserRepository.<>c.<GetAllActiveUsers>b__4_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.UserRepository.GetAllActiveUsers(Int32 tenantId) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54')
INSERT [dbo].[tblLog] ([Id], [ErrorMessage], [StackTrace]) VALUES (15, N'Object cannot be cast from DBNull to other types.', N'   at System.DBNull.System.IConvertible.ToDateTime(IFormatProvider provider)
   at System.Convert.ToDateTime(Object value)
   at LMSBL.Repository.UserRepository.<>c.<GetAllActiveUsers>b__4_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.UserRepository.GetAllActiveUsers(Int32 tenantId) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54')
INSERT [dbo].[tblLog] ([Id], [ErrorMessage], [StackTrace]) VALUES (16, N'Object cannot be cast from DBNull to other types.', N'   at System.DBNull.System.IConvertible.ToDateTime(IFormatProvider provider)
   at System.Convert.ToDateTime(Object value)
   at LMSBL.Repository.UserRepository.<>c.<GetAllActiveUsers>b__4_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.UserRepository.GetAllActiveUsers(Int32 tenantId) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54')
INSERT [dbo].[tblLog] ([Id], [ErrorMessage], [StackTrace]) VALUES (17, N'Object cannot be cast from DBNull to other types.', N'   at System.DBNull.System.IConvertible.ToDateTime(IFormatProvider provider)
   at System.Convert.ToDateTime(Object value)
   at LMSBL.Repository.UserRepository.<>c.<GetAllActiveUsers>b__4_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.UserRepository.GetAllActiveUsers(Int32 tenantId) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 54')
SET IDENTITY_INSERT [dbo].[tblLog] OFF
SET IDENTITY_INSERT [dbo].[tblQuestion] ON 

INSERT [dbo].[tblQuestion] ([QuestionId], [QuizId], [QuestionTypeId], [QuestionText], [CorrectFeedback], [InCorrectFeedback]) VALUES (3153, 3068, 1, N'<p>111111111111</p>', N'', N'')
INSERT [dbo].[tblQuestion] ([QuestionId], [QuizId], [QuestionTypeId], [QuestionText], [CorrectFeedback], [InCorrectFeedback]) VALUES (3154, 3068, 2, N'<p>2222222222</p>', N'<p>2222222222222222222</p>', N'<p>1111111111111111111</p>')
INSERT [dbo].[tblQuestion] ([QuestionId], [QuizId], [QuestionTypeId], [QuestionText], [CorrectFeedback], [InCorrectFeedback]) VALUES (3155, 3068, 2, N'<p>333333333</p>', N'<p>33333333333</p>', N'<p>44444444</p>')
SET IDENTITY_INSERT [dbo].[tblQuestion] OFF
SET IDENTITY_INSERT [dbo].[tblQuestionOption] ON 

INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1278, 3153, N'Option1', 0, N'<p>11111</p>')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1279, 3153, N'Option2', 0, N'<p>22222222</p>')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1280, 3153, N'Option 3', 1, N'<p>33333333</p>')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1281, 3154, N'22222', 1, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1282, 3154, N'111111', 0, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1283, 3155, N'3333', 1, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1284, 3155, N'44444', 0, N'')
SET IDENTITY_INSERT [dbo].[tblQuestionOption] OFF
SET IDENTITY_INSERT [dbo].[tblQuestionType] ON 

INSERT [dbo].[tblQuestionType] ([QuestionTypeID], [QuestionTypeText]) VALUES (1, N'Single Select')
INSERT [dbo].[tblQuestionType] ([QuestionTypeID], [QuestionTypeText]) VALUES (2, N'Multiple Select')
SET IDENTITY_INSERT [dbo].[tblQuestionType] OFF
SET IDENTITY_INSERT [dbo].[tblQuiz] ON 

INSERT [dbo].[tblQuiz] ([QuizId], [QuizName], [QuizDescription], [TenantId]) VALUES (3068, N'Test ', N'Test Dinesh Desc', 1)
SET IDENTITY_INSERT [dbo].[tblQuiz] OFF
INSERT [dbo].[tblQuizAssignment] ([QuizId], [UserId]) VALUES (3068, 8)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt]) VALUES (3068, N'8', CAST(1 AS Numeric(18, 0)), CAST(N'2020-01-13T13:08:37.067' AS DateTime), 1)
INSERT [dbo].[tblResetPassword] ([emailId], [token], [dateCreated], [isUsed]) VALUES (N'dgabhane@gmail.com', N'535a8f4a-b4de-4baa-897d-9d190779cc25', CAST(N'2020-01-10T19:16:22.363' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblResponses] ON 

INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1159, 3153, N'1280', N'', 8, 3068, CAST(N'2020-01-13' AS Date), 1)
SET IDENTITY_INSERT [dbo].[tblResponses] OFF
SET IDENTITY_INSERT [dbo].[tblTenant] ON 

INSERT [dbo].[tblTenant] ([tenantId], [tenantName], [tenantDomain], [activationFrom], [activationTo], [isActive], [createdBy], [createdOn], [noOfUserAllowed], [Logo]) VALUES (1, N'qqqq', N'http://qqqq.localhost', CAST(N'2019-10-10' AS Date), CAST(N'2020-10-10' AS Date), 1, 1, CAST(N'2019-11-20' AS Date), 11, NULL)
INSERT [dbo].[tblTenant] ([tenantId], [tenantName], [tenantDomain], [activationFrom], [activationTo], [isActive], [createdBy], [createdOn], [noOfUserAllowed], [Logo]) VALUES (2, N'Dinesh', N'http://Dinesh.LMS.Com.localhost', CAST(N'2019-10-10' AS Date), CAST(N'2020-10-10' AS Date), 1, 1, CAST(N'2019-12-17' AS Date), 100, NULL)
INSERT [dbo].[tblTenant] ([tenantId], [tenantName], [tenantDomain], [activationFrom], [activationTo], [isActive], [createdBy], [createdOn], [noOfUserAllowed], [Logo]) VALUES (3, N'Dinesh', N'Dinesh', CAST(N'2019-12-30' AS Date), CAST(N'2019-12-31' AS Date), 1, 1, CAST(N'2019-12-30' AS Date), 100, N'http://localhost:61705\assets\Logo\QuizScreen.png')
SET IDENTITY_INSERT [dbo].[tblTenant] OFF
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId]) VALUES (3, N'Omkar', N'Sulekar', N'OmkarS@gmail.com', N'Omkar', CAST(N'1993-03-10' AS Date), N'1234567890', 1, 1, CAST(N'2019-11-23' AS Date), 1, 1)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId]) VALUES (5, N'Dinesh', N'Gabhane', N'dgabhane@gmail.com', N'Dinesh', NULL, NULL, 1, 5, CAST(N'2020-01-13' AS Date), 1, 2)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId]) VALUES (6, N'mmm', N'ddd', N'ddd@gmail.com', N'123123', CAST(N'2019-12-26' AS Date), NULL, 1, 5, CAST(N'2020-01-13' AS Date), 1, 3)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId]) VALUES (7, N'new', N'ddd', N'new@gmail.com', N'P@ssw0rd', CAST(N'2019-12-11' AS Date), N'1234567890', 1, 5, CAST(N'2019-11-29' AS Date), 1, 3)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId]) VALUES (8, N'Don', N'Don2', N'Don@gmail.com', N'123123', CAST(N'2019-12-11' AS Date), N'1234567890', 1, 5, CAST(N'2019-11-29' AS Date), 1, 3)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId]) VALUES (9, N'Don111', N'ddd', N'Don111@gmail.com', N'123123', CAST(N'2019-11-07' AS Date), N'1234567890', 1, 5, CAST(N'2019-11-29' AS Date), 1, 3)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId]) VALUES (10, N'Don3', N'Don3', N'Don3@gmail.com', N'123123', CAST(N'2019-11-25' AS Date), N'1234567890', 1, 5, CAST(N'2019-11-29' AS Date), 1, 3)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId]) VALUES (11, N'newDinesh Name', N'ddd', N'DonandDon@gmail.com', N'123456', CAST(N'2019-12-02' AS Date), N'1234567890', 1, 5, CAST(N'2019-12-17' AS Date), 1, 3)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId]) VALUES (12, N'123123', N'Don2', N'123123@gmail.com', N'123456', CAST(N'2019-12-01' AS Date), N'1234567890', 1, 5, CAST(N'2019-12-17' AS Date), 1, 3)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId]) VALUES (13, N'new123', N'ddd1122', N'new123@gmail.com', N'123456', CAST(N'2019-10-10' AS Date), N'1234567890', 1, 5, CAST(N'2019-12-17' AS Date), 1, 3)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId]) VALUES (14, N'12121212', N'12121212', N'12121212@gmail.com', N'123456', CAST(N'2019-10-10' AS Date), N'1234567890', 1, 5, CAST(N'2019-12-17' AS Date), 1, 3)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId]) VALUES (15, N'new123', N'ddd', N'dgabhane999@gmail.com', N'Dinesh', CAST(N'2019-12-24' AS Date), N'1234567890', 1, 5, CAST(N'2019-12-18' AS Date), 1, 3)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId]) VALUES (16, N'asda', N'asdd', N'dgabhasadasdne@gmail.com', N'123123', CAST(N'2019-12-17' AS Date), N'1234567890', 1, 5, CAST(N'2019-12-27' AS Date), 1, 3)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId]) VALUES (1016, N'Dinesh New', N'Gabhane', N'd@g.com', N'123123', NULL, NULL, 1, 5, CAST(N'2020-01-11' AS Date), 1, 3)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId]) VALUES (1017, N'Dinesh', N'Gabhane', N'don123@gmail.com', N'123123', NULL, NULL, 1, 3, CAST(N'2020-01-14' AS Date), 3, 2)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
SET IDENTITY_INSERT [dbo].[tblUserRoles] ON 

INSERT [dbo].[tblUserRoles] ([roleId], [roleName]) VALUES (1, N'SuperAdmin')
INSERT [dbo].[tblUserRoles] ([roleId], [roleName]) VALUES (2, N'Admin')
INSERT [dbo].[tblUserRoles] ([roleId], [roleName]) VALUES (3, N'Learner')
SET IDENTITY_INSERT [dbo].[tblUserRoles] OFF
ALTER TABLE [dbo].[tblAssignmentAndTracking]  WITH CHECK ADD  CONSTRAINT [FK_tblAssignmentAndTracking_tblStatus] FOREIGN KEY([statusId])
REFERENCES [dbo].[tblStatus] ([statusId])
GO
ALTER TABLE [dbo].[tblAssignmentAndTracking] CHECK CONSTRAINT [FK_tblAssignmentAndTracking_tblStatus]
GO
ALTER TABLE [dbo].[tblQuestion]  WITH CHECK ADD  CONSTRAINT [FK_tblQuestion_tblQuestion] FOREIGN KEY([QuizId])
REFERENCES [dbo].[tblQuiz] ([QuizId])
GO
ALTER TABLE [dbo].[tblQuestion] CHECK CONSTRAINT [FK_tblQuestion_tblQuestion]
GO
ALTER TABLE [dbo].[tblQuestion]  WITH CHECK ADD  CONSTRAINT [FK_tblQuestion_tblQuestionType] FOREIGN KEY([QuestionTypeId])
REFERENCES [dbo].[tblQuestionType] ([QuestionTypeID])
GO
ALTER TABLE [dbo].[tblQuestion] CHECK CONSTRAINT [FK_tblQuestion_tblQuestionType]
GO
ALTER TABLE [dbo].[tblQuestionOption]  WITH CHECK ADD  CONSTRAINT [FK_tblQuestionOption_tblQuestion] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[tblQuestion] ([QuestionId])
GO
ALTER TABLE [dbo].[tblQuestionOption] CHECK CONSTRAINT [FK_tblQuestionOption_tblQuestion]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblUserRoles] FOREIGN KEY([roleId])
REFERENCES [dbo].[tblUserRoles] ([roleId])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblUserRoles]
GO
/****** Object:  StoredProcedure [dbo].[CourseUpdate]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CourseUpdate]
	@courseId int,
	@courseName nvarchar(50),
	@courseDetails nvarchar(50),
	@courseCategory nvarchar(50),
	@coursePath nvarchar(50),
	@isActive bit,
	@createdBy int,
	@tenantId int

AS
BEGIN	

	SET NOCOUNT ON;

	update tblCourses set courseName=@courseName,
	courseDetails=@courseDetails,
	courseCategory=@courseCategory,
	coursePath=@coursePath,
	isActive=@isActive,
	createdOn=getdate(),
	tenantId=@tenantId
	where  courseId=@courseId
	
END

GO
/****** Object:  StoredProcedure [dbo].[GetAllQuiz]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllQuiz] 
	@tenantId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select * from tblQuiz where TenantId=@tenantId
END

GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Login]
@EmailId nvarchar(max),
@Password nvarchar(max)
as
begin
select * from tblUser where emailId=@EmailId and password=@Password
end
GO
/****** Object:  StoredProcedure [dbo].[sp_AddError]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name				Reason
001		Omkar Sulekar		To write error log

*/
CREATE PROCEDURE [dbo].[sp_AddError]
@ExceptionMsg varchar(100)=null,  
@ExceptionType varchar(100)=null,  
@ExceptionSource nvarchar(max)=null,  
@ExceptionURL varchar(100)=null  
AS
BEGIN	
		INSERT INTO TblErrorLog  
		(  
		ExceptionMsg ,  
		ExceptionType,   
		ExceptionSource,  
		ExceptionURL,  
		Logdate  
		)  
		VALUES
		( 
		@ExceptionMsg,  
		@ExceptionType,  
		@ExceptionSource,  
		@ExceptionURL,  
		getdate()
		)
		 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddToken]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name				Reason
001		Omkar Sulekar		To write error log

*/
CREATE PROCEDURE [dbo].[sp_AddToken]
@emailId varchar(50),  
@token varchar(100)
AS
BEGIN	
		INSERT INTO tblResetPassword  
		(  
		emailId,  
		token,
		dateCreated,
		isUsed
		)  
		VALUES
		( 
		@emailId,  
		@token,
		getdate(),
		0
		)
		 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AssignmentAndTrackingActivateDeactivate]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AssignmentAndTrackingActivateDeactivate]
	@trackingId int,	
	@isActive bit	

AS
BEGIN	

	SET NOCOUNT ON;

	update tblAssignmentAndTracking set isActive=@isActive 	where  trackingId=@trackingId
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_AssignmentAndTrackingGetAllInactive]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_AssignmentAndTrackingGetAllInactive] 
	@trackingId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select * from tblAssignmentAndTracking where trackingId=@trackingId and isActive=0
END

GO
/****** Object:  StoredProcedure [dbo].[sp_CourseActivateDeactivate]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to active or deactivate course

*/
CREATE PROCEDURE [dbo].[sp_CourseActivateDeactivate]
	@courseId INT,	
	@isActive BIT	

AS
BEGIN	
	SET NOCOUNT ON;
	UPDATE tblCourses SET 	isActive=@isActive 	WHERE  courseId=@courseId	
END
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--USE [LMSDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_CourseAdd]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to add new course

*/

CREATE PROCEDURE [dbo].[sp_CourseAdd]
	@courseName NVARCHAR(50),
	@courseDetails NVARCHAR(50),
	@courseCategory NVARCHAR(50),
	@coursePath NVARCHAR(50),
	@createdBy INT,
	@tenantId INT

AS
BEGIN	
		DECLARE @status BIT
		SET NOCOUNT ON;
		IF NOT EXISTS (SELECT courseId FROM tblCourses WHERE courseName=@courseName)
		BEGIN
				INSERT INTO [dbo].[tblCourses]
							([courseName]
							,[courseDetails]
							,[courseCategory]
							,[coursePath]
							,[isActive]
							,[createdBy]
							,[createdOn]
							,[tenantId])
				VALUES
							(@courseName
							,@courseDetails
							,@courseCategory
							,@coursePath
							,1
							,@createdBy
							,getdate()
							,@tenantId)

				SET @status=1
		END
		ELSE
		BEGIN
			 SET @status=0
		END
		RETURN @status
END


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--USE [LMSDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_CourseGetById]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to Get Course data by specifeid Id

*/
CREATE PROCEDURE [dbo].[sp_CourseGetById]
	@courseId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT		c.courseId,c.courseName,c.courseDetails,c.courseCategory,c.coursePath,c.isActive,
				c.createdBy,c.createdOn,c.tenantId,t.tenantName FROM tblCourses c
	INNER JOIN	tblTenant t ON c.tenantId=t.tenantId
	WHERE		courseId=@courseId
END

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--USE [LMSDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_CoursesGet]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to Get Course data 

*/
CREATE PROCEDURE [dbo].[sp_CoursesGet] 
	@tenantId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT c.courseId,c.courseName,c.courseDetails,c.courseCategory,c.coursePath,c.isActive,
				c.createdBy,c.createdOn,c.tenantId,t.tenantName FROM tblCourses c
	INNER JOIN tblTenant t ON c.tenantId=t.tenantId
	WHERE c.tenantId=@tenantId 
END

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--USE [LMSDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_CourseUpdate]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to Edit Course data

*/

CREATE PROCEDURE [dbo].[sp_CourseUpdate]
	@courseId INT,
	@courseName NVARCHAR(50),
	@courseDetails NVARCHAR(50),
	@courseCategory NVARCHAR(50),
	@coursePath NVARCHAR(50),
	@createdBy INT,
	@tenantId INT

AS
BEGIN	
	SET NOCOUNT ON;
	UPDATE tblCourses SET courseName=@courseName,
	courseDetails=@courseDetails,
	courseCategory=@courseCategory,
	coursePath=@coursePath,
	isActive=1,
	createdOn=GETDATE(),
	tenantId=@tenantId
	WHERE  courseId=@courseId	
END

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Tenants region
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
EXEC sp_rename 'SP_VerifyTenant', 'sp_TenantVerify';
EXEC sp_rename 'TenantActivateDeactivate', 'sp_TenantActivateDeactivate';
EXEC sp_rename 'TenantAdd', 'sp_TenantAdd';
EXEC sp_rename 'TenantGetById', 'sp_TenantGetById';
EXEC sp_rename 'TenantUpdate', 'sp_TenantUpdate';
drop procedure [dbo].[TenantGetAll]
drop procedure [dbo].[TenantGetAllInactive]
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

--USE [LMSDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteAssignedUsers]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to add new course

*/

CREATE PROCEDURE [dbo].[sp_DeleteAssignedUsers]
	@QuizId int

AS
BEGIN	
		
		SET NOCOUNT ON;
		
		delete from tblQuizAssignment where QuizId=@QuizId
		
		
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetAssignedUsers]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to add new course

*/

CREATE PROCEDURE [dbo].[sp_GetAssignedUsers]
	@QuizId int

AS
BEGIN	
		
		SET NOCOUNT ON;
		
		select UserId from tblQuizAssignment where QuizId=@QuizId
		
		
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetQuestionCount]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to add new course

*/

CREATE PROCEDURE [dbo].[sp_GetQuestionCount]		
	@QuizId int

AS
BEGIN	
		
		SET NOCOUNT ON;
		SELECT count(*) from tblQuestion where QuizId=@QuizId
		 
		
		
END

--sp_GetUserAssignment 1,8
GO
/****** Object:  StoredProcedure [dbo].[sp_GetQuizAll]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001						To get all Quiz data

*/

CREATE PROCEDURE [dbo].[sp_GetQuizAll] 
	@tenantId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT	q.QuizId,q.QuizName,q.QuizDescription,q.TenantId
	FROM	tblQuiz q	
	WHERE	q.TenantId=@tenantId
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetQuizByID]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001						To get all Quiz data

*/

CREATE PROCEDURE [dbo].[sp_GetQuizByID] 
	@QuizId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT	q.QuizId,q.QuizName,q.QuizDescription,q.TenantId
	FROM	tblQuiz q	
	WHERE	q.QuizId=@QuizId

	select * from tblQuestion where QuizId=@QuizId

	select * from tblQuestionOption where QuestionId in (select QuestionId from tblQuestion where QuizId=@QuizId)

END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserAssignment]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to add new course

*/

CREATE PROCEDURE [dbo].[sp_GetUserAssignment]		
	@TenantId int,
	@UserId int

AS
BEGIN	
		
		SET NOCOUNT ON;
		
		BEGIN
		if @UserId=0
		begin
				 select a.quizId,a.UserId,b.QuizName, c.firstName + ' ' + c.lastName as Name,a.Score, a.AttemptedDate,a.Attempt  from tblQuizScore as a
				 inner join tblQuiz as b on a.QuizId=b.QuizId
				 inner join tblUser as c on a.UserId=c.userId
					where c.tenantId=@TenantId and c.roleId=3 order by a.AttemptedDate desc
		end
		else
			begin
					select a.quizId,a.UserId,b.QuizName, c.firstName + ' ' + c.lastName as Name,a.Score, a.AttemptedDate,a.Attempt  from tblQuizScore as a
				 inner join tblQuiz as b on a.QuizId=b.QuizId
				 inner join tblUser as c on a.UserId=c.userId
					where c.tenantId=@TenantId and a.UserId=@UserId order by a.AttemptedDate desc
			end


				
		END
		
		
END

--sp_GetUserAssignment 1,8
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserQuizResponses]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to add new course

*/

CREATE PROCEDURE [dbo].[sp_GetUserQuizResponses]		
	@QuizId int,
	@UserId int,
	@Attempt int

AS
BEGIN	
		
		SET NOCOUNT ON;
		
		BEGIN
				 select * from tblResponses where QuizId=@QuizId and UserId=@UserId and Attempt=@Attempt

				
		END
		
		
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to check login Credentials

*/
CREATE procedure [dbo].[sp_Login]
@EmailId NVARCHAR(max),
@Password NVARCHAR(max)
as
begin
	SELECT u.userId,u.firstName,u.lastName,u.emailId,u.[password],u.DOB,u.contactNo,u.isActive,
				u.createdBy,u.createdOn,u.tenantId,u.roleId,t.tenantName,ur.roleName 
	FROM		tblUser u
	INNER JOIN	tblTenant t ON t.tenantId=u.tenantId
	INNER JOIN	tblUserRoles ur ON ur.roleId=u.roleId
	WHERE emailId=@EmailId AND [password]=@Password
end
GO
/****** Object:  StoredProcedure [dbo].[sp_NotificationTemplatesActivateDeactivate]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_NotificationTemplatesActivateDeactivate]
	@templateId int,	
	@isActive bit	

AS
BEGIN	

	SET NOCOUNT ON;

	update tblNotificationTemplates set isActive=@isActive 	where  templateId=@templateId
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_NotificationTemplatesAdd]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_NotificationTemplatesAdd]
	@templateName nvarchar(50),
	@templateSubject nvarchar(500),
	@templateDescription ntext,	
	@isActive bit,
	@createdBy int,
	@createdOn date,
	@tenantId int

AS
BEGIN	
declare @status bit
	SET NOCOUNT ON;
	if not exists (select templateId from tblNotificationTemplates where templateName=@templateName)
	begin
    INSERT INTO [dbo].[tblNotificationTemplates]
           ([templateName]
           ,[templateSubject]
           ,[templateDescription]           
           ,[isActive]
           ,[createdBy]
           ,[createdOn]
           ,[tenantId])
     VALUES
           (@templateName
           ,@templateSubject
           ,@templateDescription           
           ,@isActive
           ,@createdBy
           ,getdate()
           ,@tenantId)

		   set @status=1
     end
		 else
			 begin

			 set @status=0
	 
			 end
	 return @status
END

GO
/****** Object:  StoredProcedure [dbo].[sp_NotificationTemplatesGetAll]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_NotificationTemplatesGetAll] 
	@tenantId int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select * from tblNotificationTemplates where tenantId=@tenantId and isActive=1
END

GO
/****** Object:  StoredProcedure [dbo].[sp_NotificationTemplatesGetById]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Dinesh>
-- Create date: <Create 01/29/2019,,>
-- Description:	<To get notification details by id and tenant id,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_NotificationTemplatesGetById]
	@templateId int,
	@tenantId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select * from tblNotificationTemplates where tenantId=@tenantId and templateId=@templateId
END

GO
/****** Object:  StoredProcedure [dbo].[sp_NotificationTemplatesUpdate]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_NotificationTemplatesUpdate]
	@templateId int,
	@templateName nvarchar(50),
	@templateSubject nvarchar(500),
	@templateDescription ntext,	
	@isActive bit,
	@createdBy int,
	@createdOn date,
	@tenantId int

AS
BEGIN	

	SET NOCOUNT ON;

	update tblNotificationTemplates set templateName=@templateName,
	templateSubject=@templateSubject,
	templateDescription=@templateDescription,	
	isActive=@isActive,
	createdOn=getdate(),
	tenantId=@tenantId
	where  templateId=@templateId
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_OptionAdd]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_OptionAdd]
	@OldOptionId int = null,
	@QuestionId INT,
	@OptionText nvarchar(max),	
	@CorrectOption bit,
	@OptionFeedback ntext = NULL,
	@OptionId INT OUTPUT

AS
BEGIN	
		
		SET NOCOUNT ON;
		IF NOT EXISTS (SELECT OptionId FROM tblQuestionOption WHERE OptionText=@OptionText and QuestionId=@QuestionId)
		BEGIN
				INSERT INTO [dbo].[tblQuestionOption]
							([QuestionId]
							,[OptionText]							
							,[CorrectOption]
							,[OptionFeedback])
				VALUES
							(@QuestionId
							,@OptionText							
							,@CorrectOption
							,@OptionFeedback)

				SET @OptionId=SCOPE_IDENTITY();

				if @OldOptionId is not null
					update tblResponses set OptionIds=REPLACE(OptionIds, @OldOptionId, @OptionId) where QuestionId=@QuestionId
		END
		ELSE
		BEGIN
			 SET @OptionId=0
		END
		RETURN @OptionId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_PasswordUpdate]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to Edit Course data

*/

CREATE PROCEDURE [dbo].[sp_PasswordUpdate]
	@emailid nvarchar(50),
	@password nvarchar(50)


AS
BEGIN	
	SET NOCOUNT ON;
	UPDATE tblUser SET password=@password	
	WHERE  emailid=@emailid	

	UPDATE tblResetPassword SET isUsed=1	
	WHERE  emailid=@emailid	

END
GO
/****** Object:  StoredProcedure [dbo].[sp_QuestionAdd]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to add new course

*/

CREATE PROCEDURE [dbo].[sp_QuestionAdd]
	@OldQuestionId int = null,
	@QuizId int,
	@QuestionTypeId int,	
	@QuestionText ntext,
	@CorrectFeedback ntext=NULL,
	@InCorrectFeedback ntext=NULL,
	@QuestionId INT OUTPUT

AS
BEGIN	
		--DECLARE @status BIT
		SET NOCOUNT ON;
		IF NOT EXISTS (SELECT QuestionId FROM tblQuestion WHERE QuestionText like @QuestionText and QuizId=@QuizId)
		BEGIN
				INSERT INTO [dbo].[tblQuestion]
							([QuizId]
							,[QuestionTypeId]							
							,[QuestionText]
							,[CorrectFeedback]
							,[InCorrectFeedback])
				VALUES
							(@QuizId
							,@QuestionTypeId							
							,@QuestionText
							,@CorrectFeedback
							,@InCorrectFeedback)

				SET @QuestionId=SCOPE_IDENTITY()

				if @OldQuestionId is not null
				update tblResponses set QuestionId=@QuestionId where QuestionId=@OldQuestionId
		END
		ELSE
		BEGIN
			 SET @QuestionId=0
		END
		RETURN @QuestionId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_QuizAdd]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to add new course

*/

CREATE PROCEDURE [dbo].[sp_QuizAdd]
	@OldQuizId int =null,
	@QuizName NVARCHAR(500),
	@QuizDescription ntext = NULL,	
	@tenantId INT,
	@QuizId INT OUTPUT

AS
BEGIN	
		
		SET NOCOUNT ON;
		IF NOT EXISTS (SELECT QuizId FROM tblQuiz WHERE QuizName=@QuizName and tenantId=@tenantId)
		BEGIN
				INSERT INTO [dbo].[tblQuiz]
							([QuizName]
							,[QuizDescription]							
							,[TenantId])
				VALUES
							(@QuizName
							,@QuizDescription							
							,@tenantId)

				SET @QuizId=SCOPE_IDENTITY();
				
				if @OldQuizId is not null
				begin
					update tblQuizAssignment set QuizId=@QuizId where QuizId=@OldQuizId
					update tblQuizScore set QuizId=@QuizId where QuizId=@OldQuizId
					update tblResponses set QuizId=@QuizId where QuizId=@OldQuizId

				end
		END
		ELSE
		BEGIN
			 SET @QuizId=0
		END
		RETURN @QuizId
END


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--USE [LMSDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_QuizAssign]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to add new course

*/

CREATE PROCEDURE [dbo].[sp_QuizAssign]
	@QuizId INT,
	@UserId INT,
	@status INT OUTPUT

AS
BEGIN	
		
		SET NOCOUNT ON;
		IF NOT EXISTS (SELECT UserId FROM tblQuizAssignment WHERE QuizId=@QuizId and UserId=@UserId )
		BEGIN
				INSERT INTO [dbo].[tblQuizAssignment]
							([QuizId]
							,[UserId])
				VALUES
							(@QuizId
							,@UserId)

				SET @status=1
		END
		ELSE
		BEGIN
			 SET @status=0
		END
		RETURN @status
END

GO
/****** Object:  StoredProcedure [dbo].[sp_QuizAttemptGet]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_QuizAttemptGet]	
	@QuizId int,
	@UserId int

AS
BEGIN	
		
		SET NOCOUNT ON;
		
		  select Attempt from tblQuizScore where QuizId=@QuizId and UserId=@UserId order by AttemptedDate desc
		--		select Score from tblQuizScore where QuizId=@QuizId and UserId=@UserId order by AttemptedDate desc

		
END
GO
/****** Object:  StoredProcedure [dbo].[sp_QuizDelete]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001						To get all Quiz data

*/

CREATE PROCEDURE [dbo].[sp_QuizDelete] 
	@QuizId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	delete from tblQuestionOption where QuestionId in (select QuestionId from tblQuestion where QuizId=@QuizId)

	delete from tblQuestion where QuizId=@QuizId

    delete FROM	tblQuiz WHERE	QuizId=@QuizId
	

END

GO
/****** Object:  StoredProcedure [dbo].[sp_QuizGetAllDetails]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to add new course

*/

CREATE PROCEDURE [dbo].[sp_QuizGetAllDetails]	
	@QuizId INT,
	@UserId INT	

AS
BEGIN	
		DECLARE @roleId INT
		SET NOCOUNT ON;
		select @roleId=roleId from tblUser where userId=@UserId
		IF @roleId=2
		BEGIN
			BEGIN
					select * from tblQuiz where QuizId=@QuizId

					select * from tblQuestion where QuizId=@QuizId				

					select * from tblQuestionOption where QuestionId in (select QuestionId from tblQuestion where QuizId=@QuizId)
				
			END
		END
		ELSE

		IF EXISTS (SELECT QuizId FROM tblQuizAssignment WHERE QuizId=@QuizId and UserId=@UserId)
		
		BEGIN
				select * from tblQuiz where QuizId=@QuizId

				select * from tblQuestion where QuizId=@QuizId				

				select * from tblQuestionOption where QuestionId in (select QuestionId from tblQuestion where QuizId=@QuizId)
				
		END
		
		
END

GO
/****** Object:  StoredProcedure [dbo].[sp_QuizGetByUserId]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to add new course

*/

CREATE PROCEDURE [dbo].[sp_QuizGetByUserId]	
	@UserId INT	

AS
BEGIN	
		
		SET NOCOUNT ON;
		
		BEGIN
				select a.QuizId,a.QuizName,a.QuizDescription  from tblQuiz as a
				inner join tblQuizAssignment as b on a.QuizId=b.QuizId  where b.UserId=@UserId

				
		END
		
END

GO
/****** Object:  StoredProcedure [dbo].[sp_QuizScoreAdd]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to add new course

*/

CREATE PROCEDURE [dbo].[sp_QuizScoreAdd]	
	@QuizId int,
	@UserId int,	
	@Score numeric(18,0),
	@Attempt int
	

AS
BEGIN	
		DECLARE @status BIT
		SET NOCOUNT ON;
		
		BEGIN
				INSERT INTO [dbo].[tblQuizScore]
							([QuizId]
							,[UserId]							
							,[Score]
							,[AttemptedDate]
							,[Attempt])
				VALUES
							(@QuizId
							,@UserId							
							,@Score
							,getdate()
							,@Attempt)

				SET @status=1
		END
		
		RETURN @status
END
GO
/****** Object:  StoredProcedure [dbo].[sp_QuizScoreGet]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_QuizScoreGet]	
	@QuizId int,
	@UserId int,
	@Attempt int

AS
BEGIN	
		
		SET NOCOUNT ON;
		
		
				select Score from tblQuizScore where QuizId=@QuizId and UserId=@UserId and Attempt=@Attempt order by AttemptedDate desc

		
END
GO
/****** Object:  StoredProcedure [dbo].[sp_QuizUpdate]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to add new course

*/

CREATE PROCEDURE [dbo].[sp_QuizUpdate]
	@QuizId INT,
	@QuizName NVARCHAR(500),
	@QuizDescription ntext	

AS
BEGIN	
		DECLARE @status BIT
		DECLARE @OldQuizId varchar(30);
		SET NOCOUNT ON;
		SELECT @OldQuizId = QuizId FROM tblQuiz WHERE QuizName=@QuizName
		IF @OldQuizId IS NOT NULL
		BEGIN
		IF @OldQuizId=@QuizId
		BEGIN
				UPDATE [dbo].[tblQuiz] SET 
							[QuizName] = @QuizName
							,[QuizDescription]	= @QuizDescription						
							where QuizId=@QuizId
				

				SET @status=1
		END
		ELSE
			BEGIN
				 SET @status=0
			END
		END
		ELSE
		BEGIN
			UPDATE [dbo].[tblQuiz] SET 
							[QuizName] = @QuizName
							,[QuizDescription]	= @QuizDescription						
							where QuizId=@QuizId
			 SET @status=1
		END
		RETURN @status
END


GO
/****** Object:  StoredProcedure [dbo].[sp_ResponseAdd]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to add new course

*/

CREATE PROCEDURE [dbo].[sp_ResponseAdd]
	@QuestionId int,
	@OptionIds nvarchar(100),
	@QuestionFeedback ntext,
	@UserId int,
	@QuizId int,
	@Attempt int
	

AS
BEGIN	
		DECLARE @status BIT
		DECLARE @roleId INT
		SET NOCOUNT ON;
		select @roleId=roleId from tblUser where userId=@UserId
		IF @roleId=2
		BEGIN
				INSERT INTO [dbo].[tblResponses]
							([QuestionId]
							,[OptionIds]							
							,[QuestionFeedback]
							,[UserId]
							,[QuizId]
							,[DateCreated]
							,[Attempt])
				VALUES
							(@QuestionId
							,@OptionIds							
							,@QuestionFeedback
							,@UserId
							,@QuizId
							,getdate()
							,@Attempt)
		END
		ELSE
		IF EXISTS (SELECT QuizId FROM tblQuizAssignment WHERE UserId = @UserId and QuizId=@QuizId)
		BEGIN
				INSERT INTO [dbo].[tblResponses]
							([QuestionId]
							,[OptionIds]							
							,[QuestionFeedback]
							,[UserId]
							,[QuizId]
							,[DateCreated]
							,[Attempt])
				VALUES
							(@QuestionId
							,@OptionIds							
							,@QuestionFeedback
							,@UserId
							,@QuizId
							,getdate()
							,@Attempt)

				SET @status=1
		END
		ELSE
		BEGIN
			 SET @status=0
		END
		


		RETURN @status
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ResponseDelete]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001						To get all Quiz data

*/

CREATE PROCEDURE [dbo].[sp_ResponseDelete] 
	@QuizId INT,
	@UserId INT,
	@Attempt INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;	

	delete from tblResponses where QuizId =@QuizId and UserId=@UserId and Attempt=@Attempt

	delete from tblQuizScore where QuizId =@QuizId and UserId=@UserId and Attempt=@Attempt

	

END

GO
/****** Object:  StoredProcedure [dbo].[sp_RolesGetAll]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Get all roles

*/
CREATE PROCEDURE [dbo].[sp_RolesGetAll] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  roleId,roleName
	FROM	tblUserRoles where roleId <>1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TenantActivateDeactivate]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to activate/deactivate Tenant data

*/
CREATE PROCEDURE [dbo].[sp_TenantActivateDeactivate]
	@tenantId INT,	
	@isActive BIT	

AS
BEGIN	

	SET NOCOUNT ON;

	UPDATE	tblTenant 
	SET		isActive=@isActive 	
	WHERE	tenantId=@tenantId
	
END

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--USE [LMSDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_TenantAdd]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to Add Tenant data

*/
CREATE PROCEDURE [dbo].[sp_TenantAdd]
	@tenantName NVARCHAR(50),
	@tenantDomain NVARCHAR(50),
	@activationFrom DATE = null,
	@activationTo DATE = null,
	@createdBy INT,
	@noOfUserAllowed INT = NULL,
	@logo ntext = NULL

AS
BEGIN	
	DECLARE @status BIT
	SET NOCOUNT ON;
	IF NOT EXISTS (SELECT tenantId FROM tblTenant WHERE tenantDomain=@tenantDomain)
	BEGIN
		INSERT INTO [dbo].[tblTenant]
			   ([tenantName],[tenantDomain],[activationFrom],[activationTo],[isActive],[createdBy],[CreatedOn]
			   ,[noOfUserAllowed],[Logo])
		VALUES
			   (@tenantName
			   ,@tenantDomain
			   ,@activationFrom
			   ,@activationTo
			   ,1
			   ,@createdBy
			   ,getdate()
			   ,@noOfUserAllowed
			   ,@logo)

		SET @status=1
     END
	 ELSE
	 BEGIN
			 SET @status=0
	  END
	 RETURN @status
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TenantGet]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to Get Tenant data

*/
CREATE PROCEDURE [dbo].[sp_TenantGet]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT	tenantId,tenantName,tenantDomain,activationFrom,activationTo,isActive,createdBy,createdOn,noOfUserAllowed 
	FROM	tblTenant 
END



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--USE [LMSDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_TenantGetById]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to get  Tenant data by ID

*/
CREATE PROCEDURE [dbo].[sp_TenantGetById]
	@tenantId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT	tenantId,tenantName,tenantDomain,activationFrom,activationTo,isActive,createdBy,createdOn,noOfUserAllowed,Logo 
	FROM	tblTenant 
	WHERE	tenantId=@tenantId
END


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--USE [LMSDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_TenantGetByName]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to get  Tenant data by ID

*/
CREATE PROCEDURE [dbo].[sp_TenantGetByName]
	@tenantName nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT	*
	FROM	tblTenant 
	WHERE	tenantName=@tenantName
END


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--USE [LMSDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_TenantUpdate]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to Edit Tenant data

*/
CREATE PROCEDURE [dbo].[sp_TenantUpdate]
	@tenantId INT,
	@tenantName NVARCHAR(50),
	@tenantDomain NVARCHAR(50),
	@activationFrom DATE=null,
	@activationTo DATE=null,
	@noOfUserAllowed INT = null,
	@logo ntext=null

AS
BEGIN	

	SET NOCOUNT ON;

	UPDATE	tblTenant 
	SET		tenantName=@tenantName,
			tenantDomain=@tenantDomain,
			activationFrom=@activationFrom,
			activationTo=@activationTo,
			noOfUserAllowed=@noOfUserAllowed
	WHERE	tenantId=@tenantId

	if @logo is not null
	begin
		UPDATE	tblTenant 
		SET		
				logo=@logo
		WHERE	tenantId=@tenantId
	end
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_TenantVerify]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to Vefiy tenant Domain

*/
CREATE PROCEDURE [dbo].[sp_TenantVerify] 
	@tenantDomain NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT tenantId FROM tblTenant WHERE tenantDomain=@tenantDomain
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UserActivateDeactivate]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP activate/deactivate users

*/
CREATE PROCEDURE [dbo].[sp_UserActivateDeactivate]
	@userId INT,	
	@isActive BIT	

AS
BEGIN	
	SET NOCOUNT ON;
	UPDATE	tblUser 
	SET 	isActive=@isActive 	
	WHERE	userId=@userId
	
END


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--USE [LMSDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_UserAdd]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create insert user

*/
CREATE PROCEDURE [dbo].[sp_UserAdd]
	@firstName NVARCHAR(50),
	@lastName NVARCHAR(50) = NULL,
	@emailId NVARCHAR(50),
	@password NVARCHAR(50),
	@DOB DATE = NULL,
	@contactNo NVARCHAR(50) = NULL,
	@createdBy INT,
	@tenantId INT,
	@roleId INT

AS
BEGIN	
	declare @status bit
	SET NOCOUNT ON;
	IF NOT EXISTS (SELECT userId FROM tblUser WHERE emailId=@emailId)
	BEGIN
		INSERT INTO [dbo].[tblUser]
					   ([firstName]
					   ,[lastName]
					   ,[emailId]
					   ,[password],
					   [DOB]
					   ,[contactNo]
					   ,[isActive]
					   ,[createdBy]
					   ,[createdOn]
					   ,[tenantId]
					   ,[roleId])
		VALUES
					   (@firstName
					   ,@lastName
					   ,@emailId
					   ,@password
						,@DOB
					   ,@contactNo
					   ,1
					   ,@createdBy
					   ,getdate()
					   ,@tenantId
					   ,@roleId)

			SET @status=1
     END
	 ELSE
	 BEGIN
			SET @status=0
	 END
	 RETURN @status
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UserGet]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to get all users

*/
CREATE PROCEDURE [dbo].[sp_UserGet]
	@tenantId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT		u.userId,u.firstName,u.lastName,u.emailId,u.[password],u.DOB,u.contactNo,u.isActive,
				u.createdBy,u.createdOn,u.tenantId,u.roleId,t.tenantName,ur.roleName 
	FROM		tblUser u
	INNER JOIN	tblTenant t ON t.tenantId=u.tenantId
	INNER JOIN	tblUserRoles ur ON ur.roleId=u.roleId
	WHERE		u.tenantId=@tenantId and u.roleId !=1
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UserGetById]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to get user by id

*/
CREATE PROCEDURE [dbo].[sp_UserGetById]
	@userId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT		u.userId,u.firstName,u.lastName,u.emailId,u.[password],u.DOB,u.contactNo,u.isActive,
				u.createdBy,u.createdOn,u.tenantId,u.roleId,t.tenantName,ur.roleName 
	FROM		tblUser u
	INNER JOIN	tblTenant t ON t.tenantId=u.tenantId
	INNER JOIN	tblUserRoles ur ON ur.roleId=u.roleId
	WHERE		userId=@userId
END


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--USE [LMSDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_UserUpdate]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Edit User data

*/
CREATE PROCEDURE [dbo].[sp_UserUpdate]
	@userId INT,
	@firstName NVARCHAR(50),
	@lastName NVARCHAR(50) = NULL,
	@emailId NVARCHAR(50),
	@password NVARCHAR(50),
	@DOB DATE  = NULL,
	@contactNo NVARCHAR(50)  = NULL,
	@createdBy INT,
	@tenantId INT,
	@roleId INT

AS
BEGIN	
	DECLARE @status BIT
	SET NOCOUNT ON;
	IF EXISTS (SELECT userId FROM tblUser WHERE emailId=@emailId and userId=@userId)
	BEGIN
		UPDATE [dbo].[tblUser] SET
			   [firstName] = @firstName
			   ,[lastName] = @lastName
			   ,[emailId] = @emailId
			   ,[password] = @password
			   ,[DOB] = @DOB
			   ,[contactNo] = @contactNo
			   ,[isActive] = 1
			   ,[createdBy] = @createdBy
			   ,[createdOn] = getdate()
			   ,[tenantId] = @tenantId
			   ,[roleId] = @roleId
		 WHERE userId=@userId
		 SET @status=1
     END
	 ELSE
	 BEGIN
	 	 SET @status=0
	 END
	 RETURN @status
END
GO
/****** Object:  StoredProcedure [dbo].[sp_VerifyToken]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to Get Course data by specifeid Id

*/
CREATE PROCEDURE [dbo].[sp_VerifyToken]
	@token nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT emailid from tblResetPassword where token=@token and isUsed=0
END

GO
/****** Object:  StoredProcedure [dbo].[TenantActivateDeactivate]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TenantActivateDeactivate]
	@tenantId int,	
	@isActive bit	

AS
BEGIN	

	SET NOCOUNT ON;

	update tblTenant set 	isActive=@isActive 	where  tenantId=@tenantId
	
END

GO
/****** Object:  StoredProcedure [dbo].[TenantAdd]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TenantAdd]
	@tenantName nvarchar(50),
	@tenantDomain nvarchar(50),
	@activationFrom date,
	@activationTo date,	
	@createdBy int,
	@noOfUserAllowed int

AS
BEGIN	
declare @status bit
	SET NOCOUNT ON;
	if not exists (select tenantId from tblTenant where tenantDomain=@tenantDomain)
	begin
    INSERT INTO [dbo].[tblTenant]
           ([tenantName]
           ,[tenantDomain]
           ,[activationFrom]
           ,[activationTo]
           ,[isActive]
           ,[createdBy]
           ,[createdOn]
           ,[noOfUserAllowed])
     VALUES
           (@tenantName
           ,@tenantDomain
           ,@activationFrom
           ,@activationTo
           ,1
           ,@createdBy
           ,getdate()
           ,@noOfUserAllowed)

		   set @status=1
     end
		 else
			 begin

			 set @status=0
	 
			 end
	 return @status
END

GO
/****** Object:  StoredProcedure [dbo].[TenantGetById]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TenantGetById]
	@tenantId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select * from tblTenant where tenantId=@tenantId
END

GO
/****** Object:  StoredProcedure [dbo].[TenantUpdate]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TenantUpdate]
	@tenantId int,
	@tenantName nvarchar(50),
	@tenantDomain nvarchar(50),
	@activationFrom date,
	@activationTo date,
	@isActive bit,
	@createdBy int,
	@noOfUserAllowed int = null

AS
BEGIN	

	SET NOCOUNT ON;

	update tblTenant set tenantName=@tenantName,
	tenantDomain=@tenantDomain,
	activationFrom=@activationFrom,
	activationTo=@activationTo,
	isActive=@isActive,
	noOfUserAllowed=@noOfUserAllowed
	where  tenantId=@tenantId
	
END

GO
/****** Object:  StoredProcedure [dbo].[UserActivateDeactivate]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserActivateDeactivate]
	@userId int,	
	@isActive bit	

AS
BEGIN	

	SET NOCOUNT ON;

	update tblUser set 	isActive=@isActive 	where  userId=@userId
	
END

GO
/****** Object:  StoredProcedure [dbo].[UserAdd]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserAdd]
	@firstName nvarchar(50),
	@lastName nvarchar(50),
	@emailId nvarchar(50),
	@password nvarchar(50),
	@DOB date,
	@contactNo nvarchar(50),
	@isActive bit,
	@createdBy int,
	@tenantId int,
	@roleId int

AS
BEGIN	
declare @status bit
	SET NOCOUNT ON;
	if not exists (select userId from tblUser where emailId=@emailId)
	begin
    INSERT INTO [dbo].[tblUser]
           ([firstName]
           ,[lastName]
           ,[emailId]
           ,[password]
           ,[contactNo]
           ,[isActive]
		   ,[createdBy]
           ,[createdOn]
           ,[tenantId]
		   ,[roleId])
     VALUES
           (@firstName
           ,@lastName
           ,@emailId
           ,@password
           ,@contactNo
           ,@isActive
		   ,@createdBy
           ,getdate()
           ,@tenantId
		   ,@roleId)

		   set @status=1
     end
		 else
			 begin

			 set @status=0
	 
			 end
	 return @status
END

GO
/****** Object:  StoredProcedure [dbo].[UserGetById]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UserGetById]
	@userId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select * from tblUser where userId=@userId
END

GO
/****** Object:  StoredProcedure [dbo].[UserUpdate]    Script Date: 1/14/2020 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserUpdate]
	@userId int,
	@firstName nvarchar(50),
	@lastName nvarchar(50),
	@emailId nvarchar(50),
	@password nvarchar(50),
	@DOB date,
	@contactNo nvarchar(50),
	@isActive bit,
	@createdBy int,
	@tenantId int,
	@roleId int

AS
BEGIN	
declare @status bit
	SET NOCOUNT ON;
	if exists (select userId from tblUser where emailId=@emailId and userId=@userId)
	begin
    UPDATE [dbo].[tblUser] SET
           [firstName] = @firstName
           ,[lastName] = @lastName
           ,[emailId] = @emailId
           ,[password] = @password
		   ,[DOB] = @DOB
           ,[contactNo] = @contactNo
           ,[isActive] = @isActive
		   ,[createdBy] = @createdBy
           ,[createdOn] = getdate()
           ,[tenantId] = @tenantId
		   ,[roleId] = @roleId
     where userId=@userId
		 set @status=1
     end
		 else
			 begin

			 set @status=0
	 
			 end
	 return @status
END

GO
USE [master]
GO
ALTER DATABASE [LMSDB] SET  READ_WRITE 
GO

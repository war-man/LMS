USE [master]
GO
/****** Object:  Database [LMSDB]    Script Date: 2/19/2020 11:54:56 AM ******/
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
/****** Object:  User [IIS APPPOOL\DefaultAppPool]    Script Date: 2/19/2020 11:54:57 AM ******/
CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[tblAssignmentAndTracking]    Script Date: 2/19/2020 11:54:57 AM ******/
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
/****** Object:  Table [dbo].[tblCourse]    Script Date: 2/19/2020 11:54:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCourse](
	[ContentModuleId] [nvarchar](50) NULL,
	[ContentModuleName] [nvarchar](250) NOT NULL,
	[ContentModuleDescription] [nvarchar](1000) NULL,
	[ContentModuleURL] [nvarchar](500) NOT NULL,
	[ContentModuleType] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NULL,
	[MasteryScore] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[TenantId] [int] NOT NULL,
	[Duration] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmails]    Script Date: 2/19/2020 11:54:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmailTo] [nvarchar](100) NOT NULL,
	[EmailSubject] [nvarchar](250) NOT NULL,
	[EmailBody] [ntext] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[isSent] [bit] NOT NULL,
	[DateSent] [datetime] NULL,
	[SentStatus] [nvarchar](200) NULL,
 CONSTRAINT [PK_tblEmails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblErrorLog]    Script Date: 2/19/2020 11:54:57 AM ******/
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
/****** Object:  Table [dbo].[tblLearnerActivityAssignment]    Script Date: 2/19/2020 11:54:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLearnerActivityAssignment](
	[LearnerId] [nvarchar](100) NOT NULL,
	[ActivityId] [nvarchar](100) NOT NULL,
	[AssignmentDate] [datetime] NOT NULL,
	[AssignmentType] [nvarchar](100) NULL,
	[DueDate] [datetime] NULL,
 CONSTRAINT [PK_tblLearnerActivityAssignment] PRIMARY KEY CLUSTERED 
(
	[LearnerId] ASC,
	[ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLearnerContentModTracking]    Script Date: 2/19/2020 11:54:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLearnerContentModTracking](
	[ContentTrackId] [nvarchar](50) NULL,
	[ContentModuleId] [nvarchar](100) NOT NULL,
	[LearnerId] [nvarchar](100) NOT NULL,
	[ContentModuleName] [nvarchar](100) NULL,
	[CompletionStatus] [nvarchar](100) NULL,
	[DateOfStart] [datetime] NULL,
	[DateOfCompletion] [datetime] NULL,
	[TotalNoOfPages] [int] NULL,
	[NoOfPagesCompleted] [int] NULL,
	[UserDataXML] [nvarchar](max) NULL,
	[Score] [varchar](50) NULL,
	[PassFailStatus] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLearnerContentModTrackingLog]    Script Date: 2/19/2020 11:54:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLearnerContentModTrackingLog](
	[LearnerId] [nvarchar](100) NULL,
	[ContentModuleId] [nvarchar](100) NULL,
	[CompletionStatus] [nvarchar](100) NULL,
	[DateOfStart] [datetime] NULL,
	[DateOfCompletion] [datetime] NULL,
	[TotalNoOfPages] [int] NULL,
	[NoOfPagesCompleted] [int] NULL,
	[UserDataXML] [nvarchar](max) NULL,
	[Score] [varchar](50) NULL,
	[Logdate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLog]    Script Date: 2/19/2020 11:54:57 AM ******/
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
/****** Object:  Table [dbo].[tblLoginLog]    Script Date: 2/19/2020 11:54:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLoginLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[LoginDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tblLoginLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNotificationTemplates]    Script Date: 2/19/2020 11:54:57 AM ******/
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
/****** Object:  Table [dbo].[tblQuestion]    Script Date: 2/19/2020 11:54:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuestion](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[QuizId] [int] NOT NULL,
	[QuestionTypeId] [int] NOT NULL,
	[QuestionText] [nvarchar](max) NULL,
	[CorrectFeedback] [ntext] NULL,
	[InCorrectFeedback] [ntext] NULL,
	[isRandomOption] [bit] NULL,
 CONSTRAINT [PK_tblQuestion] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuestionOption]    Script Date: 2/19/2020 11:54:57 AM ******/
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
/****** Object:  Table [dbo].[tblQuestionType]    Script Date: 2/19/2020 11:54:57 AM ******/
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
/****** Object:  Table [dbo].[tblQuiz]    Script Date: 2/19/2020 11:54:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuiz](
	[QuizId] [int] IDENTITY(1,1) NOT NULL,
	[QuizName] [nvarchar](500) NOT NULL,
	[QuizDescription] [nvarchar](1000) NULL,
	[TenantId] [int] NULL,
	[DateCreated] [datetime] NULL,
	[Duration] [int] NULL,
 CONSTRAINT [PK_tblQuiz] PRIMARY KEY CLUSTERED 
(
	[QuizId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuizAssignment]    Script Date: 2/19/2020 11:54:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuizAssignment](
	[QuizId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[DateAssigned] [datetime] NULL,
	[DueDate] [datetime] NULL,
 CONSTRAINT [PK_tblQuizAssignment] PRIMARY KEY CLUSTERED 
(
	[QuizId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuizScore]    Script Date: 2/19/2020 11:54:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuizScore](
	[QuizId] [int] NOT NULL,
	[UserId] [nvarchar](100) NOT NULL,
	[Score] [numeric](18, 0) NOT NULL,
	[AttemptedDate] [datetime] NOT NULL,
	[Attempt] [int] NULL,
	[completedTime] [nvarchar](20) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tblQuizScore] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRatings]    Script Date: 2/19/2020 11:54:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRatings](
	[ActivityId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Attempt] [int] NOT NULL,
	[ActivityType] [varchar](10) NOT NULL,
	[Rating] [numeric](18, 2) NULL,
	[Comment] [nvarchar](1000) NULL,
	[TenantId] [int] NOT NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblResetPassword]    Script Date: 2/19/2020 11:54:57 AM ******/
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
/****** Object:  Table [dbo].[tblResponses]    Script Date: 2/19/2020 11:54:57 AM ******/
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
	[DateCreated] [datetime] NULL,
	[Attempt] [int] NULL,
 CONSTRAINT [PK_tblResponses] PRIMARY KEY CLUSTERED 
(
	[ResponseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 2/19/2020 11:54:57 AM ******/
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
/****** Object:  Table [dbo].[tblTenant]    Script Date: 2/19/2020 11:54:57 AM ******/
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
/****** Object:  Table [dbo].[tblUser]    Script Date: 2/19/2020 11:54:57 AM ******/
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
	[createdOn] [datetime] NULL,
	[tenantId] [int] NOT NULL,
	[roleId] [int] NULL,
	[isNew] [bit] NULL,
	[profileImage] [ntext] NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserRoles]    Script Date: 2/19/2020 11:54:57 AM ******/
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
INSERT [dbo].[tblCourse] ([ContentModuleId], [ContentModuleName], [ContentModuleDescription], [ContentModuleURL], [ContentModuleType], [IsActive], [MasteryScore], [CreatedBy], [CreatedOn], [TenantId], [Duration]) VALUES (N'1', N'Test Course New', N'Test Course Desc', N'E:\Uploads\Test Course.zip', N'Scorm1.2', 1, 20, 5, CAST(N'2020-01-24T20:59:32.657' AS DateTime), 1, 10)
INSERT [dbo].[tblCourse] ([ContentModuleId], [ContentModuleName], [ContentModuleDescription], [ContentModuleURL], [ContentModuleType], [IsActive], [MasteryScore], [CreatedBy], [CreatedOn], [TenantId], [Duration]) VALUES (N'4', N'Course By Dinesh', N'DESC', N'/4//4/index_lms.html.html', N'Scorm1.2', 1, 80, 5, CAST(N'2020-01-24T20:59:32.657' AS DateTime), 1, 20)
INSERT [dbo].[tblCourse] ([ContentModuleId], [ContentModuleName], [ContentModuleDescription], [ContentModuleURL], [ContentModuleType], [IsActive], [MasteryScore], [CreatedBy], [CreatedOn], [TenantId], [Duration]) VALUES (N'5', N'Couese by Baji', N'DESC', N'/4//4/index_lms.html.html', N'Scorm1.2', 1, 80, 5, CAST(N'2020-01-24T20:59:32.657' AS DateTime), 1, NULL)
INSERT [dbo].[tblCourse] ([ContentModuleId], [ContentModuleName], [ContentModuleDescription], [ContentModuleURL], [ContentModuleType], [IsActive], [MasteryScore], [CreatedBy], [CreatedOn], [TenantId], [Duration]) VALUES (N'6', N'New Course', N'New Course desc', N'E:\Uploads\New Course.zip', N'Scorm1.2', 1, 11, 5, CAST(N'2020-02-05T19:23:06.527' AS DateTime), 1, 30)
INSERT [dbo].[tblCourse] ([ContentModuleId], [ContentModuleName], [ContentModuleDescription], [ContentModuleURL], [ContentModuleType], [IsActive], [MasteryScore], [CreatedBy], [CreatedOn], [TenantId], [Duration]) VALUES (N'7', N'Course Testing', N'Course Testing Desc', N'E:\Projects\LMS\CoursePLayer\ContentModules', N'Scorm1.2', 1, 70, 5, CAST(N'2020-02-06T12:31:58.477' AS DateTime), 1, NULL)
INSERT [dbo].[tblCourse] ([ContentModuleId], [ContentModuleName], [ContentModuleDescription], [ContentModuleURL], [ContentModuleType], [IsActive], [MasteryScore], [CreatedBy], [CreatedOn], [TenantId], [Duration]) VALUES (N'8', N'Course Testing By Dinesh', N'Course Testing By Dinesh Desc', N'E:\Projects\LMS\CoursePLayer\ContentModules', N'Scorm1.2', 1, 80, 5, CAST(N'2020-02-11T16:18:26.320' AS DateTime), 1, 10)
INSERT [dbo].[tblCourse] ([ContentModuleId], [ContentModuleName], [ContentModuleDescription], [ContentModuleURL], [ContentModuleType], [IsActive], [MasteryScore], [CreatedBy], [CreatedOn], [TenantId], [Duration]) VALUES (N'9', N'For Vivek Demo', N'For Vivek Demo Desc', N'E:\Projects\LMS\CoursePLayer\ContentModules', N'Scorm1.2', 1, 80, 5, CAST(N'2020-02-13T15:14:07.867' AS DateTime), 1, 10)
INSERT [dbo].[tblCourse] ([ContentModuleId], [ContentModuleName], [ContentModuleDescription], [ContentModuleURL], [ContentModuleType], [IsActive], [MasteryScore], [CreatedBy], [CreatedOn], [TenantId], [Duration]) VALUES (N'10', N'iSpring Course', N'Course Testing Desc', N'E:\Projects\LMS\CoursePLayer\ContentModules', N'Scorm1.2', 1, 11, 5, CAST(N'2020-02-15T13:14:56.407' AS DateTime), 1, 5)
INSERT [dbo].[tblCourse] ([ContentModuleId], [ContentModuleName], [ContentModuleDescription], [ContentModuleURL], [ContentModuleType], [IsActive], [MasteryScore], [CreatedBy], [CreatedOn], [TenantId], [Duration]) VALUES (N'11', N'Course Testing111', N'Course Testing Desc', N'E:\Projects\LMS\CoursePLayer\ContentModules', N'Scorm1.2', 1, 80, 5, CAST(N'2020-02-16T19:16:15.077' AS DateTime), 1, 10)
INSERT [dbo].[tblCourse] ([ContentModuleId], [ContentModuleName], [ContentModuleDescription], [ContentModuleURL], [ContentModuleType], [IsActive], [MasteryScore], [CreatedBy], [CreatedOn], [TenantId], [Duration]) VALUES (N'12', N'Status Check', N'111', N'E:\Projects\LMS\CoursePLayer\ContentModules', N'Scorm1.2', 1, 11, 5, CAST(N'2020-02-17T11:51:21.997' AS DateTime), 1, 22)
INSERT [dbo].[tblCourse] ([ContentModuleId], [ContentModuleName], [ContentModuleDescription], [ContentModuleURL], [ContentModuleType], [IsActive], [MasteryScore], [CreatedBy], [CreatedOn], [TenantId], [Duration]) VALUES (N'13', N'New Health Policies', N'New Health Policies', N'E:\Projects\LMS\CoursePLayer\ContentModules', N'Scorm1.2', 1, 80, 5, CAST(N'2020-02-17T14:20:37.027' AS DateTime), 1, 30)
SET IDENTITY_INSERT [dbo].[tblEmails] ON 

INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (3, N'dgabhane@gmail.com', N'Welcome To LMS', N'Welcome To LMS. </br> Please click below link to Login </br><a href=''http://localhost:61705/Login/ChangePassword?t=3c13d2eb-4c74-4263-94b7-a1020ed588ea''>Click Here</a>', CAST(N'2020-01-21T12:50:47.983' AS DateTime), 1, CAST(N'2020-01-22T20:19:54.910' AS DateTime), N'Sent')
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (4, N'dinesh3@gmail.com', N'Welcome To LMS', N'Welcome To LMS. </br> Please click below link to Login </br><a href=''http://localhost:61705/Login/ChangePassword?t=5ddccc80-7c5e-44b0-91c2-34859dd07663''>Click Here</a>', CAST(N'2020-01-21T12:50:51.783' AS DateTime), 1, CAST(N'2020-01-22T20:18:24.690' AS DateTime), N'Sent')
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (5, N'dinesh5@gmail.com', N'Welcome To LMS', N'Welcome To LMS. </br> Please click below link to Login </br><a href=''http://localhost:61705/Login/ChangePassword?t=7aee42e7-fdbb-4fbb-b761-667b1f907d83''>Click Here</a>', CAST(N'2020-01-21T12:50:51.787' AS DateTime), 1, CAST(N'2020-01-22T20:18:20.083' AS DateTime), N'Sent')
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (6, N'dinesh101@gmail.com', N'Welcome To LMS', N'Welcome To LMS. </br> Please click below link to Login </br><a href=''http://localhost:61705/Login/ChangePassword?t=02fc07f2-d9bc-44d2-9d5b-6d1e9d2b6ca8''>Click Here</a>', CAST(N'2020-01-21T13:19:43.597' AS DateTime), 1, CAST(N'2020-01-22T20:18:11.447' AS DateTime), N'Sent')
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (7, N'Don1111@gmail.com', N'Password Recovery Link', N'<a href=''http://localhost:61705/Login/ChangePassword?t=ba55842a-d016-496a-a56d-14ddf2b746d9''>Click here to reset your password</a>', CAST(N'2020-01-28T18:21:32.117' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (8, N'Don22222@gmail.com', N'Password Recovery Link', N'<a href=''http://localhost:61705/Login/ChangePassword?t=efed9ca1-0969-4fe6-9f6b-56018b1c21a4''>Click here to reset your password</a>', CAST(N'2020-01-28T18:21:44.413' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1007, N'Don@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 25% </br>', CAST(N'2020-02-10T22:18:35.643' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1008, N'Don@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 25% </br>', CAST(N'2020-02-10T22:37:41.817' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1009, N'Don@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 25% </br>', CAST(N'2020-02-11T11:42:14.547' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1010, N'Don@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 0% </br>', CAST(N'2020-02-11T11:52:38.853' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1011, N'Don@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 50% </br>', CAST(N'2020-02-11T12:01:42.277' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1012, N'Don@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 25% </br>', CAST(N'2020-02-11T12:15:17.570' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1013, N'Don@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 75% </br>', CAST(N'2020-02-11T12:33:17.403' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1014, N'Don@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 0% </br>', CAST(N'2020-02-11T13:43:30.507' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1015, N'aaaaa@gmail.com', N'Welcome To LMS', N'Welcome To LMS. </br> Please click below link to Login </br><a href=''http://localhost:61705/Login/ChangePassword?t=d2adf6d1-ce61-47b4-a289-cac4d313d175''>Click Here</a>', CAST(N'2020-02-11T15:17:12.347' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1016, N'dgabhane@gmail.com', N'Course Assigned - ', N' assigned to you. Please go through it. <br /> Your Due Date is - 2/28/2020 12:00:00 AM', CAST(N'2020-02-12T12:46:24.270' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1017, N'Don@gmail.com', N'Course Assigned - ', N' assigned to you. Please go through it. <br /> Your Due Date is - 2/28/2020 12:00:00 AM', CAST(N'2020-02-12T12:46:24.330' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1018, N'dgabhane@gmail.com', N'Course Assigned - Test Course New', N'Test Course New assigned to you. Please go through it. <br /> Your Due Date is - 2/27/2020 12:00:00 AM', CAST(N'2020-02-12T12:47:42.967' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1019, N'ddd@gmail.com', N'Course Assigned - Test Course New', N'Test Course New assigned to you. Please go through it. <br /> Your Due Date is - 2/27/2020 12:00:00 AM', CAST(N'2020-02-12T12:47:42.970' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1020, N'Don@gmail.com', N'Course Assigned - Test Course New', N'Test Course New assigned to you. Please go through it. <br /> Your Due Date is - 2/27/2020 12:00:00 AM', CAST(N'2020-02-12T12:47:42.970' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1021, N'new@gmail.com', N'Course Assigned - Check Random', N'Check Random - assigned to you. Please go through it. <br /> Your Due Date is - 2/27/2020 12:00:00 AM', CAST(N'2020-02-12T13:43:55.773' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1022, N'Don@gmail.com', N'Course Assigned - Check Random', N'Check Random - assigned to you. Please go through it. <br /> Your Due Date is - 2/27/2020 12:00:00 AM', CAST(N'2020-02-12T13:43:55.777' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1023, N'Don3@gmail.com', N'Course Assigned - Check Random', N'Check Random - assigned to you. Please go through it. <br /> Your Due Date is - 2/27/2020 12:00:00 AM', CAST(N'2020-02-12T13:43:55.837' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1024, N'dgabhane@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 50% <br />', CAST(N'2020-02-12T14:23:22.557' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1025, N'dinesh8@gmail.com', N'Welcome To LMS', N'Welcome To LMS. </br> Please click below link to Login </br><a href=''http://localhost:61705/Login/ChangePassword?t=e1df5d17-d3c6-440e-b599-4d0b8b0ee792''>Click Here</a>', CAST(N'2020-02-12T18:39:02.167' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1026, N'dinesh9@gmail.com', N'Welcome To LMS', N'Welcome To LMS. </br> Please click below link to Login </br><a href=''http://localhost:61705/Login/ChangePassword?t=1841f4a1-6058-4251-9793-46641964bf33''>Click Here</a>', CAST(N'2020-02-13T15:08:58.440' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1027, N'dinesh10@gmail.com', N'Welcome To LMS', N'Welcome To LMS. </br> Please click below link to Login </br><a href=''http://localhost:61705/Login/ChangePassword?t=857923b3-098e-4438-98cf-048355391471''>Click Here</a>', CAST(N'2020-02-13T15:08:58.440' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1028, N'dgabhane@gmail.com', N'Course Assigned - Course Testing By Dinesh', N'Course Testing By Dinesh - assigned to you. Please go through it. <br /> Your Due Date is - 2/27/2020 12:00:00 AM', CAST(N'2020-02-13T15:23:55.353' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1029, N'ddd@gmail.com', N'Course Assigned - Course Testing By Dinesh', N'Course Testing By Dinesh - assigned to you. Please go through it. <br /> Your Due Date is - 2/27/2020 12:00:00 AM', CAST(N'2020-02-13T15:23:55.357' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1030, N'new@gmail.com', N'Course Assigned - Course Testing By Dinesh', N'Course Testing By Dinesh - assigned to you. Please go through it. <br /> Your Due Date is - 2/27/2020 12:00:00 AM', CAST(N'2020-02-13T15:23:55.357' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1031, N'Don@gmail.com', N'Course Assigned - Course Testing By Dinesh', N'Course Testing By Dinesh - assigned to you. Please go through it. <br /> Your Due Date is - 2/27/2020 12:00:00 AM', CAST(N'2020-02-13T15:23:55.363' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1032, N'Don111@gmail.com', N'Course Assigned - Course Testing By Dinesh', N'Course Testing By Dinesh - assigned to you. Please go through it. <br /> Your Due Date is - 2/27/2020 12:00:00 AM', CAST(N'2020-02-13T15:23:55.367' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1033, N'dgabhane@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 25% <br />', CAST(N'2020-02-13T15:31:51.353' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1034, N'dgabhane@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 0% <br />', CAST(N'2020-02-13T15:36:20.910' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1035, N'Don@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 75% <br />', CAST(N'2020-02-13T15:44:37.873' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1036, N'Don@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 0% <br />', CAST(N'2020-02-13T16:18:51.857' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1037, N'Don@gmail.com', N'Course Assigned - Course By Dinesh', N'Course By Dinesh - assigned to you. Please go through it. <br /> Your Due Date is - 2/28/2020 12:00:00 AM', CAST(N'2020-02-13T17:03:38.850' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1038, N'dinesh12@gmail.com', N'Welcome To LMS', N'Welcome To LMS. </br> Please click below link to Login </br><a href=''http://localhost:61705/Login/ChangePassword?t=bdb5c12d-0a1a-4a14-8cbc-7848f07089ba''>Click Here</a>', CAST(N'2020-02-13T18:52:57.900' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1039, N'dinesh11@gmail.com', N'Welcome To LMS', N'Welcome To LMS. </br> Please click below link to Login </br><a href=''http://localhost:61705/Login/ChangePassword?t=c0950b47-d99f-4e52-9482-ae6755b51dfc''>Click Here</a>', CAST(N'2020-02-13T18:52:57.903' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1040, N'Don@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 25% <br />', CAST(N'2020-02-15T16:17:15.890' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1041, N'Don@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 0% <br />', CAST(N'2020-02-15T16:19:27.313' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1042, N'Don@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 25% <br />', CAST(N'2020-02-15T21:36:16.407' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1043, N'Don@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 50% <br />', CAST(N'2020-02-15T23:07:28.423' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1044, N'Don@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 0% <br />', CAST(N'2020-02-16T11:01:40.677' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1045, N'Don@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 0% <br />', CAST(N'2020-02-16T14:26:32.833' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1046, N'Don@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 0% <br />', CAST(N'2020-02-16T15:23:59.277' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1047, N'dgabhane@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 0% <br />', CAST(N'2020-02-16T15:25:41.643' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1048, N'Don@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 40% <br />', CAST(N'2020-02-16T18:52:25.483' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1049, N'Don@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 0% <br />', CAST(N'2020-02-16T19:01:14.250' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1050, N'Don@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 20% <br />', CAST(N'2020-02-16T19:01:46.750' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1051, N'dgabhane@gmail.com', N'Course Assigned - iSpring Course', N'iSpring Course - assigned to you. Please go through it. <br /> Your Due Date is - 2/16/2020 12:00:00 AM', CAST(N'2020-02-16T19:16:26.360' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1057, N'Don@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 0% <br />', CAST(N'2020-02-17T15:51:49.940' AS DateTime), 1, CAST(N'2020-02-17T16:36:29.977' AS DateTime), N'Sent')
INSERT [dbo].[tblEmails] ([Id], [EmailTo], [EmailSubject], [EmailBody], [DateCreated], [isSent], [DateSent], [SentStatus]) VALUES (1058, N'Don@gmail.com', N'Quiz Result', N'Thank you for taking Quiz. </br> Your score is 0% <br />', CAST(N'2020-02-17T16:03:22.043' AS DateTime), 1, CAST(N'2020-02-17T16:36:21.640' AS DateTime), N'Sent')
SET IDENTITY_INSERT [dbo].[tblEmails] OFF
SET IDENTITY_INSERT [dbo].[TblErrorLog] ON 

INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (1, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.UserController.Index() in E:\Projects\LMS\LMSWeb\Controllers\UserController.cs:line 23', N'/User/Index', CAST(N'2020-01-13T19:04:29.600' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (2, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.ReportsController.Index() in E:\Projects\LMS\LMSWeb\Controllers\ReportsController.cs:line 26', N'/Reports/Index', CAST(N'2020-01-13T19:37:32.990' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (3, N'111', N'111', N'111', N'/Home', CAST(N'2020-01-14T00:53:27.717' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (4, N'222', N'222', N'222', N'/Home', CAST(N'2020-01-14T00:53:27.720' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (5, N'Don', N'Don', N'Don', N'/Home', CAST(N'2020-01-14T00:53:27.723' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (6, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 168
   at LMSWeb.Controllers.LoginController.UserAuthentication(TblUser loginUser) in E:\Projects\LMS\LMSWeb\Controllers\LoginController.cs:line 42', N'/Login/UserAuthentication', CAST(N'2020-01-16T13:31:59.727' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (7, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-01-16T13:32:33.320' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (8, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-01-16T13:32:33.373' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (9, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-01-16T13:32:33.377' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 168
   at LMSWeb.Controllers.AssignmentController.LaunchQuiz(Int32 QuizId) in E:\Projects\LMS\LMSWeb\Controllers\AssignmentController.cs:line 61', N'/Assignment/LaunchQuiz', CAST(N'2020-01-16T13:34:15.510' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (11, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-01-16T13:35:04.370' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (12, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-01-16T13:35:04.430' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (13, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-01-16T13:35:04.430' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (14, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-01-16T13:36:06.077' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (15, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-01-16T13:36:06.150' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (16, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-01-16T13:36:06.150' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (17, N'Entered', N'Entered', N'Entered', N'/Quiz/Index', CAST(N'2020-01-16T15:25:21.020' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (18, N'Entered Again', N'Entered Again', N'Entered Again', N'/Quiz/Index', CAST(N'2020-01-16T15:25:21.033' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (19, N'1', N'1', N'1', N'/Quiz/Index', CAST(N'2020-01-16T15:25:21.053' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20, N'Quiz Saved Successfully', N'Quiz Saved Successfully', N'Quiz Saved Successfully', N'/Quiz/AddQuiz', CAST(N'2020-01-16T15:25:52.220' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (21, N'Entered', N'Entered', N'Entered', N'/Quiz', CAST(N'2020-01-16T15:25:54.993' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (22, N'Entered Again', N'Entered Again', N'Entered Again', N'/Quiz', CAST(N'2020-01-16T15:25:54.993' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (23, N'1', N'1', N'1', N'/Quiz', CAST(N'2020-01-16T15:25:54.993' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (24, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-01-19T18:05:38.720' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (25, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T18:05:38.800' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (26, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T18:05:38.813' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (27, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T18:06:13.670' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (28, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T18:06:13.673' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (29, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T18:06:39.807' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (30, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T18:06:39.993' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (31, N'Failed to convert parameter value from a String to a Int32.', N'FormatException', N'System.FormatException: Failed to convert parameter value from a String to a Int32. ---> System.FormatException: Input string was not in a correct format.
   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.String.System.IConvertible.ToInt32(IFormatProvider provider)
   at System.Convert.ChangeType(Object value, Type conversionType, IFormatProvider provider)
   at System.Data.SqlClient.SqlParameter.CoerceValue(Object value, MetaType destinationType, Boolean& coercedToDataFeed, Boolean& typeChanged, Boolean allowStreaming)
   --- End of inner exception stack trace ---
   at System.Data.SqlClient.SqlParameter.CoerceValue(Object value, MetaType destinationType, Boolean& coercedToDataFeed, Boolean& typeChanged, Boolean allowStreaming)
   at System.Data.SqlClient.SqlParameter.GetCoercedValue()
   at System.Data.SqlClient.SqlParameter.Validate(Int32 index, Boolean isCommandProc)
   at System.Data.SqlClient.SqlCommand.SetUpRPCParameters(_SqlRPC rpc, Int32 startCount, Boolean inSchema, SqlParameterCollection parameters)
   at System.Data.SqlClient.SqlCommand.BuildRPC(Boolean inSchema, SqlParameterCollection parameters, _SqlRPC& rpc)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at LMSBL.Repository.DataRepository.ExecuteQuery(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 87
   at LMSBL.Repository.QuizRepository.CreateQuiz(TblQuiz obj) in E:\Projects\LMS\LMSBL\Repository\QuizRepository.cs:line 120', N'/Quiz/AddQuiz', CAST(N'2020-01-19T19:08:21.933' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (32, N'Failed to convert parameter value from a String to a Int32.', N'FormatException', N'System.FormatException: Failed to convert parameter value from a String to a Int32. ---> System.FormatException: Input string was not in a correct format.
   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.String.System.IConvertible.ToInt32(IFormatProvider provider)
   at System.Convert.ChangeType(Object value, Type conversionType, IFormatProvider provider)
   at System.Data.SqlClient.SqlParameter.CoerceValue(Object value, MetaType destinationType, Boolean& coercedToDataFeed, Boolean& typeChanged, Boolean allowStreaming)
   --- End of inner exception stack trace ---
   at System.Data.SqlClient.SqlParameter.CoerceValue(Object value, MetaType destinationType, Boolean& coercedToDataFeed, Boolean& typeChanged, Boolean allowStreaming)
   at System.Data.SqlClient.SqlParameter.GetCoercedValue()
   at System.Data.SqlClient.SqlParameter.Validate(Int32 index, Boolean isCommandProc)
   at System.Data.SqlClient.SqlCommand.SetUpRPCParameters(_SqlRPC rpc, Int32 startCount, Boolean inSchema, SqlParameterCollection parameters)
   at System.Data.SqlClient.SqlCommand.BuildRPC(Boolean inSchema, SqlParameterCollection parameters, _SqlRPC& rpc)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at LMSBL.Repository.DataRepository.ExecuteQuery(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 87
   at LMSBL.Repository.QuizRepository.CreateQuiz(TblQuiz obj) in E:\Projects\LMS\LMSBL\Repository\QuizRepository.cs:line 120', N'/Quiz/AddQuiz', CAST(N'2020-01-19T19:08:35.900' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (33, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-01-19T19:25:54.087' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (34, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T19:25:54.157' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (35, N'5', N'5', N'5', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T19:25:54.157' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (36, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T19:28:37.810' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (37, N'5', N'5', N'5', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T19:28:37.813' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (38, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-01-19T19:31:24.317' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (39, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T19:31:24.363' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (40, N'5', N'5', N'5', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T19:31:24.367' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (41, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T19:32:38.300' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (42, N'5', N'5', N'5', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T19:32:38.300' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (43, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T19:33:05.887' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (44, N'5', N'5', N'5', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T19:33:05.890' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (45, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-01-19T19:33:20.080' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (46, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T19:33:20.143' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (47, N'5', N'5', N'5', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T19:33:20.147' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (48, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-01-19T19:40:00.317' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (49, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T19:40:00.397' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (50, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T19:40:00.397' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (51, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-01-19T19:40:39.973' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (52, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T19:40:40.043' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (53, N'5', N'5', N'5', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T19:40:40.043' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (54, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-01-19T19:57:27.283' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (55, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T19:57:27.343' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (56, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T19:57:27.350' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (57, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-01-19T19:59:45.910' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (58, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T19:59:45.997' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (59, N'5', N'5', N'5', N'/Assignment/ReviewQuiz', CAST(N'2020-01-19T19:59:46.000' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (60, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-01-20T15:43:07.237' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (61, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-01-20T15:44:15.903' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (62, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-01-20T15:44:16.493' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (63, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-01-20T15:46:36.347' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (64, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-01-20T15:46:36.347' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (65, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-01-20T15:48:24.213' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (66, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-01-20T15:48:24.213' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (67, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-01-20T15:50:06.390' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (68, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-01-20T15:50:06.390' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (69, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-01-20T15:51:29.460' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (70, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-01-20T15:51:29.460' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (71, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-01-20T15:51:46.553' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (72, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-01-20T15:51:46.553' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (73, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-01-20T15:52:33.500' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (74, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-01-20T15:52:33.500' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (75, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-01-20T15:53:59.827' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (76, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-01-20T15:53:59.827' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (77, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-01-20T15:54:11.730' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (78, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-01-20T15:54:11.730' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (79, N'Column ''isNew'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''isNew'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 25
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 180
   at LMSWeb.Controllers.LoginController.UserAuthentication(TblUser loginUser) in E:\Projects\LMS\LMSWeb\Controllers\LoginController.cs:line 42', N'/Login/UserAuthentication', CAST(N'2020-01-20T20:44:07.157' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (80, N'Procedure or function ''sp_VerifyToken'' expects parameter ''@token'', which was not supplied.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_VerifyToken'' expects parameter ''@token'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 61
   at LMSBL.Repository.UserRepository.VerifyToken(String token) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 200
   at LMSWeb.Controllers.LoginController.ChangePassword(String t) in E:\Projects\LMS\LMSWeb\Controllers\LoginController.cs:line 136
ClientConnectionId:c319b74d-59e1-4f71-8c28-0eda5c5e8443
Error Number:201,State:4,Class:16', N'/Login/ChangePassword', CAST(N'2020-01-20T20:46:37.063' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (81, N'Procedure or function ''sp_VerifyToken'' expects parameter ''@token'', which was not supplied.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_VerifyToken'' expects parameter ''@token'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 61
   at LMSBL.Repository.UserRepository.VerifyToken(String token) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 200
   at LMSWeb.Controllers.LoginController.ChangePassword(String t) in E:\Projects\LMS\LMSWeb\Controllers\LoginController.cs:line 136
ClientConnectionId:aeee5079-3052-454a-8c40-e398405740ce
Error Number:201,State:4,Class:16', N'/Login/ChangePassword', CAST(N'2020-01-20T20:48:46.880' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (82, N'Procedure or function ''sp_PasswordUpdate'' expects parameter ''@emailid'', which was not supplied.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_PasswordUpdate'' expects parameter ''@emailid'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at LMSBL.Repository.DataRepository.ExecuteQuery(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 87
   at LMSBL.Repository.UserRepository.UpdatePassword(TblUser obj) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 222
   at LMSWeb.Controllers.LoginController.SubmitChangePassword(TblUser loginUser) in E:\Projects\LMS\LMSWeb\Controllers\LoginController.cs:line 157
ClientConnectionId:aeee5079-3052-454a-8c40-e398405740ce
Error Number:201,State:4,Class:16', N'/Login/SubmitChangePassword', CAST(N'2020-01-20T20:48:57.223' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (83, N'Procedure or function ''sp_VerifyToken'' expects parameter ''@token'', which was not supplied.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_VerifyToken'' expects parameter ''@token'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 61
   at LMSBL.Repository.UserRepository.VerifyToken(String token) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 200
   at LMSWeb.Controllers.LoginController.ChangePassword(String t) in E:\Projects\LMS\LMSWeb\Controllers\LoginController.cs:line 136
ClientConnectionId:84bfb5df-c12f-49ff-adde-647b1e57bfc7
Error Number:201,State:4,Class:16', N'/Login/ChangePassword', CAST(N'2020-01-20T20:52:49.843' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (84, N'Procedure or function ''sp_VerifyToken'' expects parameter ''@token'', which was not supplied.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_VerifyToken'' expects parameter ''@token'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 61
   at LMSBL.Repository.UserRepository.VerifyToken(String token) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 200
   at LMSWeb.Controllers.LoginController.ChangePassword(String t) in E:\Projects\LMS\LMSWeb\Controllers\LoginController.cs:line 136
ClientConnectionId:83ad094c-3757-43f0-87c9-ac22cc684458
Error Number:201,State:4,Class:16', N'/Login/ChangePassword', CAST(N'2020-01-20T20:55:55.800' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (85, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 180
   at LMSWeb.Controllers.LoginController.UserAuthentication(TblUser loginUser) in E:\Projects\LMS\LMSWeb\Controllers\LoginController.cs:line 43', N'/Login/UserAuthentication', CAST(N'2020-01-20T21:06:29.237' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (86, N'Cannot set Column ''DateSent'' to be null. Please use DBNull instead.', N'ArgumentException', N'System.ArgumentException: Cannot set Column ''DateSent'' to be null. Please use DBNull instead.
   at System.Data.DataRow.set_Item(DataColumn column, Object value)
   at System.Data.DataRow.set_Item(String columnName, Object value)
   at LMSWeb.Controllers.UserController.UploadUsers(TblUser objUser, HttpPostedFileBase file) in E:\Projects\LMS\LMSWeb\Controllers\UserController.cs:line 364', N'/User/UploadUsers', CAST(N'2020-01-21T12:42:10.373' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (87, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 182
   at LMSWeb.Controllers.LoginController.UserAuthentication(TblUser loginUser) in E:\Projects\LMS\LMSWeb\Controllers\LoginController.cs:line 44', N'/Login/UserAuthentication', CAST(N'2020-01-23T14:52:00.077' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (88, N'Object cannot be cast from DBNull to other types.', N'InvalidCastException', N'System.InvalidCastException: Object cannot be cast from DBNull to other types.
   at System.DBNull.System.IConvertible.ToBoolean(IFormatProvider provider)
   at System.Convert.ToBoolean(Object value)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 25
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 182
   at LMSWeb.Controllers.LoginController.UserAuthentication(TblUser loginUser) in E:\Projects\LMS\LMSWeb\Controllers\LoginController.cs:line 44', N'/Login/UserAuthentication', CAST(N'2020-01-23T14:53:37.693' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (89, N'Object cannot be cast from DBNull to other types.', N'InvalidCastException', N'System.InvalidCastException: Object cannot be cast from DBNull to other types.
   at System.DBNull.System.IConvertible.ToBoolean(IFormatProvider provider)
   at System.Convert.ToBoolean(Object value)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 25
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 182
   at LMSWeb.Controllers.LoginController.UserAuthentication(TblUser loginUser) in E:\Projects\LMS\LMSWeb\Controllers\LoginController.cs:line 44', N'/Login/UserAuthentication', CAST(N'2020-01-23T14:53:45.947' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (90, N'Object cannot be cast from DBNull to other types.', N'InvalidCastException', N'System.InvalidCastException: Object cannot be cast from DBNull to other types.
   at System.DBNull.System.IConvertible.ToBoolean(IFormatProvider provider)
   at System.Convert.ToBoolean(Object value)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 25
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 182
   at LMSWeb.Controllers.LoginController.UserAuthentication(TblUser loginUser) in E:\Projects\LMS\LMSWeb\Controllers\LoginController.cs:line 44', N'/Login/UserAuthentication', CAST(N'2020-01-24T13:57:36.587' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (91, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 79
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 95
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 23', N'/Courses/Index', CAST(N'2020-01-24T15:24:53.337' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (92, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 79
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 95
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 23', N'/Courses/Index', CAST(N'2020-01-24T15:36:47.990' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (93, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 79
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 95
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T15:54:21.947' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (94, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 79
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 95
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T15:55:16.627' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (95, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 79
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 95
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T15:55:48.730' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (96, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 79
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 95
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T16:12:45.083' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (97, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 79
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 95
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T16:14:33.090' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (98, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 84
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 100
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T17:08:12.090' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (99, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 84
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 100
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T17:09:31.130' AS DateTime))
GO
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (100, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 84
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 100
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T17:11:53.197' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (101, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 84
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 100
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T17:15:01.683' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (102, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 84
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 100
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T17:27:50.040' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (103, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 84
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 100
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T17:30:54.170' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (104, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 84
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 100
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T17:32:22.367' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (105, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 84
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 100
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T17:36:04.480' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (106, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 84
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 100
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T17:40:38.853' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (107, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 84
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 100
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T17:43:43.620' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (108, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 84
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 100
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T19:03:06.550' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (109, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 84
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 100
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T19:08:26.863' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (110, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 84
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 100
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T19:09:12.463' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (111, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 84
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 100
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T19:10:24.613' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (112, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 84
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 100
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T19:11:37.950' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (113, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 84
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 100
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T19:11:48.023' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (114, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 84
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 100
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T19:13:29.330' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (115, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__4_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 84
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 100
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T20:33:07.070' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (116, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__4_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 84
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 100
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T20:35:02.400' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (117, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__4_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 88
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 104
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T20:38:17.600' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (118, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__4_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 88
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 104
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T20:40:04.420' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (119, N'Invalid object name ''tblAllCourses''.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Invalid object name ''tblAllCourses''.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at LMSBL.Repository.DataRepository.ExecuteQuery(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 83
   at LMSBL.Repository.CoursesRepository.AddCourse(tblAllCourses obj) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 122
ClientConnectionId:3a04bce8-a656-4409-8bc5-925da3d21d43
Error Number:208,State:1,Class:16', N'/Courses/AddCourse', CAST(N'2020-01-24T20:42:26.400' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (120, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__4_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 88
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 104
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses', CAST(N'2020-01-24T20:42:32.503' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (121, N'Column ''ContentModuleId'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''ContentModuleId'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.CoursesRepository.<>c.<GetAllCourses>b__4_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 88
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 104
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses/Index', CAST(N'2020-01-24T20:43:35.443' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (122, N'Invalid object name ''tblCourses''.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Invalid object name ''tblCourses''.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 104
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24
ClientConnectionId:3f7bf408-218b-4383-b6d0-23b4e5c2fc7c
Error Number:208,State:1,Class:16', N'/Courses/Index', CAST(N'2020-01-24T20:59:04.030' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (123, N'Invalid object name ''tblCourses''.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Invalid object name ''tblCourses''.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 104
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24
ClientConnectionId:3f7bf408-218b-4383-b6d0-23b4e5c2fc7c
Error Number:208,State:1,Class:16', N'/Courses', CAST(N'2020-01-24T20:59:52.587' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (124, N'Invalid object name ''tblCourses''.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Invalid object name ''tblCourses''.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 104
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24
ClientConnectionId:3f7bf408-218b-4383-b6d0-23b4e5c2fc7c
Error Number:208,State:1,Class:16', N'/Courses', CAST(N'2020-01-24T21:01:19.007' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (125, N'Invalid object name ''tblCourses''.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Invalid object name ''tblCourses''.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.CoursesRepository.GetCourseById(Int32 CourseId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 79
   at LMSWeb.Controllers.CoursesController.EditCourse(Int32 id) in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 104
ClientConnectionId:fb2fb524-1c71-42a6-b51a-de703a7d18e3
Error Number:208,State:1,Class:16', N'/Courses/EditCourse/1', CAST(N'2020-01-24T21:15:08.400' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (126, N'The conversion of a varchar data type to a datetime data type resulted in an out-of-range value.
Th', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): The conversion of a varchar data type to a datetime data type resulted in an out-of-range value.
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.HomeRepository.GetAllActivities(Int32 TenantId, Int32 UserId) in E:\Projects\LMS\LMSBL\Repository\HomeRepository.cs:line 25
ClientConnectionId:5a316788-5ea0-47ba-bab8-77c79765a0f7
Error Number:242,State:3,Class:16', N'/Home', CAST(N'2020-01-27T18:44:36.680' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (127, N'The conversion of a varchar data type to a datetime data type resulted in an out-of-range value.
Th', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): The conversion of a varchar data type to a datetime data type resulted in an out-of-range value.
The statement has been terminated.
   at LMSBL.Repository.HomeRepository.GetAllActivities(Int32 TenantId, Int32 UserId) in E:\Projects\LMS\LMSBL\Repository\HomeRepository.cs:line 43
   at LMSWeb.Controllers.HomeController.Index() in E:\Projects\LMS\LMSWeb\Controllers\HomeController.cs:line 35
ClientConnectionId:5a316788-5ea0-47ba-bab8-77c79765a0f7
Error Number:242,State:3,Class:16', N'/Home', CAST(N'2020-01-27T18:44:36.720' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (128, N'The conversion of a varchar data type to a datetime data type resulted in an out-of-range value.
Th', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): The conversion of a varchar data type to a datetime data type resulted in an out-of-range value.
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.HomeRepository.GetAllActivities(Int32 TenantId, Int32 UserId) in E:\Projects\LMS\LMSBL\Repository\HomeRepository.cs:line 25
ClientConnectionId:5a316788-5ea0-47ba-bab8-77c79765a0f7
Error Number:242,State:3,Class:16', N'/Home/Index', CAST(N'2020-01-27T18:44:41.937' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (129, N'The conversion of a varchar data type to a datetime data type resulted in an out-of-range value.
Th', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): The conversion of a varchar data type to a datetime data type resulted in an out-of-range value.
The statement has been terminated.
   at LMSBL.Repository.HomeRepository.GetAllActivities(Int32 TenantId, Int32 UserId) in E:\Projects\LMS\LMSBL\Repository\HomeRepository.cs:line 43
   at LMSWeb.Controllers.HomeController.Index() in E:\Projects\LMS\LMSWeb\Controllers\HomeController.cs:line 35
ClientConnectionId:5a316788-5ea0-47ba-bab8-77c79765a0f7
Error Number:242,State:3,Class:16', N'/Home/Index', CAST(N'2020-01-27T18:44:42.020' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (130, N'The conversion of a varchar data type to a datetime data type resulted in an out-of-range value.
Th', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): The conversion of a varchar data type to a datetime data type resulted in an out-of-range value.
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.HomeRepository.GetAllActivities(Int32 TenantId, Int32 UserId) in E:\Projects\LMS\LMSBL\Repository\HomeRepository.cs:line 25
ClientConnectionId:5a316788-5ea0-47ba-bab8-77c79765a0f7
Error Number:242,State:3,Class:16', N'/Home', CAST(N'2020-01-27T18:45:13.427' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (131, N'Conversion failed when converting date and/or time from character string.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Conversion failed when converting date and/or time from character string.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.HomeRepository.GetAllActivities(Int32 TenantId, Int32 UserId, String status) in E:\Projects\LMS\LMSBL\Repository\HomeRepository.cs:line 27
ClientConnectionId:794eb332-cf7a-4396-b136-eb2b89d2be51
Error Number:241,State:1,Class:16', N'/Home', CAST(N'2020-01-27T19:41:57.990' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (132, N'Conversion failed when converting date and/or time from character string.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Conversion failed when converting date and/or time from character string.
   at LMSBL.Repository.HomeRepository.GetAllActivities(Int32 TenantId, Int32 UserId, String status) in E:\Projects\LMS\LMSBL\Repository\HomeRepository.cs:line 45
   at LMSWeb.Controllers.HomeController.Index() in E:\Projects\LMS\LMSWeb\Controllers\HomeController.cs:line 35
ClientConnectionId:794eb332-cf7a-4396-b136-eb2b89d2be51
Error Number:241,State:1,Class:16', N'/Home', CAST(N'2020-01-27T19:41:58.017' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (133, N'Conversion failed when converting date and/or time from character string.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Conversion failed when converting date and/or time from character string.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.HomeRepository.GetAllActivities(Int32 TenantId, Int32 UserId, String status) in E:\Projects\LMS\LMSBL\Repository\HomeRepository.cs:line 27
ClientConnectionId:794eb332-cf7a-4396-b136-eb2b89d2be51
Error Number:241,State:1,Class:16', N'/Home', CAST(N'2020-01-27T19:42:17.693' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (134, N'Conversion failed when converting date and/or time from character string.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Conversion failed when converting date and/or time from character string.
   at LMSBL.Repository.HomeRepository.GetAllActivities(Int32 TenantId, Int32 UserId, String status) in E:\Projects\LMS\LMSBL\Repository\HomeRepository.cs:line 45
   at LMSWeb.Controllers.HomeController.Index() in E:\Projects\LMS\LMSWeb\Controllers\HomeController.cs:line 35
ClientConnectionId:794eb332-cf7a-4396-b136-eb2b89d2be51
Error Number:241,State:1,Class:16', N'/Home', CAST(N'2020-01-27T19:42:17.720' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (135, N'Conversion failed when converting date and/or time from character string.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Conversion failed when converting date and/or time from character string.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.HomeRepository.GetAllActivities(Int32 TenantId, Int32 UserId, String status) in E:\Projects\LMS\LMSBL\Repository\HomeRepository.cs:line 27
ClientConnectionId:794eb332-cf7a-4396-b136-eb2b89d2be51
Error Number:241,State:1,Class:16', N'/Home', CAST(N'2020-01-27T19:42:27.550' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (136, N'Conversion failed when converting date and/or time from character string.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Conversion failed when converting date and/or time from character string.
   at LMSBL.Repository.HomeRepository.GetAllActivities(Int32 TenantId, Int32 UserId, String status) in E:\Projects\LMS\LMSBL\Repository\HomeRepository.cs:line 45
   at LMSWeb.Controllers.HomeController.Index() in E:\Projects\LMS\LMSWeb\Controllers\HomeController.cs:line 35
ClientConnectionId:794eb332-cf7a-4396-b136-eb2b89d2be51
Error Number:241,State:1,Class:16', N'/Home', CAST(N'2020-01-27T19:44:27.003' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (137, N'Conversion failed when converting date and/or time from character string.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Conversion failed when converting date and/or time from character string.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.HomeRepository.GetAllActivities(Int32 TenantId, Int32 UserId, String status) in E:\Projects\LMS\LMSBL\Repository\HomeRepository.cs:line 27
ClientConnectionId:794eb332-cf7a-4396-b136-eb2b89d2be51
Error Number:241,State:1,Class:16', N'/Home', CAST(N'2020-01-27T19:44:29.000' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (138, N'Conversion failed when converting date and/or time from character string.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Conversion failed when converting date and/or time from character string.
   at LMSBL.Repository.HomeRepository.GetAllActivities(Int32 TenantId, Int32 UserId, String status) in E:\Projects\LMS\LMSBL\Repository\HomeRepository.cs:line 45
   at LMSWeb.Controllers.HomeController.Index() in E:\Projects\LMS\LMSWeb\Controllers\HomeController.cs:line 35
ClientConnectionId:794eb332-cf7a-4396-b136-eb2b89d2be51
Error Number:241,State:1,Class:16', N'/Home', CAST(N'2020-01-27T19:44:29.023' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (139, N'Conversion failed when converting date and/or time from character string.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Conversion failed when converting date and/or time from character string.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.HomeRepository.GetAllActivities(Int32 TenantId, Int32 UserId, String status) in E:\Projects\LMS\LMSBL\Repository\HomeRepository.cs:line 27
ClientConnectionId:f4cf0718-c0b4-4716-9fc8-e90b0b046b09
Error Number:241,State:1,Class:16', N'/Home', CAST(N'2020-01-27T19:44:47.283' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (140, N'Conversion failed when converting date and/or time from character string.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Conversion failed when converting date and/or time from character string.
   at LMSBL.Repository.HomeRepository.GetAllActivities(Int32 TenantId, Int32 UserId, String status) in E:\Projects\LMS\LMSBL\Repository\HomeRepository.cs:line 45
   at LMSWeb.Controllers.HomeController.Index() in E:\Projects\LMS\LMSWeb\Controllers\HomeController.cs:line 35
ClientConnectionId:f4cf0718-c0b4-4716-9fc8-e90b0b046b09
Error Number:241,State:1,Class:16', N'/Home', CAST(N'2020-01-27T19:45:34.630' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (141, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.HomeController.Index() in E:\Projects\LMS\LMSWeb\Controllers\HomeController.cs:line 24', N'/Home', CAST(N'2020-01-27T20:24:57.420' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (142, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.HomeController.Index() in E:\Projects\LMS\LMSWeb\Controllers\HomeController.cs:line 24', N'/Home/Index', CAST(N'2020-01-28T12:19:31.307' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (143, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.HomeController.Index() in E:\Projects\LMS\LMSWeb\Controllers\HomeController.cs:line 25', N'/Home', CAST(N'2020-01-28T13:03:50.860' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (144, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.HomeController.Index() in E:\Projects\LMS\LMSWeb\Controllers\HomeController.cs:line 25', N'/Home', CAST(N'2020-01-28T13:25:16.770' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (145, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.HomeController.Index() in E:\Projects\LMS\LMSWeb\Controllers\HomeController.cs:line 25', N'/Home', CAST(N'2020-01-28T13:35:15.550' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (146, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.AssignmentController.MyAssignments() in E:\Projects\LMS\LMSWeb\Controllers\AssignmentController.cs:line 36', N'/Assignment/MyAssignments', CAST(N'2020-01-28T14:37:24.263' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (147, N'String reference not set to an instance of a String.
Parameter name: s', N'ArgumentNullException', N'System.ArgumentNullException: String reference not set to an instance of a String.
Parameter name: s
   at System.Text.Encoding.GetBytes(String s)
   at LMSWeb.App_Start.CommonFunctions.GetEncodePassword(String password) in E:\Projects\LMS\LMSWeb\App_Start\CommonFunctions.cs:line 21', N'/Login/UserAuthentication', CAST(N'2020-01-28T17:05:59.833' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (148, N'Procedure or function ''sp_Login'' expects parameter ''@EmailId'', which was not supplied.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_Login'' expects parameter ''@EmailId'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 182
   at LMSWeb.Controllers.LoginController.UserAuthentication(TblUser loginUser) in E:\Projects\LMS\LMSWeb\Controllers\LoginController.cs:line 44
ClientConnectionId:b13cd54c-386f-4f03-8347-589aa44767e7
Error Number:201,State:4,Class:16', N'/Login/UserAuthentication', CAST(N'2020-01-28T17:05:59.940' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (149, N'String reference not set to an instance of a String.
Parameter name: s', N'ArgumentNullException', N'System.ArgumentNullException: String reference not set to an instance of a String.
Parameter name: s
   at System.Text.Encoding.GetBytes(String s)
   at LMSWeb.App_Start.CommonFunctions.GetEncodePassword(String password) in E:\Projects\LMS\LMSWeb\App_Start\CommonFunctions.cs:line 21', N'/Login/UserAuthentication', CAST(N'2020-01-28T17:06:28.557' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (150, N'Procedure or function ''sp_Login'' expects parameter ''@Password'', which was not supplied.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_Login'' expects parameter ''@Password'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 182
   at LMSWeb.Controllers.LoginController.UserAuthentication(TblUser loginUser) in E:\Projects\LMS\LMSWeb\Controllers\LoginController.cs:line 44
ClientConnectionId:b13cd54c-386f-4f03-8347-589aa44767e7
Error Number:201,State:4,Class:16', N'/Login/UserAuthentication', CAST(N'2020-01-28T17:06:28.640' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (151, N'String reference not set to an instance of a String.
Parameter name: s', N'ArgumentNullException', N'System.ArgumentNullException: String reference not set to an instance of a String.
Parameter name: s
   at System.Text.Encoding.GetBytes(String s)
   at LMSWeb.App_Start.CommonFunctions.GetEncodePassword(String password) in E:\Projects\LMS\LMSWeb\App_Start\CommonFunctions.cs:line 21', N'/Login/UserAuthentication', CAST(N'2020-01-28T17:08:48.230' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (152, N'Procedure or function ''sp_Login'' expects parameter ''@Password'', which was not supplied.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_Login'' expects parameter ''@Password'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 182
   at LMSWeb.Controllers.LoginController.UserAuthentication(TblUser loginUser) in E:\Projects\LMS\LMSWeb\Controllers\LoginController.cs:line 44
ClientConnectionId:b13cd54c-386f-4f03-8347-589aa44767e7
Error Number:201,State:4,Class:16', N'/Login/UserAuthentication', CAST(N'2020-01-28T17:08:48.330' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (153, N'String reference not set to an instance of a String.
Parameter name: s', N'ArgumentNullException', N'System.ArgumentNullException: String reference not set to an instance of a String.
Parameter name: s
   at System.Text.Encoding.GetBytes(String s)
   at LMSWeb.App_Start.CommonFunctions.GetEncodePassword(String password) in E:\Projects\LMS\LMSWeb\App_Start\CommonFunctions.cs:line 21', N'/Login/UserAuthentication', CAST(N'2020-01-28T17:10:24.227' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (154, N'Procedure or function ''sp_Login'' expects parameter ''@Password'', which was not supplied.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_Login'' expects parameter ''@Password'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 182
   at LMSWeb.Controllers.LoginController.UserAuthentication(TblUser loginUser) in E:\Projects\LMS\LMSWeb\Controllers\LoginController.cs:line 44
ClientConnectionId:ce0bcead-6b7c-47d0-9f7d-87c211f641ea
Error Number:201,State:4,Class:16', N'/Login/UserAuthentication', CAST(N'2020-01-28T17:10:24.317' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (155, N'String reference not set to an instance of a String.
Parameter name: s', N'ArgumentNullException', N'System.ArgumentNullException: String reference not set to an instance of a String.
Parameter name: s
   at System.Text.Encoding.GetBytes(String s)
   at LMSWeb.App_Start.CommonFunctions.GetEncodePassword(String password) in E:\Projects\LMS\LMSWeb\App_Start\CommonFunctions.cs:line 21', N'/Login/UserAuthentication', CAST(N'2020-01-28T17:10:56.077' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (156, N'Procedure or function ''sp_Login'' expects parameter ''@Password'', which was not supplied.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_Login'' expects parameter ''@Password'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 182
   at LMSWeb.Controllers.LoginController.UserAuthentication(TblUser loginUser) in E:\Projects\LMS\LMSWeb\Controllers\LoginController.cs:line 44
ClientConnectionId:d80839d7-23af-4ac1-bd8e-4b690a6e3798
Error Number:201,State:4,Class:16', N'/Login/UserAuthentication', CAST(N'2020-01-28T17:10:56.170' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (157, N'Procedure or function ''sp_Login'' expects parameter ''@EmailId'', which was not supplied.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_Login'' expects parameter ''@EmailId'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 182
   at LMSWeb.Controllers.LoginController.UserAuthentication(TblUser loginUser) in E:\Projects\LMS\LMSWeb\Controllers\LoginController.cs:line 44
ClientConnectionId:d80839d7-23af-4ac1-bd8e-4b690a6e3798
Error Number:201,State:4,Class:16', N'/Login/UserAuthentication', CAST(N'2020-01-28T17:16:08.377' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (158, N'String reference not set to an instance of a String.
Parameter name: s', N'ArgumentNullException', N'System.ArgumentNullException: String reference not set to an instance of a String.
Parameter name: s
   at System.Text.Encoding.GetBytes(String s)
   at LMSWeb.App_Start.CommonFunctions.GetEncodePassword(String password) in E:\Projects\LMS\LMSWeb\App_Start\CommonFunctions.cs:line 21', N'/Login/UserAuthentication', CAST(N'2020-01-28T17:16:27.437' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (159, N'Procedure or function ''sp_Login'' expects parameter ''@Password'', which was not supplied.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_Login'' expects parameter ''@Password'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 182
   at LMSWeb.Controllers.LoginController.UserAuthentication(TblUser loginUser) in E:\Projects\LMS\LMSWeb\Controllers\LoginController.cs:line 44
ClientConnectionId:d80839d7-23af-4ac1-bd8e-4b690a6e3798
Error Number:201,State:4,Class:16', N'/Login/UserAuthentication', CAST(N'2020-01-28T17:16:27.543' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (160, N'String reference not set to an instance of a String.
Parameter name: s', N'ArgumentNullException', N'System.ArgumentNullException: String reference not set to an instance of a String.
Parameter name: s
   at System.Text.Encoding.GetBytes(String s)
   at LMSWeb.App_Start.CommonFunctions.GetEncodePassword(String password) in E:\Projects\LMS\LMSWeb\App_Start\CommonFunctions.cs:line 21', N'/Login/UserAuthentication', CAST(N'2020-01-28T17:16:58.170' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (161, N'Procedure or function ''sp_Login'' expects parameter ''@Password'', which was not supplied.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_Login'' expects parameter ''@Password'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 182
   at LMSWeb.Controllers.LoginController.UserAuthentication(TblUser loginUser) in E:\Projects\LMS\LMSWeb\Controllers\LoginController.cs:line 44
ClientConnectionId:d80839d7-23af-4ac1-bd8e-4b690a6e3798
Error Number:201,State:4,Class:16', N'/Login/UserAuthentication', CAST(N'2020-01-28T17:16:58.273' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10142, N'Don@gmail.com', N'Don@gmail.com', N'Don@gmail.com', N'/Reports/Index', CAST(N'2020-01-29T08:07:04.690' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10143, N'Don@gmail.com', N'Don@gmail.com', N'Don@gmail.com', N'/Reports/Index', CAST(N'2020-01-29T08:07:26.137' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10144, N'Don@gmail.com', N'Don@gmail.com', N'Don@gmail.com', N'/Reports/Index', CAST(N'2020-01-29T08:08:15.820' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10145, N'Don@gmail.com', N'Don@gmail.com', N'Don@gmail.com', N'/Reports/Index', CAST(N'2020-01-29T08:09:07.830' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10146, N'Column ''PhoneNo'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''PhoneNo'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.ReportRepository.<>c.<GetUserReportForAdmin>b__4_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\ReportRepository.cs:line 92
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.ReportRepository.GetUserReportForAdmin(Int32 tenantId) in E:\Projects\LMS\LMSBL\Repository\ReportRepository.cs:line 92', N'/Reports/UserReport', CAST(N'2020-02-02T09:38:58.087' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10147, N'Object cannot be cast from DBNull to other types.', N'InvalidCastException', N'System.InvalidCastException: Object cannot be cast from DBNull to other types.
   at System.DBNull.System.IConvertible.ToInt32(IFormatProvider provider)
   at System.Convert.ToInt32(Object value)
   at LMSBL.Repository.ReportRepository.<>c.<GetUserProgressReportForAdmin>b__5_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\ReportRepository.cs:line 126
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.ReportRepository.GetUserProgressReportForAdmin(Int32 tenantId, Int32 UserId) in E:\Projects\LMS\LMSBL\Repository\ReportRepository.cs:line 126', N'/Reports/UserProgressReport', CAST(N'2020-02-03T14:03:05.247' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10148, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.HomeController.Index() in E:\Projects\LMS\LMSWeb\Controllers\HomeController.cs:line 25', N'/Home', CAST(N'2020-02-03T22:44:15.673' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10149, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.HomeController.Index() in E:\Projects\LMS\LMSWeb\Controllers\HomeController.cs:line 25', N'/Home', CAST(N'2020-02-03T22:54:25.400' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10150, N'Cannot find table 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: Cannot find table 0.
   at System.Data.DataTableCollection.get_Item(Int32 index)
   at LMSBL.Repository.ReportRepository.GetLearningCompletionProgressReportForAdmin(Int32 tenantId, Int32 activityId, String type) in E:\Projects\LMS\LMSBL\Repository\ReportRepository.cs:line 193', N'/Reports/LearningProgressCompletionReport', CAST(N'2020-02-04T17:34:04.643' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10151, N'Object cannot be cast from DBNull to other types.', N'InvalidCastException', N'System.InvalidCastException: Object cannot be cast from DBNull to other types.
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 105
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/courses/index', CAST(N'2020-02-05T18:49:32.077' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10152, N'Cannot insert the value NULL into column ''ActivityId'', table ''LMSDB.dbo.tblLearnerActivityAssignment', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Cannot insert the value NULL into column ''ActivityId'', table ''LMSDB.dbo.tblLearnerActivityAssignment''; column does not allow nulls. INSERT fails.
The statement has been terminated.
The ''sp_CourseAdd'' procedure attempted to return a status of NULL, which is not allowed. A status of 0 will be returned instead.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at LMSBL.Repository.DataRepository.ExecuteQuery(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 83
   at LMSBL.Repository.CoursesRepository.AddCourse(tblCourse obj) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 123
ClientConnectionId:cfddb882-5aa6-4d29-831c-00b04c1762b9
Error Number:515,State:2,Class:16', N'/Courses/AddCourse', CAST(N'2020-02-05T19:12:55.050' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10153, N'Object cannot be cast from DBNull to other types.', N'InvalidCastException', N'System.InvalidCastException: Object cannot be cast from DBNull to other types.
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 105
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses', CAST(N'2020-02-05T19:12:55.550' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10154, N'Object cannot be cast from DBNull to other types.', N'InvalidCastException', N'System.InvalidCastException: Object cannot be cast from DBNull to other types.
   at System.DBNull.System.IConvertible.ToInt32(IFormatProvider provider)
   at System.Convert.ToInt32(Object value)
   at LMSBL.Repository.CoursesRepository.AddCourse(tblCourse obj) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 124', N'/Courses/AddCourse', CAST(N'2020-02-05T19:23:06.640' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10155, N'Procedure or function ''sp_AddLoginLog'' expects parameter ''@userId'', which was not supplied.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_AddLoginLog'' expects parameter ''@userId'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at LMSBL.Repository.DataRepository.ExecuteQuery(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 83
   at LMSBL.Repository.UserRepository.AddLoginLog(Int32 UserId) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 197
ClientConnectionId:a06c9275-da7c-4d9c-ba9a-4540b85b4d9e
Error Number:201,State:4,Class:16', N'/Login/UserAuthentication', CAST(N'2020-02-07T12:15:54.363' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10156, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-07T16:28:14.400' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10157, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-07T16:28:14.447' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10158, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-07T16:28:14.450' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10159, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-07T16:29:08.753' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10160, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-07T16:29:08.817' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10161, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-07T16:29:08.817' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10162, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-07T16:30:30.370' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10163, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-07T16:30:30.433' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10164, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-07T16:30:30.433' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10165, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-07T16:41:13.417' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10166, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-07T16:41:13.483' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10167, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-07T16:41:13.493' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10168, N'Column ''Duration'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''Duration'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.QuizRepository.<>c.<GetQuizByID>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\QuizRepository.cs:line 49
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.QuizRepository.GetQuizByID(Int32 QuizId) in E:\Projects\LMS\LMSBL\Repository\QuizRepository.cs:line 87
   at LMSWeb.Controllers.QuizController.EditQuiz(Int32 id) in E:\Projects\LMS\LMSWeb\Controllers\QuizController.cs:line 154', N'/Quiz/EditQuiz/3075', CAST(N'2020-02-07T16:56:49.547' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10169, N'Column ''Duration'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''Duration'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Repository.QuizRepository.<>c.<GetQuizByID>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\QuizRepository.cs:line 49
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.QuizRepository.GetQuizByID(Int32 QuizId) in E:\Projects\LMS\LMSBL\Repository\QuizRepository.cs:line 87
   at LMSWeb.Controllers.QuizController.EditQuiz(Int32 id) in E:\Projects\LMS\LMSWeb\Controllers\QuizController.cs:line 154', N'/Quiz/EditQuiz/3075', CAST(N'2020-02-07T16:59:03.977' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10170, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_tblQuestion_tblQuestion". The co', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK_tblQuestion_tblQuestion". The conflict occurred in database "LMSDB", table "dbo.tblQuiz", column ''QuizId''.
The statement has been terminated.
The ''sp_QuestionAdd'' procedure attempted to return a status of NULL, which is not allowed. A status of 0 will be returned instead.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at LMSBL.Repository.DataRepository.ExecuteQuery(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 83
   at LMSBL.Repository.QuizRepository.CreateQuiz(TblQuiz obj) in E:\Projects\LMS\LMSBL\Repository\QuizRepository.cs:line 179
ClientConnectionId:9086cad0-b453-44cc-9df0-35a39fc9c252
Error Number:547,State:0,Class:16', N'/Quiz/AddQuiz', CAST(N'2020-02-07T17:07:48.680' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10171, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-07T19:45:28.423' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10172, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-07T19:45:28.497' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10173, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-07T19:45:28.497' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10174, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-07T19:48:25.730' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10175, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-07T19:54:16.750' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10176, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-07T20:01:28.467' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10177, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-07T20:16:15.810' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10178, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-09T19:16:35.180' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10179, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-09T19:18:11.787' AS DateTime))
GO
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10180, N'Failed to convert parameter value from a String to a Int32.', N'FormatException', N'System.FormatException: Failed to convert parameter value from a String to a Int32. ---> System.FormatException: Input string was not in a correct format.
   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   at System.String.System.IConvertible.ToInt32(IFormatProvider provider)
   at System.Convert.ChangeType(Object value, Type conversionType, IFormatProvider provider)
   at System.Data.SqlClient.SqlParameter.CoerceValue(Object value, MetaType destinationType, Boolean& coercedToDataFeed, Boolean& typeChanged, Boolean allowStreaming)
   --- End of inner exception stack trace ---
   at System.Data.SqlClient.SqlParameter.CoerceValue(Object value, MetaType destinationType, Boolean& coercedToDataFeed, Boolean& typeChanged, Boolean allowStreaming)
   at System.Data.SqlClient.SqlParameter.GetCoercedValue()
   at System.Data.SqlClient.SqlParameter.Validate(Int32 index, Boolean isCommandProc)
   at System.Data.SqlClient.SqlCommand.SetUpRPCParameters(_SqlRPC rpc, Int32 startCount, Boolean inSchema, SqlParameterCollection parameters)
   at System.Data.SqlClient.SqlCommand.BuildRPC(Boolean inSchema, SqlParameterCollection parameters, _SqlRPC& rpc)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at LMSBL.Repository.DataRepository.ExecuteQuery(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 83
   at LMSBL.Repository.QuizRepository.CaptureRatings(tblRatings objRatings) in E:\Projects\LMS\LMSBL\Repository\QuizRepository.cs:line 558', N'/Assignment/SubmitRating', CAST(N'2020-02-09T19:18:33.763' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10181, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-09T19:20:11.623' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10182, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-09T19:20:35.617' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10183, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-09T19:20:35.617' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10184, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.AssignmentController.MyAssignments() in E:\Projects\LMS\LMSWeb\Controllers\AssignmentController.cs:line 36', N'/Assignment/MyAssignments', CAST(N'2020-02-09T19:49:24.013' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10185, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 179', N'/Assignment/MyAssignments', CAST(N'2020-02-09T19:49:25.663' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10186, N'Procedure or function ''sp_UserUpdate'' expects parameter ''@firstName'', which was not supplied.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_UserUpdate'' expects parameter ''@firstName'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at LMSBL.Repository.DataRepository.ExecuteQuery(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 83
   at LMSBL.Repository.UserRepository.EditUser(TblUser obj) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 138
ClientConnectionId:f8b6686b-b761-4e20-b0e7-b8d116cfc1e7
Error Number:201,State:4,Class:16', N'/User/AddUser', CAST(N'2020-02-10T08:28:06.953' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10187, N'Procedure or function ''sp_UserUpdate'' expects parameter ''@firstName'', which was not supplied.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_UserUpdate'' expects parameter ''@firstName'', which was not supplied.
   at LMSBL.Repository.UserRepository.EditUser(TblUser obj) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 145
   at LMSWeb.Controllers.UserController.AddUser(TblUser objUser) in E:\Projects\LMS\LMSWeb\Controllers\UserController.cs:line 113
ClientConnectionId:f8b6686b-b761-4e20-b0e7-b8d116cfc1e7
Error Number:201,State:4,Class:16', N'/User/AddUser', CAST(N'2020-02-10T08:28:07.000' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10188, N'Procedure or function ''sp_UserUpdate'' expects parameter ''@roleId'', which was not supplied.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_UserUpdate'' expects parameter ''@roleId'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at LMSBL.Repository.DataRepository.ExecuteQuery(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 83
   at LMSBL.Repository.UserRepository.EditUser(TblUser obj) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 138
ClientConnectionId:b7343320-d33c-47aa-96d5-0353de8ec491
Error Number:201,State:4,Class:16', N'/User/AddUser', CAST(N'2020-02-10T09:26:47.087' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10189, N'Procedure or function ''sp_UserUpdate'' expects parameter ''@roleId'', which was not supplied.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_UserUpdate'' expects parameter ''@roleId'', which was not supplied.
   at LMSBL.Repository.UserRepository.EditUser(TblUser obj) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 143
   at LMSWeb.Controllers.UserController.AddUser(TblUser objUser) in E:\Projects\LMS\LMSWeb\Controllers\UserController.cs:line 114
ClientConnectionId:b7343320-d33c-47aa-96d5-0353de8ec491
Error Number:201,State:4,Class:16', N'/User/AddUser', CAST(N'2020-02-10T09:27:22.617' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10190, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 177', N'/Login/UserAuthentication', CAST(N'2020-02-10T09:40:57.040' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (10191, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 177', N'/Login/UserAuthentication', CAST(N'2020-02-10T09:41:44.223' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20178, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 177', N'/Login/UserAuthentication', CAST(N'2020-02-10T11:29:03.313' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20179, N'''E:/Projects/LMS/LMSWeb/assets/Logo/1'' is a physical path, but a virtual path was expected.', N'HttpException', N'System.Web.HttpException (0x80004005): ''E:/Projects/LMS/LMSWeb/assets/Logo/1'' is a physical path, but a virtual path was expected.
   at System.Web.Util.UrlPath.CheckValidVirtualPath(String path)
   at System.Web.Util.UrlPath.Combine(String appPath, String basepath, String relative)
   at System.Web.VirtualPath.Combine(VirtualPath relativePath)
   at System.Web.HttpRequest.MapPath(VirtualPath virtualPath, VirtualPath baseVirtualDir, Boolean allowCrossAppMapping)
   at System.Web.HttpServerUtility.MapPath(String path)
   at System.Web.HttpServerUtilityWrapper.MapPath(String path)
   at LMSWeb.Controllers.UserController.AddUser(TblUser objUser, HttpPostedFileBase file) in E:\Projects\LMS\LMSWeb\Controllers\UserController.cs:line 111', N'/User/AddUser', CAST(N'2020-02-10T16:15:53.340' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20180, N'Column ''profileImage'' does not belong to table Table.', N'ArgumentException', N'System.ArgumentException: Column ''profileImage'' does not belong to table Table.
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 26
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 180', N'/Login/UserAuthentication', CAST(N'2020-02-10T16:35:06.163' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20181, N'Object cannot be cast from DBNull to other types.', N'InvalidCastException', N'System.InvalidCastException: Object cannot be cast from DBNull to other types.
   at System.DBNull.System.IConvertible.ToBoolean(IFormatProvider provider)
   at System.Convert.ToBoolean(Object value)
   at LMSBL.Repository.QuizRepository.<>c.<GetQuizForLaunch>b__11_1(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\QuizRepository.cs:line 328
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.QuizRepository.GetQuizForLaunch(Int32 QuizId, Int32 UserId) in E:\Projects\LMS\LMSBL\Repository\QuizRepository.cs:line 360
   at LMSWeb.Controllers.AssignmentController.LaunchQuiz(Int32 QuizId) in E:\Projects\LMS\LMSWeb\Controllers\AssignmentController.cs:line 79', N'/Assignment/LaunchQuiz', CAST(N'2020-02-10T16:59:33.593' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20182, N'Object cannot be cast from DBNull to other types.', N'InvalidCastException', N'System.InvalidCastException: Object cannot be cast from DBNull to other types.
   at System.DBNull.System.IConvertible.ToBoolean(IFormatProvider provider)
   at System.Convert.ToBoolean(Object value)
   at LMSBL.Repository.QuizRepository.<>c.<GetQuizForLaunch>b__11_1(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\QuizRepository.cs:line 328
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.QuizRepository.GetQuizForLaunch(Int32 QuizId, Int32 UserId) in E:\Projects\LMS\LMSBL\Repository\QuizRepository.cs:line 360
   at LMSWeb.Controllers.AssignmentController.LaunchQuiz(Int32 QuizId) in E:\Projects\LMS\LMSWeb\Controllers\AssignmentController.cs:line 79', N'/Assignment/LaunchQuiz', CAST(N'2020-02-10T18:15:36.257' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20183, N'Object cannot be cast from DBNull to other types.', N'InvalidCastException', N'System.InvalidCastException: Object cannot be cast from DBNull to other types.
   at System.DBNull.System.IConvertible.ToBoolean(IFormatProvider provider)
   at System.Convert.ToBoolean(Object value)
   at LMSBL.Repository.QuizRepository.<>c.<GetQuizForLaunch>b__11_1(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\QuizRepository.cs:line 328
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.QuizRepository.GetQuizForLaunch(Int32 QuizId, Int32 UserId) in E:\Projects\LMS\LMSBL\Repository\QuizRepository.cs:line 360
   at LMSWeb.Controllers.AssignmentController.LaunchQuiz(Int32 QuizId) in E:\Projects\LMS\LMSWeb\Controllers\AssignmentController.cs:line 79', N'/Assignment/LaunchQuiz', CAST(N'2020-02-10T18:15:53.080' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20184, N'Object cannot be cast from DBNull to other types.', N'InvalidCastException', N'System.InvalidCastException: Object cannot be cast from DBNull to other types.
   at System.DBNull.System.IConvertible.ToBoolean(IFormatProvider provider)
   at System.Convert.ToBoolean(Object value)
   at LMSBL.Repository.QuizRepository.<>c.<GetQuizForLaunch>b__11_1(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\QuizRepository.cs:line 328
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.QuizRepository.GetQuizForLaunch(Int32 QuizId, Int32 UserId) in E:\Projects\LMS\LMSBL\Repository\QuizRepository.cs:line 360
   at LMSWeb.Controllers.AssignmentController.LaunchQuiz(Int32 QuizId) in E:\Projects\LMS\LMSWeb\Controllers\AssignmentController.cs:line 79', N'/Assignment/LaunchQuiz', CAST(N'2020-02-10T18:19:39.087' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20185, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-10T19:13:34.423' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20186, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-10T19:13:43.353' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20187, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-10T19:13:43.357' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20188, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-10T20:59:08.957' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20189, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-10T20:59:26.583' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20190, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-10T20:59:26.597' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20191, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-10T21:02:57.137' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20192, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-10T21:03:01.997' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20193, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-10T21:03:02.000' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20194, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-10T21:44:18.447' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20195, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-10T22:18:39.170' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20196, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 180', N'/Assignment/RatingAndFeedback', CAST(N'2020-02-10T22:36:52.890' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20197, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-10T22:37:41.820' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20198, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-10T22:42:24.860' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20199, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-10T22:42:24.860' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20200, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-11T11:42:14.553' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20201, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:42:27.050' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20202, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:42:27.050' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20203, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:42:56.620' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20204, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:42:56.630' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20205, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:45:17.173' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20206, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:45:17.187' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20207, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:46:57.477' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20208, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:46:57.517' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20209, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:47:54.583' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20210, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:47:54.583' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20211, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:48:43.557' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20212, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:48:43.580' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20213, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:49:51.233' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20214, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:49:51.233' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20215, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:51:42.683' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20216, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:51:42.683' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20217, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-11T11:52:38.857' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20218, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:57:22.383' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20219, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:57:22.383' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20220, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:58:02.133' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20221, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:58:02.133' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20222, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:58:25.610' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20223, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:58:25.610' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20224, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:59:11.833' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20225, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:59:11.833' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20226, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:59:29.123' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20227, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:59:29.177' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20228, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:59:57.770' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20229, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T11:59:57.770' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20230, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:00:21.627' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20231, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:00:21.630' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20232, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-11T12:01:42.290' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20233, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:01:51.297' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20234, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:01:51.297' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20235, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:02:33.587' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20236, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:02:33.587' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20237, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:02:49.540' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20238, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:02:49.543' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20239, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:03:13.807' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20240, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:03:13.810' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20241, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:06:01.080' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20242, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:06:01.103' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20243, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:06:32.303' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20244, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:06:32.303' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20245, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:07:04.330' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20246, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:07:04.330' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20247, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:07:30.283' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20248, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:07:30.283' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20249, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:07:48.863' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20250, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:07:48.867' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20251, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:09:11.967' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20252, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:09:11.970' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20253, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:09:37.610' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20254, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:09:37.610' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20255, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:10:02.823' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20256, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:10:02.827' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20257, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:11:35.363' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20258, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:11:35.367' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20259, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:11:47.093' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20260, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:11:47.097' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20261, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:12:24.100' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20262, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:12:24.110' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20263, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:13:36.203' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20264, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:13:36.203' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20265, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 180', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:13:53.710' AS DateTime))
GO
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20266, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:13:53.710' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20267, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-11T12:15:17.573' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20268, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:15:22.250' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20269, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:15:22.250' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20270, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:16:47.283' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20271, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:16:47.283' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20272, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-11T12:33:17.407' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20273, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:33:21.757' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20274, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-11T12:33:21.757' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20275, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-11T13:43:30.510' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20276, N'Procedure or function ''sp_UserAdd'' expects parameter ''@roleId'', which was not supplied.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_UserAdd'' expects parameter ''@roleId'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at LMSBL.Repository.DataRepository.ExecuteQuery(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 83
   at LMSBL.Repository.UserRepository.AddUser(TblUser obj) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 106
ClientConnectionId:205bf7c6-6de3-465c-a687-8c6317ad9fe4
Error Number:201,State:4,Class:16', N'/User/AddUser', CAST(N'2020-02-11T15:03:02.750' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20277, N'Procedure or function ''sp_CourseUpdate'' expects parameter ''@ContentModuleName'', which was not suppli', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_CourseUpdate'' expects parameter ''@ContentModuleName'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at LMSBL.Repository.DataRepository.ExecuteQuery(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 83
   at LMSBL.Repository.CoursesRepository.EditCourse(tblCourse obj) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 168
ClientConnectionId:c55e6257-63cc-4e7b-9d84-2cf30e698d3c
Error Number:201,State:4,Class:16', N'/Courses/AddCourse', CAST(N'2020-02-11T16:48:02.387' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20278, N'Procedure or function ''sp_CourseUpdate'' expects parameter ''@ContentModuleName'', which was not suppli', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_CourseUpdate'' expects parameter ''@ContentModuleName'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at LMSBL.Repository.DataRepository.ExecuteQuery(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 83
   at LMSBL.Repository.CoursesRepository.EditCourse(tblCourse obj) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 168
ClientConnectionId:c55e6257-63cc-4e7b-9d84-2cf30e698d3c
Error Number:201,State:4,Class:16', N'/Courses/AddCourse', CAST(N'2020-02-11T16:49:05.147' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20279, N'Procedure or function ''sp_CourseAdd'' expects parameter ''@ContentModuleName'', which was not supplied.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_CourseAdd'' expects parameter ''@ContentModuleName'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at LMSBL.Repository.DataRepository.ExecuteQuery(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 83
   at LMSBL.Repository.CoursesRepository.AddCourse(tblCourse obj) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 124
ClientConnectionId:c55e6257-63cc-4e7b-9d84-2cf30e698d3c
Error Number:201,State:4,Class:16', N'/Courses/AddCourse', CAST(N'2020-02-11T16:49:19.210' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20280, N'Object cannot be cast from DBNull to other types.', N'InvalidCastException', N'System.InvalidCastException: Object cannot be cast from DBNull to other types.
   at System.DBNull.System.IConvertible.ToInt32(IFormatProvider provider)
   at System.Convert.ToInt32(Object value)
   at LMSBL.Repository.CoursesRepository.<>c.<GetCourseById>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 62
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetCourseById(Int32 CourseId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 80
   at LMSWeb.Controllers.CoursesController.EditCourse(Int32 id) in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 97', N'/Courses/EditCourse/8', CAST(N'2020-02-11T17:05:29.050' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20281, N'Object cannot be cast from DBNull to other types.', N'InvalidCastException', N'System.InvalidCastException: Object cannot be cast from DBNull to other types.
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 108
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses', CAST(N'2020-02-11T17:17:07.383' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20282, N'Object cannot be cast from DBNull to other types.', N'InvalidCastException', N'System.InvalidCastException: Object cannot be cast from DBNull to other types.
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 108
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses', CAST(N'2020-02-11T17:20:28.407' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20283, N'Object cannot be cast from DBNull to other types.', N'InvalidCastException', N'System.InvalidCastException: Object cannot be cast from DBNull to other types.
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 108
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses', CAST(N'2020-02-11T17:23:15.710' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20284, N'Object cannot be cast from DBNull to other types.', N'InvalidCastException', N'System.InvalidCastException: Object cannot be cast from DBNull to other types.
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 108
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses', CAST(N'2020-02-11T17:24:34.100' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20285, N'Object cannot be cast from DBNull to other types.', N'InvalidCastException', N'System.InvalidCastException: Object cannot be cast from DBNull to other types.
   at LMSBL.Repository.CoursesRepository.GetAllCourses(Int32 TenantId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 108
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 24', N'/Courses', CAST(N'2020-02-11T17:27:23.767' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20286, N'Object cannot be cast from DBNull to other types.', N'InvalidCastException', N'System.InvalidCastException: Object cannot be cast from DBNull to other types.
   at System.DBNull.System.IConvertible.ToInt32(IFormatProvider provider)
   at System.Convert.ToInt32(Object value)
   at LMSBL.Repository.CoursesRepository.<>c.<GetCourseById>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 62
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetCourseById(Int32 CourseId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 81
   at LMSWeb.Controllers.CoursesController.EditCourse(Int32 id) in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 97', N'/Courses/EditCourse/8', CAST(N'2020-02-11T17:29:44.210' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20287, N'Object cannot be cast from DBNull to other types.', N'InvalidCastException', N'System.InvalidCastException: Object cannot be cast from DBNull to other types.
   at System.DBNull.System.IConvertible.ToInt32(IFormatProvider provider)
   at System.Convert.ToInt32(Object value)
   at LMSBL.Repository.CoursesRepository.<>c.<GetCourseById>b__3_0(DataRow dr) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 62
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at LMSBL.Repository.CoursesRepository.GetCourseById(Int32 CourseId) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 81
   at LMSWeb.Controllers.CoursesController.EditCourse(Int32 id) in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 97', N'/Courses/EditCourse/8', CAST(N'2020-02-11T17:30:47.890' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20288, N'Procedure or function ''sp_CourseAdd'' expects parameter ''@ContentModuleName'', which was not supplied.', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_CourseAdd'' expects parameter ''@ContentModuleName'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at LMSBL.Repository.DataRepository.ExecuteQuery(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 83
   at LMSBL.Repository.CoursesRepository.AddCourse(tblCourse obj) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 130
ClientConnectionId:7eb91022-0724-4bd6-bbf6-4998da356b0d
Error Number:201,State:4,Class:16', N'/Courses/AddCourse', CAST(N'2020-02-11T19:26:33.660' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20289, N'Violation of PRIMARY KEY constraint ''PK_tblLearnerActivityAssignment''. Cannot insert duplicate key i', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Violation of PRIMARY KEY constraint ''PK_tblLearnerActivityAssignment''. Cannot insert duplicate key in object ''dbo.tblLearnerActivityAssignment''. The duplicate key value is (8, 5).
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at LMSBL.Repository.DataRepository.ExecuteQuery(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 83
   at LMSBL.Repository.CoursesRepository.AssignCourse(Int32 ContentModuleId, Int32 UserId, DateTime DueDate) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 256
ClientConnectionId:9cf1b601-ad06-452a-a086-9c2abae13396
Error Number:2627,State:1,Class:14', N'/Courses/AssignCourseToUsers', CAST(N'2020-02-11T20:58:10.950' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20290, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-12T14:23:22.560' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20291, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-12T14:23:37.130' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20292, N'5', N'5', N'5', N'/Assignment/ReviewQuiz', CAST(N'2020-02-12T14:23:37.223' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20293, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-12T14:26:37.127' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20294, N'5', N'5', N'5', N'/Assignment/ReviewQuiz', CAST(N'2020-02-12T14:26:37.127' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20295, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-12T14:26:53.297' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20296, N'5', N'5', N'5', N'/Assignment/ReviewQuiz', CAST(N'2020-02-12T14:26:53.300' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20297, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-12T14:27:06.643' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20298, N'5', N'5', N'5', N'/Assignment/ReviewQuiz', CAST(N'2020-02-12T14:27:06.647' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20299, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-12T14:28:04.830' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20300, N'5', N'5', N'5', N'/Assignment/ReviewQuiz', CAST(N'2020-02-12T14:28:04.830' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20301, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-12T14:28:19.273' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20302, N'5', N'5', N'5', N'/Assignment/ReviewQuiz', CAST(N'2020-02-12T14:28:19.273' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20303, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 180', N'/Assignment/SubmitQuiz', CAST(N'2020-02-12T14:50:52.700' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20304, N'Login', N'Login', N'Login', N'/Assignment/SubmitQuiz', CAST(N'2020-02-12T14:50:52.700' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20305, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 180', N'/User/AddUser', CAST(N'2020-02-12T16:08:43.630' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20306, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 180', N'/Quiz/AddQuiz', CAST(N'2020-02-12T16:40:49.790' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20307, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 180', N'/User/Upload', CAST(N'2020-02-12T17:41:12.493' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20308, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.UserController.UploadUsers(TblUser objUser, HttpPostedFileBase file) in E:\Projects\LMS\LMSWeb\Controllers\UserController.cs:line 298', N'/User/UploadUsers', CAST(N'2020-02-12T17:42:13.237' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20309, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.UserController.UploadUsers(TblUser objUser, HttpPostedFileBase file) in E:\Projects\LMS\LMSWeb\Controllers\UserController.cs:line 298', N'/User/UploadUsers', CAST(N'2020-02-12T18:31:01.020' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20310, N'Column ''EmailId'' does not belong to table .', N'ArgumentException', N'System.ArgumentException: Column ''EmailId'' does not belong to table .
   at System.Data.DataRow.GetDataColumn(String columnName)
   at System.Data.DataRow.get_Item(String columnName)
   at LMSWeb.Controllers.UserController.UploadUsers(TblUser objUser, HttpPostedFileBase file) in E:\Projects\LMS\LMSWeb\Controllers\UserController.cs:line 335', N'/User/UploadUsers', CAST(N'2020-02-12T18:36:02.763' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20311, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.UserController.UploadUsers(TblUser objUser, HttpPostedFileBase file) in E:\Projects\LMS\LMSWeb\Controllers\UserController.cs:line 298', N'/User/UploadUsers', CAST(N'2020-02-12T18:44:42.430' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20312, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-13T15:31:51.357' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20313, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-13T15:32:10.233' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20314, N'5', N'5', N'5', N'/Assignment/ReviewQuiz', CAST(N'2020-02-13T15:32:10.237' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20315, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-13T15:36:20.943' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20316, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-13T15:36:25.130' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20317, N'5', N'5', N'5', N'/Assignment/ReviewQuiz', CAST(N'2020-02-13T15:36:25.137' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20318, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-13T15:44:37.900' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20319, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-13T15:44:49.660' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20320, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-13T15:44:49.667' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20321, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-13T15:44:59.803' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20322, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-13T15:44:59.823' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20323, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-13T15:45:05.330' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20324, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-13T15:45:05.330' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20325, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-13T15:45:11.170' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20326, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-13T15:45:11.173' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20327, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-13T16:18:51.860' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20328, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-13T16:19:03.420' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20329, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-13T16:19:03.830' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20330, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-13T16:20:09.837' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20331, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-13T16:20:09.837' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20332, N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , ', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TrySetMetaData(_SqlMetaDataSet metaData, Boolean moreInfo)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.HomeRepository.GetAllLearnerActivities(Int32 TenantId, Int32 UserId, String status) in E:\Projects\LMS\LMSBL\Repository\HomeRepository.cs:line 27
ClientConnectionId:2f435d56-0834-4cf6-bc87-2cfc16daa7a8
Error Number:512,State:1,Class:16', N'/Assignment/MyAssignments', CAST(N'2020-02-13T17:06:38.200' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20333, N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , ', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.
The statement has been terminated.
   at LMSBL.Repository.HomeRepository.GetAllLearnerActivities(Int32 TenantId, Int32 UserId, String status) in E:\Projects\LMS\LMSBL\Repository\HomeRepository.cs:line 45
   at LMSWeb.Controllers.AssignmentController.MyAssignments() in E:\Projects\LMS\LMSWeb\Controllers\AssignmentController.cs:line 36
ClientConnectionId:2f435d56-0834-4cf6-bc87-2cfc16daa7a8
Error Number:512,State:1,Class:16', N'/Assignment/MyAssignments', CAST(N'2020-02-13T17:06:38.240' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20334, N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , ', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TrySetMetaData(_SqlMetaDataSet metaData, Boolean moreInfo)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.HomeRepository.GetAllLearnerActivities(Int32 TenantId, Int32 UserId, String status) in E:\Projects\LMS\LMSBL\Repository\HomeRepository.cs:line 27
ClientConnectionId:2f435d56-0834-4cf6-bc87-2cfc16daa7a8
Error Number:512,State:1,Class:16', N'/Home', CAST(N'2020-02-13T17:06:48.243' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20335, N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , ', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.
The statement has been terminated.
   at LMSBL.Repository.HomeRepository.GetAllLearnerActivities(Int32 TenantId, Int32 UserId, String status) in E:\Projects\LMS\LMSBL\Repository\HomeRepository.cs:line 45
   at LMSWeb.Controllers.HomeController.Index() in E:\Projects\LMS\LMSWeb\Controllers\HomeController.cs:line 39
ClientConnectionId:2f435d56-0834-4cf6-bc87-2cfc16daa7a8
Error Number:512,State:1,Class:16', N'/Home', CAST(N'2020-02-13T17:06:48.270' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20336, N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , ', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TrySetMetaData(_SqlMetaDataSet metaData, Boolean moreInfo)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.HomeRepository.GetAllLearnerActivities(Int32 TenantId, Int32 UserId, String status) in E:\Projects\LMS\LMSBL\Repository\HomeRepository.cs:line 27
ClientConnectionId:2f435d56-0834-4cf6-bc87-2cfc16daa7a8
Error Number:512,State:1,Class:16', N'/Home', CAST(N'2020-02-13T17:07:00.153' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20337, N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , ', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.
The statement has been terminated.
   at LMSBL.Repository.HomeRepository.GetAllLearnerActivities(Int32 TenantId, Int32 UserId, String status) in E:\Projects\LMS\LMSBL\Repository\HomeRepository.cs:line 45
   at LMSWeb.Controllers.HomeController.Index() in E:\Projects\LMS\LMSWeb\Controllers\HomeController.cs:line 39
ClientConnectionId:2f435d56-0834-4cf6-bc87-2cfc16daa7a8
Error Number:512,State:1,Class:16', N'/Home', CAST(N'2020-02-13T17:07:00.177' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20338, N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , ', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TrySetMetaData(_SqlMetaDataSet metaData, Boolean moreInfo)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.HomeRepository.GetAllLearnerActivities(Int32 TenantId, Int32 UserId, String status) in E:\Projects\LMS\LMSBL\Repository\HomeRepository.cs:line 27
ClientConnectionId:2f435d56-0834-4cf6-bc87-2cfc16daa7a8
Error Number:512,State:1,Class:16', N'/Home', CAST(N'2020-02-13T17:07:23.300' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20339, N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , ', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.
The statement has been terminated.
   at LMSBL.Repository.HomeRepository.GetAllLearnerActivities(Int32 TenantId, Int32 UserId, String status) in E:\Projects\LMS\LMSBL\Repository\HomeRepository.cs:line 45
   at LMSWeb.Controllers.HomeController.Index() in E:\Projects\LMS\LMSWeb\Controllers\HomeController.cs:line 39
ClientConnectionId:2f435d56-0834-4cf6-bc87-2cfc16daa7a8
Error Number:512,State:1,Class:16', N'/Home', CAST(N'2020-02-13T17:08:04.227' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20340, N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , ', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryHasMoreRows(Boolean& moreRows)
   at System.Data.SqlClient.SqlDataReader.TryReadInternal(Boolean setTimeout, Boolean& more)
   at System.Data.SqlClient.SqlDataReader.Read()
   at System.Data.Common.DataAdapter.FillLoadDataRow(SchemaMapping mapping)
   at System.Data.Common.DataAdapter.FillFromReader(DataSet dataset, DataTable datatable, String srcTable, DataReaderContainer dataReader, Int32 startRecord, Int32 maxRecords, DataColumn parentChapterColumn, Object parentChapterValue)
   at System.Data.Common.DataAdapter.Fill(DataSet dataSet, String srcTable, IDataReader dataReader, Int32 startRecord, Int32 maxRecords)
   at System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.Fill(DataSet dataSet, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.Fill(DataSet dataSet)
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.ReportRepository.GetUserProgressReportForAdmin(Int32 tenantId, Int32 UserId) in E:\Projects\LMS\LMSBL\Repository\ReportRepository.cs:line 124
ClientConnectionId:2f435d56-0834-4cf6-bc87-2cfc16daa7a8
Error Number:512,State:1,Class:16', N'/Reports/UserProgressReport', CAST(N'2020-02-13T17:16:24.963' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20341, N'Cannot find table 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: Cannot find table 0.
   at System.Data.DataTableCollection.get_Item(Int32 index)
   at LMSBL.Repository.ReportRepository.GetLearningCompletionProgressReportForAdmin(Int32 tenantId, Int32 activityId, String type) in E:\Projects\LMS\LMSBL\Repository\ReportRepository.cs:line 193', N'/Reports/GetFilteredData', CAST(N'2020-02-14T17:53:05.477' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20342, N'Cannot find table 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: Cannot find table 0.
   at System.Data.DataTableCollection.get_Item(Int32 index)
   at LMSBL.Repository.ReportRepository.GetLearningCompletionProgressReportForAdmin(Int32 tenantId, Int32 activityId, String type) in E:\Projects\LMS\LMSBL\Repository\ReportRepository.cs:line 193', N'/Reports/GetFilteredData', CAST(N'2020-02-14T17:53:47.807' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20343, N'Cannot find table 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: Cannot find table 0.
   at System.Data.DataTableCollection.get_Item(Int32 index)
   at LMSBL.Repository.ReportRepository.GetLearningCompletionProgressReportForAdmin(Int32 tenantId, Int32 activityId, String type) in E:\Projects\LMS\LMSBL\Repository\ReportRepository.cs:line 193', N'/Reports/GetFilteredData', CAST(N'2020-02-14T17:55:07.567' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20344, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.CoursesController.Index() in E:\Projects\LMS\LMSWeb\Controllers\CoursesController.cs:line 27', N'/Courses', CAST(N'2020-02-15T13:04:56.210' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20345, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 180', N'/Courses', CAST(N'2020-02-15T13:04:56.330' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20346, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-15T16:17:15.927' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20347, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-15T16:17:51.887' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20348, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-15T16:17:51.890' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20349, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-15T16:18:37.290' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20350, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-15T16:18:37.293' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20351, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-15T16:19:27.323' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20352, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-15T16:19:31.910' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20353, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-15T16:19:31.910' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20354, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.HomeController.Index() in E:\Projects\LMS\LMSWeb\Controllers\HomeController.cs:line 25', N'/Home', CAST(N'2020-02-15T17:11:43.163' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20355, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 180', N'/Home', CAST(N'2020-02-15T17:11:43.293' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20356, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.QuizController.Index() in E:\Projects\LMS\LMSWeb\Controllers\QuizController.cs:line 27', N'/Quiz', CAST(N'2020-02-15T20:15:59.420' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20357, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 180', N'/Quiz', CAST(N'2020-02-15T20:16:01.820' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20358, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.QuizController.Index() in E:\Projects\LMS\LMSWeb\Controllers\QuizController.cs:line 27', N'/Quiz', CAST(N'2020-02-15T20:16:17.450' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20359, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 180', N'/Quiz', CAST(N'2020-02-15T20:16:18.090' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20360, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-15T21:36:16.453' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20361, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 180', N'/Assignment/RatingAndFeedback', CAST(N'2020-02-15T21:40:38.767' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20362, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 180', N'/Assignment/RatingAndFeedback', CAST(N'2020-02-15T21:41:00.080' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20363, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-15T23:07:28.427' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20364, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-15T23:14:50.380' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20365, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-15T23:14:50.380' AS DateTime))
GO
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20366, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-15T23:20:26.170' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20367, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-15T23:20:26.170' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20368, N'Procedure or function ''sp_LearningProgressCompletionReport'' expects parameter ''@type'', which was not', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_LearningProgressCompletionReport'' expects parameter ''@type'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
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
   at LMSBL.Repository.DataRepository.FillData(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 59
   at LMSBL.Repository.ReportRepository.GetLearningCompletionProgressReportForAdmin(Int32 tenantId, Int32 activityId, String type) in E:\Projects\LMS\LMSBL\Repository\ReportRepository.cs:line 190
ClientConnectionId:27a11eff-b590-4186-9814-f472678db892
Error Number:201,State:4,Class:16', N'/Reports/ExportToExcel', CAST(N'2020-02-16T10:40:35.023' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20369, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-16T11:01:40.687' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20370, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-16T11:01:48.507' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20371, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-16T11:01:48.510' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20372, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-16T14:26:32.850' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20373, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-16T14:26:36.227' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20374, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-16T14:26:36.250' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20375, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-16T15:23:59.280' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20376, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-16T15:24:01.127' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20377, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-16T15:24:01.133' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20378, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-16T15:25:41.647' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20379, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-16T15:25:43.857' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20380, N'5', N'5', N'5', N'/Assignment/ReviewQuiz', CAST(N'2020-02-16T15:25:43.860' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20381, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.HomeController.Index() in E:\Projects\LMS\LMSWeb\Controllers\HomeController.cs:line 25', N'/Home/Index', CAST(N'2020-02-16T15:39:09.753' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20382, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 180', N'/Assignment/LaunchQuiz', CAST(N'2020-02-16T16:45:33.390' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20383, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.AssignmentController.LaunchQuiz(Int32 QuizId) in E:\Projects\LMS\LMSWeb\Controllers\AssignmentController.cs:line 79', N'/Assignment/LaunchQuiz', CAST(N'2020-02-16T16:45:33.410' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20384, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 180', N'/Assignment/LaunchQuiz', CAST(N'2020-02-16T18:29:39.623' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20385, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.AssignmentController.LaunchQuiz(Int32 QuizId) in E:\Projects\LMS\LMSWeb\Controllers\AssignmentController.cs:line 79', N'/Assignment/LaunchQuiz', CAST(N'2020-02-16T18:29:39.657' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20386, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-16T18:52:25.497' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20387, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-16T18:52:27.623' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20388, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-16T18:52:27.630' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20389, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-16T18:54:52.373' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20390, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-16T18:54:52.423' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20391, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 180', N'/Assignment/LaunchQuiz', CAST(N'2020-02-16T18:58:36.663' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20392, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.AssignmentController.LaunchQuiz(Int32 QuizId) in E:\Projects\LMS\LMSWeb\Controllers\AssignmentController.cs:line 79', N'/Assignment/LaunchQuiz', CAST(N'2020-02-16T18:58:36.667' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20393, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-16T19:01:14.303' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20394, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-16T19:01:17.660' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20395, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-16T19:01:17.660' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20396, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-16T19:01:46.750' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20397, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-16T19:01:48.157' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20398, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-16T19:01:48.160' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20399, N'Violation of PRIMARY KEY constraint ''PK_tblLearnerActivityAssignment''. Cannot insert duplicate key i', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Violation of PRIMARY KEY constraint ''PK_tblLearnerActivityAssignment''. Cannot insert duplicate key in object ''dbo.tblLearnerActivityAssignment''. The duplicate key value is (5, 10).
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at LMSBL.Repository.DataRepository.ExecuteQuery(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 83
   at LMSBL.Repository.CoursesRepository.AddCourse(tblCourse obj) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 142
ClientConnectionId:8e38728d-296e-420f-92ce-e2b164820f03
Error Number:2627,State:1,Class:14', N'/Courses/AddCourse', CAST(N'2020-02-16T19:16:15.220' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20400, N'Violation of PRIMARY KEY constraint ''PK_tblLearnerActivityAssignment''. Cannot insert duplicate key i', N'SqlException', N'System.Data.SqlClient.SqlException (0x80131904): Violation of PRIMARY KEY constraint ''PK_tblLearnerActivityAssignment''. Cannot insert duplicate key in object ''dbo.tblLearnerActivityAssignment''. The duplicate key value is (5, 10).
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at LMSBL.Repository.DataRepository.ExecuteQuery(String cmdText) in E:\Projects\LMS\LMSBL\Repository\DataRepository.cs:line 83
   at LMSBL.Repository.CoursesRepository.AddCourse(tblCourse obj) in E:\Projects\LMS\LMSBL\Repository\CoursesRepository.cs:line 142
ClientConnectionId:680907c5-8089-4e02-a342-f6cfdb9ef5e1
Error Number:2627,State:1,Class:14', N'/Courses/AddCourse', CAST(N'2020-02-17T11:51:22.223' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20401, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.UserController.Index() in E:\Projects\LMS\LMSWeb\Controllers\UserController.cs:line 30', N'/User/Index', CAST(N'2020-02-17T12:27:09.583' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20402, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 180', N'/User/Index', CAST(N'2020-02-17T12:27:11.220' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20403, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.HomeController.Index() in E:\Projects\LMS\LMSWeb\Controllers\HomeController.cs:line 25', N'/Home/Index', CAST(N'2020-02-17T12:27:33.533' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20404, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.AssignmentController.MyAssignments() in E:\Projects\LMS\LMSWeb\Controllers\AssignmentController.cs:line 36', N'/Assignment/MyAssignments', CAST(N'2020-02-17T13:17:27.133' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20405, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 180', N'/Assignment/MyAssignments', CAST(N'2020-02-17T13:17:29.533' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20406, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.AssignmentController.MyAssignments() in E:\Projects\LMS\LMSWeb\Controllers\AssignmentController.cs:line 36', N'/Assignment/MyAssignments', CAST(N'2020-02-17T13:17:41.173' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20407, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 180', N'/Assignment/MyAssignments', CAST(N'2020-02-17T13:17:41.500' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20408, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-17T15:20:00.417' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20409, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:20:01.903' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20410, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:20:01.903' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20411, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:21:53.413' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20412, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:21:53.480' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20413, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:22:02.630' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20414, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:22:02.640' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20415, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:22:56.410' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20416, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:22:56.410' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20417, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:23:14.337' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20418, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:23:14.337' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20419, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:23:39.730' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20420, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:23:39.730' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20421, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:24:09.793' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20422, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:24:09.797' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20423, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:25:14.350' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20424, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:25:14.350' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20425, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:25:44.940' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20426, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:25:44.940' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20427, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:25:59.380' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20428, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:25:59.383' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20429, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:27:46.330' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20430, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:27:46.330' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20431, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:30:24.507' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20432, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:30:24.507' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20433, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:30:28.630' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20434, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:30:28.630' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20435, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:30:39.827' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20436, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:30:39.860' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20437, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:31:28.143' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20438, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:31:28.143' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20439, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:32:01.163' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20440, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:32:01.170' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20441, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:34:43.727' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20442, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:34:43.727' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20443, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:37:48.207' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20444, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:37:48.210' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20445, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:39:14.320' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20446, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:39:14.320' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20447, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:39:54.377' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20448, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:39:54.380' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20449, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:40:37.670' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20450, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:40:37.670' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20451, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:40:59.187' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20452, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:40:59.190' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20453, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:41:07.250' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20454, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:41:07.250' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20455, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:41:51.677' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20456, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:41:51.677' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20457, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:42:22.320' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20458, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:42:22.323' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20459, N'There is no row at position 0.', N'IndexOutOfRangeException', N'System.IndexOutOfRangeException: There is no row at position 0.
   at System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   at System.Data.DataRowCollection.get_Item(Int32 index)
   at LMSBL.Common.Commonfunctions.UserMapping(DataSet ds) in E:\Projects\LMS\LMSBL\Common\Common.cs:line 17
   at LMSBL.Repository.UserRepository.IsValidUser(String Username, String Password) in E:\Projects\LMS\LMSBL\Repository\UserRepository.cs:line 180', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:42:36.873' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20460, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:42:36.880' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20461, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-17T15:51:49.950' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20462, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:51:51.413' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20463, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T15:51:51.413' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20464, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.ReportsController.AttemptReport(Int32 activityId, Int32 attempt) in E:\Projects\LMS\LMSWeb\Controllers\ReportsController.cs:line 63', N'/Reports/AttemptReport', CAST(N'2020-02-17T15:55:48.217' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20465, N'Object reference not set to an instance of an object.', N'NullReferenceException', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at LMSWeb.Controllers.ReportsController.AttemptReport(Int32 activityId, Int32 attempt) in E:\Projects\LMS\LMSWeb\Controllers\ReportsController.cs:line 63', N'/Reports/AttemptReport', CAST(N'2020-02-17T15:56:10.970' AS DateTime))
GO
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20466, N'Responses Saved Successfully', N'Responses Saved Successfully', N'Responses Saved Successfully', N'/Assignment/SubmitQuiz', CAST(N'2020-02-17T16:03:22.080' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20467, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T16:03:23.360' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20468, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T16:03:23.363' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20469, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T16:08:06.293' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20470, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T16:08:06.343' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20471, N'222', N'222', N'222', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T16:09:10.763' AS DateTime))
INSERT [dbo].[TblErrorLog] ([Logid], [ExceptionMsg], [ExceptionType], [ExceptionSource], [ExceptionURL], [Logdate]) VALUES (20472, N'8', N'8', N'8', N'/Assignment/ReviewQuiz', CAST(N'2020-02-17T16:09:10.763' AS DateTime))
SET IDENTITY_INSERT [dbo].[TblErrorLog] OFF
INSERT [dbo].[tblLearnerActivityAssignment] ([LearnerId], [ActivityId], [AssignmentDate], [AssignmentType], [DueDate]) VALUES (N'5', N'1', CAST(N'2020-02-12T12:47:42.967' AS DateTime), N'Course', CAST(N'2020-02-27T00:00:00.000' AS DateTime))
INSERT [dbo].[tblLearnerActivityAssignment] ([LearnerId], [ActivityId], [AssignmentDate], [AssignmentType], [DueDate]) VALUES (N'5', N'10', CAST(N'2020-02-16T19:16:26.350' AS DateTime), N'Course', CAST(N'2020-02-16T00:00:00.000' AS DateTime))
INSERT [dbo].[tblLearnerActivityAssignment] ([LearnerId], [ActivityId], [AssignmentDate], [AssignmentType], [DueDate]) VALUES (N'5', N'12', CAST(N'2020-02-13T15:23:55.367' AS DateTime), N'Course', CAST(N'2020-02-13T15:23:55.367' AS DateTime))
INSERT [dbo].[tblLearnerActivityAssignment] ([LearnerId], [ActivityId], [AssignmentDate], [AssignmentType], [DueDate]) VALUES (N'5', N'13', CAST(N'2020-02-17T14:21:10.197' AS DateTime), N'Course', CAST(N'2020-02-20T00:00:00.000' AS DateTime))
INSERT [dbo].[tblLearnerActivityAssignment] ([LearnerId], [ActivityId], [AssignmentDate], [AssignmentType], [DueDate]) VALUES (N'5', N'6', CAST(N'2020-02-12T12:46:24.263' AS DateTime), N'Course', CAST(N'2020-02-28T00:00:00.000' AS DateTime))
INSERT [dbo].[tblLearnerActivityAssignment] ([LearnerId], [ActivityId], [AssignmentDate], [AssignmentType], [DueDate]) VALUES (N'5', N'7', CAST(N'2020-02-06T12:31:58.480' AS DateTime), NULL, CAST(N'2020-02-11T19:18:00.797' AS DateTime))
INSERT [dbo].[tblLearnerActivityAssignment] ([LearnerId], [ActivityId], [AssignmentDate], [AssignmentType], [DueDate]) VALUES (N'5', N'8', CAST(N'2020-02-13T15:23:55.333' AS DateTime), N'Course', CAST(N'2020-02-27T00:00:00.000' AS DateTime))
INSERT [dbo].[tblLearnerActivityAssignment] ([LearnerId], [ActivityId], [AssignmentDate], [AssignmentType], [DueDate]) VALUES (N'5', N'9', CAST(N'2020-02-13T15:14:07.890' AS DateTime), NULL, NULL)
INSERT [dbo].[tblLearnerActivityAssignment] ([LearnerId], [ActivityId], [AssignmentDate], [AssignmentType], [DueDate]) VALUES (N'6', N'1', CAST(N'2020-02-12T12:47:42.967' AS DateTime), N'Course', CAST(N'2020-02-27T00:00:00.000' AS DateTime))
INSERT [dbo].[tblLearnerActivityAssignment] ([LearnerId], [ActivityId], [AssignmentDate], [AssignmentType], [DueDate]) VALUES (N'6', N'8', CAST(N'2020-02-13T15:23:55.353' AS DateTime), N'Course', CAST(N'2020-02-27T00:00:00.000' AS DateTime))
INSERT [dbo].[tblLearnerActivityAssignment] ([LearnerId], [ActivityId], [AssignmentDate], [AssignmentType], [DueDate]) VALUES (N'7', N'8', CAST(N'2020-02-13T15:23:55.357' AS DateTime), N'Course', CAST(N'2020-02-27T00:00:00.000' AS DateTime))
INSERT [dbo].[tblLearnerActivityAssignment] ([LearnerId], [ActivityId], [AssignmentDate], [AssignmentType], [DueDate]) VALUES (N'8', N'1', CAST(N'2020-02-12T12:47:42.970' AS DateTime), N'Course', CAST(N'2020-02-27T00:00:00.000' AS DateTime))
INSERT [dbo].[tblLearnerActivityAssignment] ([LearnerId], [ActivityId], [AssignmentDate], [AssignmentType], [DueDate]) VALUES (N'8', N'10', CAST(N'2020-02-16T19:16:26.360' AS DateTime), N'Course', CAST(N'2020-02-16T00:00:00.000' AS DateTime))
INSERT [dbo].[tblLearnerActivityAssignment] ([LearnerId], [ActivityId], [AssignmentDate], [AssignmentType], [DueDate]) VALUES (N'8', N'12', CAST(N'2020-02-17T11:55:12.897' AS DateTime), N'Course', CAST(N'2020-02-27T00:00:00.000' AS DateTime))
INSERT [dbo].[tblLearnerActivityAssignment] ([LearnerId], [ActivityId], [AssignmentDate], [AssignmentType], [DueDate]) VALUES (N'8', N'13', CAST(N'2020-02-17T14:21:10.257' AS DateTime), N'Course', CAST(N'2020-02-20T00:00:00.000' AS DateTime))
INSERT [dbo].[tblLearnerActivityAssignment] ([LearnerId], [ActivityId], [AssignmentDate], [AssignmentType], [DueDate]) VALUES (N'8', N'4', CAST(N'2020-02-13T17:03:38.840' AS DateTime), N'Course', CAST(N'2020-02-28T00:00:00.000' AS DateTime))
INSERT [dbo].[tblLearnerActivityAssignment] ([LearnerId], [ActivityId], [AssignmentDate], [AssignmentType], [DueDate]) VALUES (N'8', N'5', CAST(N'2020-01-27T00:00:00.000' AS DateTime), NULL, CAST(N'2020-02-11T19:18:00.797' AS DateTime))
INSERT [dbo].[tblLearnerActivityAssignment] ([LearnerId], [ActivityId], [AssignmentDate], [AssignmentType], [DueDate]) VALUES (N'8', N'6', CAST(N'2020-02-12T12:46:24.320' AS DateTime), N'Course', CAST(N'2020-02-28T00:00:00.000' AS DateTime))
INSERT [dbo].[tblLearnerActivityAssignment] ([LearnerId], [ActivityId], [AssignmentDate], [AssignmentType], [DueDate]) VALUES (N'8', N'8', CAST(N'2020-02-13T15:23:55.360' AS DateTime), N'Course', CAST(N'2020-02-27T00:00:00.000' AS DateTime))
INSERT [dbo].[tblLearnerActivityAssignment] ([LearnerId], [ActivityId], [AssignmentDate], [AssignmentType], [DueDate]) VALUES (N'9', N'8', CAST(N'2020-02-13T15:23:55.367' AS DateTime), N'Course', CAST(N'2020-02-27T00:00:00.000' AS DateTime))
INSERT [dbo].[tblLearnerContentModTracking] ([ContentTrackId], [ContentModuleId], [LearnerId], [ContentModuleName], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [PassFailStatus]) VALUES (N'XwHowTaMvO142rDN', N'4', N'8', N'SCORM', N'Completed', CAST(N'2020-02-03T21:57:35.507' AS DateTime), CAST(N'2020-02-03T23:03:07.543' AS DateTime), 1, 1, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>suspend</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:52</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:52</session_time></core><suspend_data><![CDATA[2S4i405060708090a0b0c0SR1001811J01011011110121101311014110151101611017110181100~2C3~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default0000000~2g2cb101001a1a103AP0~2u1pTi3000H0_$00H0158_defaultnSi0012_$0012148_defaultjDi300000158_defaultnSi00m1_$00m1148_defaultpn02Ulfe720118_default00000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[18]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', N'Passed')
INSERT [dbo].[tblLearnerContentModTracking] ([ContentTrackId], [ContentModuleId], [LearnerId], [ContentModuleName], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [PassFailStatus]) VALUES (N'mjCcrXHheYipmxlS', N'1', N'8', N'Test Course', N'Started', CAST(N'2020-02-03T22:07:37.883' AS DateTime), NULL, 1, 0, N'<Root Bookmark="ITEM_01"><sco identifier="ITEM_01"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[2$$1,1,1,0,0,0,0,0,0,0,0,0,0,0$$$$0]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[12]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, NULL)
INSERT [dbo].[tblLearnerContentModTracking] ([ContentTrackId], [ContentModuleId], [LearnerId], [ContentModuleName], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [PassFailStatus]) VALUES (N'gnJIfg29BjdeNBeE', N'5', N'8', N'SCORM', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, NULL)
INSERT [dbo].[tblLearnerContentModTracking] ([ContentTrackId], [ContentModuleId], [LearnerId], [ContentModuleName], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [PassFailStatus]) VALUES (N'PtnCreiHgwDDkXHD', N'6', N'5', N'New Course', N'Started', CAST(N'2020-02-05T19:24:42.153' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:15</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[35]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, NULL)
INSERT [dbo].[tblLearnerContentModTracking] ([ContentTrackId], [ContentModuleId], [LearnerId], [ContentModuleName], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [PassFailStatus]) VALUES (N'ovyQbSoAuROxW28p', N'7', N'5', N'Course Testing', N'Started', CAST(N'2020-02-06T12:33:27.190' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:06</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[39]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, NULL)
INSERT [dbo].[tblLearnerContentModTracking] ([ContentTrackId], [ContentModuleId], [LearnerId], [ContentModuleName], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [PassFailStatus]) VALUES (N'QibbgWbTOHztF4MB', N'8', N'5', N'Course Testing By Dinesh', N'Started', CAST(N'2020-02-11T16:18:35.943' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:06</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[53]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, NULL)
INSERT [dbo].[tblLearnerContentModTracking] ([ContentTrackId], [ContentModuleId], [LearnerId], [ContentModuleName], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [PassFailStatus]) VALUES (N'GVuHu38nf7y7InBM', N'9', N'5', N'For Vivek Demo', N'Started', CAST(N'2020-02-13T15:14:37.613' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[7]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:01:30</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:05</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[41]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, NULL)
INSERT [dbo].[tblLearnerContentModTracking] ([ContentTrackId], [ContentModuleId], [LearnerId], [ContentModuleName], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [PassFailStatus]) VALUES (N'3f6JIjiACeBfMhrT', N'12', N'5', N'Status Check', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', N'Passed')
INSERT [dbo].[tblLearnerContentModTracking] ([ContentTrackId], [ContentModuleId], [LearnerId], [ContentModuleName], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [PassFailStatus]) VALUES (N'shgLBRbA4xZRF7jw', N'8', N'8', N'Course Testing By Dinesh', N'Completed', CAST(N'2020-02-13T17:05:12.930' AS DateTime), CAST(N'2020-02-13T17:05:48.973' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:01:50</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:10</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[80]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, NULL)
INSERT [dbo].[tblLearnerContentModTracking] ([ContentTrackId], [ContentModuleId], [LearnerId], [ContentModuleName], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [PassFailStatus]) VALUES (N'PzlJtRgX9DCUQDMc', N'1', N'5', N'Test Course New', N'Started', CAST(N'2020-02-15T11:51:05.410' AS DateTime), NULL, 1, 0, N'<Root Bookmark="ITEM_01"><sco identifier="ITEM_01"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[5]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, NULL)
INSERT [dbo].[tblLearnerContentModTracking] ([ContentTrackId], [ContentModuleId], [LearnerId], [ContentModuleName], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [PassFailStatus]) VALUES (N'zOCoTdpzsGN5iUrW', N'10', N'5', N'iSpring Course', N'Completed', CAST(N'2020-02-15T13:15:04.310' AS DateTime), CAST(N'2020-02-15T13:15:06.967' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:03</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:03</session_time></core><suspend_data><![CDATA[N4IgJiBcDMBMAMBWANCANleqBuUDa8AujgBb7EgBq+WAjBQA5ShoCGAzgC6UCWApgHc+YAMpoeYPlFo5+AgCIBXAE6tOPAPYA7KLFTtxkkZzV92zEPAsBjDQFsGaPp2FROyxX1nseLiJHdPb19hAAkATwY+ZXEtAGtzSDxCAF9UWht7R2dXSAAzVjR2LxBsHh8/Nw8SsoqwyOjYhPIUtJAALw17Y1MLHi1JAA8zGgpO7pMXRLwtRTQ0VP1DPgAVHjs+WL4eqYsrSFBErBBOTAA6eHhaS5vLgBYAdjuATifEWmhUEQs7C0SQWwOJyVVCnSC0C63e5PV53d6fEArCxggjIeioNT4UBg45MJLY9ZSSDHACaABlpIgABy0B6IWAPeB3WiIBF5ZR8PjtIkFIp8FKLbGYVB4vAEjbCkDkyk0ukMpmwF6odmc7lQXnFAVato8FqtNoAR2YrSAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[81]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', N'Passed')
INSERT [dbo].[tblLearnerContentModTracking] ([ContentTrackId], [ContentModuleId], [LearnerId], [ContentModuleName], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [PassFailStatus]) VALUES (N'HUFrKYKcSy5kbowz', N'13', N'5', N'New Health Policies', N'Started', CAST(N'2020-02-17T14:20:52.703' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:02</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:01</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[37]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, NULL)
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (NULL, NULL, N'None', NULL, NULL, 0, 0, NULL, NULL, CAST(N'2020-02-03T21:57:35.443' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[44]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T22:04:42.197' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (NULL, NULL, N'None', NULL, NULL, 0, 0, NULL, NULL, CAST(N'2020-02-03T22:07:37.870' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'1', N'Started', CAST(N'2020-02-03T22:07:37.883' AS DateTime), NULL, 1, 0, N'<Root Bookmark="ITEM_01"><sco identifier="ITEM_01"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[69]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T22:11:02.820' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (NULL, NULL, N'None', NULL, NULL, 0, 0, NULL, NULL, CAST(N'2020-02-03T22:28:19.693' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (NULL, NULL, N'None', NULL, NULL, 0, 0, NULL, NULL, CAST(N'2020-02-11T16:18:35.467' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (NULL, NULL, N'None', NULL, NULL, 0, 0, NULL, NULL, CAST(N'2020-02-13T15:14:37.343' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'1', N'Started', CAST(N'2020-02-03T22:07:37.883' AS DateTime), NULL, 1, 0, N'<Root Bookmark="ITEM_01"><sco identifier="ITEM_01"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[0$$1,0,0,0,0,0,0,0,0,0,0,0,0,0$$$$0]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[44]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T22:12:52.200' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Started', CAST(N'2020-02-03T22:28:19.740' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[20]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T22:32:44.887' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Started', CAST(N'2020-02-03T22:28:19.740' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[0]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T22:39:08.117' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Started', CAST(N'2020-02-03T22:28:19.740' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[31]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T22:39:57.077' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Started', CAST(N'2020-02-03T22:28:19.740' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[19]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T22:45:09.760' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Started', CAST(N'2020-02-03T22:28:19.740' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[31]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T22:49:12.753' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Started', CAST(N'2020-02-03T22:28:19.740' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[95]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T22:51:03.900' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Started', CAST(N'2020-02-03T22:28:19.740' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[76]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T22:55:05.627' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Started', CAST(N'2020-02-03T22:28:19.740' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[50]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T22:55:24.690' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Started', CAST(N'2020-02-03T22:28:19.740' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[1]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[15]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T22:55:26.940' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Started', CAST(N'2020-02-03T22:28:19.740' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[2]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[64]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T22:55:28.213' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Started', CAST(N'2020-02-03T22:28:19.740' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[3]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[70]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T22:55:28.943' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Started', CAST(N'2020-02-03T22:28:19.740' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[4]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[26]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T22:55:29.630' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Started', CAST(N'2020-02-03T22:28:19.740' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[5]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[17]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T22:55:34.480' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Started', CAST(N'2020-02-03T22:28:19.740' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[6]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[25]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T22:55:34.663' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Completed', CAST(N'2020-02-03T21:57:35.507' AS DateTime), CAST(N'2020-02-03T23:03:07.543' AS DateTime), 1, 1, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>suspend</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:52</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:52</session_time></core><suspend_data><![CDATA[2S4i405060708090a0b0c0SR1001811J01011011110121101311014110151101611017110181100~2C3~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default0000000~2g2cb101001a1a103AP0~2u1pTi3000H0_$00H0158_defaultnSi0012_$0012148_defaultjDi300000158_defaultnSi00m1_$00m1148_defaultpn02Ulfe720118_default00000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[18]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-03T23:09:42.437' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Started', CAST(N'2020-02-03T22:28:19.740' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[7]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[95]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T22:55:34.957' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'8', N'Started', CAST(N'2020-02-11T16:18:35.943' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[85]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-11T16:18:36.423' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Started', CAST(N'2020-02-03T22:28:19.740' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[9]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[51]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T22:55:35.273' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'9', N'Started', CAST(N'2020-02-13T15:14:37.613' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[37]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T15:14:37.733' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Started', CAST(N'2020-02-03T22:28:19.740' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[8]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[22]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T22:55:35.910' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'8', N'Started', CAST(N'2020-02-13T17:05:12.930' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[52]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T17:05:14.797' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Started', CAST(N'2020-02-03T22:28:19.740' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[10]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[25]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T22:55:36.603' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'8', N'Started', CAST(N'2020-02-13T17:05:12.930' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[1]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[33]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T17:05:15.540' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Started', CAST(N'2020-02-03T22:28:19.740' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[11]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[28]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T22:55:37.207' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'8', N'Started', CAST(N'2020-02-13T17:05:12.930' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[2]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[71]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T17:05:16.377' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Started', CAST(N'2020-02-03T22:28:19.740' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[12]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[93]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T22:55:37.857' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'8', N'Started', CAST(N'2020-02-13T17:05:12.930' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[3]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[22]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T17:05:16.950' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Started', CAST(N'2020-02-03T22:28:19.740' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[13]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[100]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T22:55:53.747' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'13', N'Started', CAST(N'2020-02-17T14:20:52.703' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:01</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:01</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[53]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-17T14:20:54.970' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Started', CAST(N'2020-02-03T22:28:19.740' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[26]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:00:04.303' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:00:22.783' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:00:23.343' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:00:40.650' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:00:48.247' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:00:53.220' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:01:01.083' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:01:01.660' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:01:02.180' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:01:02.623' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:01:02.860' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:01:03.020' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:01:03.260' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:01:03.543' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:01:03.993' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:01:04.420' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:01:04.993' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:01:05.517' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:01:13.340' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:01:13.843' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:02:08.627' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:02:09.120' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[56]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:02:14.680' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[100]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:02:15.117' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[15]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:02:15.340' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:02:15.840' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[68]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:02:16.267' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[6]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:02:16.347' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[5]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:02:16.843' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[34]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:02:18.100' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[1v44050ji1001111a0101101111003000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[16]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:02:19.800' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[1C6405060on1001211f010110111101211003000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[15]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:02:25.477' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[1J840506070ts1001311k01011011110121101311003000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[69]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:02:55.940' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[1Qa4050607080yx1001411p0101101111012110131101411003000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[97]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:02:56.750' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[1Xc405060708090DC1001511u010110111101211013110141101511003000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[36]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:02:57.800' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[221e405060708090a0IH1001611z01011011110121101311014110151101611003000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[94]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:03:00.803' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[221e405060708090a0IH1001611z01011011110121101311014110151101611003000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[90]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:03:00.923' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw>50</raw><max>100</max><min>0</min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[221e405060708090a0IH1001611z01011011110121101311014110151101611003000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[55]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'50', CAST(N'2020-02-03T23:03:01.280' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[221e405060708090a0IH1001611z01011011110121101311014110151101611003000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[93]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:03:01.320' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[221e405060708090a0IH1001611z01011011110121101311014110151101611003000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[42]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:03:01.393' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw>50</raw><max>100</max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[221e405060708090a0IH1001611z01011011110121101311014110151101611003000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[26]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'50', CAST(N'2020-02-03T23:03:01.827' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[221e405060708090a0IH1001611z01011011110121101311014110151101611003000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[32]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:03:02.330' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[221e405060708090a0IH1001611z01011011110121101311014110151101611003000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[37]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:03:02.380' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[221e405060708090a0IH1001611z01011011110121101311014110151101611003000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[81]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:03:02.553' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw>50</raw><max>100</max><min>0</min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[2s2g405060708090a0b0NM1001711E010110111101211013110141101511016110171100~2j1~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default000000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'50', CAST(N'2020-02-03T23:03:02.830' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[221e405060708090a0IH1001611z01011011110121101311014110151101611003000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[39]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-03T23:03:05.643' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw>50</raw><max>100</max><min>0</min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[2s2g405060708090a0b0NM1001711E010110111101211013110141101511016110171100~2j1~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default000000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[75]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'50', CAST(N'2020-02-03T23:03:05.727' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[2s2g405060708090a0b0NM1001711E010110111101211013110141101511016110171100~2j1~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default000000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[61]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-03T23:03:06.137' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw>50</raw><max>100</max><min>0</min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[2s2g405060708090a0b0NM1001711E010110111101211013110141101511016110171100~2j1~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default000000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[52]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'50', CAST(N'2020-02-03T23:03:06.647' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw>50</raw><max>100</max><min>0</min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[2s2g405060708090a0b0NM1001711E010110111101211013110141101511016110171100~2j1~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default000000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[83]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'50', CAST(N'2020-02-03T23:03:06.730' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw>50</raw><max>100</max><min>0</min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[2s2g405060708090a0b0NM1001711E010110111101211013110141101511016110171100~2j1~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default000000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[13]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'50', CAST(N'2020-02-03T23:03:07.163' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw>50</raw><max>100</max><min>0</min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[2s2g405060708090a0b0NM1001711E010110111101211013110141101511016110171100~2j1~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default000000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[74]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'50', CAST(N'2020-02-03T23:03:07.377' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Started', CAST(N'2020-02-03T21:57:35.507' AS DateTime), NULL, 1, 0, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[2s2g405060708090a0b0NM1001711E010110111101211013110141101511016110171100~2j1~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default000000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[61]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-03T23:03:07.537' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Completed', CAST(N'2020-02-03T21:57:35.507' AS DateTime), CAST(N'2020-02-03T23:03:07.543' AS DateTime), 1, 1, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>suspend</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:52</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:52</session_time></core><suspend_data><![CDATA[2S4i405060708090a0b0c0SR1001811J01011011110121101311014110151101611017110181100~2C3~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default0000000~2g2cb101001a1a103AP0~2u1pTi3000H0_$00H0158_defaultnSi0012_$0012148_defaultjDi300000158_defaultnSi00m1_$00m1148_defaultpn02Ulfe720118_default00000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[18]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-03T23:03:07.713' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Completed', CAST(N'2020-02-03T21:57:35.507' AS DateTime), CAST(N'2020-02-03T23:03:07.543' AS DateTime), 1, 1, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>suspend</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:52</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:52</session_time></core><suspend_data><![CDATA[2S4i405060708090a0b0c0SR1001811J01011011110121101311014110151101611017110181100~2C3~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default0000000~2g2cb101001a1a103AP0~2u1pTi3000H0_$00H0158_defaultnSi0012_$0012148_defaultjDi300000158_defaultnSi00m1_$00m1148_defaultpn02Ulfe720118_default00000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[18]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-03T23:03:07.887' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Completed', CAST(N'2020-02-03T21:57:35.507' AS DateTime), CAST(N'2020-02-03T23:03:07.543' AS DateTime), 1, 1, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>suspend</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:52</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:52</session_time></core><suspend_data><![CDATA[2S4i405060708090a0b0c0SR1001811J01011011110121101311014110151101611017110181100~2C3~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default0000000~2g2cb101001a1a103AP0~2u1pTi3000H0_$00H0158_defaultnSi0012_$0012148_defaultjDi300000158_defaultnSi00m1_$00m1148_defaultpn02Ulfe720118_default00000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[18]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-03T23:03:08.220' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Completed', CAST(N'2020-02-03T21:57:35.507' AS DateTime), CAST(N'2020-02-03T23:03:07.543' AS DateTime), 1, 1, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>suspend</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:52</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:52</session_time></core><suspend_data><![CDATA[2S4i405060708090a0b0c0SR1001811J01011011110121101311014110151101611017110181100~2C3~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default0000000~2g2cb101001a1a103AP0~2u1pTi3000H0_$00H0158_defaultnSi0012_$0012148_defaultjDi300000158_defaultnSi00m1_$00m1148_defaultpn02Ulfe720118_default00000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[18]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-03T23:03:08.250' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Completed', CAST(N'2020-02-03T21:57:35.507' AS DateTime), CAST(N'2020-02-03T23:03:07.543' AS DateTime), 1, 1, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>suspend</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:52</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:52</session_time></core><suspend_data><![CDATA[2S4i405060708090a0b0c0SR1001811J01011011110121101311014110151101611017110181100~2C3~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default0000000~2g2cb101001a1a103AP0~2u1pTi3000H0_$00H0158_defaultnSi0012_$0012148_defaultjDi300000158_defaultnSi00m1_$00m1148_defaultpn02Ulfe720118_default00000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[18]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-03T23:03:08.413' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Completed', CAST(N'2020-02-03T21:57:35.507' AS DateTime), CAST(N'2020-02-03T23:03:07.543' AS DateTime), 1, 1, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>suspend</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:52</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:52</session_time></core><suspend_data><![CDATA[2S4i405060708090a0b0c0SR1001811J01011011110121101311014110151101611017110181100~2C3~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default0000000~2g2cb101001a1a103AP0~2u1pTi3000H0_$00H0158_defaultnSi0012_$0012148_defaultjDi300000158_defaultnSi00m1_$00m1148_defaultpn02Ulfe720118_default00000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[18]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-03T23:03:08.723' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Completed', CAST(N'2020-02-03T21:57:35.507' AS DateTime), CAST(N'2020-02-03T23:03:07.543' AS DateTime), 1, 1, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>suspend</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:52</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:52</session_time></core><suspend_data><![CDATA[2S4i405060708090a0b0c0SR1001811J01011011110121101311014110151101611017110181100~2C3~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default0000000~2g2cb101001a1a103AP0~2u1pTi3000H0_$00H0158_defaultnSi0012_$0012148_defaultjDi300000158_defaultnSi00m1_$00m1148_defaultpn02Ulfe720118_default00000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[18]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-03T23:03:08.750' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Completed', CAST(N'2020-02-03T21:57:35.507' AS DateTime), CAST(N'2020-02-03T23:03:07.543' AS DateTime), 1, 1, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>suspend</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:52</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:52</session_time></core><suspend_data><![CDATA[2S4i405060708090a0b0c0SR1001811J01011011110121101311014110151101611017110181100~2C3~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default0000000~2g2cb101001a1a103AP0~2u1pTi3000H0_$00H0158_defaultnSi0012_$0012148_defaultjDi300000158_defaultnSi00m1_$00m1148_defaultpn02Ulfe720118_default00000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[18]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-03T23:03:08.913' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Completed', CAST(N'2020-02-03T21:57:35.507' AS DateTime), CAST(N'2020-02-03T23:03:07.543' AS DateTime), 1, 1, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>suspend</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:52</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:52</session_time></core><suspend_data><![CDATA[2S4i405060708090a0b0c0SR1001811J01011011110121101311014110151101611017110181100~2C3~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default0000000~2g2cb101001a1a103AP0~2u1pTi3000H0_$00H0158_defaultnSi0012_$0012148_defaultjDi300000158_defaultnSi00m1_$00m1148_defaultpn02Ulfe720118_default00000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[18]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-03T23:03:09.457' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'1', N'Started', CAST(N'2020-02-03T22:07:37.883' AS DateTime), NULL, 1, 0, N'<Root Bookmark="ITEM_01"><sco identifier="ITEM_01"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[0$$1,0,0,0,0,0,0,0,0,0,0,0,0,0$$$$0]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[15]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-04T08:01:38.860' AS DateTime))
GO
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'1', N'Started', CAST(N'2020-02-03T22:07:37.883' AS DateTime), NULL, 1, 0, N'<Root Bookmark="ITEM_01"><sco identifier="ITEM_01"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[0$$1,0,0,0,0,0,0,0,0,0,0,0,0,0$$$$0]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[4]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-04T08:01:48.443' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'1', N'Started', CAST(N'2020-02-03T22:07:37.883' AS DateTime), NULL, 1, 0, N'<Root Bookmark="ITEM_01"><sco identifier="ITEM_01"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[0$$1,0,0,0,0,0,0,0,0,0,0,0,0,0$$$$0]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[88]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-04T08:01:50.967' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'1', N'Started', CAST(N'2020-02-03T22:07:37.883' AS DateTime), NULL, 1, 0, N'<Root Bookmark="ITEM_01"><sco identifier="ITEM_01"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[1$$1,1,0,0,0,0,0,0,0,0,0,0,0,0$$$$0]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[86]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-04T08:01:51.967' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (NULL, NULL, N'None', NULL, NULL, 0, 0, NULL, NULL, CAST(N'2020-02-05T19:24:41.990' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Completed', CAST(N'2020-02-03T21:57:35.507' AS DateTime), CAST(N'2020-02-03T23:03:07.543' AS DateTime), 1, 1, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>suspend</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:52</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:52</session_time></core><suspend_data><![CDATA[2S4i405060708090a0b0c0SR1001811J01011011110121101311014110151101611017110181100~2C3~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default0000000~2g2cb101001a1a103AP0~2u1pTi3000H0_$00H0158_defaultnSi0012_$0012148_defaultjDi300000158_defaultnSi00m1_$00m1148_defaultpn02Ulfe720118_default00000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[18]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-04T08:04:12.107' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Completed', CAST(N'2020-02-03T21:57:35.507' AS DateTime), CAST(N'2020-02-03T23:03:07.543' AS DateTime), 1, 1, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>suspend</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:52</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:52</session_time></core><suspend_data><![CDATA[2S4i405060708090a0b0c0SR1001811J01011011110121101311014110151101611017110181100~2C3~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default0000000~2g2cb101001a1a103AP0~2u1pTi3000H0_$00H0158_defaultnSi0012_$0012148_defaultjDi300000158_defaultnSi00m1_$00m1148_defaultpn02Ulfe720118_default00000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[18]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-04T08:04:15.903' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Completed', CAST(N'2020-02-03T21:57:35.507' AS DateTime), CAST(N'2020-02-03T23:03:07.543' AS DateTime), 1, 1, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>suspend</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:52</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:52</session_time></core><suspend_data><![CDATA[2S4i405060708090a0b0c0SR1001811J01011011110121101311014110151101611017110181100~2C3~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default0000000~2g2cb101001a1a103AP0~2u1pTi3000H0_$00H0158_defaultnSi0012_$0012148_defaultjDi300000158_defaultnSi00m1_$00m1148_defaultpn02Ulfe720118_default00000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[18]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-04T08:04:16.403' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Completed', CAST(N'2020-02-03T21:57:35.507' AS DateTime), CAST(N'2020-02-03T23:03:07.543' AS DateTime), 1, 1, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>suspend</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:52</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:52</session_time></core><suspend_data><![CDATA[2S4i405060708090a0b0c0SR1001811J01011011110121101311014110151101611017110181100~2C3~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default0000000~2g2cb101001a1a103AP0~2u1pTi3000H0_$00H0158_defaultnSi0012_$0012148_defaultjDi300000158_defaultnSi00m1_$00m1148_defaultpn02Ulfe720118_default00000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[18]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-04T08:04:20.067' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (NULL, NULL, N'None', NULL, NULL, 0, 0, NULL, NULL, CAST(N'2020-02-06T12:33:27.070' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Completed', CAST(N'2020-02-03T21:57:35.507' AS DateTime), CAST(N'2020-02-03T23:03:07.543' AS DateTime), 1, 1, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>suspend</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:52</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:52</session_time></core><suspend_data><![CDATA[2S4i405060708090a0b0c0SR1001811J01011011110121101311014110151101611017110181100~2C3~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default0000000~2g2cb101001a1a103AP0~2u1pTi3000H0_$00H0158_defaultnSi0012_$0012148_defaultjDi300000158_defaultnSi00m1_$00m1148_defaultpn02Ulfe720118_default00000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[18]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-04T08:04:20.223' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Completed', CAST(N'2020-02-03T21:57:35.507' AS DateTime), CAST(N'2020-02-03T23:03:07.543' AS DateTime), 1, 1, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>suspend</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:52</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:52</session_time></core><suspend_data><![CDATA[2S4i405060708090a0b0c0SR1001811J01011011110121101311014110151101611017110181100~2C3~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default0000000~2g2cb101001a1a103AP0~2u1pTi3000H0_$00H0158_defaultnSi0012_$0012148_defaultjDi300000158_defaultnSi00m1_$00m1148_defaultpn02Ulfe720118_default00000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[18]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-04T08:04:20.607' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'4', N'Completed', CAST(N'2020-02-03T21:57:35.507' AS DateTime), CAST(N'2020-02-03T23:03:07.543' AS DateTime), 1, 1, N'<Root Bookmark="SCORMPackage_SCO"><sco identifier="SCORMPackage_SCO"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>suspend</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:52</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:52</session_time></core><suspend_data><![CDATA[2S4i405060708090a0b0c0SR1001811J01011011110121101311014110151101611017110181100~2C3~2d1cb101001a1a1030O0udCg148_defaultfDg30158_defaultpn02Mife720118_default0000000~2g2cb101001a1a103AP0~2u1pTi3000H0_$00H0158_defaultnSi0012_$0012148_defaultjDi300000158_defaultnSi00m1_$00m1148_defaultpn02Ulfe720118_default00000000]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[18]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-04T08:04:21.107' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-04T08:04:44.677' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-04T08:04:45.927' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-04T08:04:46.393' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (NULL, NULL, N'None', NULL, NULL, 0, 0, NULL, NULL, CAST(N'2020-02-13T17:05:12.810' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'5', N'Completed', CAST(N'2020-02-03T22:28:19.740' AS DateTime), CAST(N'2020-02-03T23:00:04.340' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry></entry><score><raw></raw><max></max><min></min></score><total_time>0000:04:58</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:04:58</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[9]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-04T08:04:46.890' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'6', N'Started', CAST(N'2020-02-05T19:24:42.153' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[67]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-05T19:24:42.433' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'6', N'Started', CAST(N'2020-02-05T19:24:42.153' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[23]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-05T19:24:42.457' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'8', N'Started', CAST(N'2020-02-11T16:18:35.943' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[5]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-11T16:18:36.923' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'6', N'Started', CAST(N'2020-02-05T19:24:42.153' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[85]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-05T19:24:45.453' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'6', N'Started', CAST(N'2020-02-05T19:24:42.153' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:03</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:03</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[73]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-05T19:24:45.920' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'8', N'Started', CAST(N'2020-02-11T16:18:35.943' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[95]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-11T16:18:37.457' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'8', N'Started', CAST(N'2020-02-11T16:18:35.943' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:02</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[24]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-11T16:18:37.950' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'8', N'Started', CAST(N'2020-02-11T16:18:35.943' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[95]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-11T16:18:38.450' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'9', N'Started', CAST(N'2020-02-13T15:14:37.613' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T15:14:40.503' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'9', N'Started', CAST(N'2020-02-13T15:14:37.613' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[1]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[11]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T15:14:41.463' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'9', N'Started', CAST(N'2020-02-13T15:14:37.613' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[2]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[55]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T15:14:43.020' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'9', N'Started', CAST(N'2020-02-13T15:14:37.613' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[3]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[65]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T15:14:43.977' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'9', N'Started', CAST(N'2020-02-13T15:14:37.613' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[4]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[76]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T15:14:44.817' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'9', N'Started', CAST(N'2020-02-13T15:14:37.613' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[5]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[22]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T15:14:46.653' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'9', N'Started', CAST(N'2020-02-13T15:14:37.613' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[6]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[91]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T15:14:47.253' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'9', N'Started', CAST(N'2020-02-13T15:14:37.613' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[7]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[23]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T15:14:50.147' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'9', N'Started', CAST(N'2020-02-13T15:14:37.613' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[7]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:12</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:12</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[76]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T15:14:50.627' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'8', N'Started', CAST(N'2020-02-13T17:05:12.930' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[4]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[77]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T17:05:17.647' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'8', N'Started', CAST(N'2020-02-13T17:05:12.930' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[5]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[58]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T17:05:23.427' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'8', N'Started', CAST(N'2020-02-13T17:05:12.930' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[5]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[5]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T17:05:23.970' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'8', N'Started', CAST(N'2020-02-13T17:05:12.930' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[5]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:10</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:10</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[86]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T17:05:41.433' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'8', N'Started', CAST(N'2020-02-13T17:05:12.930' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[5]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:20</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:10</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[16]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T17:05:43.100' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'8', N'Started', CAST(N'2020-02-13T17:05:12.930' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[6]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:30</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:10</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[44]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T17:05:43.870' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'8', N'Started', CAST(N'2020-02-13T17:05:12.930' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[7]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:40</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:10</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[18]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T17:05:44.497' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (NULL, NULL, N'None', NULL, NULL, 0, 0, NULL, NULL, CAST(N'2020-02-17T11:57:31.567' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Started', CAST(N'2020-02-17T11:57:31.707' AS DateTime), NULL, 1, 0, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>not attempted</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[41]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-17T11:57:31.747' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'8', N'Started', CAST(N'2020-02-13T17:05:12.930' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[8]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:50</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:10</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[41]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T17:05:45.193' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Started', CAST(N'2020-02-17T11:57:31.707' AS DateTime), NULL, 1, 0, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw>50</raw><max>100</max><min>0</min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[N4IgJiBcCsAsDMAaEAbKAGZA3KBtdAutgBZ5EgBqemAjOQA5SgoCGAzgC4UCWApgO68wAZRTcwvDNj78AIgFcATiw7cA9gDspINmInCOK3myYh0pgMZqAtvRS8OQqB0Xze0tt0cRILtx68hAAkAT3peRTENAGsTSFwCAF9k5ABHJmSgA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[17]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'50', CAST(N'2020-02-17T11:57:32.043' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'8', N'Started', CAST(N'2020-02-13T17:05:12.930' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[9]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:01:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:10</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[76]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T17:05:45.953' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'8', N'Started', CAST(N'2020-02-13T17:05:12.930' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[10]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:01:10</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:10</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[10]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T17:05:46.720' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'8', N'Started', CAST(N'2020-02-13T17:05:12.930' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[11]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:01:20</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:10</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[8]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T17:05:47.550' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'9', N'Started', CAST(N'2020-02-13T15:14:37.613' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[7]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:01:25</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:05</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[0]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-15T12:35:46.607' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (NULL, NULL, N'None', NULL, NULL, 0, 0, NULL, NULL, CAST(N'2020-02-15T13:15:04.240' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'8', N'Started', CAST(N'2020-02-13T17:05:12.930' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[12]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:01:30</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:10</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T17:05:48.290' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Started', CAST(N'2020-02-15T13:15:04.310' AS DateTime), NULL, 1, 0, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>not attempted</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[17]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-15T13:15:04.690' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'8', N'Started', CAST(N'2020-02-13T17:05:12.930' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[13]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:01:40</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:10</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[47]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T17:05:48.970' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Started', CAST(N'2020-02-15T13:15:04.310' AS DateTime), NULL, 1, 0, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>not attempted</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[N4IgJiBcCsBMCcAaEAbKBaAjMgblA2gLq4AWBxIAagQAyKYUAOUoKAhgM4AulAlgKYB3fmADKKXmH5Q6IHAMEARAK4AnNl14B7AHYzkHCVNFcN/DixA1LAYy0BbRin5cRUAGZsUHfrl4deVwhILlVlXzl/QJEACQBPRn5VCR0AawtIIgBfHOQARxYcoAAA==]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[33]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-15T13:15:04.743' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'8', N'Completed', CAST(N'2020-02-13T17:05:12.930' AS DateTime), CAST(N'2020-02-13T17:05:48.973' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:01:50</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:10</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[80]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T17:06:12.797' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Started', CAST(N'2020-02-15T13:15:04.310' AS DateTime), NULL, 1, 0, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>not attempted</lesson_status><entry>ab-initio</entry><score><raw>50</raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[N4IgJiBcCsBMCcAaEAbKBaAjMgblA2gLq4AWBxIAagQAyKYUAOUoKAhgM4AulAlgKYB3fmADKKXmH5Q6IHAMEARAK4AnNl14B7AHYzkHCVNFcN/DixA1LAYy0BbRin5cRUAGZsUHfrl4deVwhILlVlXzl/QJEACQBPRn5VCR0AawtIIgBfHOQARxYcoAAA==]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[69]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'50', CAST(N'2020-02-15T13:15:05.247' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'8', N'Completed', CAST(N'2020-02-13T17:05:12.930' AS DateTime), CAST(N'2020-02-13T17:05:48.973' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:01:50</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:10</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[80]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T17:06:13.300' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Started', CAST(N'2020-02-15T13:15:04.310' AS DateTime), NULL, 1, 0, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>not attempted</lesson_status><entry>ab-initio</entry><score><raw>50</raw><max></max><min>0</min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[N4IgJiBcCsBMCcAaEAbKBaAjMgblA2gLq4AWBxIAagQAyKYUAOUoKAhgM4AulAlgKYB3fmADKKXmH5Q6IHAMEARAK4AnNl14B7AHYzkHCVNFcN/DixA1LAYy0BbRin5cRUAGZsUHfrl4deVwhILlVlXzl/QJEACQBPRn5VCR0AawtIIgBfHOQARxYcoAAA==]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[66]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'50', CAST(N'2020-02-15T13:15:05.320' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'8', N'Completed', CAST(N'2020-02-13T17:05:12.930' AS DateTime), CAST(N'2020-02-13T17:05:48.973' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:01:50</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:10</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[80]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T17:06:13.307' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'8', N'Completed', CAST(N'2020-02-13T17:05:12.930' AS DateTime), CAST(N'2020-02-13T17:05:48.973' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:01:50</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:10</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[80]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T17:06:17.547' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'8', N'8', N'Completed', CAST(N'2020-02-13T17:05:12.930' AS DateTime), CAST(N'2020-02-13T17:05:48.973' AS DateTime), 1, 1, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Don2, Don]]></student_name><lesson_location><![CDATA[14]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:01:50</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:10</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[80]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-13T17:06:18.090' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'9', N'Started', CAST(N'2020-02-13T15:14:37.613' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[7]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:24</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:12</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[76]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-15T11:50:36.403' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'9', N'Started', CAST(N'2020-02-13T15:14:37.613' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[7]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:36</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:12</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[41]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-15T11:50:47.980' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'9', N'Started', CAST(N'2020-02-13T15:14:37.613' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[7]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:49</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:13</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[47]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-15T11:50:48.473' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'9', N'Started', CAST(N'2020-02-13T15:14:37.613' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[7]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:01:02</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:13</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[55]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-15T11:50:54.170' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'9', N'Started', CAST(N'2020-02-13T15:14:37.613' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[7]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:01:15</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:13</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[39]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-15T11:50:55.677' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'9', N'Started', CAST(N'2020-02-13T15:14:37.613' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[7]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:01:20</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:05</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[67]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-15T11:50:56.143' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (NULL, NULL, N'None', NULL, NULL, 0, 0, NULL, NULL, CAST(N'2020-02-15T11:51:05.397' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'1', N'Started', CAST(N'2020-02-15T11:51:05.410' AS DateTime), NULL, 1, 0, N'<Root Bookmark="ITEM_01"><sco identifier="ITEM_01"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[8]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-15T11:51:05.903' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'6', N'Started', CAST(N'2020-02-05T19:24:42.153' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:06</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:03</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[73]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-15T11:51:20.750' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'6', N'Started', CAST(N'2020-02-05T19:24:42.153' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:09</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:03</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[45]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-15T11:51:21.977' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'6', N'Started', CAST(N'2020-02-05T19:24:42.153' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:11</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[50]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-15T11:51:22.470' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'6', N'Started', CAST(N'2020-02-05T19:24:42.153' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:13</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[26]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-15T11:51:22.987' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'7', N'Started', CAST(N'2020-02-06T12:33:27.190' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:01</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:01</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[24]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-15T11:51:25.407' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'7', N'Started', CAST(N'2020-02-06T12:33:27.190' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:02</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:01</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[20]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-15T11:51:26.733' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'7', N'Started', CAST(N'2020-02-06T12:33:27.190' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>suspend</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[4]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-15T11:51:27.227' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (NULL, NULL, N'None', NULL, NULL, 0, 0, NULL, NULL, CAST(N'2020-02-15T13:04:54.760' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (NULL, NULL, N'None', NULL, NULL, 0, 0, NULL, NULL, CAST(N'2020-02-15T13:04:55.227' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Started', CAST(N'2020-02-15T13:15:04.310' AS DateTime), NULL, 1, 0, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw>50</raw><max>100</max><min>0</min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[N4IgJiBcBsDMBMAaEAbKAGZA3KBtdAutgBZ5EgBqemAjOQA5SgoCGAzgC4UCWApgO68wAZRTcwvDNj78AIgFcATiw7cA9gDspINmInCOK3myYh0pgMZqAtvRS8OQqB0Xze0tt0cRILtx68hAAkAT3peRTENAGsTSFwCAF9k5ABHJmSgA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[86]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'50', CAST(N'2020-02-15T13:15:05.413' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Started', CAST(N'2020-02-15T13:15:04.310' AS DateTime), NULL, 1, 0, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw>50</raw><max>100</max><min>0</min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[N4IgJiBcBsAsCMAaEAbKAGZA3KBtdAutgBZ5EgBqem85ADlKCgIYDOALhQJYCmA7jzABlFFzA8M2XnwAiAVwBOzdlwD2AO0khWo8UPbKerRiHQmAxqoC2dFD3aCo7BXJ5TWXBxEjPX7z4IAEgCedDwKouoA1saQuAQAvgnIOmI8ACpcVjyRPPqGsaBmkKCxmCDsGAB06OjwtQ21sADssACcrQCs8ADMyEImViaxILbMwVzqAOYgyJWQ8DWNTa0dsN19IOkm8/iItMjKeKDz5QxxJ1kSkOUAmgAyUPCdABzwzZ0ATM3oCJ2bADMFDweAAva4A5goVg8BKJRAnLTnXCXbJaB5PV7vL4/WCfdrIIEg8FQSHQ2GJRLJEBcMhJJLIACOjCSQA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[25]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'50', CAST(N'2020-02-15T13:15:05.740' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Started', CAST(N'2020-02-15T13:15:04.310' AS DateTime), NULL, 1, 0, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>not attempted</lesson_status><entry>ab-initio</entry><score><raw>50</raw><max>100</max><min>0</min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[N4IgJiBcCsBMCcAaEAbKBaAjMgblA2gLq4AWBxIAagQAyKYUAOUoKAhgM4AulAlgKYB3fmADKKXmH5Q6IHAMEARAK4AnNl14B7AHYzkHCVNFcN/DixA1LAYy0BbRin5cRUAGZsUHfrl4deVwhILlVlXzl/QJEACQBPRn5VCR0AawtIIgBfHOQARxYcoAAA==]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[93]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'50', CAST(N'2020-02-15T13:15:05.813' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (NULL, NULL, N'None', NULL, NULL, 0, 0, NULL, NULL, CAST(N'2020-02-17T14:20:52.600' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'13', N'Started', CAST(N'2020-02-17T14:20:52.703' AS DateTime), NULL, 1, 0, N'<Root Bookmark="item_1"><sco identifier="item_1"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[0]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[58]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-17T14:20:54.533' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Started', CAST(N'2020-02-15T13:15:04.310' AS DateTime), NULL, 1, 0, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw>50</raw><max>100</max><min>0</min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[N4IgJiBcBsDMBMAaEAbKAGZA3KBtdAutgBZ5EgBqemAjOQA5SgoCGAzgC4UCWApgO68wAZRTcwvDNj78AIgFcATiw7cA9gDspINmInCOK3myYh0pgMZqAtvRS8OQqB0Xze0tt0cRILtx68hAAkAT3peRTENAGsTSFwCAF9k5ABHJmSgA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[44]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'50', CAST(N'2020-02-15T13:15:06.320' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Started', CAST(N'2020-02-15T13:15:04.310' AS DateTime), NULL, 1, 0, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw>50</raw><max>100</max><min>0</min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[N4IgJiBcCsAcAMAaEAbKSQDcoG14F1lMALXQkANVyQEZyAHKUFAQwGcAXCgSwFMB3XmADKKbmF7oiffgBEArgCcWHbgHsAdlJBsxE4RxW82TEPFMBjNQFt6KXhyFQAZixRte0tt0cRIHRXlPLG5vXwAJAE96XkUxDQBrE0gcfABfDOQARyYMoAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[81]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'50', CAST(N'2020-02-15T13:15:06.817' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Started', CAST(N'2020-02-15T13:15:04.310' AS DateTime), NULL, 1, 0, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw>50</raw><max>100</max><min>0</min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[N4IgJiBcCsAcAMAaEAbKSQDcoG14F1lMALXQkANVyQEZyAHKUFAQwGcAXCgSwFMB3XmADKKbmF7oiffgBEArgCcWHbgHsAdlJBsxE4RxW82TEPFMBjNQFt6KXhyFQAZixRte0tt0cRIHRXlPLG5vXwAJAE96XkUxDQBrE0gcfABfDOQARyYMoAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[18]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'50', CAST(N'2020-02-15T13:15:06.953' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Completed', CAST(N'2020-02-15T13:15:04.310' AS DateTime), CAST(N'2020-02-15T13:15:06.967' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:03</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:03</session_time></core><suspend_data><![CDATA[N4IgJiBcDMBMAMBWANCANleqBuUDa8AujgBb7EgBq+WAjBQA5ShoCGAzgC6UCWApgHc+YAMpoeYPlFo5+AgCIBXAE6tOPAPYA7KLFTtxkkZzV92zEPAsBjDQFsGaPp2FROyxX1nseLiJHdPb19hAAkATwY+ZXEtAGtzSDxCAF9UWht7R2dXSAAzVjR2LxBsHh8/Nw8SsoqwyOjYhPIUtJAALw17Y1MLHi1JAA8zGgpO7pMXRLwtRTQ0VP1DPgAVHjs+WL4eqYsrSFBErBBOTAA6eHhaS5vLgBYAdjuATifEWmhUEQs7C0SQWwOJyVVCnSC0C63e5PV53d6fEArCxggjIeioNT4UBg45MJLY9ZSSDHACaABlpIgABy0B6IWAPeB3WiIBF5ZR8PjtIkFIp8FKLbGYVB4vAEjbCkDkyk0ukMpmwF6odmc7lQXnFAVato8FqtNoAR2YrSAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[81]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-15T13:15:07.313' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Completed', CAST(N'2020-02-15T13:15:04.310' AS DateTime), CAST(N'2020-02-15T13:15:06.967' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:03</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:03</session_time></core><suspend_data><![CDATA[N4IgJiBcDMBMAMBWANCANleqBuUDa8AujgBb7EgBq+WAjBQA5ShoCGAzgC6UCWApgHc+YAMpoeYPlFo5+AgCIBXAE6tOPAPYA7KLFTtxkkZzV92zEPAsBjDQFsGaPp2FROyxX1nseLiJHdPb19hAAkATwY+ZXEtAGtzSDxCAF9UWht7R2dXSAAzVjR2LxBsHh8/Nw8SsoqwyOjYhPIUtJAALw17Y1MLHi1JAA8zGgpO7pMXRLwtRTQ0VP1DPgAVHjs+WL4eqYsrSFBErBBOTAA6eHhaS5vLgBYAdjuATifEWmhUEQs7C0SQWwOJyVVCnSC0C63e5PV53d6fEArCxggjIeioNT4UBg45MJLY9ZSSDHACaABlpIgABy0B6IWAPeB3WiIBF5ZR8PjtIkFIp8FKLbGYVB4vAEjbCkDkyk0ukMpmwF6odmc7lQXnFAVato8FqtNoAR2YrSAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[81]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-15T13:15:07.380' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Completed', CAST(N'2020-02-15T13:15:04.310' AS DateTime), CAST(N'2020-02-15T13:15:06.967' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:03</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:03</session_time></core><suspend_data><![CDATA[N4IgJiBcDMBMAMBWANCANleqBuUDa8AujgBb7EgBq+WAjBQA5ShoCGAzgC6UCWApgHc+YAMpoeYPlFo5+AgCIBXAE6tOPAPYA7KLFTtxkkZzV92zEPAsBjDQFsGaPp2FROyxX1nseLiJHdPb19hAAkATwY+ZXEtAGtzSDxCAF9UWht7R2dXSAAzVjR2LxBsHh8/Nw8SsoqwyOjYhPIUtJAALw17Y1MLHi1JAA8zGgpO7pMXRLwtRTQ0VP1DPgAVHjs+WL4eqYsrSFBErBBOTAA6eHhaS5vLgBYAdjuATifEWmhUEQs7C0SQWwOJyVVCnSC0C63e5PV53d6fEArCxggjIeioNT4UBg45MJLY9ZSSDHACaABlpIgABy0B6IWAPeB3WiIBF5ZR8PjtIkFIp8FKLbGYVB4vAEjbCkDkyk0ukMpmwF6odmc7lQXnFAVato8FqtNoAR2YrSAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[81]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-15T13:15:07.463' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Completed', CAST(N'2020-02-15T13:15:04.310' AS DateTime), CAST(N'2020-02-15T13:15:06.967' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:03</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:03</session_time></core><suspend_data><![CDATA[N4IgJiBcDMBMAMBWANCANleqBuUDa8AujgBb7EgBq+WAjBQA5ShoCGAzgC6UCWApgHc+YAMpoeYPlFo5+AgCIBXAE6tOPAPYA7KLFTtxkkZzV92zEPAsBjDQFsGaPp2FROyxX1nseLiJHdPb19hAAkATwY+ZXEtAGtzSDxCAF9UWht7R2dXSAAzVjR2LxBsHh8/Nw8SsoqwyOjYhPIUtJAALw17Y1MLHi1JAA8zGgpO7pMXRLwtRTQ0VP1DPgAVHjs+WL4eqYsrSFBErBBOTAA6eHhaS5vLgBYAdjuATifEWmhUEQs7C0SQWwOJyVVCnSC0C63e5PV53d6fEArCxggjIeioNT4UBg45MJLY9ZSSDHACaABlpIgABy0B6IWAPeB3WiIBF5ZR8PjtIkFIp8FKLbGYVB4vAEjbCkDkyk0ukMpmwF6odmc7lQXnFAVato8FqtNoAR2YrSAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[81]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-15T13:15:07.823' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Completed', CAST(N'2020-02-15T13:15:04.310' AS DateTime), CAST(N'2020-02-15T13:15:06.967' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:03</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:03</session_time></core><suspend_data><![CDATA[N4IgJiBcDMBMAMBWANCANleqBuUDa8AujgBb7EgBq+WAjBQA5ShoCGAzgC6UCWApgHc+YAMpoeYPlFo5+AgCIBXAE6tOPAPYA7KLFTtxkkZzV92zEPAsBjDQFsGaPp2FROyxX1nseLiJHdPb19hAAkATwY+ZXEtAGtzSDxCAF9UWht7R2dXSAAzVjR2LxBsHh8/Nw8SsoqwyOjYhPIUtJAALw17Y1MLHi1JAA8zGgpO7pMXRLwtRTQ0VP1DPgAVHjs+WL4eqYsrSFBErBBOTAA6eHhaS5vLgBYAdjuATifEWmhUEQs7C0SQWwOJyVVCnSC0C63e5PV53d6fEArCxggjIeioNT4UBg45MJLY9ZSSDHACaABlpIgABy0B6IWAPeB3WiIBF5ZR8PjtIkFIp8FKLbGYVB4vAEjbCkDkyk0ukMpmwF6odmc7lQXnFAVato8FqtNoAR2YrSAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[81]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-15T13:15:07.900' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Completed', CAST(N'2020-02-15T13:15:04.310' AS DateTime), CAST(N'2020-02-15T13:15:06.967' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:03</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:03</session_time></core><suspend_data><![CDATA[N4IgJiBcDMBMAMBWANCANleqBuUDa8AujgBb7EgBq+WAjBQA5ShoCGAzgC6UCWApgHc+YAMpoeYPlFo5+AgCIBXAE6tOPAPYA7KLFTtxkkZzV92zEPAsBjDQFsGaPp2FROyxX1nseLiJHdPb19hAAkATwY+ZXEtAGtzSDxCAF9UWht7R2dXSAAzVjR2LxBsHh8/Nw8SsoqwyOjYhPIUtJAALw17Y1MLHi1JAA8zGgpO7pMXRLwtRTQ0VP1DPgAVHjs+WL4eqYsrSFBErBBOTAA6eHhaS5vLgBYAdjuATifEWmhUEQs7C0SQWwOJyVVCnSC0C63e5PV53d6fEArCxggjIeioNT4UBg45MJLY9ZSSDHACaABlpIgABy0B6IWAPeB3WiIBF5ZR8PjtIkFIp8FKLbGYVB4vAEjbCkDkyk0ukMpmwF6odmc7lQXnFAVato8FqtNoAR2YrSAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[81]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-15T13:15:07.923' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Completed', CAST(N'2020-02-15T13:15:04.310' AS DateTime), CAST(N'2020-02-15T13:15:06.967' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:03</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:03</session_time></core><suspend_data><![CDATA[N4IgJiBcDMBMAMBWANCANleqBuUDa8AujgBb7EgBq+WAjBQA5ShoCGAzgC6UCWApgHc+YAMpoeYPlFo5+AgCIBXAE6tOPAPYA7KLFTtxkkZzV92zEPAsBjDQFsGaPp2FROyxX1nseLiJHdPb19hAAkATwY+ZXEtAGtzSDxCAF9UWht7R2dXSAAzVjR2LxBsHh8/Nw8SsoqwyOjYhPIUtJAALw17Y1MLHi1JAA8zGgpO7pMXRLwtRTQ0VP1DPgAVHjs+WL4eqYsrSFBErBBOTAA6eHhaS5vLgBYAdjuATifEWmhUEQs7C0SQWwOJyVVCnSC0C63e5PV53d6fEArCxggjIeioNT4UBg45MJLY9ZSSDHACaABlpIgABy0B6IWAPeB3WiIBF5ZR8PjtIkFIp8FKLbGYVB4vAEjbCkDkyk0ukMpmwF6odmc7lQXnFAVato8FqtNoAR2YrSAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[81]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-15T13:15:07.967' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Completed', CAST(N'2020-02-15T13:15:04.310' AS DateTime), CAST(N'2020-02-15T13:15:06.967' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:03</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:03</session_time></core><suspend_data><![CDATA[N4IgJiBcDMBMAMBWANCANleqBuUDa8AujgBb7EgBq+WAjBQA5ShoCGAzgC6UCWApgHc+YAMpoeYPlFo5+AgCIBXAE6tOPAPYA7KLFTtxkkZzV92zEPAsBjDQFsGaPp2FROyxX1nseLiJHdPb19hAAkATwY+ZXEtAGtzSDxCAF9UWht7R2dXSAAzVjR2LxBsHh8/Nw8SsoqwyOjYhPIUtJAALw17Y1MLHi1JAA8zGgpO7pMXRLwtRTQ0VP1DPgAVHjs+WL4eqYsrSFBErBBOTAA6eHhaS5vLgBYAdjuATifEWmhUEQs7C0SQWwOJyVVCnSC0C63e5PV53d6fEArCxggjIeioNT4UBg45MJLY9ZSSDHACaABlpIgABy0B6IWAPeB3WiIBF5ZR8PjtIkFIp8FKLbGYVB4vAEjbCkDkyk0ukMpmwF6odmc7lQXnFAVato8FqtNoAR2YrSAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[81]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-15T13:15:08.330' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Completed', CAST(N'2020-02-15T13:15:04.310' AS DateTime), CAST(N'2020-02-15T13:15:06.967' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:03</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:03</session_time></core><suspend_data><![CDATA[N4IgJiBcDMBMAMBWANCANleqBuUDa8AujgBb7EgBq+WAjBQA5ShoCGAzgC6UCWApgHc+YAMpoeYPlFo5+AgCIBXAE6tOPAPYA7KLFTtxkkZzV92zEPAsBjDQFsGaPp2FROyxX1nseLiJHdPb19hAAkATwY+ZXEtAGtzSDxCAF9UWht7R2dXSAAzVjR2LxBsHh8/Nw8SsoqwyOjYhPIUtJAALw17Y1MLHi1JAA8zGgpO7pMXRLwtRTQ0VP1DPgAVHjs+WL4eqYsrSFBErBBOTAA6eHhaS5vLgBYAdjuATifEWmhUEQs7C0SQWwOJyVVCnSC0C63e5PV53d6fEArCxggjIeioNT4UBg45MJLY9ZSSDHACaABlpIgABy0B6IWAPeB3WiIBF5ZR8PjtIkFIp8FKLbGYVB4vAEjbCkDkyk0ukMpmwF6odmc7lQXnFAVato8FqtNoAR2YrSAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[81]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-15T13:15:08.420' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Completed', CAST(N'2020-02-15T13:15:04.310' AS DateTime), CAST(N'2020-02-15T13:15:06.967' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:03</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:03</session_time></core><suspend_data><![CDATA[N4IgJiBcDMBMAMBWANCANleqBuUDa8AujgBb7EgBq+WAjBQA5ShoCGAzgC6UCWApgHc+YAMpoeYPlFo5+AgCIBXAE6tOPAPYA7KLFTtxkkZzV92zEPAsBjDQFsGaPp2FROyxX1nseLiJHdPb19hAAkATwY+ZXEtAGtzSDxCAF9UWht7R2dXSAAzVjR2LxBsHh8/Nw8SsoqwyOjYhPIUtJAALw17Y1MLHi1JAA8zGgpO7pMXRLwtRTQ0VP1DPgAVHjs+WL4eqYsrSFBErBBOTAA6eHhaS5vLgBYAdjuATifEWmhUEQs7C0SQWwOJyVVCnSC0C63e5PV53d6fEArCxggjIeioNT4UBg45MJLY9ZSSDHACaABlpIgABy0B6IWAPeB3WiIBF5ZR8PjtIkFIp8FKLbGYVB4vAEjbCkDkyk0ukMpmwF6odmc7lQXnFAVato8FqtNoAR2YrSAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[81]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-15T13:15:08.467' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Completed', CAST(N'2020-02-15T13:15:04.310' AS DateTime), CAST(N'2020-02-15T13:15:06.967' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:03</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:03</session_time></core><suspend_data><![CDATA[N4IgJiBcDMBMAMBWANCANleqBuUDa8AujgBb7EgBq+WAjBQA5ShoCGAzgC6UCWApgHc+YAMpoeYPlFo5+AgCIBXAE6tOPAPYA7KLFTtxkkZzV92zEPAsBjDQFsGaPp2FROyxX1nseLiJHdPb19hAAkATwY+ZXEtAGtzSDxCAF9UWht7R2dXSAAzVjR2LxBsHh8/Nw8SsoqwyOjYhPIUtJAALw17Y1MLHi1JAA8zGgpO7pMXRLwtRTQ0VP1DPgAVHjs+WL4eqYsrSFBErBBOTAA6eHhaS5vLgBYAdjuATifEWmhUEQs7C0SQWwOJyVVCnSC0C63e5PV53d6fEArCxggjIeioNT4UBg45MJLY9ZSSDHACaABlpIgABy0B6IWAPeB3WiIBF5ZR8PjtIkFIp8FKLbGYVB4vAEjbCkDkyk0ukMpmwF6odmc7lQXnFAVato8FqtNoAR2YrSAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[81]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-15T13:15:08.830' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Completed', CAST(N'2020-02-15T13:15:04.310' AS DateTime), CAST(N'2020-02-15T13:15:06.967' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:03</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:03</session_time></core><suspend_data><![CDATA[N4IgJiBcDMBMAMBWANCANleqBuUDa8AujgBb7EgBq+WAjBQA5ShoCGAzgC6UCWApgHc+YAMpoeYPlFo5+AgCIBXAE6tOPAPYA7KLFTtxkkZzV92zEPAsBjDQFsGaPp2FROyxX1nseLiJHdPb19hAAkATwY+ZXEtAGtzSDxCAF9UWht7R2dXSAAzVjR2LxBsHh8/Nw8SsoqwyOjYhPIUtJAALw17Y1MLHi1JAA8zGgpO7pMXRLwtRTQ0VP1DPgAVHjs+WL4eqYsrSFBErBBOTAA6eHhaS5vLgBYAdjuATifEWmhUEQs7C0SQWwOJyVVCnSC0C63e5PV53d6fEArCxggjIeioNT4UBg45MJLY9ZSSDHACaABlpIgABy0B6IWAPeB3WiIBF5ZR8PjtIkFIp8FKLbGYVB4vAEjbCkDkyk0ukMpmwF6odmc7lQXnFAVato8FqtNoAR2YrSAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[81]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-15T13:15:08.920' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Completed', CAST(N'2020-02-15T13:15:04.310' AS DateTime), CAST(N'2020-02-15T13:15:06.967' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:03</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:03</session_time></core><suspend_data><![CDATA[N4IgJiBcDMBMAMBWANCANleqBuUDa8AujgBb7EgBq+WAjBQA5ShoCGAzgC6UCWApgHc+YAMpoeYPlFo5+AgCIBXAE6tOPAPYA7KLFTtxkkZzV92zEPAsBjDQFsGaPp2FROyxX1nseLiJHdPb19hAAkATwY+ZXEtAGtzSDxCAF9UWht7R2dXSAAzVjR2LxBsHh8/Nw8SsoqwyOjYhPIUtJAALw17Y1MLHi1JAA8zGgpO7pMXRLwtRTQ0VP1DPgAVHjs+WL4eqYsrSFBErBBOTAA6eHhaS5vLgBYAdjuATifEWmhUEQs7C0SQWwOJyVVCnSC0C63e5PV53d6fEArCxggjIeioNT4UBg45MJLY9ZSSDHACaABlpIgABy0B6IWAPeB3WiIBF5ZR8PjtIkFIp8FKLbGYVB4vAEjbCkDkyk0ukMpmwF6odmc7lQXnFAVato8FqtNoAR2YrSAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[81]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-15T13:15:09.330' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Completed', CAST(N'2020-02-15T13:15:04.310' AS DateTime), CAST(N'2020-02-15T13:15:06.967' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:03</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:03</session_time></core><suspend_data><![CDATA[N4IgJiBcDMBMAMBWANCANleqBuUDa8AujgBb7EgBq+WAjBQA5ShoCGAzgC6UCWApgHc+YAMpoeYPlFo5+AgCIBXAE6tOPAPYA7KLFTtxkkZzV92zEPAsBjDQFsGaPp2FROyxX1nseLiJHdPb19hAAkATwY+ZXEtAGtzSDxCAF9UWht7R2dXSAAzVjR2LxBsHh8/Nw8SsoqwyOjYhPIUtJAALw17Y1MLHi1JAA8zGgpO7pMXRLwtRTQ0VP1DPgAVHjs+WL4eqYsrSFBErBBOTAA6eHhaS5vLgBYAdjuATifEWmhUEQs7C0SQWwOJyVVCnSC0C63e5PV53d6fEArCxggjIeioNT4UBg45MJLY9ZSSDHACaABlpIgABy0B6IWAPeB3WiIBF5ZR8PjtIkFIp8FKLbGYVB4vAEjbCkDkyk0ukMpmwF6odmc7lQXnFAVato8FqtNoAR2YrSAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[81]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-15T13:15:11.483' AS DateTime))
GO
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Completed', CAST(N'2020-02-15T13:15:04.310' AS DateTime), CAST(N'2020-02-15T13:15:06.967' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:03</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:03</session_time></core><suspend_data><![CDATA[N4IgJiBcDMBMAMBWANCANleqBuUDa8AujgBb7EgBq+WAjBQA5ShoCGAzgC6UCWApgHc+YAMpoeYPlFo5+AgCIBXAE6tOPAPYA7KLFTtxkkZzV92zEPAsBjDQFsGaPp2FROyxX1nseLiJHdPb19hAAkATwY+ZXEtAGtzSDxCAF9UWht7R2dXSAAzVjR2LxBsHh8/Nw8SsoqwyOjYhPIUtJAALw17Y1MLHi1JAA8zGgpO7pMXRLwtRTQ0VP1DPgAVHjs+WL4eqYsrSFBErBBOTAA6eHhaS5vLgBYAdjuATifEWmhUEQs7C0SQWwOJyVVCnSC0C63e5PV53d6fEArCxggjIeioNT4UBg45MJLY9ZSSDHACaABlpIgABy0B6IWAPeB3WiIBF5ZR8PjtIkFIp8FKLbGYVB4vAEjbCkDkyk0ukMpmwF6odmc7lQXnFAVato8FqtNoAR2YrSAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[81]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-15T13:15:11.980' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Completed', CAST(N'2020-02-15T13:15:04.310' AS DateTime), CAST(N'2020-02-15T13:15:06.967' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:03</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:03</session_time></core><suspend_data><![CDATA[N4IgJiBcDMBMAMBWANCANleqBuUDa8AujgBb7EgBq+WAjBQA5ShoCGAzgC6UCWApgHc+YAMpoeYPlFo5+AgCIBXAE6tOPAPYA7KLFTtxkkZzV92zEPAsBjDQFsGaPp2FROyxX1nseLiJHdPb19hAAkATwY+ZXEtAGtzSDxCAF9UWht7R2dXSAAzVjR2LxBsHh8/Nw8SsoqwyOjYhPIUtJAALw17Y1MLHi1JAA8zGgpO7pMXRLwtRTQ0VP1DPgAVHjs+WL4eqYsrSFBErBBOTAA6eHhaS5vLgBYAdjuATifEWmhUEQs7C0SQWwOJyVVCnSC0C63e5PV53d6fEArCxggjIeioNT4UBg45MJLY9ZSSDHACaABlpIgABy0B6IWAPeB3WiIBF5ZR8PjtIkFIp8FKLbGYVB4vAEjbCkDkyk0ukMpmwF6odmc7lQXnFAVato8FqtNoAR2YrSAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[81]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-15T13:15:12.003' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'10', N'Completed', CAST(N'2020-02-15T13:15:04.310' AS DateTime), CAST(N'2020-02-15T13:15:06.967' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:03</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:03</session_time></core><suspend_data><![CDATA[N4IgJiBcDMBMAMBWANCANleqBuUDa8AujgBb7EgBq+WAjBQA5ShoCGAzgC6UCWApgHc+YAMpoeYPlFo5+AgCIBXAE6tOPAPYA7KLFTtxkkZzV92zEPAsBjDQFsGaPp2FROyxX1nseLiJHdPb19hAAkATwY+ZXEtAGtzSDxCAF9UWht7R2dXSAAzVjR2LxBsHh8/Nw8SsoqwyOjYhPIUtJAALw17Y1MLHi1JAA8zGgpO7pMXRLwtRTQ0VP1DPgAVHjs+WL4eqYsrSFBErBBOTAA6eHhaS5vLgBYAdjuATifEWmhUEQs7C0SQWwOJyVVCnSC0C63e5PV53d6fEArCxggjIeioNT4UBg45MJLY9ZSSDHACaABlpIgABy0B6IWAPeB3WiIBF5ZR8PjtIkFIp8FKLbGYVB4vAEjbCkDkyk0ukMpmwF6odmc7lQXnFAVato8FqtNoAR2YrSAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[81]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-15T13:15:12.480' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Started', CAST(N'2020-02-17T11:57:31.707' AS DateTime), NULL, 1, 0, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>not attempted</lesson_status><entry>ab-initio</entry><score><raw></raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[N4IgJiBcAs0BwBoQBsoFoCMSBuUDaAujgBb5EgBq+ADAhuQA5SjICGAzgC4UCWApgHc+YAMrIeYPlFohs/AQBEArgCdWnHgHsAdtKTtxkkZ3V92zENQsBjTQFsGyPp2FQAZq2Ts+OHux4uEJCcKko+sn4BwgASAJ4MfCri2gDW5pCEAL7ZSACOzNlAA=]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[5]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', NULL, CAST(N'2020-02-17T11:57:32.113' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Started', CAST(N'2020-02-17T11:57:31.707' AS DateTime), NULL, 1, 0, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw>50</raw><max>100</max><min>0</min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[N4IgJiBcAsCcsBoQBsoAYkDcoG00F0sALXQkANVwwEYyAHKUZAQwGcAXcgSwFMB3HmADKyLmB7osvPgBEArgCdm7LgHsAdpJCtR4oe2U9WjEGhMBjVQFs6yHu0FQAZs2SseU1lwcRI7BXIeIJhcXj4AEgCedDwKouoA1saQOPgAvhlIAI6MGUAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[57]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'50', CAST(N'2020-02-17T11:57:32.140' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Started', CAST(N'2020-02-17T11:57:31.707' AS DateTime), NULL, 1, 0, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw>50</raw><max>100</max><min>0</min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[N4IgJiBcAsCcsBoQBsoAYkDcoG00F0sALXQkANVwwEYyAHKUZAQwGcAXcgSwFMB3HmADKyLmB7osvPgBEArgCdm7LgHsAdpJCtR4oe2U9WjEGhMBjVQFs6yHu0FQAZs2SseU1lwcRI7BXIeIJhcXj4AEgCedDwKouoA1saQOPgAvhlIAI6MGUAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[42]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'50', CAST(N'2020-02-17T11:57:32.153' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Started', CAST(N'2020-02-17T11:57:31.707' AS DateTime), NULL, 1, 0, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw>50</raw><max>100</max><min>0</min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[N4IgJiBcCsAsDMAaEAbKAGZA3KBtdAutgBZ5EgBqemAjOQA5SgoCGAzgC4UCWApgO68wAZRTcwvDNj78AIgFcATiw7cA9gDspINmInCOK3myYh0pgMZqAtvRS8OQqB0Xze0tt0cRILtx68hAAkAT3peRTENAGsTSFwCAF9k5ABHJmSgA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[27]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'50', CAST(N'2020-02-17T11:57:32.200' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Started', CAST(N'2020-02-17T11:57:31.707' AS DateTime), NULL, 1, 0, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw>50</raw><max>100</max><min>0</min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[N4IgJiBcCs0IwBoQBsoAYkDcoG00F0sALXQkANVwzjIAcpRkBDAZwBdyBLAUwHduwAZWScw3dFh68AIgFcATkzacA9gDsJIFiLGC2S7iwYg0xgMYqAtrWTc2AqG3mzuklp3sRITl248CACQBPWm55ETUAayNIHHwAX3ikbVFuABVOS24I7j0DGNBTSFAYjBA2dAA6NDQ4GvqagBYAdkaATlb4AGYkQWNLYxiQGyYgzjUAcxAkCsg4aoam1o7G7qQ041m8BBokJVxQWbL6WMPM8UgygE0AGSg4aAAOODaAJjRH+HhmpAAzeW43AAXhdfkxkCxuPEEghDpoTjgzllNLd7k8Xu9PnAAGxoaB/AHA0HgyHQslJECcUiJRJIACODESQA=]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[61]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'50', CAST(N'2020-02-17T11:57:32.597' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Started', CAST(N'2020-02-17T11:57:31.707' AS DateTime), NULL, 1, 0, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>not attempted</lesson_status><entry>ab-initio</entry><score><raw>50</raw><max></max><min></min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[N4IgJiBcAs0BwBoQBsoFoCMSBuUDaAujgBb5EgBq+ADAhuQA5SjICGAzgC4UCWApgHc+YAMrIeYPlFohs/AQBEArgCdWnHgHsAdtKTtxkkZ3V92zENQsBjTQFsGyPp2FQAZq2Ts+OHux4uEJCcKko+sn4BwgASAJ4MfCri2gDW5pCEAL7ZSACOzNlAA=]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[87]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'50', CAST(N'2020-02-17T11:57:33.090' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Started', CAST(N'2020-02-17T11:57:31.707' AS DateTime), NULL, 1, 0, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>not attempted</lesson_status><entry>ab-initio</entry><score><raw>50</raw><max></max><min>0</min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[N4IgJiBcAs0BwBoQBsoFoCMSBuUDaAujgBb5EgBq+ADAhuQA5SjICGAzgC4UCWApgHc+YAMrIeYPlFohs/AQBEArgCdWnHgHsAdtKTtxkkZ3V92zENQsBjTQFsGyPp2FQAZq2Ts+OHux4uEJCcKko+sn4BwgASAJ4MfCri2gDW5pCEAL7ZSACOzNlAA=]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[61]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'50', CAST(N'2020-02-17T11:57:33.153' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Started', CAST(N'2020-02-17T11:57:31.707' AS DateTime), NULL, 1, 0, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw>50</raw><max>100</max><min>0</min></score><total_time>0000:00:00</total_time><lesson_mode>normal</lesson_mode><exit></exit><session_time>0000:00:00</session_time></core><suspend_data><![CDATA[N4IgJiBcAsCcsBoQBsoAYkDcoG00F0sALXQkANVwwEYyAHKUZAQwGcAXcgSwFMB3HmADKyLmB7osvPgBEArgCdm7LgHsAdpJCtR4oe2U9WjEGhMBjVQFs6yHu0FQAZs2SseU1lwcRI7BXIeIJhcXj4AEgCedDwKouoA1saQOPgAvhlIAI6MGUAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[37]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'50', CAST(N'2020-02-17T11:57:33.393' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Started', CAST(N'2020-02-17T11:57:31.707' AS DateTime), NULL, 1, 0, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>incomplete</lesson_status><entry>ab-initio</entry><score><raw>50</raw><max>100</max><min>0</min></score><total_time>0000:00:02</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcCs0IwBoQBsoAYkDcoG00F0sALXQkANVwzjIAcpRkBDAZwBdyBLAUwHduwAZWScw3dFh68AIgFcATkzacA9gDsJIFiLGC2S7iwYg0xgMYqAtrWTc2AqG3mzuklp3sRITl248CACQBPWm55ETUAayNIHHwAX3ikbVFuABVOS24I7j0DGNBTSFAYjBA2dAA6NDQ4GvqagBYAdkaATlb4AGYkQWNLYxiQGyYgzjUAcxAkCsg4aoam1o7G7qQ041m8BBokJVxQWbL6WMPM8UgygE0AGSg4aAAOODaAJjRH+HhmpAAzeW43AAXhdfkxkCxuPEEghDpoTjgzllNLd7k8Xu9PnAAGxoaB/AHA0HgyHQslJECcUiJRJIACODESQA=]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[2]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'50', CAST(N'2020-02-17T11:57:33.507' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:33.657' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:33.897' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:33.913' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:33.937' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:33.963' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:34.007' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:34.023' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:34.163' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:34.400' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:34.443' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:34.477' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:34.540' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:34.943' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:35.040' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:37.980' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:38.027' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:38.060' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:38.480' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:38.493' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:38.523' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:38.540' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:38.570' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:39.053' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:39.190' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:39.250' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:39.273' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:39.707' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:39.733' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:39.757' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:39.790' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:40.150' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:40.220' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:40.247' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:40.643' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:40.720' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:41.153' AS DateTime))
INSERT [dbo].[tblLearnerContentModTrackingLog] ([LearnerId], [ContentModuleId], [CompletionStatus], [DateOfStart], [DateOfCompletion], [TotalNoOfPages], [NoOfPagesCompleted], [UserDataXML], [Score], [Logdate]) VALUES (N'5', N'12', N'Completed', CAST(N'2020-02-17T11:57:31.707' AS DateTime), CAST(N'2020-02-17T11:57:33.523' AS DateTime), 1, 1, N'<Root Bookmark="98B826A1-9E53-4893-84A8-07211DB08F48"><sco identifier="98B826A1-9E53-4893-84A8-07211DB08F48"><cmi><core><student_id><![CDATA[]]></student_id><student_name><![CDATA[Gabhane, Dinesh]]></student_name><lesson_location><![CDATA[]]></lesson_location><credit>credit</credit><lesson_status>completed</lesson_status><entry>ab-initio</entry><score><raw>100</raw><max>100</max><min>0</min></score><total_time>0000:00:04</total_time><lesson_mode>normal</lesson_mode><exit>suspend</exit><session_time>0000:00:02</session_time></core><suspend_data><![CDATA[N4IgJiBcBMDMCsAWANCANlAjKgblA2gAzKYC6uAFgeSAGoHFmoAOUoaAhgM4AutAlgFMA7oLABlNPzCCsuIcIAiAVwBOHHvwD2AOzkguUmeJ4bBXNiEKWAxloC2zNIJ5ioPVcsHyu/VxEgPLx8/MQAJAE9mQVUpHQBrC0h8UgBfVExbBycXN0gAMw40Lm8QHH5ff3dPUvLK8KiYuMTqVPSQAC8tBxMzS34dGQAPcwYaLp7TVyT8HWU0NDTUQ2lBABV+e0E4wV7py2tIUCTiEB4oQgA6QkJMG/ubxAB2RABOF/hMWFRxS3tLJIgOyOZxVVDnSCYa4PR4vd6IT7fEBrSwQogkGgaAigCGnVjJHGbWSQU4ATQAMlh4AAOTCvaCEamfT5PVD5VSCQQdYmFYqCVJLHEXFjYs5E4UgClU2n0xmfABshHgbI5XJ5RRKAq17X4rTa7QAjmw2kAAA]]></suspend_data><launch_data><![CDATA[LMSID=SAI&rip=HRS&lang=en-US]]></launch_data><comments><![CDATA[]]></comments><comments_from_lms><![CDATA[54]]></comments_from_lms><objectives><_count>0</_count></objectives><student_data><mastery_score>100</mastery_score><max_time_allowed></max_time_allowed><time_limit_action></time_limit_action></student_data><student_preference><audio /><language>en-US</language><speed /><text /></student_preference><interactions><_count>0</_count></interactions></cmi></sco></Root>', N'100', CAST(N'2020-02-17T11:57:41.233' AS DateTime))
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
SET IDENTITY_INSERT [dbo].[tblLoginLog] ON 

INSERT [dbo].[tblLoginLog] ([Id], [UserId], [LoginDate]) VALUES (1, 5, CAST(N'2020-02-17T14:17:40.937' AS DateTime))
INSERT [dbo].[tblLoginLog] ([Id], [UserId], [LoginDate]) VALUES (2, 8, CAST(N'2020-02-18T10:38:14.117' AS DateTime))
INSERT [dbo].[tblLoginLog] ([Id], [UserId], [LoginDate]) VALUES (3, 3, CAST(N'2020-02-10T11:44:45.987' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblLoginLog] OFF
SET IDENTITY_INSERT [dbo].[tblQuestion] ON 

INSERT [dbo].[tblQuestion] ([QuestionId], [QuizId], [QuestionTypeId], [QuestionText], [CorrectFeedback], [InCorrectFeedback], [isRandomOption]) VALUES (3177, 3075, 1, N'<p>Question 1<br></p>', N'', N'', 0)
INSERT [dbo].[tblQuestion] ([QuestionId], [QuizId], [QuestionTypeId], [QuestionText], [CorrectFeedback], [InCorrectFeedback], [isRandomOption]) VALUES (3178, 3075, 2, N'<p>Question 2<br></p>', N'<p>11111111111111 &amp; 2222222222222<br></p>', N'<p>33333333333333<br></p>', 0)
INSERT [dbo].[tblQuestion] ([QuestionId], [QuizId], [QuestionTypeId], [QuestionText], [CorrectFeedback], [InCorrectFeedback], [isRandomOption]) VALUES (3179, 3075, 1, N'<p>Question 3<br></p>', N'', N'', 0)
INSERT [dbo].[tblQuestion] ([QuestionId], [QuizId], [QuestionTypeId], [QuestionText], [CorrectFeedback], [InCorrectFeedback], [isRandomOption]) VALUES (3180, 3075, 1, N'<p>Question 4<br></p>', N'', N'', 0)
INSERT [dbo].[tblQuestion] ([QuestionId], [QuizId], [QuestionTypeId], [QuestionText], [CorrectFeedback], [InCorrectFeedback], [isRandomOption]) VALUES (3181, 3076, 2, N'<p>1111111111111<br></p>', N'', N'', 0)
INSERT [dbo].[tblQuestion] ([QuestionId], [QuizId], [QuestionTypeId], [QuestionText], [CorrectFeedback], [InCorrectFeedback], [isRandomOption]) VALUES (3183, 3078, 1, N'<p>43523452345<br></p>', N'', N'', 0)
INSERT [dbo].[tblQuestion] ([QuestionId], [QuizId], [QuestionTypeId], [QuestionText], [CorrectFeedback], [InCorrectFeedback], [isRandomOption]) VALUES (3196, 3079, 1, N'<div>PUM focusses on SMEs because...</div><div>Multiple answers are possible.</div>', N'', N'', 0)
INSERT [dbo].[tblQuestion] ([QuestionId], [QuizId], [QuestionTypeId], [QuestionText], [CorrectFeedback], [InCorrectFeedback], [isRandomOption]) VALUES (3198, 3080, 2, N'<p>Duration Testing<br></p>', N'', N'', 0)
INSERT [dbo].[tblQuestion] ([QuestionId], [QuizId], [QuestionTypeId], [QuestionText], [CorrectFeedback], [InCorrectFeedback], [isRandomOption]) VALUES (3200, 3081, 1, N'<p>Duration Testing1<br></p>', N'', N'', 0)
INSERT [dbo].[tblQuestion] ([QuestionId], [QuizId], [QuestionTypeId], [QuestionText], [CorrectFeedback], [InCorrectFeedback], [isRandomOption]) VALUES (3222, 3082, 2, N'<p>dfsadfasdf</p>', N'<p>dsfasfasd</p>', N'<p>fasdfasd</p>', 1)
INSERT [dbo].[tblQuestion] ([QuestionId], [QuizId], [QuestionTypeId], [QuestionText], [CorrectFeedback], [InCorrectFeedback], [isRandomOption]) VALUES (3223, 3082, 1, N'<span style="color: rgb(68, 68, 68); font-family: &quot;Ek Mukta&quot;, sans-serif; font-size: 16px;">सलग दुसऱ्यांदा आपनं साठपेक्षा अधिक जागा घेत बहुमतापेक्षा जवळपास दुप्पट जागा मिळवल्या आहेत</span>', N'', N'', 0)
INSERT [dbo].[tblQuestion] ([QuestionId], [QuizId], [QuestionTypeId], [QuestionText], [CorrectFeedback], [InCorrectFeedback], [isRandomOption]) VALUES (3224, 3082, 1, N'<p><span style="color: rgb(0, 0, 255); font-family: Monaco, Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace; white-space: pre;">ನನ್ನ ಹೆಸರು ಪಿನಾಲ್ ಆಗಿದೆ</span><br></p>', N'', N'', 0)
INSERT [dbo].[tblQuestion] ([QuestionId], [QuizId], [QuestionTypeId], [QuestionText], [CorrectFeedback], [InCorrectFeedback], [isRandomOption]) VALUES (3225, 3082, 1, N'<p>நீங்கள் எப்படி இருக்கிறீர்கள்<br></p>', N'', N'', 0)
INSERT [dbo].[tblQuestion] ([QuestionId], [QuizId], [QuestionTypeId], [QuestionText], [CorrectFeedback], [InCorrectFeedback], [isRandomOption]) VALUES (3246, 3068, 1, N'<p>111111111111</p>', N'', N'', 0)
INSERT [dbo].[tblQuestion] ([QuestionId], [QuizId], [QuestionTypeId], [QuestionText], [CorrectFeedback], [InCorrectFeedback], [isRandomOption]) VALUES (3247, 3068, 2, N'<p>2222222222</p>', N'<p>2222222222222222222</p>', N'<p>1111111111111111111</p>', 0)
INSERT [dbo].[tblQuestion] ([QuestionId], [QuizId], [QuestionTypeId], [QuestionText], [CorrectFeedback], [InCorrectFeedback], [isRandomOption]) VALUES (3248, 3068, 2, N'<p>333333333</p>', N'<p>33333333333</p>', N'<p>44444444</p>', 0)
INSERT [dbo].[tblQuestion] ([QuestionId], [QuizId], [QuestionTypeId], [QuestionText], [CorrectFeedback], [InCorrectFeedback], [isRandomOption]) VALUES (3249, 3068, 1, N'<p>999999999999</p>', N'', N'', 0)
INSERT [dbo].[tblQuestion] ([QuestionId], [QuizId], [QuestionTypeId], [QuestionText], [CorrectFeedback], [InCorrectFeedback], [isRandomOption]) VALUES (3250, 3068, 2, N'<p>Newly Added Question<br></p>', N'', N'', 1)
SET IDENTITY_INSERT [dbo].[tblQuestion] OFF
SET IDENTITY_INSERT [dbo].[tblQuestionOption] ON 

INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1336, 3177, N'111111111', 0, N'<p>1111<br></p>')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1337, 3177, N'2222222222', 1, N'<p>222222<br></p>')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1338, 3178, N'111111111', 1, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1339, 3178, N'222222222', 1, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1340, 3178, N'3333333333', 0, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1341, 3179, N'1111111111', 0, N'<p>11111111111<br></p>')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1342, 3179, N'222222222222', 1, N'<p>222222<br></p>')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1343, 3180, N'11111111', 0, N'<p>2222222222222<br></p>')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1344, 3180, N'333333333333', 0, N'<p>4444444444444<br></p>')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1345, 3180, N'44444444444', 1, N'<p>444444444444444<br></p>')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1346, 3181, N'111111111111', 0, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1347, 3181, N'22222222222222', 1, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1350, 3183, N'3452345', 0, N'<p>4352345<br></p>')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1351, 3183, N'23453452345', 1, N'<p>1412352345234<br></p>')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1380, 3196, N'ag', 0, N'<p>sdfs<br></p>')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1381, 3196, N'fasfas', 1, N'<p>asdfas<br></p>')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1384, 3198, N'Duration Testing1', 0, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1385, 3198, N'Duration Testing2', 1, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1386, 3200, N'Duration Testing11111', 1, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1387, 3200, N'Duration Testing2222', 0, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1428, 3222, N'sdfasd', 0, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1429, 3222, N'fasdfsda', 1, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1430, 3223, N'111', 1, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1431, 3223, N'2222', 0, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1432, 3224, N'3333', 0, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1433, 3224, N'44444', 1, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1434, 3225, N'Testing Tamil', 1, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1435, 3225, N'Testing Marathi', 0, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1493, 3246, N'Option1', 0, N'<p>11111</p>')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1494, 3246, N'Option2', 0, N'<p>22222222</p>')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1495, 3246, N'Option 3', 1, N'<p>33333333</p>')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1496, 3247, N'22222', 1, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1497, 3247, N'111111', 0, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1498, 3248, N'3333', 1, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1499, 3248, N'44444', 0, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1500, 3249, N'99999999999', 1, N'<p>9999999999999</p>')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1501, 3249, N'88888888888', 0, N'<p>88888888</p>')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1502, 3249, N'777777777777777', 0, N'<p>77777777777777</p>')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1503, 3250, N'Newly Added Option1', 0, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1504, 3250, N'Newly Added Option2', 1, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1505, 3250, N'Newly Added Option3', 0, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1506, 3250, N'Newly Added Option4', 0, N'')
INSERT [dbo].[tblQuestionOption] ([OptionId], [QuestionId], [OptionText], [CorrectOption], [OptionFeedback]) VALUES (1507, 3250, N'Newly Added Option5', 0, N'')
SET IDENTITY_INSERT [dbo].[tblQuestionOption] OFF
SET IDENTITY_INSERT [dbo].[tblQuestionType] ON 

INSERT [dbo].[tblQuestionType] ([QuestionTypeID], [QuestionTypeText]) VALUES (1, N'Single Select')
INSERT [dbo].[tblQuestionType] ([QuestionTypeID], [QuestionTypeText]) VALUES (2, N'Multiple Select')
SET IDENTITY_INSERT [dbo].[tblQuestionType] OFF
SET IDENTITY_INSERT [dbo].[tblQuiz] ON 

INSERT [dbo].[tblQuiz] ([QuizId], [QuizName], [QuizDescription], [TenantId], [DateCreated], [Duration]) VALUES (3068, N'Test ', N'Test Dinesh Desc Updated', 1, CAST(N'2020-01-26T19:31:42.920' AS DateTime), 10)
INSERT [dbo].[tblQuiz] ([QuizId], [QuizName], [QuizDescription], [TenantId], [DateCreated], [Duration]) VALUES (3075, N'New One for FireFox', N'New One for FireFox New One for FireFox', 1, CAST(N'2020-01-24T19:31:42.920' AS DateTime), 2)
INSERT [dbo].[tblQuiz] ([QuizId], [QuizName], [QuizDescription], [TenantId], [DateCreated], [Duration]) VALUES (3076, N'1111111111111', N'22222222222222222', 1, CAST(N'2020-01-26T19:31:42.920' AS DateTime), NULL)
INSERT [dbo].[tblQuiz] ([QuizId], [QuizName], [QuizDescription], [TenantId], [DateCreated], [Duration]) VALUES (3078, N'43253452345', N'4352352345', 1, CAST(N'2020-01-12T19:31:42.920' AS DateTime), NULL)
INSERT [dbo].[tblQuiz] ([QuizId], [QuizName], [QuizDescription], [TenantId], [DateCreated], [Duration]) VALUES (3079, N'new', N'rewe', 1, CAST(N'2019-01-11T19:31:42.920' AS DateTime), NULL)
INSERT [dbo].[tblQuiz] ([QuizId], [QuizName], [QuizDescription], [TenantId], [DateCreated], [Duration]) VALUES (3080, N'Duration Testing', N'Duration Testing desc', 1, CAST(N'2020-02-07T17:07:48.610' AS DateTime), 10)
INSERT [dbo].[tblQuiz] ([QuizId], [QuizName], [QuizDescription], [TenantId], [DateCreated], [Duration]) VALUES (3081, N'Duration Testing1222', N'Duration Testing1', 1, CAST(N'2020-02-07T17:07:48.610' AS DateTime), 11)
INSERT [dbo].[tblQuiz] ([QuizId], [QuizName], [QuizDescription], [TenantId], [DateCreated], [Duration]) VALUES (3082, N'Check Random', N'Check Random Description', 1, CAST(N'2020-02-07T18:03:08.570' AS DateTime), 10)
SET IDENTITY_INSERT [dbo].[tblQuiz] OFF
INSERT [dbo].[tblQuizAssignment] ([QuizId], [UserId], [DateAssigned], [DueDate]) VALUES (3068, 5, CAST(N'2019-12-27T19:31:42.920' AS DateTime), NULL)
INSERT [dbo].[tblQuizAssignment] ([QuizId], [UserId], [DateAssigned], [DueDate]) VALUES (3068, 8, CAST(N'2020-01-26T19:31:42.920' AS DateTime), NULL)
INSERT [dbo].[tblQuizAssignment] ([QuizId], [UserId], [DateAssigned], [DueDate]) VALUES (3075, 8, CAST(N'2020-01-24T19:31:42.920' AS DateTime), NULL)
INSERT [dbo].[tblQuizAssignment] ([QuizId], [UserId], [DateAssigned], [DueDate]) VALUES (3078, 8, CAST(N'2019-01-11T19:31:42.920' AS DateTime), NULL)
INSERT [dbo].[tblQuizAssignment] ([QuizId], [UserId], [DateAssigned], [DueDate]) VALUES (3082, 7, CAST(N'2020-02-12T13:43:55.770' AS DateTime), CAST(N'2020-02-27T00:00:00.000' AS DateTime))
INSERT [dbo].[tblQuizAssignment] ([QuizId], [UserId], [DateAssigned], [DueDate]) VALUES (3082, 8, CAST(N'2020-02-12T13:43:55.777' AS DateTime), CAST(N'2020-02-27T00:00:00.000' AS DateTime))
INSERT [dbo].[tblQuizAssignment] ([QuizId], [UserId], [DateAssigned], [DueDate]) VALUES (3082, 10, CAST(N'2020-02-12T13:43:55.820' AS DateTime), CAST(N'2020-02-27T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblQuizScore] ON 

INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3068, N'8', CAST(1 AS Numeric(18, 0)), CAST(N'2020-01-13T13:08:37.067' AS DateTime), 1, NULL, 1)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3068, N'8', CAST(0 AS Numeric(18, 0)), CAST(N'2020-01-16T13:32:33.313' AS DateTime), 2, NULL, 2)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3068, N'8', CAST(1 AS Numeric(18, 0)), CAST(N'2020-01-16T13:35:04.370' AS DateTime), 3, NULL, 3)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3068, N'8', CAST(0 AS Numeric(18, 0)), CAST(N'2020-01-16T13:36:06.073' AS DateTime), 4, NULL, 4)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3068, N'8', CAST(0 AS Numeric(18, 0)), CAST(N'2020-01-19T18:05:38.693' AS DateTime), 5, NULL, 5)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3068, N'8', CAST(0 AS Numeric(18, 0)), CAST(N'2020-01-19T19:57:27.280' AS DateTime), 7, NULL, 6)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3068, N'8', CAST(1 AS Numeric(18, 0)), CAST(N'2020-01-20T15:43:07.217' AS DateTime), 8, NULL, 8)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3075, N'8', CAST(0 AS Numeric(18, 0)), CAST(N'2020-02-07T16:28:14.397' AS DateTime), 1, NULL, 9)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3075, N'8', CAST(0 AS Numeric(18, 0)), CAST(N'2020-02-07T16:29:08.750' AS DateTime), 2, NULL, 10)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3075, N'8', CAST(1 AS Numeric(18, 0)), CAST(N'2020-02-07T16:30:30.367' AS DateTime), 3, NULL, 11)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3075, N'8', CAST(2 AS Numeric(18, 0)), CAST(N'2020-02-07T16:41:13.413' AS DateTime), 4, NULL, 12)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3082, N'8', CAST(1 AS Numeric(18, 0)), CAST(N'2020-02-07T19:45:28.420' AS DateTime), 1, NULL, 13)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3082, N'8', CAST(1 AS Numeric(18, 0)), CAST(N'2020-02-07T19:48:25.727' AS DateTime), 2, NULL, 14)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3082, N'8', CAST(0 AS Numeric(18, 0)), CAST(N'2020-02-07T19:54:15.877' AS DateTime), 3, NULL, 15)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3082, N'8', CAST(0 AS Numeric(18, 0)), CAST(N'2020-02-07T20:16:15.807' AS DateTime), 5, NULL, 16)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3082, N'8', CAST(0 AS Numeric(18, 0)), CAST(N'2020-02-09T19:16:35.170' AS DateTime), 6, NULL, 17)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3082, N'8', CAST(1 AS Numeric(18, 0)), CAST(N'2020-02-09T19:18:11.783' AS DateTime), 7, NULL, 18)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3075, N'8', CAST(1 AS Numeric(18, 0)), CAST(N'2020-02-10T19:13:34.423' AS DateTime), 5, NULL, 19)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3075, N'8', CAST(1 AS Numeric(18, 0)), CAST(N'2020-02-10T20:58:53.500' AS DateTime), 6, N'00:45', 20)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3075, N'8', CAST(1 AS Numeric(18, 0)), CAST(N'2020-02-10T22:18:26.573' AS DateTime), 9, N'00:41', 21)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3075, N'8', CAST(1 AS Numeric(18, 0)), CAST(N'2020-02-10T21:44:18.443' AS DateTime), 8, N'02:00', 23)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3075, N'8', CAST(1 AS Numeric(18, 0)), CAST(N'2020-02-11T11:42:14.533' AS DateTime), 11, N'00:11', 24)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3075, N'8', CAST(0 AS Numeric(18, 0)), CAST(N'2020-02-11T11:52:38.850' AS DateTime), 12, N'02:00', 25)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3082, N'8', CAST(0 AS Numeric(18, 0)), CAST(N'2020-02-07T20:01:28.463' AS DateTime), 4, NULL, 26)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3082, N'8', CAST(1 AS Numeric(18, 0)), CAST(N'2020-02-09T19:20:11.597' AS DateTime), 8, NULL, 27)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3075, N'8', CAST(1 AS Numeric(18, 0)), CAST(N'2020-02-10T22:37:41.810' AS DateTime), 10, N'00:07', 28)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3075, N'8', CAST(2 AS Numeric(18, 0)), CAST(N'2020-02-11T12:01:42.273' AS DateTime), 13, N'00:10', 29)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3075, N'8', CAST(1 AS Numeric(18, 0)), CAST(N'2020-02-11T12:15:17.567' AS DateTime), 14, N'00:09', 30)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3075, N'8', CAST(3 AS Numeric(18, 0)), CAST(N'2020-02-11T12:33:17.403' AS DateTime), 15, N'00:10', 31)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3075, N'8', CAST(0 AS Numeric(18, 0)), CAST(N'2020-02-11T13:43:30.503' AS DateTime), 16, N'01:36', 32)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3068, N'8', CAST(2 AS Numeric(18, 0)), CAST(N'2020-01-19T19:40:00.297' AS DateTime), 6, NULL, 33)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3075, N'5', CAST(1 AS Numeric(18, 0)), CAST(N'2020-02-13T15:31:51.337' AS DateTime), 1, N'02:00', 34)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3082, N'5', CAST(0 AS Numeric(18, 0)), CAST(N'2020-02-13T15:36:20.897' AS DateTime), 1, N'00:34', 35)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3082, N'8', CAST(3 AS Numeric(18, 0)), CAST(N'2020-02-13T15:44:37.850' AS DateTime), 9, N'00:11', 36)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3075, N'8', CAST(0 AS Numeric(18, 0)), CAST(N'2020-02-13T16:18:51.833' AS DateTime), 17, N'00:06', 37)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3082, N'8', CAST(1 AS Numeric(18, 0)), CAST(N'2020-02-15T16:17:15.833' AS DateTime), 10, N'00:16', 38)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3082, N'8', CAST(0 AS Numeric(18, 0)), CAST(N'2020-02-15T16:19:27.310' AS DateTime), 11, N'00:35', 39)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3082, N'8', CAST(1 AS Numeric(18, 0)), CAST(N'2020-02-15T21:36:16.390' AS DateTime), 12, N'02:04', 40)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3082, N'8', CAST(2 AS Numeric(18, 0)), CAST(N'2020-02-15T23:07:28.413' AS DateTime), 13, N'00:15', 41)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3082, N'8', CAST(0 AS Numeric(18, 0)), CAST(N'2020-02-16T11:01:40.670' AS DateTime), 14, N'00:03', 42)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3068, N'8', CAST(0 AS Numeric(18, 0)), CAST(N'2020-02-16T14:26:32.817' AS DateTime), 9, N'00:05', 43)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3068, N'8', CAST(0 AS Numeric(18, 0)), CAST(N'2020-02-16T15:23:59.250' AS DateTime), 10, N'00:04', 44)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3068, N'5', CAST(0 AS Numeric(18, 0)), CAST(N'2020-02-16T15:25:41.640' AS DateTime), 1, N'00:07', 45)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3068, N'8', CAST(2 AS Numeric(18, 0)), CAST(N'2020-02-16T18:52:25.447' AS DateTime), 11, N'00:17', 46)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3068, N'8', CAST(0 AS Numeric(18, 0)), CAST(N'2020-02-16T19:01:14.247' AS DateTime), 12, N'00:16', 47)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3068, N'8', CAST(1 AS Numeric(18, 0)), CAST(N'2020-02-16T19:01:46.740' AS DateTime), 13, N'00:52', 48)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3082, N'8', CAST(3 AS Numeric(18, 0)), CAST(N'2020-02-17T15:20:00.397' AS DateTime), 15, N'00:12', 49)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3082, N'8', CAST(0 AS Numeric(18, 0)), CAST(N'2020-02-17T15:51:49.930' AS DateTime), 16, N'00:02', 50)
INSERT [dbo].[tblQuizScore] ([QuizId], [UserId], [Score], [AttemptedDate], [Attempt], [completedTime], [ID]) VALUES (3082, N'8', CAST(0 AS Numeric(18, 0)), CAST(N'2020-02-17T16:03:22.023' AS DateTime), 17, N'00:03', 51)
SET IDENTITY_INSERT [dbo].[tblQuizScore] OFF
INSERT [dbo].[tblRatings] ([ActivityId], [UserId], [Attempt], [ActivityType], [Rating], [Comment], [TenantId], [CreatedDate]) VALUES (3068, 8, 1, N'Quiz', CAST(3.00 AS Numeric(18, 2)), N'aaaaaaa', 1, NULL)
INSERT [dbo].[tblRatings] ([ActivityId], [UserId], [Attempt], [ActivityType], [Rating], [Comment], [TenantId], [CreatedDate]) VALUES (3068, 8, 2, N'Quiz', CAST(4.00 AS Numeric(18, 2)), N'bbbbb', 1, NULL)
INSERT [dbo].[tblRatings] ([ActivityId], [UserId], [Attempt], [ActivityType], [Rating], [Comment], [TenantId], [CreatedDate]) VALUES (3082, 8, 8, N'Quiz', CAST(4.00 AS Numeric(18, 2)), N'Test Rating and Comments', 1, CAST(N'2020-02-09T19:20:30.997' AS DateTime))
INSERT [dbo].[tblRatings] ([ActivityId], [UserId], [Attempt], [ActivityType], [Rating], [Comment], [TenantId], [CreatedDate]) VALUES (3075, 8, 5, N'Quiz', CAST(4.00 AS Numeric(18, 2)), N'dfgasd fgasdgasd gasd gasdgasdgasdgasd', 1, CAST(N'2020-02-10T19:13:43.263' AS DateTime))
INSERT [dbo].[tblRatings] ([ActivityId], [UserId], [Attempt], [ActivityType], [Rating], [Comment], [TenantId], [CreatedDate]) VALUES (3075, 8, 11, N'Quiz', CAST(4.00 AS Numeric(18, 2)), N'New Review Testing', 1, CAST(N'2020-02-11T11:42:26.920' AS DateTime))
INSERT [dbo].[tblRatings] ([ActivityId], [UserId], [Attempt], [ActivityType], [Rating], [Comment], [TenantId], [CreatedDate]) VALUES (3075, 8, 12, N'Quiz', CAST(4.00 AS Numeric(18, 2)), NULL, 1, CAST(N'2020-02-11T12:00:21.567' AS DateTime))
INSERT [dbo].[tblRatings] ([ActivityId], [UserId], [Attempt], [ActivityType], [Rating], [Comment], [TenantId], [CreatedDate]) VALUES (3082, 8, 9, N'Quiz', CAST(4.00 AS Numeric(18, 2)), N'Vivek Testing', 1, CAST(N'2020-02-13T15:44:49.583' AS DateTime))
INSERT [dbo].[tblRatings] ([ActivityId], [UserId], [Attempt], [ActivityType], [Rating], [Comment], [TenantId], [CreatedDate]) VALUES (3075, 8, 17, N'Quiz', CAST(5.00 AS Numeric(18, 2)), NULL, 1, CAST(N'2020-02-13T16:18:58.357' AS DateTime))
INSERT [dbo].[tblRatings] ([ActivityId], [UserId], [Attempt], [ActivityType], [Rating], [Comment], [TenantId], [CreatedDate]) VALUES (3082, 8, 10, N'Quiz', CAST(5.00 AS Numeric(18, 2)), NULL, 1, CAST(N'2020-02-15T16:17:47.000' AS DateTime))
INSERT [dbo].[tblRatings] ([ActivityId], [UserId], [Attempt], [ActivityType], [Rating], [Comment], [TenantId], [CreatedDate]) VALUES (3068, 8, 9, N'Quiz', CAST(5.00 AS Numeric(18, 2)), NULL, 1, CAST(N'2020-02-16T14:26:36.137' AS DateTime))
INSERT [dbo].[tblRatings] ([ActivityId], [UserId], [Attempt], [ActivityType], [Rating], [Comment], [TenantId], [CreatedDate]) VALUES (3068, 8, 12, N'Quiz', CAST(5.00 AS Numeric(18, 2)), NULL, 1, CAST(N'2020-02-16T19:01:17.613' AS DateTime))
INSERT [dbo].[tblRatings] ([ActivityId], [UserId], [Attempt], [ActivityType], [Rating], [Comment], [TenantId], [CreatedDate]) VALUES (3068, 8, 13, N'Quiz', CAST(0.00 AS Numeric(18, 2)), NULL, 1, CAST(N'2020-02-16T19:01:48.113' AS DateTime))
INSERT [dbo].[tblRatings] ([ActivityId], [UserId], [Attempt], [ActivityType], [Rating], [Comment], [TenantId], [CreatedDate]) VALUES (3075, 8, 13, N'Quiz', CAST(5.00 AS Numeric(18, 2)), N'aaaaaaaaaaaaaaa', 1, CAST(N'2020-02-11T12:01:51.240' AS DateTime))
INSERT [dbo].[tblResetPassword] ([emailId], [token], [dateCreated], [isUsed]) VALUES (N'dgabhane@gmail.com', N'535a8f4a-b4de-4baa-897d-9d190779cc25', CAST(N'2020-01-10T19:16:22.363' AS DateTime), 1)
INSERT [dbo].[tblResetPassword] ([emailId], [token], [dateCreated], [isUsed]) VALUES (N'dinesh1@gmail.com', N'3c13d2eb-4c74-4263-94b7-a1020ed588ea', CAST(N'2020-01-21T12:50:47.217' AS DateTime), 0)
INSERT [dbo].[tblResetPassword] ([emailId], [token], [dateCreated], [isUsed]) VALUES (N'dinesh3@gmail.com', N'5ddccc80-7c5e-44b0-91c2-34859dd07663', CAST(N'2020-01-21T12:50:51.783' AS DateTime), 0)
INSERT [dbo].[tblResetPassword] ([emailId], [token], [dateCreated], [isUsed]) VALUES (N'dinesh5@gmail.com', N'7aee42e7-fdbb-4fbb-b761-667b1f907d83', CAST(N'2020-01-21T12:50:51.783' AS DateTime), 0)
INSERT [dbo].[tblResetPassword] ([emailId], [token], [dateCreated], [isUsed]) VALUES (N'dinesh101@gmail.com', N'02fc07f2-d9bc-44d2-9d5b-6d1e9d2b6ca8', CAST(N'2020-01-21T13:19:43.590' AS DateTime), 0)
INSERT [dbo].[tblResetPassword] ([emailId], [token], [dateCreated], [isUsed]) VALUES (N'Don1111@gmail.com', N'ba55842a-d016-496a-a56d-14ddf2b746d9', CAST(N'2020-01-28T18:21:32.040' AS DateTime), 0)
INSERT [dbo].[tblResetPassword] ([emailId], [token], [dateCreated], [isUsed]) VALUES (N'Don22222@gmail.com', N'efed9ca1-0969-4fe6-9f6b-56018b1c21a4', CAST(N'2020-01-28T18:21:44.400' AS DateTime), 0)
INSERT [dbo].[tblResetPassword] ([emailId], [token], [dateCreated], [isUsed]) VALUES (N'aaaaa@gmail.com', N'd2adf6d1-ce61-47b4-a289-cac4d313d175', CAST(N'2020-02-11T15:17:12.330' AS DateTime), 0)
INSERT [dbo].[tblResetPassword] ([emailId], [token], [dateCreated], [isUsed]) VALUES (N'dinesh8@gmail.com', N'e1df5d17-d3c6-440e-b599-4d0b8b0ee792', CAST(N'2020-02-12T18:39:02.103' AS DateTime), 0)
INSERT [dbo].[tblResetPassword] ([emailId], [token], [dateCreated], [isUsed]) VALUES (N'dinesh9@gmail.com', N'1841f4a1-6058-4251-9793-46641964bf33', CAST(N'2020-02-13T15:08:58.420' AS DateTime), 0)
INSERT [dbo].[tblResetPassword] ([emailId], [token], [dateCreated], [isUsed]) VALUES (N'dinesh10@gmail.com', N'857923b3-098e-4438-98cf-048355391471', CAST(N'2020-02-13T15:08:58.437' AS DateTime), 0)
INSERT [dbo].[tblResetPassword] ([emailId], [token], [dateCreated], [isUsed]) VALUES (N'dinesh12@gmail.com', N'bdb5c12d-0a1a-4a14-8cbc-7848f07089ba', CAST(N'2020-02-13T18:52:57.880' AS DateTime), 0)
INSERT [dbo].[tblResetPassword] ([emailId], [token], [dateCreated], [isUsed]) VALUES (N'dinesh11@gmail.com', N'c0950b47-d99f-4e52-9482-ae6755b51dfc', CAST(N'2020-02-13T18:52:57.900' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblResponses] ON 

INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1159, 3246, N'1495', N'', 8, 3068, CAST(N'2020-01-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1160, 3246, N'1494', N'', 8, 3068, CAST(N'2020-01-16T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1161, 3247, N'1496,1497', N'', 8, 3068, CAST(N'2020-01-16T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1162, 3248, N'1499', N'', 8, 3068, CAST(N'2020-01-16T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1163, 3246, N'1495', N'', 8, 3068, CAST(N'2020-01-16T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1164, 3247, N'1497', N'', 8, 3068, CAST(N'2020-01-16T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1165, 3248, N'1499', N'', 8, 3068, CAST(N'2020-01-16T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1166, 3246, N'1494', N'', 8, 3068, CAST(N'2020-01-16T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1167, 3247, N'1497', N'', 8, 3068, CAST(N'2020-01-16T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1168, 3248, N'1498,1499', N'', 8, 3068, CAST(N'2020-01-16T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1169, 3246, N'1494', N'', 8, 3068, CAST(N'2020-01-19T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1170, 3247, N'1497', N'', 8, 3068, CAST(N'2020-01-19T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1171, 3248, N'1498,1499', N'', 8, 3068, CAST(N'2020-01-19T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1177, 3246, N'1494', N'', 8, 3068, CAST(N'2020-01-19T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1178, 3247, N'1497', N'', 8, 3068, CAST(N'2020-01-19T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1179, 3248, N'1498', N'', 8, 3068, CAST(N'2020-01-19T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1180, 3249, N'1500', N'', 8, 3068, CAST(N'2020-01-19T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1185, 3246, N'1494', N'', 8, 3068, CAST(N'2020-01-19T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1186, 3247, N'1497', N'', 8, 3068, CAST(N'2020-01-19T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1187, 3248, N'1499', N'', 8, 3068, CAST(N'2020-01-19T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1188, 3249, N'1502', N'', 8, 3068, CAST(N'2020-01-19T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1193, 3246, N'1493', N'', 8, 3068, CAST(N'2020-01-20T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1194, 3247, N'1497', N'', 8, 3068, CAST(N'2020-01-20T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1195, 3248, N'1499', N'', 8, 3068, CAST(N'2020-01-20T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1196, 3249, N'1500', N'', 8, 3068, CAST(N'2020-01-20T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1197, 3177, N'1336', N'', 8, 3075, CAST(N'2020-02-07T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1198, 3178, N'1338', N'', 8, 3075, CAST(N'2020-02-07T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1199, 3179, N'1341', N'', 8, 3075, CAST(N'2020-02-07T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1200, 3180, N'1343', N'', 8, 3075, CAST(N'2020-02-07T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1201, 3177, N'1336', N'', 8, 3075, CAST(N'2020-02-07T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1202, 3178, N'1338,1339', N'', 8, 3075, CAST(N'2020-02-07T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1203, 3179, N'1341', N'', 8, 3075, CAST(N'2020-02-07T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1204, 3177, N'1336', N'', 8, 3075, CAST(N'2020-02-07T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1205, 3178, N'1338,1339', N'', 8, 3075, CAST(N'2020-02-07T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1206, 3179, N'1342', N'', 8, 3075, CAST(N'2020-02-07T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1207, 3205, N'1396', N'', 8, 3082, CAST(N'2020-02-07T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1208, 3222, N'1428,1429', N'', 8, 3082, CAST(N'2020-02-07T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1209, 3205, N'1396', N'', 8, 3082, CAST(N'2020-02-07T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1210, 3222, N'1428', N'', 8, 3082, CAST(N'2020-02-07T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1211, 3205, N'1393', N'', 8, 3082, CAST(N'2020-02-07T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1212, 3222, N'1428', N'', 8, 3082, CAST(N'2020-02-07T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1213, 3205, N'1393', N'', 8, 3082, CAST(N'2020-02-07T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1214, 3222, N'1428', N'', 8, 3082, CAST(N'2020-02-07T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1215, 3205, N'1393', N'', 8, 3082, CAST(N'2020-02-07T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1216, 3222, N'1428', N'', 8, 3082, CAST(N'2020-02-07T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1217, 3205, N'1393', N'', 8, 3082, CAST(N'2020-02-09T19:16:35.127' AS DateTime), 6)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1218, 3222, N'1429,1428', N'', 8, 3082, CAST(N'2020-02-09T19:16:35.147' AS DateTime), 6)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1219, 3205, N'1396', N'', 8, 3082, CAST(N'2020-02-09T19:18:11.780' AS DateTime), 7)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1220, 3222, N'1428', N'', 8, 3082, CAST(N'2020-02-09T19:18:11.780' AS DateTime), 7)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1221, 3205, N'1396', N'', 8, 3082, CAST(N'2020-02-09T19:20:11.590' AS DateTime), 8)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (1222, 3222, N'1428', N'', 8, 3082, CAST(N'2020-02-09T19:20:11.590' AS DateTime), 8)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2217, 3177, N'1336', N'', 8, 3075, CAST(N'2020-02-10T19:13:34.397' AS DateTime), 5)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2218, 3178, N'1338,1339', N'', 8, 3075, CAST(N'2020-02-10T19:13:34.410' AS DateTime), 5)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2219, 3179, N'1341', N'', 8, 3075, CAST(N'2020-02-10T19:13:34.410' AS DateTime), 5)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2220, 3180, N'1344', N'', 8, 3075, CAST(N'2020-02-10T19:13:34.410' AS DateTime), 5)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2221, 3177, N'1336', N'', 8, 3075, CAST(N'2020-02-10T20:58:45.627' AS DateTime), 6)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2222, 3178, N'1338,1339', N'', 8, 3075, CAST(N'2020-02-10T20:58:45.630' AS DateTime), 6)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2223, 3179, N'1341', N'', 8, 3075, CAST(N'2020-02-10T20:58:45.677' AS DateTime), 6)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2224, 3180, N'1344', N'', 8, 3075, CAST(N'2020-02-10T20:58:45.677' AS DateTime), 6)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2225, 3177, N'1336', N'', 8, 3075, CAST(N'2020-02-10T21:02:53.690' AS DateTime), 7)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2226, 3178, N'1338,1339', N'', 8, 3075, CAST(N'2020-02-10T21:02:53.690' AS DateTime), 7)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2227, 3179, N'1341', N'', 8, 3075, CAST(N'2020-02-10T21:02:53.690' AS DateTime), 7)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2228, 3180, N'1344', N'', 8, 3075, CAST(N'2020-02-10T21:02:53.693' AS DateTime), 7)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2229, 3177, N'1336', N'', 8, 3075, CAST(N'2020-02-10T21:44:17.453' AS DateTime), 8)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2230, 3178, N'1338,1339', N'', 8, 3075, CAST(N'2020-02-10T21:44:17.453' AS DateTime), 8)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2231, 3179, N'1341', N'', 8, 3075, CAST(N'2020-02-10T21:44:17.453' AS DateTime), 8)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2232, 3180, N'1344', N'', 8, 3075, CAST(N'2020-02-10T21:44:17.457' AS DateTime), 8)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2233, 3177, N'1336', N'', 8, 3075, CAST(N'2020-02-10T22:18:23.183' AS DateTime), 9)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2234, 3178, N'1338,1339', N'', 8, 3075, CAST(N'2020-02-10T22:18:23.200' AS DateTime), 9)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2235, 3179, N'1341', N'', 8, 3075, CAST(N'2020-02-10T22:18:23.203' AS DateTime), 9)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2236, 3180, N'1344', N'', 8, 3075, CAST(N'2020-02-10T22:18:23.207' AS DateTime), 9)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2237, 3177, N'1337', N'', 8, 3075, CAST(N'2020-02-10T22:37:41.757' AS DateTime), 10)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2238, 3177, N'1336', N'', 8, 3075, CAST(N'2020-02-11T11:42:14.523' AS DateTime), 11)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2239, 3178, N'1338,1339', N'', 8, 3075, CAST(N'2020-02-11T11:42:14.527' AS DateTime), 11)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2240, 3179, N'1341', N'', 8, 3075, CAST(N'2020-02-11T11:42:14.527' AS DateTime), 11)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2241, 3180, N'1344', N'', 8, 3075, CAST(N'2020-02-11T11:42:14.530' AS DateTime), 11)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2242, 3177, N'1336', N'', 8, 3075, CAST(N'2020-02-11T12:01:42.253' AS DateTime), 13)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2243, 3178, N'1338,1339', N'', 8, 3075, CAST(N'2020-02-11T12:01:42.263' AS DateTime), 13)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2244, 3179, N'1342', N'', 8, 3075, CAST(N'2020-02-11T12:01:42.263' AS DateTime), 13)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2245, 3180, N'1344', N'', 8, 3075, CAST(N'2020-02-11T12:01:42.267' AS DateTime), 13)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2246, 3177, N'1336', N'', 8, 3075, CAST(N'2020-02-11T12:15:17.547' AS DateTime), 14)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2247, 3178, N'1338,1339', N'', 8, 3075, CAST(N'2020-02-11T12:15:17.550' AS DateTime), 14)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2248, 3179, N'1341', N'', 8, 3075, CAST(N'2020-02-11T12:15:17.550' AS DateTime), 14)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2249, 3180, N'1344', N'', 8, 3075, CAST(N'2020-02-11T12:15:17.550' AS DateTime), 14)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2250, 3178, N'1338,1339', N'', 8, 3075, CAST(N'2020-02-11T12:33:17.397' AS DateTime), 15)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2251, 3179, N'1342', N'', 8, 3075, CAST(N'2020-02-11T12:33:17.400' AS DateTime), 15)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2252, 3180, N'1345', N'', 8, 3075, CAST(N'2020-02-11T12:33:17.400' AS DateTime), 15)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2257, 3177, N'1336', N'', 5, 3075, CAST(N'2020-02-13T15:31:51.300' AS DateTime), 1)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2258, 3178, N'1338,1339', N'', 5, 3075, CAST(N'2020-02-13T15:31:51.310' AS DateTime), 1)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2259, 3179, N'1341', N'', 5, 3075, CAST(N'2020-02-13T15:31:51.310' AS DateTime), 1)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2260, 3222, N'1429', N'', 8, 3082, CAST(N'2020-02-13T15:44:37.793' AS DateTime), 9)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2261, 3223, N'1430', N'', 8, 3082, CAST(N'2020-02-13T15:44:37.817' AS DateTime), 9)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2262, 3224, N'1432', N'', 8, 3082, CAST(N'2020-02-13T15:44:37.820' AS DateTime), 9)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2263, 3225, N'1434', N'', 8, 3082, CAST(N'2020-02-13T15:44:37.820' AS DateTime), 9)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2264, 3222, N'1428', N'', 8, 3082, CAST(N'2020-02-15T16:17:15.780' AS DateTime), 10)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2265, 3224, N'1432', N'', 8, 3082, CAST(N'2020-02-15T16:17:15.793' AS DateTime), 10)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2266, 3225, N'1434', N'', 8, 3082, CAST(N'2020-02-15T16:17:15.793' AS DateTime), 10)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2267, 3222, N'1428', N'', 8, 3082, CAST(N'2020-02-15T21:36:16.260' AS DateTime), 12)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2268, 3223, N'1431', N'', 8, 3082, CAST(N'2020-02-15T21:36:16.287' AS DateTime), 12)
GO
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2269, 3224, N'1433', N'', 8, 3082, CAST(N'2020-02-15T21:36:16.313' AS DateTime), 12)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2270, 3225, N'1435', N'', 8, 3082, CAST(N'2020-02-15T21:36:16.313' AS DateTime), 12)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2271, 3222, N'1429', N'', 8, 3082, CAST(N'2020-02-15T23:07:28.387' AS DateTime), 13)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2272, 3223, N'1431', N'', 8, 3082, CAST(N'2020-02-15T23:07:28.390' AS DateTime), 13)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2273, 3224, N'1433', N'', 8, 3082, CAST(N'2020-02-15T23:07:28.390' AS DateTime), 13)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2274, 3225, N'1435', N'', 8, 3082, CAST(N'2020-02-15T23:07:28.393' AS DateTime), 13)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2275, 3246, N'1493', N'', 8, 3068, CAST(N'2020-02-16T18:52:25.413' AS DateTime), 11)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2276, 3247, N'1496', N'', 8, 3068, CAST(N'2020-02-16T18:52:25.427' AS DateTime), 11)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2277, 3248, N'1498', N'', 8, 3068, CAST(N'2020-02-16T18:52:25.427' AS DateTime), 11)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2278, 3249, N'1501', N'', 8, 3068, CAST(N'2020-02-16T18:52:25.430' AS DateTime), 11)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2279, 3250, N'1507', N'', 8, 3068, CAST(N'2020-02-16T18:52:25.430' AS DateTime), 11)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2280, 3246, N'1493', N'', 8, 3068, CAST(N'2020-02-16T19:01:14.243' AS DateTime), 12)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2281, 3246, N'1495', N'', 8, 3068, CAST(N'2020-02-16T19:01:46.727' AS DateTime), 13)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2282, 3222, N'1429', N'', 8, 3082, CAST(N'2020-02-17T15:20:00.370' AS DateTime), 15)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2283, 3223, N'1430', N'', 8, 3082, CAST(N'2020-02-17T15:20:00.380' AS DateTime), 15)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2284, 3224, N'1432', N'', 8, 3082, CAST(N'2020-02-17T15:20:00.383' AS DateTime), 15)
INSERT [dbo].[tblResponses] ([ResponseId], [QuestionId], [OptionIds], [QuestionFeedback], [UserId], [QuizId], [DateCreated], [Attempt]) VALUES (2285, 3225, N'1434', N'', 8, 3082, CAST(N'2020-02-17T15:20:00.387' AS DateTime), 15)
SET IDENTITY_INSERT [dbo].[tblResponses] OFF
SET IDENTITY_INSERT [dbo].[tblTenant] ON 

INSERT [dbo].[tblTenant] ([tenantId], [tenantName], [tenantDomain], [activationFrom], [activationTo], [isActive], [createdBy], [createdOn], [noOfUserAllowed], [Logo]) VALUES (1, N'qqqq', N'http://qqqq.localhost', CAST(N'2019-10-10' AS Date), CAST(N'2020-10-10' AS Date), 1, 1, CAST(N'2019-11-20' AS Date), 11, NULL)
INSERT [dbo].[tblTenant] ([tenantId], [tenantName], [tenantDomain], [activationFrom], [activationTo], [isActive], [createdBy], [createdOn], [noOfUserAllowed], [Logo]) VALUES (2, N'Dinesh', N'http://Dinesh.LMS.Com.localhost', CAST(N'2019-10-10' AS Date), CAST(N'2020-10-10' AS Date), 1, 1, CAST(N'2019-12-17' AS Date), 100, NULL)
INSERT [dbo].[tblTenant] ([tenantId], [tenantName], [tenantDomain], [activationFrom], [activationTo], [isActive], [createdBy], [createdOn], [noOfUserAllowed], [Logo]) VALUES (3, N'Dinesh', N'Dinesh', CAST(N'2019-12-30' AS Date), CAST(N'2019-12-31' AS Date), 1, 1, CAST(N'2019-12-30' AS Date), 100, N'http://localhost:61705\assets\Logo\Dinesh.jpg')
SET IDENTITY_INSERT [dbo].[tblTenant] OFF
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId], [isNew], [profileImage]) VALUES (3, N'Omkar', N'Sulekar', N'OmkarS@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', CAST(N'1993-03-10' AS Date), N'1234567890', 1, 1, CAST(N'2019-11-23T00:00:00.000' AS DateTime), 1, 1, 0, NULL)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId], [isNew], [profileImage]) VALUES (5, N'Dinesh', N'Gabhane', N'dgabhane@gmail.com', N'5a440b76c06eb46c02725764ee54e00e', NULL, N'1234567890', 1, 5, CAST(N'2020-02-13T15:38:45.760' AS DateTime), 1, 2, 0, N'http://localhost:61705\assets\ProfileImages\1\5.jpg')
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId], [isNew], [profileImage]) VALUES (6, N'mmm', N'ddd', N'ddd@gmail.com', N'123123', CAST(N'2019-12-26' AS Date), NULL, 1, 5, CAST(N'2020-01-13T00:00:00.000' AS DateTime), 1, 3, NULL, NULL)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId], [isNew], [profileImage]) VALUES (7, N'new', N'ddd', N'new@gmail.com', N'P@ssw0rd', CAST(N'2019-12-11' AS Date), N'1234567890', 0, 5, CAST(N'2019-11-29T00:00:00.000' AS DateTime), 1, 3, NULL, NULL)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId], [isNew], [profileImage]) VALUES (8, N'Don', N'Don2', N'Don@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', CAST(N'1981-04-13' AS Date), N'1234567890', 1, 8, CAST(N'2020-02-10T00:00:00.000' AS DateTime), 1, 3, 0, N'http://localhost:61705\assets\ProfileImages\1\8.jpg')
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId], [isNew], [profileImage]) VALUES (9, N'Don111', N'ddd', N'Don111@gmail.com', N'123123', CAST(N'2019-11-07' AS Date), N'1234567890', 0, 5, CAST(N'2019-11-29T00:00:00.000' AS DateTime), 1, 3, NULL, NULL)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId], [isNew], [profileImage]) VALUES (10, N'Don3', N'Don3', N'Don3@gmail.com', N'123123', CAST(N'2019-11-25' AS Date), N'1234567890', 1, 5, CAST(N'2019-11-29T00:00:00.000' AS DateTime), 1, 3, NULL, NULL)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId], [isNew], [profileImage]) VALUES (1034, N'Dinesh1', N'Gabhane1', N'dinesh1@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL, N'1234567890', 1, 5, CAST(N'2020-01-21T00:00:00.000' AS DateTime), 1, 3, 1, NULL)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId], [isNew], [profileImage]) VALUES (1035, N'Dinesh3', N'', N'dinesh3@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL, N'', 1, 5, CAST(N'2020-01-21T00:00:00.000' AS DateTime), 1, 3, 1, NULL)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId], [isNew], [profileImage]) VALUES (1036, N'Dinesh5', N'', N'dinesh5@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL, N'', 1, 5, CAST(N'2020-01-21T00:00:00.000' AS DateTime), 1, 3, 1, NULL)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId], [isNew], [profileImage]) VALUES (1037, N'Dinesh101', N'Gabhane101', N'dinesh101@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, 1, 5, CAST(N'2020-01-21T00:00:00.000' AS DateTime), 1, 3, 1, NULL)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId], [isNew], [profileImage]) VALUES (1038, N'aaaaa', N'b', N'aaaaa@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', CAST(N'2020-02-17' AS Date), N'1231231234', 1, 5, CAST(N'2020-02-11T15:39:37.280' AS DateTime), 1, 3, 1, NULL)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId], [isNew], [profileImage]) VALUES (1039, N'Dinesh8', N'Gabhane8', N'dinesh8@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL, N'2222222222', 1, 5, CAST(N'2020-02-12T18:39:02.097' AS DateTime), 1, 3, 1, NULL)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId], [isNew], [profileImage]) VALUES (1040, N'Dinesh9', N'Gabhane9', N'dinesh9@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL, N'2222222222', 1, 5, CAST(N'2020-02-13T15:08:58.410' AS DateTime), 1, 3, 1, NULL)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId], [isNew], [profileImage]) VALUES (1041, N'Dinesh10', N'Gabhane10', N'dinesh10@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL, N'2222222222', 1, 5, CAST(N'2020-02-13T15:08:58.410' AS DateTime), 1, 3, 1, NULL)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId], [isNew], [profileImage]) VALUES (1042, N'Dinesh12', N'Gabhane12', N'dinesh12@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL, N'2222222222', 1, 5, CAST(N'2020-02-13T18:52:57.873' AS DateTime), 1, 3, 1, NULL)
INSERT [dbo].[tblUser] ([userId], [firstName], [lastName], [emailId], [password], [DOB], [contactNo], [isActive], [createdBy], [createdOn], [tenantId], [roleId], [isNew], [profileImage]) VALUES (1043, N'Dinesh11', N'Gabhane11', N'dinesh11@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL, N'2222222222', 1, 5, CAST(N'2020-02-13T18:52:57.873' AS DateTime), 1, 3, 1, NULL)
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
/****** Object:  StoredProcedure [dbo].[CourseUpdate]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllQuiz]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetUserContentModule]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--***************************************************************************************************************
            
CREATE PROCEDURE [dbo].[GetUserContentModule]      
@LearnerId   varchar(50),
@CurriculumId varchar(50)
AS              
BEGIN              
 SET NOCOUNT ON;              
               
   select tlaa.ActivityId,tcmg.ContentModuleName,tcmg.ContentModuleDescription,tlcmt.ContentTrackId,
  tlcmt.CompletionStatus,tlcmt.DateOfCompletion,tlcmt.DateOfStart,tlcmt.NoOfPagesCompleted,
  tlcmt.TotalNoOfPages, tlcmt.Score, tlcmt.PassFailStatus
   from tblLearnerActivityAssignment tlaa
  inner join tblCourse tcmg on tlaa.ActivityId=tcmg.ContentModuleId and tcmg.IsActive='True'
  
  left join tblLearnerContentModTracking tlcmt on tlcmt.ContentModuleId=tcmg.ContentModuleId and tlcmt.LearnerId=tlaa.LearnerId
  where tlaa.LearnerId=@LearnerId
  
         
             
END
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[procGenerateLog]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[procGenerateLog]      
    @LearnerId VARCHAR(100) = NULL,      
    @ContentModuleId NVARCHAR(100) = NULL,
    @CompletionStatus NVARCHAR(100) = NULL,      
    @DateOfStart DATETIME = NULL,      
    @DateOfCompletion DATETIME = NULL,      
    @TotalNoOfPages INT = NULL,      
    @NoOfPagesCompleted INT = NULL,      
    @Score INT = NULL,
    @UserDataXML nvarchar(MAX) = NULL
        
          
AS  
		insert into tblLearnerContentModTrackingLog
		( 
			LearnerId,      
			ContentModuleId,
			CompletionStatus,      
			DateOfStart,      
			DateOfCompletion,      
			TotalNoOfPages,      
			NoOfPagesCompleted,  	
			Score,      
			UserDataXML,
			LogDate
		)
		values
		(
			@LearnerId,      
			@ContentModuleId,
			@CompletionStatus,      
			@DateOfStart,      
			@DateOfCompletion,      
			@TotalNoOfPages,      
			@NoOfPagesCompleted,      
			@Score,
			@UserDataXML,
			Getdate()
		)
GO
/****** Object:  StoredProcedure [dbo].[procGetActivityDetails]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[procGetActivityDetails]  
    @LearnerId VARCHAR(100) = NULL,  
    @ActivityId VARCHAR(100) = NULL  
AS   
begin
  declare @msg VARCHAR(100);
  declare @retLearnerId VARCHAR(100);
  declare @retActivityId VARCHAR(100);
  declare @retContentTrackId VARCHAR(100);
  declare @retCompletionStatus VARCHAR(100);
  declare @retScore VARCHAR(100);
  declare @retPassFailStatus VARCHAR(100);
  -- Check if learner is valid
  if exists(Select * from tblUser where UserId = @LearnerId) --@LearnerId
  begin
	Select @retLearnerId = UserId from tblUser where UserId = @LearnerId
	
	-- Check if activity is valid
	if exists(Select * from tblLearnerActivityAssignment where LearnerId = @LearnerId and ActivityId = @ActivityId )
	begin
		Select @retActivityId = ActivityId from tblLearnerActivityAssignment where LearnerId = @LearnerId and ActivityId = @ActivityId 
		set @msg = 'success'		
		
		-- Get ContentTrackId if available
		if exists(Select * from tblLearnerContentModTracking where LearnerId = @LearnerId and ContentModuleId = @ActivityId )
		begin
			Select @retContentTrackId = ContentTrackId, @retCompletionStatus = CompletionStatus from tblLearnerContentModTracking where LearnerId = @LearnerId and ContentModuleId = @ActivityId
		end
		else
		begin
			set @retCompletionStatus = 'Not Started'
		end	
	end
	else
	begin
		set @msg = 'Invalid Assignment' 
	end
  end
  else
  begin 
	set @msg = 'Invalid LearnerId'
  end
  
  
  select	@msg as 'message', 
			@retLearnerId as LearnerId, 
			@retActivityId as ActivityId, 
			@retCompletionStatus as CompletionStatus,  
			@retCompletionStatus as CompletionStatus, 
			@retContentTrackId as ContentTrackId 
end
GO
/****** Object:  StoredProcedure [dbo].[procGetScormDetails]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--procGetScormDetails 4
CREATE PROC [dbo].[procGetScormDetails]      
    @ContentModuleId VARCHAR(100)    
AS 
Begin      
SELECT [ContentModuleId],       
 'ContentModules/' + cast([ContentModuleId] as varchar) +'/' as PointToURL,      
  CAST(1 AS BIT) as ScoreTracking,        
   CAST(0 AS BIT) as IsCourseSessionNoExpiry,  
   CAST(0 AS BIT) as [IsShortLanguageCode],      
 '' as ImanifestUrl,  
  'Scorm12' as ContentModuleTypeId,
 CAST(0 AS BIT) as IsAssessment, 
 CAST(0 AS BIT) as IsMiddlePage,
 ContentModuleName as ContentModuleEnglishName

FROM dbo.tblCourse  
WHERE  [ContentModuleId] = @ContentModuleId  

End
GO
/****** Object:  StoredProcedure [dbo].[procGetUserDetails]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[procGetUserDetails]  
    @SystemUserGUID VARCHAR(100)      
AS   
SET NOCOUNT ON  
BEGIN  
select UserId,        
            LastName,        
            [FirstName],        
            [LastName],        
            'en-US' LanguageId       
              from tblUser where UserId=@SystemUserGUID
END
GO
/****** Object:  StoredProcedure [dbo].[procScormTrackingDetails]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[procScormTrackingDetails]  
    @AttemptId VARCHAR(100) = NULL,  
    @ContentModuleId VARCHAR(100) = NULL,  
    @SystemUserGUID VARCHAR(100) = NULL,  
    @SessionId VARCHAR(100) = NULL  
AS   
    BEGIN  
        SET NOCOUNT ON  
  
            BEGIN   
                SELECT  ContentTrackId as AttemptId,  
                        [ContentModuleId],  
                         ContentModuleName as ActivityName,  
                         LearnerId as SystemUserGUID,  
                         '' as UserFirstLastName,  
                        [DateOfStart],  
                        [DateOfCompletion],  
                        [TotalNoOfPages],  
                        [NoOfPagesCompleted],  
                        [CompletionStatus],  
                        UserDataXML,  
                        Score,  
                        '' as RegionViewInfo,  
                         '' as MarkedCompletedById,  
                         '' as [ReviewerComments],  
                         '' as [scannedcertificationFileName],  
                        cast(0 as bit) [IsForAdminPreview]  
                FROM    tblLearnerContentModTracking  
                WHERE   ContentModuleId = @ContentModuleId  
                        AND LearnerId = @SystemUserGUID  
            END   
        SET NOCOUNT OFF  
  
    END
GO
/****** Object:  StoredProcedure [dbo].[procUpdateTracking]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[procUpdateTracking]      
    @ContentTrackId VARCHAR(100),      
    @LearnerId VARCHAR(100),      
    @ContentModuleId NVARCHAR(100),
    @CompletionStatus NVARCHAR(100) = NULL,      
    @DateOfStart DATETIME = NULL,      
    @DateOfCompletion DATETIME = NULL,      
    @TotalNoOfPages INT = NULL,      
    @NoOfPagesCompleted INT = NULL,      
    @Score INT = NULL,
    @UserDataXML nvarchar(MAX)
        
          
AS  
	 
    SET NOCOUNT ON      
    DECLARE @ActivityName Varchar(100)
	declare @PassFailStatus VARCHAR(100);    
    DECLARE @MasteryScore smallint;
	set @PassFailStatus = ''
    
    SELECT  @ActivityName = ContentModuleName,  @MasteryScore = MasteryScore
    FROM    tblCourse
    WHERE   ContentModuleId = @ContentModuleId
	
	if(@Score is null) -- if score is not recieved from the course
	begin
		set @PassFailStatus = null
	end
	else -- if score is recieved from the course
	begin
		if ( @Score >= Isnull(@MasteryScore,80)) 
			set @PassFailStatus = 'Passed'
		else
			set @PassFailStatus = 'Failed'
	end

	
	if exists(Select * from tblLearnerContentModTracking where LearnerId = @LearnerId and ContentModuleId = @ContentModuleId )
	begin 
		update tblLearnerContentModTracking 
		set 
		CompletionStatus = @CompletionStatus,
		DateOfCompletion = @DateOfCompletion,
		TotalNoOfPages = @TotalNoOfPages,
		NoOfPagesCompleted = @NoOfPagesCompleted,
		PassFailStatus = @PassFailStatus,
		UserDataXML = @UserDataXML,
		Score = @Score
		
		where LearnerId = @LearnerId and ContentModuleId = @ContentModuleId and CompletionStatus <> 'Completed'
	end 
	else
	begin
		insert into tblLearnerContentModTracking
		(
			ContentTrackId,      
			LearnerId,      
			ContentModuleId,
			CompletionStatus,      
			DateOfStart,      
			DateOfCompletion,      
			TotalNoOfPages,      
			NoOfPagesCompleted,      
			ContentModuleName,      
			Score,      
			PassFailStatus,      
			UserDataXML
		)
		values
		(
			@ContentTrackId,      
			@LearnerId,      
			@ContentModuleId,
			@CompletionStatus,      
			IsNull(@DateOfStart, GetDate()),      
			case when @CompletionStatus = 'Completed' then IsNull(@DateOfCompletion, GetDate()) else null end ,     
			@TotalNoOfPages,      
			@NoOfPagesCompleted,
			@ActivityName,
			@Score,
			@PassFailStatus,
			@UserDataXML
		)
	end
    
    
    Select 'Success'
    
    
    SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_AddEmail]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name				Reason
001		Omkar Sulekar		To write error log

*/
CREATE PROCEDURE [dbo].[sp_AddEmail]
@EmailTo nvarchar(100),  
@EmailSubject nvarchar(250),  
@EmailBody ntext  

 
AS
BEGIN	
		INSERT INTO tblEmails  
		(  
			EmailTo ,  
			EmailSubject,   
			EmailBody,  
			DateCreated,  
			isSent,
			DateSent,
			SentStatus
			)  
			VALUES
			( 
			@EmailTo,  
			@EmailSubject,  
			@EmailBody,  
			getdate(),
			0,
			NULL,
			NULL
		)
		 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddError]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AddLoginLog]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name				Reason
001		Dinesh		To write Login log

*/
CREATE PROCEDURE [dbo].[sp_AddLoginLog]
@userId int
AS
BEGIN	
		IF NOT EXISTS(select Id from tblLoginLog where UserId=@userId)
		begin
				INSERT INTO tblLoginLog  
				(  
					UserId,  		
					LoginDate
				)  
				VALUES
				( 
					@userId,
					getdate()
				)
		end
		ELSE
		begin
			update tblLoginLog set LoginDate=getdate() where UserId=@userId

		end
		 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddToken]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AdminDashboardCounts]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to Edit Course data

*/

CREATE PROCEDURE [dbo].[sp_AdminDashboardCounts]	
	@TenantId INT

AS
BEGIN	
	SET NOCOUNT ON;

	create table #Temp
	(
		TotalUserCount int, 
		ActiveUserCount int,
		TotalQuizCount int,
		TotalCourseCount int,
		TotalHighScoreQuizUserCount int,
		TotalHighScoreCourseUserCount int
		
	)

	create table #Temp1
	(
		TotalUserCount int	
	)

	create table #Temp2
	(
		TotalUserCount int		
	)

	begin
	 Insert Into #Temp1
		SELECT max(score) as TotalUserCount  FROM tblQuizScore as a 
		inner join tblQuiz as b on a.QuizId=b.QuizId where b.TenantId = @TenantId  group by a.quizid
	end

	begin
	 Insert Into #Temp2
		  select max(score) from tblLearnerContentModTracking as a inner join tblCourse as b
		  on a.ContentModuleId=b.ContentModuleId where b.TenantId=@TenantId and a.score is not null  group by a.ContentModuleId
	end


	begin
	Insert Into #Temp
		
		select count(*) as TotalUserCount,
		(select count(*) from tblUser where isActive=1 and  tenantId=@TenantId and roleId!=1 ) as ActiveUserCount,
		(select count(*) from tblQuiz where tenantId=@TenantId ) as TotalQuizCount,
		(select count(*) from tblCourse where tenantId=@TenantId ) as TotalCourseCount,
		(select count(*) from #Temp1) as TotalHighScoreQuizUserCount,
		(select count(*) from #Temp2) as TotalHighScoreCourseUserCount
		from tblUser	where tenantId=@TenantId and roleId!=1


	end
	
		select  * from #Temp 

	

	If(OBJECT_ID('tempdb..#Temp') Is Not Null)
	Begin
		Drop Table #Temp
	End



END
GO
/****** Object:  StoredProcedure [dbo].[sp_AdminDashboardList]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to Edit Course data

*/

CREATE PROCEDURE [dbo].[sp_AdminDashboardList]	
	@TenantId INT

AS
BEGIN	
	SET NOCOUNT ON;

	create table #Temp
	(
		ActivityId int, 
		ActivityName nvarchar(500), 
		ActivityType nvarchar(50), 
		ActivityDescription ntext,
		ActivityDuration nvarchar(50),
		ActivityCreationDate nvarchar(50),
		ActivityAssignedUsers int 
		
	)
	begin
	Insert Into #Temp
		select a.QuizId as activityId, a.QuizName as activityName, 'Quiz' as activityType,
		a.QuizDescription as ActivityDescription,
		a.Duration as activityDuration, a.DateCreated as ActivityCreationDate,
		(select count(*) from tblQuizAssignment where QuizId=a.QuizId) as ActivityAssignedUsers		
		from tblQuiz as a where a.TenantId=@TenantId

		union

		select a.ContentModuleId as  activityId, a.ContentModuleName as activityName, 'Course' as activityType,
		a.ContentModuleDescription as ActivityDescription,a.Duration as activityDuration, a.CreatedOn as ActivityCreationDate,
		(select count(*) from tblLearnerActivityAssignment where ActivityId=a.ContentModuleId) as ActivityAssignedUsers	

		from tblCourse as a where a.TenantId=@TenantId


	end

	
		select  * from #Temp order by ActivityCreationDate desc

	

	If(OBJECT_ID('tempdb..#Temp') Is Not Null)
	Begin
		Drop Table #Temp
	End



END
GO
/****** Object:  StoredProcedure [dbo].[sp_AdminUserReport]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to Edit Course data

*/

CREATE PROCEDURE [dbo].[sp_AdminUserReport]	
	@TenantId INT,
	@isActive bit

AS
BEGIN	
	SET NOCOUNT ON;
	if @isActive=1
	begin
		--select a.UserId, (a.firstName + ' ' + a.lastName) as FullName, 
		--a.emailId, a.contactNo, a.isActive, a.createdOn,
		--NULL as LastLogin, (select count(*) from tblQuizAssignment where UserId=a.userId) as assigned
		--from tblUser as a where a.tenantId=@TenantId and a.roleId!=1 and a.isActive=1

		select a.UserId, (a.firstName + ' ' + a.lastName) as FullName, 
		a.emailId, a.contactNo, a.isActive, a.createdOn,
		NULL as LastLogin, (select count(*) from tblQuizAssignment where UserId=a.userId) + 
		(select count(*) from tblLearnerActivityAssignment where LearnerId=a.userId) as assigned
		from tblUser as a where a.tenantId=@TenantId and a.roleId!=1 and a.isActive=1
	end

	if @isActive=0
	begin
		select a.UserId, (a.firstName + ' ' + a.lastName) as FullName, 
		a.emailId, a.contactNo, a.isActive, a.createdOn,
		NULL as LastLogin, (select count(*) from tblQuizAssignment where UserId=a.userId) +
		(select count(*) from tblLearnerActivityAssignment where LearnerId=a.userId) as assigned
		from tblUser as a where a.tenantId=@TenantId and a.roleId!=1
	end

END
GO
/****** Object:  StoredProcedure [dbo].[sp_AssignmentAndTrackingActivateDeactivate]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AssignmentAndTrackingGetAllInactive]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CourseActivateDeactivate]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CourseAdd]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to add new course

*/

CREATE PROCEDURE [dbo].[sp_CourseAdd]
	@ContentModuleName NVARCHAR(50),
	@ContentModuleDescription NVARCHAR(50) = NULL,
	@ContentModuleURL NVARCHAR(50),
	@ContentModuleType NVARCHAR(50),
	@MasteryScore INT = NULL,
	@Duration INT = NULL,
	@createdBy INT,
	@tenantId INT,	
	@ContentModuleId INT OUTPUT

AS
BEGIN	
		
		SET NOCOUNT ON;
		IF NOT EXISTS (SELECT ContentModuleId FROM tblCourse WHERE ContentModuleName=@ContentModuleName)
		BEGIN
		declare @CourseId int = (select top 1 [ContentModuleId] from tblCourse order by createdOn desc)
		set @CourseId=@CourseId+1;
				INSERT INTO [dbo].[tblCourse]
							([ContentModuleId]
							,[ContentModuleName]
							,[ContentModuleDescription]
							,[ContentModuleURL]
							,[ContentModuleType]
							,[IsActive]
							,[MasteryScore]
							,[createdBy]
							,[createdOn]
							,[tenantId]
							,[Duration])
				VALUES
							(@CourseId
							,@ContentModuleName
							,@ContentModuleDescription
							,@ContentModuleURL
							,@ContentModuleType
							,1
							,@MasteryScore
							,@createdBy
							,getdate()
							,@tenantId
							,@Duration)

				--SET @ContentModuleId=SCOPE_IDENTITY()
				set @ContentModuleId=@CourseId

				DECLARE @UserId int
				DECLARE cur_emp CURSOR
				STATIC FOR 
				SELECT UserId from tblUser where roleId=2 and tenantId=@tenantId
				OPEN cur_emp
				IF @@CURSOR_ROWS > 0
				 BEGIN 
				 FETCH NEXT FROM cur_emp INTO @UserId
				 WHILE @@Fetch_status = 0
				 BEGIN
					
					insert into [dbo].[tblLearnerActivityAssignment] values(@UserId,@CourseId,getdate(),NULL,NULL)
							
				 FETCH NEXT FROM cur_emp INTO @UserId
				 END
				END
				CLOSE cur_emp
				DEALLOCATE cur_emp



		END
		ELSE
		BEGIN
			 SET @ContentModuleId=0
		END
		RETURN @ContentModuleId
END

GO
/****** Object:  StoredProcedure [dbo].[sp_CourseAssign]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to add new course

*/

CREATE PROCEDURE [dbo].[sp_CourseAssign]
	
	@UserId nvarchar(100),
	@ActivityId nvarchar(100),
	@DueDate datetime

AS
BEGIN	
		
		SET NOCOUNT ON;
		
		BEGIN
				INSERT INTO [dbo].[tblLearnerActivityAssignment]
							([LearnerId]
							,[ActivityId]
							,[AssignmentDate]
							,[AssignmentType]
							,[DueDate])
				VALUES
							(@UserId
							,@ActivityId
							,getdate()
							,'Course'
							,@DueDate)
				
		END
		
		
END

GO
/****** Object:  StoredProcedure [dbo].[sp_CourseGetById]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to Get Course data by specifeid Id

*/
CREATE PROCEDURE [dbo].[sp_CourseGetById]
	@ContentModuleId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT		* FROM tblCourse WHERE		ContentModuleId=@ContentModuleId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CoursesGet]    Script Date: 2/19/2020 11:54:58 AM ******/
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

    SELECT ContentModuleId, ContentModuleName,ContentModuleDescription,ContentModuleURL,ContentModuleType,IsActive,
	MasteryScore,CreatedBy,CreatedOn,TenantId,ISNULL(Duration,0) as Duration
	from tblCourse WHERE tenantId=@tenantId 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CourseUpdate]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to Edit Course data

*/

CREATE PROCEDURE [dbo].[sp_CourseUpdate]
	@ContentModuleId INT,
	@ContentModuleName NVARCHAR(50),
	@ContentModuleDescription NVARCHAR(50),
	@ContentModuleType NVARCHAR(50),
	@ContentModuleURL NVARCHAR(50),
	@MasteryScore INT=null,
	@Duration INT = NULL,
	@createdBy INT,
	@tenantId INT

AS
BEGIN	
	SET NOCOUNT ON;
	UPDATE tblCourse SET ContentModuleName=@ContentModuleName,
	ContentModuleDescription=@ContentModuleDescription,
	ContentModuleType=@ContentModuleType,
	ContentModuleURL=@ContentModuleURL,
	MasteryScore=@MasteryScore,
	Duration=@Duration
	WHERE  ContentModuleId=@ContentModuleId	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteAssignedUsers]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DeleteAssignedUsersForCourse]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to add new course

*/

CREATE PROCEDURE [dbo].[sp_DeleteAssignedUsersForCourse]
	@ContentModuleId nvarchar(50)

AS
BEGIN	
		
		SET NOCOUNT ON;
		
		delete from tblLearnerActivityAssignment where ActivityId=@ContentModuleId
		
		
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DetailReportList]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to Edit Course data

*/

CREATE PROCEDURE [dbo].[sp_DetailReportList]	
	@TenantId INT,
	@UserId INT,
	@ActivityId INT
	

AS
BEGIN	
	SET NOCOUNT ON;

	create table #Temp
	(
		ActivityId int, 						
		ActivityDuration nvarchar(50),
		ActivityAttemptedDate nvarchar(50),
		ActivityAttempts nvarchar(50), 
		ActivityScore Varchar(50),
		ActivityQuestionCount nvarchar(50),
		ActivityCompletionTime Varchar(50) 
		
	)
	begin
	Insert Into #Temp
		select quizid as ActivityId, ISNULL((select Duration from tblQuiz where QuizId=@ActivityId),0) as activityDuration, AttemptedDate as ActivityAttemptedDate,
		Attempt as ActivityAttempts, Score as ActivityScore,
		(select count(*) from tblQuestion where QuizId=@ActivityId) as ActivityQuestionCount,
		ISNULL(completedTime,'-') as ActivityCompletionTime from tblQuizScore where QuizId=@ActivityId and UserId=@UserId


	end

	
		select  * from #Temp order by ActivityAttemptedDate desc

	

	If(OBJECT_ID('tempdb..#Temp') Is Not Null)
	Begin
		Drop Table #Temp
	End



END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetAssignedUsers]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetAssignedUsersForCourse]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to add new course

*/

CREATE PROCEDURE [dbo].[sp_GetAssignedUsersForCourse]
	@ContentModuleId int

AS
BEGIN	
		
		SET NOCOUNT ON;
		
		select LearnerId,DueDate from tblLearnerActivityAssignment where ActivityId=@ContentModuleId order by DueDate desc
		
		
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetQuestionCount]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetQuizAll]    Script Date: 2/19/2020 11:54:58 AM ******/
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

    SELECT	q.QuizId,q.QuizName,q.QuizDescription,ISNULL(q.Duration,0) as Duration,q.TenantId, (select count(QuestionId) from tblQuestion where QuizId=q.QuizId) as NoOfQuestion
	FROM	tblQuiz q	
	WHERE	q.TenantId=@tenantId
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetQuizByID]    Script Date: 2/19/2020 11:54:58 AM ******/
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

    SELECT	q.QuizId,q.QuizName,q.QuizDescription,q.Duration, q.TenantId
	FROM	tblQuiz q	
	WHERE	q.QuizId=@QuizId

	select * from tblQuestion where QuizId=@QuizId

	select * from tblQuestionOption where QuestionId in (select QuestionId from tblQuestion where QuizId=@QuizId)

END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserAssignment]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetUserQuizResponses]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_HighScoreUsersReport]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to Edit Course data

*/

CREATE PROCEDURE [dbo].[sp_HighScoreUsersReport]	
	@TenantId INT

AS
BEGIN	
	SET NOCOUNT ON;

SELECT c.QuizName as ActivityName, 'Quiz' as ActivityType, (d.firstName +' '+ d.lastName) as FullName,  a.Score, 
		(select count(questionid) from tblQuestion as e where e.QuizId=a.QuizId) as TotalQuestion,a.completedTime,c.duration
		FROM tblQuizScore AS A inner join tblQuiz as c on a.QuizId=c.QuizId
		inner join tblUser as d on a.UserId=d.userId
		WHERE A.score = (SELECT max(B.score) FROM tblQuizScore AS B WHERE A.QuizId = B.QuizId) and c.TenantId = @TenantId

		union

		
		SELECT c.ContentModuleName as ActivityName, 'Course' as ActivityType, (d.firstName +' '+ d.lastName) as FullName,  a.Score, 
		0 as TotalQuestion,'-' as completedTime,  c.duration
		FROM tblLearnerContentModTracking AS A inner join tblCourse as c on a.ContentModuleId=c.ContentModuleId
		inner join tblUser as d on a.LearnerId=d.userId
		WHERE A.score = (SELECT max(B.score) FROM tblLearnerContentModTracking AS B WHERE A.ContentModuleId = B.ContentModuleId) and c.TenantId = @TenantId




END
GO
/****** Object:  StoredProcedure [dbo].[sp_HomeActivitiesList]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to Edit Course data

*/

CREATE PROCEDURE [dbo].[sp_HomeActivitiesList]	
	@tenantId INT,
	@UserId INT,
	@status varchar(50) = NULL

AS
BEGIN	
	SET NOCOUNT ON;

	create table #Temp
	(
		ActivityId int, 
		ActivityName nvarchar(500), 
		ActivityType nvarchar(50), 
		ActivityDescription ntext, 
		ActivityDuration nvarchar(50),
		ActivityStartDate datetime,
		ActivityCompletionDate nvarchar(50), 
		ActivityStatus Varchar(50) 
		
	)
	begin
	Insert Into #Temp
		select a.QuizId as ActivityId,
		a.QuizName as ActivityName,
		'Quiz' as ActivityType,
		a.QuizDescription as ActivityDescription,
		ISNULL(a.Duration,0) as activityDuration,
		b.DateAssigned as ActivityStartDate,
		ISNULL((select TOP (1) DateCreated from tblResponses where QuizId=a.QuizId and UserId=@UserId order by DateCreated desc), NULL) as  ActivityCompletionDate,
		--'-' as ActivityStatus,
		(case when (select count(*) from tblResponses where QuizId=a.QuizId)> 0 then 'Completed'
		else 'Not Started' end) as  ActivityStatus
		from tblQuiz a
		inner join tblQuizAssignment b on a.QuizId=b.QuizId	
		where TenantId=@tenantId and b.UserId=@UserId
		
		union

		select ContentModuleId as ActivityId, ContentModuleName as ActivityName,
		'Course' as ActivityType,  ContentModuleDescription as ActivityDescription,
		'-' as ActivityDuration, b.AssignmentDate as ActivityStartDate, 
		ISNULL((select TOP (1) DateOfCompletion from tblLearnerContentModTracking where ContentModuleId=a.ContentModuleId and LearnerId=@UserId order by DateOfCompletion desc), NULL) as  ActivityCompletionDate,
		--'-' as ActivityStatus
		(case when (select count(*) from tblLearnerContentModTracking where ContentModuleId=a.ContentModuleId and LearnerId=@UserId)> 0 then 
		(case when (select CompletionStatus from tblLearnerContentModTracking where ContentModuleId=a.ContentModuleId and LearnerId=@UserId) = 'Started' then 'InProgress' else 'Completed' end)
		else 'Not Started' end) as  ActivityStatus
		from tblCourse as a inner join tblLearnerActivityAssignment as b on a.ContentModuleId=b.ActivityId
		where a.TenantId=@tenantId and b.LearnerId=@UserId
		
		--select ContentModuleId as ActivityId, ContentModuleName as ActivityName,
		--'Course' as ActivityType,  ContentModuleDescription as ActivityDescription,
		--'-' as ActivityDuration, b.AssignmentDate as ActivityStartDate, 
		--ISNULL((select TOP (1) DateOfCompletion from tblLearnerContentModTracking where ContentModuleId=a.ContentModuleId and LearnerId=@UserId order by DateOfCompletion desc), NULL) as  ActivityCompletionDate,
		----'-' as ActivityStatus
		--(case when (select count(*) from tblLearnerContentModTracking where ContentModuleId=a.ContentModuleId)> 0 then 
		--case when (select CompletionStatus from tblLearnerContentModTracking where ContentModuleId=a.ContentModuleId and LearnerId=@UserId) = 'Started' then 'InProgress' else 'Completed' end
		--else 'Not Started' end) as  ActivityStatus
		--from tblCourse as a inner join tblLearnerActivityAssignment as b on a.ContentModuleId=b.ActivityId
		--where a.TenantId=@tenantId and b.LearnerId=@UserId


	end

	if @status is null or @status = 'Total'
		select  * from #Temp order by ActivityStartDate desc

	if @status is not null
		select  * from #Temp where ActivityStatus=@status order by ActivityStartDate desc

	If(OBJECT_ID('tempdb..#Temp') Is Not Null)
	Begin
		Drop Table #Temp
	End



END

GO
/****** Object:  StoredProcedure [dbo].[sp_LearningCompletionReport]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to Edit Course data

*/

CREATE PROCEDURE [dbo].[sp_LearningCompletionReport]	
	@tenantId INT

AS
BEGIN	
	SET NOCOUNT ON;

	
				select QuizId as ActivityId, QuizName as ActivityName,'Quiz' as ActivityType, QuizDescription as ActivityDescription,
		(select count(*) from tblQuizAssignment where QuizId=a.QuizId) as ActivityUserCount,
		(select top 1 DateAssigned from tblQuizAssignment where QuizId=a.QuizId order by DateAssigned desc) as ActivityLearningAssigned
		from tblQuiz as a where a.TenantId=@tenantId

		union

		select a.ContentModuleId as ActivityId, ContentModuleName as ActivityName,'Course' as ActivityType, ContentModuleDescription as ActivityDescription,
		(select count(*) from tblLearnerActivityAssignment where ActivityId=a.ContentModuleId) as ActivityUserCount,
		(select top 1 AssignmentDate from tblLearnerActivityAssignment where ActivityId=a.ContentModuleId order by AssignmentDate desc) as ActivityLearningAssigned
		from tblCourse as a where a.TenantId=@tenantId



	
END

--sp_LearningCompletionReport 1
GO
/****** Object:  StoredProcedure [dbo].[sp_LearningProgressCompletionReport]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to Edit Course data

*/

CREATE PROCEDURE [dbo].[sp_LearningProgressCompletionReport]	
	@tenantId INT,
	@activityId INT,
	@type nvarchar(50)

AS
BEGIN	
	SET NOCOUNT ON;

	if @type='Quiz'
	begin
		--select a.firstName + ' ' + a.lastName as FullName, 
		--(select top 1 DateCreated from tblResponses where QuizId=b.QuizId order by DateCreated desc) as CompletionDate,
		--b.DueDate, '-' as ActivityDuration, '-' as TimeSpent, 
		--(case when (select count(*) from tblResponses where QuizId=b.QuizId)> 0 then 'Completed'
		--				else 'Not Started' end) as  ActivityStatus,
		--(select top 1 Rating from tblRatings where ActivityId=b.QuizId and UserId=b.UserId)  as Rating,
		--(SELECT string_agg(Comment, '#;;# ') FROM tblRatings where ActivityId=b.QuizId and UserId=b.UserId GROUP BY ActivityId) as Comments
		
		--from tblUser as a inner join tblQuizAssignment as b
		--on a.userId=b.UserId where b.QuizId=@activityId and a.tenantId=@tenantId


		select a.firstName + ' ' + a.lastName as FullName, 
		(select top 1 DateCreated from tblResponses where QuizId=b.QuizId and userid=a.userId order by DateCreated desc) as CompletionDate,
		b.DueDate, (select Duration from tblQuiz where QuizId=@activityId) as ActivityDuration, (select top 1 completedTime from tblQuizScore where QuizId=@activityId and userId=a.userId order by Attempt desc) as TimeSpent,-- '-' as TimeSpent, 
		(case when (select count(*) from tblResponses where QuizId=b.QuizId and userId=a.userId)> 0 then 'Completed' else 'Not Started' end) as  ActivityStatus,
		(select top 1 Rating from tblRatings where ActivityId=b.QuizId and UserId=b.UserId)  as Rating,
		(SELECT string_agg(Comment, '#;;# ') FROM tblRatings where ActivityId=b.QuizId and UserId=b.UserId GROUP BY ActivityId) as Comments		
		from tblUser as a inner join tblQuizAssignment as b		
		on a.userId=b.UserId where b.QuizId=@activityId and a.tenantId=@tenantId

	end

	if @type='Course'
	begin
		select a.firstName + ' ' + a.lastName as FullName, 
		(select top 1 DateOfCompletion from tblLearnerContentModTracking where ContentModuleId=b.ActivityId order by DateOfCompletion desc) as CompletionDate,
		b.DueDate, (select Duration from tblCourse where ContentModuleId=4 ) as ActivityDuration, '-' as TimeSpent, 
		(case when (select count(*) from tblLearnerContentModTracking where ContentModuleId=b.ActivityId)> 0 then 
		case when (select CompletionStatus from tblLearnerContentModTracking where ContentModuleId=b.ActivityId and LearnerId=a.userId) = 'Started' then 'InProgress' else 'Completed' end
		else 'Not Started' end) as  ActivityStatus,	
		(select top 1 Rating from tblRatings where ActivityId=b.ActivityId and UserId=a.UserId)  as Rating,
		(SELECT string_agg(Comment, '#;;# ') FROM tblRatings where ActivityId=b.ActivityId and UserId=a.UserId GROUP BY ActivityId) as Comments
		
		from tblUser as a inner join tblLearnerActivityAssignment as b
		on a.userId=b.LearnerId where b.ActivityId=@activityId and a.tenantId=@tenantId

	end


	
END

--sp_LearningProgressCompletionReport 1, 3068,'Quiz'
GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 2/19/2020 11:54:58 AM ******/
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
				u.createdBy,u.createdOn,u.tenantId,u.roleId,u.isNew,t.tenantName,ur.roleName,u.profileImage 
	FROM		tblUser u
	INNER JOIN	tblTenant t ON t.tenantId=u.tenantId
	INNER JOIN	tblUserRoles ur ON ur.roleId=u.roleId
	WHERE emailId=@EmailId AND [password]=@Password
end
GO
/****** Object:  StoredProcedure [dbo].[sp_MainReportList]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to Edit Course data

*/

CREATE PROCEDURE [dbo].[sp_MainReportList]	
	@TenantId INT,
	@UserId INT
	

AS
BEGIN	
	SET NOCOUNT ON;

	create table #Temp
	(
		ActivityId int, 
		ActivityName nvarchar(500), 
		ActivityType nvarchar(50), 		
		ActivityDuration nvarchar(50),
		ActivityAttemptedDate nvarchar(50),
		ActivityAttempts nvarchar(50), 
		ActivityScore Varchar(50),
		ActivityQuestionCount nvarchar(50),
		ActivityCompletionTime Varchar(50) 
		
	)
	begin
	Insert Into #Temp
		select a.QuizId as activityId, a.QuizName as activityName, 'Quiz' as activityType,
		--'-' as activityDuration, 
		ISNULL(a.Duration,0) as activityDuration,
		(select top 1 AttemptedDate from tblQuizScore where UserId=@UserId and QuizId=b.QuizId order by AttemptedDate desc) as activityDateAttempted,
		(select top 1 Attempt from tblQuizScore where UserId=@UserId and QuizId=b.QuizId order by Attempt desc) as activityAttempts,
		(select MAX(Score) from tblQuizScore where UserId=@UserId and QuizId=b.QuizId) as activityScore,
		(select count(*) from tblQuestion where QuizId=b.QuizId) as activityQuestionCount,
		--'-' as activityCompletionTime
		ISNULL((select MAX(completedTime) from tblQuizScore where UserId=@UserId and QuizId=b.QuizId),'-') as activityCompletionTime
		from tblQuiz as a inner join tblQuizAssignment as b on a.QuizId=b.QuizId
		where a.TenantId=@TenantId and b.UserId=@UserId

		union

		select a.ContentModuleId as activityId, a.ContentModuleName as activityName, 'Course' as activityType,
		'-' as activityDuration, 
		(select top 1 DateOfStart from tblLearnerContentModTracking where LearnerId=@UserId and ContentModuleId=b.ActivityId order by DateOfStart desc) as activityDateAttempted,
		(select count(*) from tblLearnerContentModTracking where LearnerId=@UserId and ContentModuleId=b.ActivityId) as activityAttempts,
		ISNULL((select MAX(Score) from tblLearnerContentModTracking where LearnerId=@UserId and ContentModuleId=b.ActivityId),0) as activityScore,
		0 as activityQuestionCount,
		'-' as activityCompletionTime
		from tblCourse as a inner join tblLearnerActivityAssignment as b on a.ContentModuleId=b.ActivityId
		where a.TenantId=@TenantId and b.LearnerId=@UserId


	end

	
		select  * from #Temp order by ActivityAttemptedDate desc

	

	If(OBJECT_ID('tempdb..#Temp') Is Not Null)
	Begin
		Drop Table #Temp
	End



END

GO
/****** Object:  StoredProcedure [dbo].[sp_NotificationTemplatesActivateDeactivate]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_NotificationTemplatesAdd]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_NotificationTemplatesGetAll]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_NotificationTemplatesGetById]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_NotificationTemplatesUpdate]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_OptionAdd]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_PasswordChange]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to Edit Course data

*/

CREATE PROCEDURE [dbo].[sp_PasswordChange]
	@UserID int,
	@OldPassword nvarchar(50),
	@Password nvarchar(50),
	@Status INT OUTPUT


AS
BEGIN	
	SET NOCOUNT ON;
	IF EXISTS (select userId from tblUser where userId=@UserID and password=@OldPassword)
		begin
		UPDATE tblUser SET password=@password
		WHERE  userId=@UserID

		SET @Status=1

	end
	ELSE
		BEGIN
			 SET @Status=0
		END
		RETURN @Status

END
GO
/****** Object:  StoredProcedure [dbo].[sp_PasswordUpdate]    Script Date: 2/19/2020 11:54:58 AM ******/
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
	UPDATE tblUser SET password=@password, isNew=0
	WHERE  emailid=@emailid	

	UPDATE tblResetPassword SET isUsed=1	
	WHERE  emailid=@emailid	

END
GO
/****** Object:  StoredProcedure [dbo].[sp_QuestionAdd]    Script Date: 2/19/2020 11:54:58 AM ******/
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
	@isRandomOption bit=NULL,
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
							,[InCorrectFeedback]
							,[isRandomOption])
				VALUES
							(@QuizId
							,@QuestionTypeId							
							,@QuestionText
							,@CorrectFeedback
							,@InCorrectFeedback
							,@isRandomOption)

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
/****** Object:  StoredProcedure [dbo].[sp_QuizAdd]    Script Date: 2/19/2020 11:54:58 AM ******/
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
	@QuizName NVARCHAR(max),
	@QuizDescription ntext = NULL,
	@Duration INT = NULL,
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
							,[TenantId]
							,[DateCreated]
							,[Duration])
				VALUES
							(N''+@QuizName+''
							,@QuizDescription							
							,@tenantId
							,GETDATE()
							,@Duration)

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

GO
/****** Object:  StoredProcedure [dbo].[sp_QuizAssign]    Script Date: 2/19/2020 11:54:58 AM ******/
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
	@DueDate datetime

AS
BEGIN	
		
		SET NOCOUNT ON;
		
		BEGIN
				INSERT INTO [dbo].[tblQuizAssignment]
							([QuizId]
							,[UserId]
							,[DateAssigned]
							,[DueDate])
				VALUES
							(@QuizId
							,@UserId
							,GETDATE()
							,@DueDate)

				
		END
		
		
END

GO
/****** Object:  StoredProcedure [dbo].[sp_QuizAttemptGet]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_QuizDelete]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_QuizGetAllDetails]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_QuizGetByUserId]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_QuizScoreAdd]    Script Date: 2/19/2020 11:54:58 AM ******/
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
	@Attempt int,
	@completedTime nvarchar(20)=null
	

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
							,[Attempt]
							,[completedTime])
				VALUES
							(@QuizId
							,@UserId							
							,@Score
							,getdate()
							,@Attempt
							,@completedTime)

				SET @status=1
		END
		
		RETURN @status
END
GO
/****** Object:  StoredProcedure [dbo].[sp_QuizScoreGet]    Script Date: 2/19/2020 11:54:58 AM ******/
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
		
		
				select Score,completedTime from tblQuizScore where QuizId=@QuizId and UserId=@UserId and Attempt=@Attempt order by AttemptedDate desc

		
END
GO
/****** Object:  StoredProcedure [dbo].[sp_QuizUpdate]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_QuizUpdateDelete]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001						To get all Quiz data

*/

CREATE PROCEDURE [dbo].[sp_QuizUpdateDelete] 
	@QuizId INT,
	@QuizName NVARCHAR(500),
	@QuizDescription ntext = NULL,
	@Duration INT = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	update tblQuiz set QuizName=@QuizName, QuizDescription=@QuizDescription,Duration=@Duration  WHERE	QuizId=@QuizId

	delete from tblQuestionOption where QuestionId in (select QuestionId from tblQuestion where QuizId=@QuizId)

	delete from tblQuestion where QuizId=@QuizId

    --delete FROM	tblQuiz WHERE	QuizId=@QuizId
	

END

GO
/****** Object:  StoredProcedure [dbo].[sp_RatingsAdd]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to add new course

*/

CREATE PROCEDURE [dbo].[sp_RatingsAdd]	
	@ActivityId int,
	@UserId int,	
	@Attempt int,
	@ActivityType varchar(10),
	@Rating numeric(18,0) = NULL,
	@Comment nvarchar(1000) = NULL,
	@TenantId int
	
	

AS
BEGIN	
		DECLARE @status BIT
		SET NOCOUNT ON;
		SET @status=0
		BEGIN
				INSERT INTO [dbo].[tblRatings]
							([ActivityId]
							,[UserId]							
							,[Attempt]
							,[ActivityType]
							,[Rating]
							,[Comment]
							,[TenantId]
							,[CreatedDate])
				VALUES
							(@ActivityId
							,@UserId							
							,@Attempt
							,@ActivityType
							,@Rating
							,@Comment
							,@TenantId
							,getdate())

				SET @status=1
		END
		
		RETURN @status
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ResponseAdd]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ResponseDelete]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_RolesGetAll]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TenantActivateDeactivate]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TenantAdd]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TenantGet]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TenantGetById]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TenantGetByName]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TenantUpdate]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TenantVerify]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UserActivateDeactivate]    Script Date: 2/19/2020 11:54:58 AM ******/
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

GO
/****** Object:  StoredProcedure [dbo].[sp_UserAdd]    Script Date: 2/19/2020 11:54:58 AM ******/
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
	@roleId INT,
	@profileImage ntext=null,
	@UserId int OUTPUT

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
					   ,[password]
					   ,[DOB]
					   ,[contactNo]
					   ,[isActive]
					   ,[createdBy]
					   ,[createdOn]
					   ,[tenantId]
					   ,[roleId]
					   ,[isNew]
					   ,[profileImage])
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
					   ,@roleId
					   ,1
					   ,@profileImage)

			SET @UserId=SCOPE_IDENTITY();
     END
	 ELSE
	 BEGIN
			SET @UserId=-2
	 END
	 RETURN @UserId
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UserGet]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UserGetById]    Script Date: 2/19/2020 11:54:58 AM ******/
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
				u.createdBy,u.createdOn,u.tenantId,u.roleId,t.tenantName,ur.roleName,u.profileImage 
	FROM		tblUser u
	INNER JOIN	tblTenant t ON t.tenantId=u.tenantId
	INNER JOIN	tblUserRoles ur ON ur.roleId=u.roleId
	WHERE		userId=@userId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserProgressReport]    Script Date: 2/19/2020 11:54:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to Edit Course data

*/

CREATE PROCEDURE [dbo].[sp_UserProgressReport]	
	@tenantId INT,
	@UserId INT

AS
BEGIN	
	SET NOCOUNT ON;

	
		select a.QuizId as ActivityId, QuizName as LearningName, 'Quiz' as LearningType,
		(case when (select count(*) from tblResponses where QuizId=a.QuizId)> 0 then 'Completed'
		else 'Not Started' end) as  ActivityStatus, a.Duration as Duration,
		 (select top 1 completedTime from tblQuizScore where QuizId=a.QuizId and UserId=@UserId order by completedTime desc) as CompletionTime,
		(select max(Attempt)   from tblQuizScore where QuizId=a.QuizId and UserId=@UserId) as Attempts,
		(select max(Score)   from tblQuizScore where QuizId=a.QuizId and UserId=@UserId) as Score,
		(select count(*) from tblQuestion where QuizId=a.QuizId) as QuestionCount,
		ISNULL((select TOP (1) DateCreated from tblResponses where QuizId=a.QuizId and UserId=@UserId order by DateCreated desc), NULL) as  AttemptedOn,
		ISNULL((select CAST(AVG(Rating) AS DECIMAL(10,2)) from tblRatings where ActivityId=a.QuizId and UserId=@UserId), NULL) as  Rating,
		(SELECT string_agg(Comment, '#;;# ') FROM tblRatings where ActivityId=a.QuizId and UserId=@UserId GROUP BY ActivityId) as Comments
		from tblquiz as a inner join tblQuizAssignment as b on a.QuizId=b.QuizId
		where a.TenantId=@tenantId  and b.UserId=@UserId

		union

		select a.ContentModuleId as ActivityId, a.ContentModuleName as LearningName, 'Course' as LearningType,
		(case when (select count(*) from tblLearnerContentModTracking where ContentModuleId=a.ContentModuleId and LearnerId=@UserId)> 0 then 
		(case when (select CompletionStatus from tblLearnerContentModTracking where ContentModuleId=a.ContentModuleId and LearnerId=@UserId) = 'Started'
		then 'InProgress' else 'Completed' end) else 'Not Started' end) as  ActivityStatus,		
		a.Duration as Duration,'-' as CompletionTime,
		(select count(*)  from tblLearnerContentModTracking where ContentModuleId=a.ContentModuleId and LearnerId=@UserId) as Attempts,
		ISNULL((select Score  from tblLearnerContentModTracking where ContentModuleId=a.ContentModuleId and LearnerId=@UserId),0) as Score,
		0 as QuestionCount,
		ISNULL((select DateOfStart  from tblLearnerContentModTracking where ContentModuleId=a.ContentModuleId and LearnerId=@UserId),NULL) as AttemptedOn,
		ISNULL((select CAST(AVG(Rating) AS DECIMAL(10,2)) from tblRatings where ActivityId=a.ContentModuleId and UserId=@UserId), NULL) as  Rating,
		(SELECT string_agg(Comment, '#;;# ') FROM tblRatings where ActivityId=a.ContentModuleId and UserId=@UserId GROUP BY ActivityId) as Comments

		from tblCourse as a inner join tblLearnerActivityAssignment as b on a.ContentModuleId=b.ActivityId
		where a.TenantId=@tenantId and b.LearnerId=@UserId


	
END

--sp_UserProgressReport 1,5
GO
/****** Object:  StoredProcedure [dbo].[sp_UserUpdate]    Script Date: 2/19/2020 11:54:58 AM ******/
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
	--@password NVARCHAR(50),
	@DOB DATE  = NULL,
	@contactNo NVARCHAR(50)  = NULL,
	@createdBy INT,
	@tenantId INT,
	@roleId INT,
	@profileImage ntext=null

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
			   --,[password] = @password
			   ,[DOB] = @DOB
			   ,[contactNo] = @contactNo
			   ,[isActive] = 1
			   ,[createdBy] = @createdBy
			   ,[createdOn] = getdate()
			   ,[tenantId] = @tenantId
			   ,[roleId] = @roleId
			   ,[profileImage]=@profileImage
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
/****** Object:  StoredProcedure [dbo].[sp_VerifyToken]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TenantActivateDeactivate]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TenantAdd]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TenantGetById]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TenantUpdate]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[UserActivateDeactivate]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[UserAdd]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[UserGetById]    Script Date: 2/19/2020 11:54:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[UserUpdate]    Script Date: 2/19/2020 11:54:58 AM ******/
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

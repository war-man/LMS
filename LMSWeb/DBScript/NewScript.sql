USE [master]
GO
/****** Object:  Database [LMSDBV2]    Script Date: 7/13/2020 2:00:35 PM ******/
CREATE DATABASE [LMSDBV2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LMSDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LMSDBV2.mdf' , SIZE = 335872KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LMSDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LMSDBV2_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LMSDBV2] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LMSDBV2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LMSDBV2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LMSDBV2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LMSDBV2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LMSDBV2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LMSDBV2] SET ARITHABORT OFF 
GO
ALTER DATABASE [LMSDBV2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LMSDBV2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LMSDBV2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LMSDBV2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LMSDBV2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LMSDBV2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LMSDBV2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LMSDBV2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LMSDBV2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LMSDBV2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LMSDBV2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LMSDBV2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LMSDBV2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LMSDBV2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LMSDBV2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LMSDBV2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LMSDBV2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LMSDBV2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LMSDBV2] SET  MULTI_USER 
GO
ALTER DATABASE [LMSDBV2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LMSDBV2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LMSDBV2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LMSDBV2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LMSDBV2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LMSDBV2] SET QUERY_STORE = OFF
GO
USE [LMSDBV2]
GO
/****** Object:  User [IIS APPPOOL\DefaultAppPool]    Script Date: 7/13/2020 2:00:35 PM ******/
CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[tblAssignmentAndTracking]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  Table [dbo].[tblCourse]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  Table [dbo].[tblCurriculum]    Script Date: 7/13/2020 2:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCurriculum](
	[CurriculumId] [int] IDENTITY(1,1) NOT NULL,
	[CurriculumTitle] [nvarchar](250) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[TenantId] [int] NOT NULL,
 CONSTRAINT [PK_tblCurriculum] PRIMARY KEY CLUSTERED 
(
	[CurriculumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmails]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  Table [dbo].[TblErrorLog]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  Table [dbo].[tblForum]    Script Date: 7/13/2020 2:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblForum](
	[ForumId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Description] [ntext] NULL,
	[ForumType] [int] NOT NULL,
	[TenantId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[IsBrodcast] [bit] NULL,
 CONSTRAINT [PK_tblForum] PRIMARY KEY CLUSTERED 
(
	[ForumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblForumAssign]    Script Date: 7/13/2020 2:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblForumAssign](
	[ForumId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[DueDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblForumReply]    Script Date: 7/13/2020 2:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblForumReply](
	[ForumId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[ForumReply] [ntext] NOT NULL,
	[CreatedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLearnerActivityAssignment]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  Table [dbo].[tblLearnerContentModTracking]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  Table [dbo].[tblLearnerContentModTrackingLog]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  Table [dbo].[tblLog]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  Table [dbo].[tblLoginLog]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  Table [dbo].[tblNotificationTemplates]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  Table [dbo].[tblQuestion]    Script Date: 7/13/2020 2:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuestion](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[QuizId] [int] NOT NULL,
	[QuestionTypeId] [int] NOT NULL,
	[QuestionText] [nvarchar](max) NULL,
	[CorrectFeedback] [nvarchar](max) NULL,
	[InCorrectFeedback] [nvarchar](max) NULL,
	[isRandomOption] [bit] NULL,
	[MediaURL] [ntext] NULL,
	[MediaName] [nvarchar](500) NULL,
 CONSTRAINT [PK_tblQuestion] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuestionOption]    Script Date: 7/13/2020 2:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuestionOption](
	[OptionId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[OptionText] [nvarchar](max) NOT NULL,
	[CorrectOption] [bit] NULL,
	[OptionFeedback] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblQuestionOption] PRIMARY KEY CLUSTERED 
(
	[OptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuestionType]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  Table [dbo].[tblQuiz]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  Table [dbo].[tblQuizAssignment]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  Table [dbo].[tblQuizScore]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  Table [dbo].[tblRatings]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  Table [dbo].[tblResetPassword]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  Table [dbo].[tblResponses]    Script Date: 7/13/2020 2:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblResponses](
	[ResponseId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[OptionIds] [nvarchar](100) NOT NULL,
	[QuestionFeedback] [nvarchar](max) NULL,
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
/****** Object:  Table [dbo].[tblStatus]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  Table [dbo].[tblTenant]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  Table [dbo].[tblUser]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  Table [dbo].[tblUserRoles]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CourseUpdate]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllQuiz]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetUserContentModule]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[procGenerateLog]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[procGetActivityDetails]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[procGetScormDetails]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[procGetUserDetails]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[procScormTrackingDetails]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[procUpdateTracking]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AddEmail]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AddError]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AddLoginLog]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AddToken]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AdminDashboardCounts]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AdminDashboardList]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AdminUserReport]    Script Date: 7/13/2020 2:00:35 PM ******/
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
		
		select a.UserId, (isnull(a.firstName,'')+' ' + isnull(a.lastName,'')) as FullName, 
		a.emailId, a.contactNo, a.isActive, a.createdOn,
		(select x.LoginDate from tblLoginLog as x where x.UserId=a.UserId) as LastLogin, (select count(*) from tblQuizAssignment where UserId=a.userId) + 
		(select count(*) from tblLearnerActivityAssignment where LearnerId=a.userId) as assigned
		from tblUser as a where a.tenantId=@TenantId and a.roleId!=1 and a.isActive=1
	end

	if @isActive=0
	begin
		select a.UserId, (isnull(a.firstName,'')+' ' + isnull(a.lastName,'')) as FullName, 
		a.emailId, a.contactNo, a.isActive, a.createdOn,
		(select x.LoginDate from tblLoginLog as x where x.UserId=a.UserId) as LastLogin, (select count(*) from tblQuizAssignment where UserId=a.userId) +
		(select count(*) from tblLearnerActivityAssignment where LearnerId=a.userId) as assigned
		from tblUser as a where a.tenantId=@TenantId and a.roleId!=1
	end

END
GO
/****** Object:  StoredProcedure [dbo].[sp_AssignmentAndTrackingActivateDeactivate]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AssignmentAndTrackingGetAllInactive]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CheckCourseAssignedUser]    Script Date: 7/13/2020 2:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

CREATE PROCEDURE [dbo].[sp_CheckCourseAssignedUser]
	@CourseId int,
	@UserId int

AS
BEGIN	
		
		SET NOCOUNT ON;
		
		select LearnerId from tblLearnerActivityAssignment where ActivityId=@CourseId and LearnerId=@UserId
		
		
END

GO
/****** Object:  StoredProcedure [dbo].[sp_CheckQuizAssignedUser]    Script Date: 7/13/2020 2:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

CREATE PROCEDURE [dbo].[sp_CheckQuizAssignedUser]
	@QuizId int,
	@UserId int

AS
BEGIN	
		
		SET NOCOUNT ON;
		
		select UserId from tblQuizAssignment where QuizId=@QuizId and UserId=@UserId
		
		
END

GO
/****** Object:  StoredProcedure [dbo].[sp_CourseActivateDeactivate]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CourseAdd]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CourseAssign]    Script Date: 7/13/2020 2:00:35 PM ******/
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
	@DueDate datetime = null

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
/****** Object:  StoredProcedure [dbo].[sp_CourseGetById]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CoursesGet]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CourseUpdate]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CurriculumCoursesGet]    Script Date: 7/13/2020 2:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to Get Course data 

*/
CREATE PROCEDURE [dbo].[sp_CurriculumCoursesGet] 
	@tenantId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT ContentModuleId, ContentModuleName	from tblCourse WHERE tenantId=@tenantId order by ContentModuleName
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CurriculumForumsGet]    Script Date: 7/13/2020 2:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to Get Course data 

*/
CREATE PROCEDURE [dbo].[sp_CurriculumForumsGet] 
	@tenantId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT ForumId, Title	from tblForum WHERE tenantId=@tenantId and IsBrodcast=0 order by Title
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CurriculumQuizsGet]    Script Date: 7/13/2020 2:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to Get Course data 

*/
CREATE PROCEDURE [dbo].[sp_CurriculumQuizsGet] 
	@tenantId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT QuizId, QuizName	from tblQuiz WHERE tenantId=@tenantId order by QuizName
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteAssignedUsers]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DeleteAssignedUsersForCourse]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DetailReportList]    Script Date: 7/13/2020 2:00:35 PM ******/
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
		select quizid as ActivityId, (select QuizName from tblQuiz where QuizId=@ActivityId) as ActivityName, 'Quiz' as ActivityType, ISNULL((select Duration from tblQuiz where QuizId=@ActivityId),0) as activityDuration, AttemptedDate as ActivityAttemptedDate,
		Attempt as ActivityAttempts, Score as ActivityScore,
		(select count(*) from tblQuestion where QuizId=@ActivityId and QuestionTypeId in (1,2)) as ActivityQuestionCount,
		ISNULL(completedTime,'-') as ActivityCompletionTime from tblQuizScore where QuizId=@ActivityId and UserId=@UserId


	end

	
		select  * from #Temp order by ActivityAttemptedDate desc

	

	If(OBJECT_ID('tempdb..#Temp') Is Not Null)
	Begin
		Drop Table #Temp
	End



END

GO
/****** Object:  StoredProcedure [dbo].[sp_ForumAdd]    Script Date: 7/13/2020 2:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to add new course

*/

CREATE PROCEDURE [dbo].[sp_ForumAdd]	
	@Title nvarchar(250),
	@Description ntext=NULL,	
	@ForumType int,
	@TenantId int,	
	@CreatedBy int,
	@IsBrodcast bit,
	@ForumId int OUTPUT
	

AS
BEGIN	
		 
		SET NOCOUNT ON;
		 
		BEGIN
				INSERT INTO [dbo].[tblForum]
							([Title]
							,[Description]							
							,[ForumType]
							,[TenantId]
							,[CreatedDate]
							,[CreatedBy]
							,[IsBrodcast])
				VALUES
							(@Title
							,@Description							
							,@ForumType
							,@TenantId
							,getdate()
							,@CreatedBy
							,@IsBrodcast)

				SET @ForumId=SCOPE_IDENTITY();
				 
		END
		
		RETURN @ForumId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ForumGet]    Script Date: 7/13/2020 2:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ForumGet] 
	@tenantId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT *
	from tblForum WHERE TenantId=@tenantId 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ForumGetById]    Script Date: 7/13/2020 2:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ForumGetById] 
	@forumId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT *
	from tblForum WHERE ForumId=@forumId 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ForumUpdate]    Script Date: 7/13/2020 2:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to add new course

*/

CREATE PROCEDURE [dbo].[sp_ForumUpdate]	
	@ForumId int,
	@Title nvarchar(250),
	@Description ntext=NULL,	
	@ForumType int,	
	@IsBrodcast bit,
	@ForumIdOutput int OUTPUT
	

AS
BEGIN	
		 
		SET NOCOUNT ON;
		 
		BEGIN
				update tblForum set
				Title=@Title,
				Description=@Description,
				ForumType=@ForumType,
				IsBrodcast=@IsBrodcast
				where ForumId=@ForumId


				SET @ForumIdOutput=@ForumId
				 
		END
		
		RETURN @ForumIdOutput
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAssignedUsers]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetAssignedUsersForCourse]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetQuestionCount]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetQuizAll]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetQuizByID]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetUserAssignment]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetUserQuizResponses]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_HighScoreUsersReport]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_HomeActivitiesList]    Script Date: 7/13/2020 2:00:35 PM ******/
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
		ActivitySubType nvarchar(50), 
		ActivityURL nvarchar(50),
		ActivityDescription ntext, 
		ActivityDuration nvarchar(50),
		ActivityStartDate datetime,
		ActivityCompletionDate nvarchar(50), 
		ActivityStatus Varchar(50),
		ActivityRating int
		
	)
	begin
	Insert Into #Temp
		select a.QuizId as ActivityId,
		a.QuizName as ActivityName,
		'Quiz' as ActivityType,
		'Quiz' as ActivitySubType,
		'' as ActivityURL,
		a.QuizDescription as ActivityDescription,
		ISNULL(a.Duration,0) as activityDuration,
		b.DateAssigned as ActivityStartDate,
		ISNULL((select TOP (1) DateCreated from tblResponses where QuizId=a.QuizId and UserId=@UserId order by DateCreated desc), NULL) as  ActivityCompletionDate,
		--'-' as ActivityStatus,
		(case when (select count(*) from tblResponses where QuizId=a.QuizId and UserId=@UserId)> 0 then 'Completed'
		else 'Not Started' end) as  ActivityStatus,
		(select count(*) from tblRatings where ActivityId=a.QuizId and UserId=@UserId) as ActivityRating
		
		from tblQuiz a
		inner join tblQuizAssignment b on a.QuizId=b.QuizId	
		where TenantId=@tenantId and b.UserId=@UserId
		
		union

		select ContentModuleId as ActivityId, ContentModuleName as ActivityName,
		'Course' as ActivityType, 
		a.ContentModuleType as ActivitySubType,	
		a.ContentModuleURL as ActivityURL,
		ContentModuleDescription as ActivityDescription,
		Duration as ActivityDuration, b.AssignmentDate as ActivityStartDate, 
		ISNULL((select TOP (1) DateOfCompletion from tblLearnerContentModTracking where ContentModuleId=a.ContentModuleId and LearnerId=@UserId order by DateOfCompletion desc), NULL) as  ActivityCompletionDate,
		--'-' as ActivityStatus
		(case when (select count(*) from tblLearnerContentModTracking where ContentModuleId=a.ContentModuleId and LearnerId=@UserId)> 0 then 
		(case when (select CompletionStatus from tblLearnerContentModTracking where ContentModuleId=a.ContentModuleId and LearnerId=@UserId) = 'Started' then 'InProgress' else 'Completed' end)
		else 'Not Started' end) as  ActivityStatus,
		(select count(*) from tblRatings where ActivityId=a.ContentModuleId and UserId=@UserId) as ActivityRating
		from tblCourse as a inner join tblLearnerActivityAssignment as b on a.ContentModuleId=b.ActivityId
		where a.TenantId=@tenantId and b.LearnerId=@UserId
		



	end
	print @status
	if @status is null or @status = 'Total'
		select  * from #Temp order by ActivityStartDate desc

	if @status <> 'Total'
		select  * from #Temp where ActivityStatus=@status order by ActivityStartDate desc

	If(OBJECT_ID('tempdb..#Temp') Is Not Null)
	Begin
		Drop Table #Temp
	End



END

GO
/****** Object:  StoredProcedure [dbo].[sp_LearningCompletionReport]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_LearningProgressCompletionReport]    Script Date: 7/13/2020 2:00:35 PM ******/
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
		
		select isnull(a.firstName,'')+' ' + isnull(a.lastName,'') as FullName, 
		(select top 1 DateCreated from tblResponses where QuizId=b.QuizId and userid=a.userId order by DateCreated desc) as CompletionDate,
		b.DueDate, (select Duration from tblQuiz where QuizId=@activityId) as ActivityDuration, (select top 1 completedTime from tblQuizScore where QuizId=@activityId and userId=a.userId order by Attempt desc) as TimeSpent,-- '-' as TimeSpent, 
		(case when (select count(*) from tblResponses where QuizId=b.QuizId and userId=a.userId)> 0 then 'Completed' else 'Not Started' end) as  ActivityStatus,
		(select top 1 Rating from tblRatings where ActivityId=b.QuizId and UserId=b.UserId)  as Rating,
		(SELECT string_agg(Comment, '#;;# ') FROM tblRatings where ActivityId=b.QuizId and UserId=b.UserId GROUP BY ActivityId) as Comments		
		from tblUser as a inner join tblQuizAssignment as b		
		on a.userId=b.UserId where b.QuizId=@activityId and a.tenantId=@tenantId

		select QuizName as ActivityName, QuizDescription as ActivityDescription, 'Quiz' as ActivityType from tblQuiz
		where QuizId=@activityId

	end

	if @type='Course'
	begin
		select isnull(a.firstName,'')+' ' + isnull(a.lastName,'') as FullName, 
		(select top 1 DateOfCompletion from tblLearnerContentModTracking where ContentModuleId=b.ActivityId order by DateOfCompletion desc) as CompletionDate,
		b.DueDate, (select Duration from tblCourse where ContentModuleId=4 ) as ActivityDuration, '-' as TimeSpent, 
		(case when (select count(*) from tblLearnerContentModTracking where ContentModuleId=b.ActivityId)> 0 then 
		case when (select CompletionStatus from tblLearnerContentModTracking where ContentModuleId=b.ActivityId and LearnerId=a.userId) = 'Started' then 'InProgress' else 'Completed' end
		else 'Not Started' end) as  ActivityStatus,	
		(select top 1 Rating from tblRatings where ActivityId=b.ActivityId and UserId=a.UserId)  as Rating,
		(SELECT string_agg(Comment, '#;;# ') FROM tblRatings where ActivityId=b.ActivityId and UserId=a.UserId GROUP BY ActivityId) as Comments
		
		from tblUser as a inner join tblLearnerActivityAssignment as b
		on a.userId=b.LearnerId where b.ActivityId=@activityId and a.tenantId=@tenantId

		select ContentModuleName as ActivityName, ContentModuleDescription as ActivityDescription, 'Course' as ActivityType from tblCourse
		where ContentModuleId=@activityId

	end


	
END

--sp_LearningProgressCompletionReport 1, 3068,'Quiz'
GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 7/13/2020 2:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_Login]
@EmailId NVARCHAR(max),
@Password NVARCHAR(max),
@DomainName NVARCHAR(max)
as
begin
	SELECT u.userId,u.firstName,u.lastName,u.emailId,u.[password],u.DOB,u.contactNo,u.isActive,
				u.createdBy,u.createdOn,u.tenantId,u.roleId,u.isNew,t.tenantName,t.tenantDomain,t.Logo,ur.roleName,u.profileImage 
	FROM		tblUser u
	INNER JOIN	tblTenant t ON t.tenantId=u.tenantId
	INNER JOIN	tblUserRoles ur ON ur.roleId=u.roleId
	WHERE emailId=@EmailId AND [password]=@Password and t.tenantDomain=@DomainName
end
GO
/****** Object:  StoredProcedure [dbo].[sp_MainReportList]    Script Date: 7/13/2020 2:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


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
		ActivityCompletionTime nvarchar(50) 
		
	)
	begin
	Insert Into #Temp
		select a.QuizId as activityId, a.QuizName as activityName, 'Quiz' as activityType,
		--'-' as activityDuration, 
		ISNULL(a.Duration,0) as activityDuration,
		(select top 1 AttemptedDate from tblQuizScore where UserId=@UserId and QuizId=b.QuizId order by AttemptedDate desc) as activityDateAttempted,
		(select top 1 Attempt from tblQuizScore where UserId=@UserId and QuizId=b.QuizId order by Attempt desc) as activityAttempts,
		(select MAX(Score) from tblQuizScore where UserId=@UserId and QuizId=b.QuizId) as activityScore,
		(select count(*) from tblQuestion where QuizId=b.QuizId and QuestionTypeId in (1,2)) as activityQuestionCount,
		--'-' as activityCompletionTime
		ISNULL((select MAX(completedTime) from tblQuizScore where UserId=@UserId and QuizId=b.QuizId),NULL) as activityCompletionTime
		from tblQuiz as a inner join tblQuizAssignment as b on a.QuizId=b.QuizId
		where a.TenantId=@TenantId and b.UserId=@UserId

		union

		select a.ContentModuleId as activityId, a.ContentModuleName as activityName, 'Course' as activityType,
		ISNULL(a.Duration,0) as activityDuration, 
		(select top 1 DateOfStart from tblLearnerContentModTracking where LearnerId=@UserId and ContentModuleId=b.ActivityId order by DateOfStart desc) as activityDateAttempted,
		(select count(*) from tblLearnerContentModTracking where LearnerId=@UserId and ContentModuleId=b.ActivityId) as activityAttempts,
		ISNULL((select MAX(Score) from tblLearnerContentModTracking where LearnerId=@UserId and ContentModuleId=b.ActivityId),0) as activityScore,
		0 as activityQuestionCount,
		--'-' as activityCompletionTime
		(select CAST(DATEDIFF(minute, m.DateOfStart,m.DateOfCompletion) AS nvarchar(50)) from tblLearnerContentModTracking as m where m.ContentModuleId=a.ContentModuleId and m.LearnerId=@UserId) as activityCompletionTime
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
/****** Object:  StoredProcedure [dbo].[sp_NotificationTemplatesActivateDeactivate]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_NotificationTemplatesAdd]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_NotificationTemplatesGetAll]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_NotificationTemplatesGetById]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_NotificationTemplatesUpdate]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_OptionAdd]    Script Date: 7/13/2020 2:00:35 PM ******/
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
		
		RETURN @OptionId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_PasswordChange]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_PasswordUpdate]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_PlekCheckUserExist]    Script Date: 7/13/2020 2:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001		Sana Bagwan		Create SP to get user by id

*/
CREATE PROCEDURE [dbo].[sp_PlekCheckUserExist]
	@emailId nvarchar(100),
	@domainName nvarchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

			SELECT userId from tblUser as a
		inner join tblTenant as b on a.tenantId=b.tenantId
		where a.emailId=@emailId and b.tenantDomain=@domainName
END
GO
/****** Object:  StoredProcedure [dbo].[sp_QuestionAdd]    Script Date: 7/13/2020 2:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_QuestionAdd]
	@OldQuestionId int = null,
	@QuizId int,
	@QuestionTypeId int,	
	@QuestionText ntext,
	@CorrectFeedback ntext=NULL,
	@InCorrectFeedback ntext=NULL,
	@isRandomOption bit=NULL,
	@MediaURL ntext=NULL,
	@MediaName ntext=NULL,
	@QuestionId INT OUTPUT

AS
BEGIN
		SET NOCOUNT ON;
		
		BEGIN
				INSERT INTO [dbo].[tblQuestion]
							([QuizId]
							,[QuestionTypeId]							
							,[QuestionText]
							,[CorrectFeedback]
							,[InCorrectFeedback]
							,[isRandomOption]
							,[MediaURL]
							,[MediaName])
				VALUES
							(@QuizId
							,@QuestionTypeId							
							,@QuestionText
							,@CorrectFeedback
							,@InCorrectFeedback
							,@isRandomOption
							,@MediaURL
							,@MediaName)

				SET @QuestionId=SCOPE_IDENTITY()

				if @OldQuestionId is not null
				update tblResponses set QuestionId=@QuestionId where QuestionId=@OldQuestionId
		END
		
		RETURN @QuestionId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_QuizAdd]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_QuizAssign]    Script Date: 7/13/2020 2:00:35 PM ******/
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
	@DueDate datetime = null

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
/****** Object:  StoredProcedure [dbo].[sp_QuizAttemptGet]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_QuizDataDelete]    Script Date: 7/13/2020 2:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Srno	Name			Reason
001						To get all Quiz data

*/

CREATE PROCEDURE [dbo].[sp_QuizDataDelete] 
	@QuestionId INT
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	

	delete from tblQuestionOption where QuestionId in (select QuestionId from tblQuestion where QuestionId=@QuestionId)

	delete from tblQuestion where QuestionId=@QuestionId

    --delete FROM	tblQuiz WHERE	QuizId=@QuizId
	

END
GO
/****** Object:  StoredProcedure [dbo].[sp_QuizDelete]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_QuizGetAllDetails]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_QuizGetByUserId]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_QuizScoreAdd]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_QuizScoreGet]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_QuizUpdateDelete]    Script Date: 7/13/2020 2:00:35 PM ******/
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

	--delete from tblQuestionOption where QuestionId in (select QuestionId from tblQuestion where QuizId=@QuizId)

	--delete from tblQuestion where QuizId=@QuizId

    --delete FROM	tblQuiz WHERE	QuizId=@QuizId
	

END

GO
/****** Object:  StoredProcedure [dbo].[sp_RatingsAdd]    Script Date: 7/13/2020 2:00:35 PM ******/
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
	@Attempt int = NULL,
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
							,1
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
/****** Object:  StoredProcedure [dbo].[sp_ResponseAdd]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ResponseDelete]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_RolesGetAll]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TenantActivateDeactivate]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TenantAdd]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TenantGet]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TenantGetById]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TenantGetByName]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TenantUpdate]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TenantVerify]    Script Date: 7/13/2020 2:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_TenantVerify] 
	@tenantDomain NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT * FROM tblTenant WHERE tenantDomain=@tenantDomain and isactive=1
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UserActivateDeactivate]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UserAdd]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UserGet]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UserGetById]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UserProgressReport]    Script Date: 7/13/2020 2:00:35 PM ******/
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
		(select count(*) from tblQuestion where QuizId=a.QuizId and QuestionTypeId in (1,2)) as QuestionCount,
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


		select (isnull(firstName,'')+' ' + isnull(lastName,'')) as FullName from tblUser where userId=@UserId
	
END

--sp_UserProgressReport 1,5
GO
/****** Object:  StoredProcedure [dbo].[sp_UserUpdate]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_VerifyToken]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TenantActivateDeactivate]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TenantAdd]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TenantGetById]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TenantUpdate]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UserActivateDeactivate]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UserAdd]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UserGetById]    Script Date: 7/13/2020 2:00:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UserUpdate]    Script Date: 7/13/2020 2:00:35 PM ******/
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
ALTER DATABASE [LMSDBV2] SET  READ_WRITE 
GO

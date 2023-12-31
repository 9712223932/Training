USE [master]
GO
/****** Object:  Database [test]    Script Date: 29-08-2023 16:13:33 ******/
CREATE DATABASE [test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'test', FILENAME = N'C:\Users\darshan.modi\test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'test_log', FILENAME = N'C:\Users\darshan.modi\test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [test] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [test] SET ARITHABORT OFF 
GO
ALTER DATABASE [test] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [test] SET  ENABLE_BROKER 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [test] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [test] SET  MULTI_USER 
GO
ALTER DATABASE [test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [test] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [test] SET QUERY_STORE = OFF
GO
USE [test]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [test]
GO
/****** Object:  Table [dbo].[AccountorTransectionType]    Script Date: 29-08-2023 16:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountorTransectionType](
	[AccountorTransectionTypeId] [int] IDENTITY(301,1) NOT NULL,
	[AccountorTransectionTypeName] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountorTransectionValue]    Script Date: 29-08-2023 16:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountorTransectionValue](
	[AccountorTransectionValueId] [int] IDENTITY(401,1) NOT NULL,
	[AccountorTransectionValueName] [varchar](15) NULL,
	[AccountorTransectionTypeId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CreditCardDetail]    Script Date: 29-08-2023 16:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditCardDetail](
	[CreditCardDetailID] [int] IDENTITY(601,1) NOT NULL,
	[CardNumber] [int] NULL,
	[Expirydate] [datetime] NULL,
	[CardLimit] [int] NULL,
	[CustomerAccountManageId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerAccountManage]    Script Date: 29-08-2023 16:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAccountManage](
	[CustomerAccountManageId] [int] IDENTITY(201,1) NOT NULL,
	[AccountNumber] [int] NULL,
	[AccountType] [int] NULL,
	[AccountBalance] [int] NULL,
	[BranchName] [varchar](10) NULL,
	[IfscCode] [varchar](10) NULL,
	[CustomerInformationId] [int] NULL,
	[CreatedOn] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerInformation]    Script Date: 29-08-2023 16:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerInformation](
	[CustomerInformationId] [int] IDENTITY(101,1) NOT NULL,
	[CustomerName] [varchar](10) NULL,
	[CustomerMobileNumber] [varchar](10) NULL,
	[CustomerAddress] [varchar](20) NULL,
	[CreatedOn] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeInfromation]    Script Date: 29-08-2023 16:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeInfromation](
	[EmployeeID] [int] IDENTITY(101,1) NOT NULL,
	[EmployeeName] [varchar](20) NULL,
	[EmployeeSalary] [int] NULL,
	[EmployeeGender] [varchar](10) NULL,
	[EmployeeCity] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transection]    Script Date: 29-08-2023 16:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transection](
	[TransectionId] [int] IDENTITY(501,1) NOT NULL,
	[TransectionType] [int] NULL,
	[TransectionAmmount] [int] NULL,
	[CustomerAccountManageId] [int] NULL,
	[CreatedOn] [datetime] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AccountorTransectionType] ON 

INSERT [dbo].[AccountorTransectionType] ([AccountorTransectionTypeId], [AccountorTransectionTypeName]) VALUES (301, N'Account')
INSERT [dbo].[AccountorTransectionType] ([AccountorTransectionTypeId], [AccountorTransectionTypeName]) VALUES (302, N'Transection')
INSERT [dbo].[AccountorTransectionType] ([AccountorTransectionTypeId], [AccountorTransectionTypeName]) VALUES (303, N'Console')
INSERT [dbo].[AccountorTransectionType] ([AccountorTransectionTypeId], [AccountorTransectionTypeName]) VALUES (304, N'Store SP')
INSERT [dbo].[AccountorTransectionType] ([AccountorTransectionTypeId], [AccountorTransectionTypeName]) VALUES (305, N'Banking')
SET IDENTITY_INSERT [dbo].[AccountorTransectionType] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountorTransectionValue] ON 

INSERT [dbo].[AccountorTransectionValue] ([AccountorTransectionValueId], [AccountorTransectionValueName], [AccountorTransectionTypeId]) VALUES (401, N'Savings', 301)
INSERT [dbo].[AccountorTransectionValue] ([AccountorTransectionValueId], [AccountorTransectionValueName], [AccountorTransectionTypeId]) VALUES (402, N'Current', 301)
INSERT [dbo].[AccountorTransectionValue] ([AccountorTransectionValueId], [AccountorTransectionValueName], [AccountorTransectionTypeId]) VALUES (403, N'Deposite', 302)
INSERT [dbo].[AccountorTransectionValue] ([AccountorTransectionValueId], [AccountorTransectionValueName], [AccountorTransectionTypeId]) VALUES (404, N'Withdrawal', 302)
INSERT [dbo].[AccountorTransectionValue] ([AccountorTransectionValueId], [AccountorTransectionValueName], [AccountorTransectionTypeId]) VALUES (405, N'Console', 301)
INSERT [dbo].[AccountorTransectionValue] ([AccountorTransectionValueId], [AccountorTransectionValueName], [AccountorTransectionTypeId]) VALUES (406, N'Store SP', 302)
INSERT [dbo].[AccountorTransectionValue] ([AccountorTransectionValueId], [AccountorTransectionValueName], [AccountorTransectionTypeId]) VALUES (407, N'System', 301)
SET IDENTITY_INSERT [dbo].[AccountorTransectionValue] OFF
GO
SET IDENTITY_INSERT [dbo].[CreditCardDetail] ON 

INSERT [dbo].[CreditCardDetail] ([CreditCardDetailID], [CardNumber], [Expirydate], [CardLimit], [CustomerAccountManageId]) VALUES (601, 6186, CAST(N'2024-08-19T10:00:00.000' AS DateTime), 45000, 201)
INSERT [dbo].[CreditCardDetail] ([CreditCardDetailID], [CardNumber], [Expirydate], [CardLimit], [CustomerAccountManageId]) VALUES (602, 6187, CAST(N'2025-06-10T10:00:00.000' AS DateTime), 50000, 201)
INSERT [dbo].[CreditCardDetail] ([CreditCardDetailID], [CardNumber], [Expirydate], [CardLimit], [CustomerAccountManageId]) VALUES (603, 6188, CAST(N'2026-09-25T10:00:00.000' AS DateTime), 47000, 202)
INSERT [dbo].[CreditCardDetail] ([CreditCardDetailID], [CardNumber], [Expirydate], [CardLimit], [CustomerAccountManageId]) VALUES (605, 6189, CAST(N'2023-08-25T15:50:07.673' AS DateTime), 636000, 203)
INSERT [dbo].[CreditCardDetail] ([CreditCardDetailID], [CardNumber], [Expirydate], [CardLimit], [CustomerAccountManageId]) VALUES (606, 6190, CAST(N'2026-09-25T10:00:00.000' AS DateTime), 36000, 204)
INSERT [dbo].[CreditCardDetail] ([CreditCardDetailID], [CardNumber], [Expirydate], [CardLimit], [CustomerAccountManageId]) VALUES (607, 6191, CAST(N'2027-08-01T10:00:00.000' AS DateTime), 26000, 205)
INSERT [dbo].[CreditCardDetail] ([CreditCardDetailID], [CardNumber], [Expirydate], [CardLimit], [CustomerAccountManageId]) VALUES (608, 6192, CAST(N'2023-08-25T15:50:17.327' AS DateTime), 60000, 206)
INSERT [dbo].[CreditCardDetail] ([CreditCardDetailID], [CardNumber], [Expirydate], [CardLimit], [CustomerAccountManageId]) VALUES (609, 6193, CAST(N'2024-08-19T10:00:00.000' AS DateTime), 70000, 207)
INSERT [dbo].[CreditCardDetail] ([CreditCardDetailID], [CardNumber], [Expirydate], [CardLimit], [CustomerAccountManageId]) VALUES (610, 6194, CAST(N'2025-06-10T10:00:00.000' AS DateTime), 75000, 208)
SET IDENTITY_INSERT [dbo].[CreditCardDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerAccountManage] ON 

INSERT [dbo].[CustomerAccountManage] ([CustomerAccountManageId], [AccountNumber], [AccountType], [AccountBalance], [BranchName], [IfscCode], [CustomerInformationId], [CreatedOn]) VALUES (201, 12121, 401, 30000, N'Surat', N'ST123', 101, CAST(N'2023-08-18T14:45:12.080' AS DateTime))
INSERT [dbo].[CustomerAccountManage] ([CustomerAccountManageId], [AccountNumber], [AccountType], [AccountBalance], [BranchName], [IfscCode], [CustomerInformationId], [CreatedOn]) VALUES (202, 12122, 402, 2400, N'Surat', N'ST123', 101, CAST(N'2023-08-18T14:45:30.900' AS DateTime))
INSERT [dbo].[CustomerAccountManage] ([CustomerAccountManageId], [AccountNumber], [AccountType], [AccountBalance], [BranchName], [IfscCode], [CustomerInformationId], [CreatedOn]) VALUES (203, 12123, 402, 58200, N'Ahemdabad', N'AH123', 102, CAST(N'2023-08-18T14:45:55.823' AS DateTime))
INSERT [dbo].[CustomerAccountManage] ([CustomerAccountManageId], [AccountNumber], [AccountType], [AccountBalance], [BranchName], [IfscCode], [CustomerInformationId], [CreatedOn]) VALUES (204, 12124, 401, 5200, N'Pune', N'PN123', 103, CAST(N'2023-08-18T14:46:28.630' AS DateTime))
INSERT [dbo].[CustomerAccountManage] ([CustomerAccountManageId], [AccountNumber], [AccountType], [AccountBalance], [BranchName], [IfscCode], [CustomerInformationId], [CreatedOn]) VALUES (205, 12125, 402, 8200, N'Banglore', N'BN123', 104, CAST(N'2023-08-18T14:47:01.830' AS DateTime))
INSERT [dbo].[CustomerAccountManage] ([CustomerAccountManageId], [AccountNumber], [AccountType], [AccountBalance], [BranchName], [IfscCode], [CustomerInformationId], [CreatedOn]) VALUES (206, 12126, 401, 1200, N'Nashik', N'NS123', 105, CAST(N'2023-08-18T14:47:32.857' AS DateTime))
INSERT [dbo].[CustomerAccountManage] ([CustomerAccountManageId], [AccountNumber], [AccountType], [AccountBalance], [BranchName], [IfscCode], [CustomerInformationId], [CreatedOn]) VALUES (207, 12127, 402, 4400, N'Mumbai', N'BM123', 106, CAST(N'2023-08-22T15:50:41.830' AS DateTime))
INSERT [dbo].[CustomerAccountManage] ([CustomerAccountManageId], [AccountNumber], [AccountType], [AccountBalance], [BranchName], [IfscCode], [CustomerInformationId], [CreatedOn]) VALUES (208, 12128, 402, 8200, N'Pune', N'PN123', 107, CAST(N'2023-08-22T15:56:13.350' AS DateTime))
INSERT [dbo].[CustomerAccountManage] ([CustomerAccountManageId], [AccountNumber], [AccountType], [AccountBalance], [BranchName], [IfscCode], [CustomerInformationId], [CreatedOn]) VALUES (209, 12128, 402, 4300, N'Kolkata', N'KT123', 107, CAST(N'2023-08-28T10:35:12.317' AS DateTime))
INSERT [dbo].[CustomerAccountManage] ([CustomerAccountManageId], [AccountNumber], [AccountType], [AccountBalance], [BranchName], [IfscCode], [CustomerInformationId], [CreatedOn]) VALUES (210, 12128, 402, 5800, N'Kolkata', N'KT123', 107, CAST(N'2023-08-28T10:41:13.670' AS DateTime))
SET IDENTITY_INSERT [dbo].[CustomerAccountManage] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerInformation] ON 

INSERT [dbo].[CustomerInformation] ([CustomerInformationId], [CustomerName], [CustomerMobileNumber], [CustomerAddress], [CreatedOn]) VALUES (101, N'Darshan', N'97215244', N'Surat', CAST(N'2023-08-18T13:30:05.663' AS DateTime))
INSERT [dbo].[CustomerInformation] ([CustomerInformationId], [CustomerName], [CustomerMobileNumber], [CustomerAddress], [CreatedOn]) VALUES (102, N'Aman', N'8712113932', N'Ahemdabad', CAST(N'2023-08-18T13:30:05.663' AS DateTime))
INSERT [dbo].[CustomerInformation] ([CustomerInformationId], [CustomerName], [CustomerMobileNumber], [CustomerAddress], [CreatedOn]) VALUES (103, N'Dhriti', N'97814122', N'Pune', CAST(N'2023-08-18T13:30:37.410' AS DateTime))
INSERT [dbo].[CustomerInformation] ([CustomerInformationId], [CustomerName], [CustomerMobileNumber], [CustomerAddress], [CreatedOn]) VALUES (104, N'Tithi', N'98814133', N'Banglore', CAST(N'2023-08-18T13:30:59.947' AS DateTime))
INSERT [dbo].[CustomerInformation] ([CustomerInformationId], [CustomerName], [CustomerMobileNumber], [CustomerAddress], [CreatedOn]) VALUES (105, N'Rusih', N'88814133', N'Nashik', CAST(N'2023-08-18T14:16:52.810' AS DateTime))
INSERT [dbo].[CustomerInformation] ([CustomerInformationId], [CustomerName], [CustomerMobileNumber], [CustomerAddress], [CreatedOn]) VALUES (106, N'Console', N'98561414', N'Mumbai', CAST(N'2023-08-22T15:44:48.307' AS DateTime))
INSERT [dbo].[CustomerInformation] ([CustomerInformationId], [CustomerName], [CustomerMobileNumber], [CustomerAddress], [CreatedOn]) VALUES (107, N'Store SP', N'87945122', N'Pune', CAST(N'2023-08-22T15:46:42.147' AS DateTime))
INSERT [dbo].[CustomerInformation] ([CustomerInformationId], [CustomerName], [CustomerMobileNumber], [CustomerAddress], [CreatedOn]) VALUES (108, N'Store SP', N'87945122', N'Pune', CAST(N'2023-08-22T15:51:16.980' AS DateTime))
INSERT [dbo].[CustomerInformation] ([CustomerInformationId], [CustomerName], [CustomerMobileNumber], [CustomerAddress], [CreatedOn]) VALUES (109, N'Console', N'98561414', N'Mumbai', CAST(N'2023-08-28T10:21:37.150' AS DateTime))
INSERT [dbo].[CustomerInformation] ([CustomerInformationId], [CustomerName], [CustomerMobileNumber], [CustomerAddress], [CreatedOn]) VALUES (110, N'Console', N'96661414', N'Kolkata', CAST(N'2023-08-28T10:22:28.180' AS DateTime))
SET IDENTITY_INSERT [dbo].[CustomerInformation] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeInfromation] ON 

INSERT [dbo].[EmployeeInfromation] ([EmployeeID], [EmployeeName], [EmployeeSalary], [EmployeeGender], [EmployeeCity]) VALUES (101, N'Darshan', 4500, N'Male', N'Surat')
INSERT [dbo].[EmployeeInfromation] ([EmployeeID], [EmployeeName], [EmployeeSalary], [EmployeeGender], [EmployeeCity]) VALUES (102, N'Aman', 80500, N'Male', N'UP')
INSERT [dbo].[EmployeeInfromation] ([EmployeeID], [EmployeeName], [EmployeeSalary], [EmployeeGender], [EmployeeCity]) VALUES (103, N'Tithi', 10500, N'FeMale', N'Mehsana')
INSERT [dbo].[EmployeeInfromation] ([EmployeeID], [EmployeeName], [EmployeeSalary], [EmployeeGender], [EmployeeCity]) VALUES (104, N'Dhriti', 2500, N'FeMale', N'Ahemdabad')
INSERT [dbo].[EmployeeInfromation] ([EmployeeID], [EmployeeName], [EmployeeSalary], [EmployeeGender], [EmployeeCity]) VALUES (105, N'Rushi', 90500, N'Male', N'Nashik')
SET IDENTITY_INSERT [dbo].[EmployeeInfromation] OFF
GO
SET IDENTITY_INSERT [dbo].[Transection] ON 

INSERT [dbo].[Transection] ([TransectionId], [TransectionType], [TransectionAmmount], [CustomerAccountManageId], [CreatedOn]) VALUES (501, 404, 300, 201, CAST(N'2023-08-25T09:37:02.270' AS DateTime))
INSERT [dbo].[Transection] ([TransectionId], [TransectionType], [TransectionAmmount], [CustomerAccountManageId], [CreatedOn]) VALUES (502, 404, 500, 201, CAST(N'2023-08-25T09:37:24.813' AS DateTime))
INSERT [dbo].[Transection] ([TransectionId], [TransectionType], [TransectionAmmount], [CustomerAccountManageId], [CreatedOn]) VALUES (503, 403, 500, 201, CAST(N'2023-08-25T09:37:42.973' AS DateTime))
INSERT [dbo].[Transection] ([TransectionId], [TransectionType], [TransectionAmmount], [CustomerAccountManageId], [CreatedOn]) VALUES (504, 404, 500, 209, CAST(N'2023-08-28T12:31:13.143' AS DateTime))
INSERT [dbo].[Transection] ([TransectionId], [TransectionType], [TransectionAmmount], [CustomerAccountManageId], [CreatedOn]) VALUES (505, 404, 1000, 209, CAST(N'2023-08-28T17:24:32.607' AS DateTime))
SET IDENTITY_INSERT [dbo].[Transection] OFF
GO
ALTER TABLE [dbo].[CreditCardDetail] ADD  DEFAULT (getdate()) FOR [Expirydate]
GO
ALTER TABLE [dbo].[CustomerAccountManage] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[CustomerInformation] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Transection] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  StoredProcedure [dbo].[AccountInformation1]    Script Date: 29-08-2023 16:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Darshan Modi
-- Create date: 2023-Aug-13
-- Description:	SP of Banking System table AccountInformation	
-- =============================================
CREATE PROCEDURE [dbo].[AccountInformation1]
	-- Add the parameters for the stored procedure here
	@aiId int,
	@accNumber varchar(10),
	@atvid int,
	@accBalance int,
	@branch varchar(15),
	@ifsc varchar(15),
	@OPType varchar(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	If (@aiId=0)
BEGIN
	Insert into AccountInformation values(@accNumber,@atvid,@accBalance,@branch,@ifsc,getdate())
END
ELSE
BEGIN
	If(@OPType='U')
BEGIN
	Update AccountInformation SET AccountNumber=@accNumber,AccountType=@atvid, AccountBalance=@accBalance,BranchName=@branch,IfscCode=@ifsc
	where AccountInformationId=@aiId
END
ELSE
BEGIN
	Delete AccountInformation where AccountInformationId=@aiId
END
END
END
GO
/****** Object:  StoredProcedure [dbo].[AccountorTransectionType1]    Script Date: 29-08-2023 16:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Darshan Modi
-- Create date: 2023-Aug-18
-- Description:	SP of Banking System table AccountorTransectionType	
-- =============================================
CREATE PROCEDURE [dbo].[AccountorTransectionType1]
	-- Add the parameters for the stored procedure here
	@attid int,
	@attname varchar(20),
	@OPType varchar(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	If (@attid=0)
BEGIN
	Insert into AccountorTransectionType values(@attname)
END
ELSE
BEGIN
	If(@OPType='U')
BEGIN
	Update AccountorTransectionType SET AccountorTransectionTypeName=@attname
	where AccountorTransectionTypeId=@attid
END
ELSE
BEGIN
	Delete AccountorTransectionType where AccountorTransectionTypeId=@attid
END
END
END
GO
/****** Object:  StoredProcedure [dbo].[AccountorTransectionValue1]    Script Date: 29-08-2023 16:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Darshan Modi
-- Create date: 2023-Aug-18
-- Description:	SP of Banking System table AccountorTransectionValue	
-- =============================================
CREATE PROCEDURE [dbo].[AccountorTransectionValue1]
	-- Add the parameters for the stored procedure here
	@atvid int,
	@atvname varchar(10),
	@attid int,
	@OPType varchar(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	If (@atvid=0)
BEGIN
	Insert into AccountorTransectionValue values(@atvname,@attid)
END
ELSE
BEGIN
	If(@OPType='U')
BEGIN
	Update AccountorTransectionValue SET AccountorTransectionValueName=@atvname,AccountorTransectionTypeId=@attid
	where AccountorTransectionValueId=@atvid
END
ELSE
BEGIN
	Delete AccountorTransectionValue where AccountorTransectionValueId=@atvid
END
END
END
GO
/****** Object:  StoredProcedure [dbo].[BankServer1]    Script Date: 29-08-2023 16:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Darshan Modi
-- Create date: 2023-Aug-13
-- Description:	SP of Banking System table BankServer	
-- =============================================
CREATE PROCEDURE [dbo].[BankServer1]
	-- Add the parameters for the stored procedure here
	@bsId int,
	@camid int,
	@tid int,
	@OPType varchar(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	If (@bsId=0)
BEGIN
	Insert into BankServer values(@camid,@tid,getdate())
END
ELSE
BEGIN
	If(@OPType='U')
BEGIN
	Update BankServer SET CustomerAccountManageId=@camid,TransectionId=@tid
	where BankServerId=@bsId
END
ELSE
BEGIN
	Delete BankServer where BankServerId=@bsId
END
END
END
GO
/****** Object:  StoredProcedure [dbo].[Cust]    Script Date: 29-08-2023 16:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Darshan Modi
-- Create date: 2023-Aug-18
-- Description:	SP of Banking System table CustomerInformation	
-- =============================================
CREATE PROCEDURE [dbo].[Cust]
	-- Add the parameters for the stored procedure here

	
AS
BEGIN

	SET NOCOUNT ON;	
	print('query start');
	declare @query varchar(max)='select * from CustomerInformation' 
	print(@query)
	exec (@query)
  
	
END
GO
/****** Object:  StoredProcedure [dbo].[Cust1]    Script Date: 29-08-2023 16:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Darshan Modi
-- Create date: 2023-Aug-18
-- Description:	SP of Banking System table CustomerInformation	
-- =============================================
CREATE PROCEDURE [dbo].[Cust1]
	-- Add the parameters for the stored procedure here
	@ciId int
	
AS
BEGIN

	SET NOCOUNT ON;	
	
	declare @query varchar(max)='select CustomerInformationId  from CustomerInformation' 
	print(@query)
	exec (@query)
  
	
END
GO
/****** Object:  StoredProcedure [dbo].[CustomerAccountManage1]    Script Date: 29-08-2023 16:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Darshan Modi
-- Create date: 2023-Aug-18
-- Description:	SP of Banking System table CustomerAccountManage	
-- =============================================
CREATE PROCEDURE [dbo].[CustomerAccountManage1]
	-- Add the parameters for the stored procedure here
	@camid int,
	@accNumber varchar(10),
	@atvid int,
	@accBalance int,
	@branch varchar(15),
	@ifsc varchar(15),
	@ciId int,	
	@OPType varchar(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	If (@camid=0)
BEGIN
	Insert into CustomerAccountManage values(@accNumber,@atvid,@accBalance,@branch,@ifsc,@ciId,getdate())
END
ELSE
BEGIN
	If(@OPType='U')
BEGIN
	Update CustomerAccountManage SET AccountNumber=@accNumber,AccountType=@atvid,AccountBalance=@accBalance,
	BranchName=@branch,IfscCode=@ifsc,CustomerInformationId=@ciId
	where CustomerAccountManageId=@camid
END
ELSE
BEGIN
	Delete CustomerAccountManage where CustomerAccountManageId=@camid
END
END
END
GO
/****** Object:  StoredProcedure [dbo].[CustomerInfo1]    Script Date: 29-08-2023 16:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Darshan Modi
-- Create date: 2023-Aug-18
-- Description:	SP of Banking System table CustomerInformation	
-- =============================================
CREATE PROCEDURE [dbo].[CustomerInfo1]
	-- Add the parameters for the stored procedure here
	@ciId int,
	@custName varchar(10),
	@custmobileNo varchar(10),
	@custAdd varchar(20),
	@OPType varchar(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @query varchar(max)='select * from CustomerInformation'

	print (@query)

    -- Insert statements for procedure here
	If (@ciId=0)
BEGIN
	Insert into CustomerInformation values(@custName,@custmobileNo,@custAdd,getdate())
END
ELSE
BEGIN
	If(@OPType='U')
BEGIN
	Update CustomerInformation SET CustomerName=@custName, CustomerMobileNumber=@custmobileNo,CustomerAddress=@custAdd
	where CustomerInformationId=@ciId
END
ELSE
BEGIN
	Delete CustomerInformation where CustomerInformationId=@ciId
END
END
END
GO
/****** Object:  StoredProcedure [dbo].[Transection1]    Script Date: 29-08-2023 16:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Transection1]
	-- Add the parameters for the stored procedure here
	@tid int,
	@atvid int,
	@tamount int,
	@camid int,
	@OPType varchar(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON

    -- Insert statements for procedure here
	If (@tid=0)
BEGIN
	Insert into Transection values(@atvid,@tamount,@camid,getdate())
END
ELSE
BEGIN
	If(@OPType='U')
BEGIN
	Update Transection SET TransectionType=@atvid,TransectionAmmount=@tamount,CustomerAccountManageId=@camid
	where TransectionId=@tid
END
ELSE
BEGIN
	Delete Transection where TransectionId=@tid
END
END
END
GO
USE [master]
GO
ALTER DATABASE [test] SET  READ_WRITE 
GO

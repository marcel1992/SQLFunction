USE [WindowsControlDB]
GO

/****** Object:  Table [dbo].[tblPoint]    Script Date: 6/11/2017 10:57:13 PM ******/
DROP TABLE [dbo].[tblPoint]
GO

/****** Object:  Table [dbo].[tblPoint]    Script Date: 6/11/2017 10:57:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblPoint](
	[POINT_Id] [int] IDENTITY(1,1) NOT NULL,
	[POINT_POST_Id] [int] NOT NULL,
	[POINT_X] [float] NOT NULL,
	[POINT_Y] [float] NOT NULL,
	[POINT_Z] [float] NOT NULL,
 CONSTRAINT [PK_tblPoint] PRIMARY KEY CLUSTERED 
(
	[POINT_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



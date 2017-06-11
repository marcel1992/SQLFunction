USE [WindowsControlDB]
GO

ALTER TABLE [dbo].[tblPosture] DROP CONSTRAINT [FK_tblPosture_tblPoint]
GO

/****** Object:  Table [dbo].[tblPosture]    Script Date: 6/11/2017 10:57:32 PM ******/
DROP TABLE [dbo].[tblPosture]
GO

/****** Object:  Table [dbo].[tblPosture]    Script Date: 6/11/2017 10:57:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblPosture](
	[POST_Id] [int] IDENTITY(1,1) NOT NULL,
	[POST_POINT_Id] [int] NOT NULL,
 CONSTRAINT [PK_tblPosture] PRIMARY KEY CLUSTERED 
(
	[POST_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblPosture]  WITH CHECK ADD  CONSTRAINT [FK_tblPosture_tblPoint] FOREIGN KEY([POST_POINT_Id])
REFERENCES [dbo].[tblPoint] ([POINT_Id])
GO

ALTER TABLE [dbo].[tblPosture] CHECK CONSTRAINT [FK_tblPosture_tblPoint]
GO



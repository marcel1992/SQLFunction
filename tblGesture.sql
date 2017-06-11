USE [WindowsControlDB]
GO

ALTER TABLE [dbo].[tblGesture] DROP CONSTRAINT [FK_tblGesture_tblPosture]
GO

/****** Object:  Table [dbo].[tblGesture]    Script Date: 6/11/2017 10:56:53 PM ******/
DROP TABLE [dbo].[tblGesture]
GO

/****** Object:  Table [dbo].[tblGesture]    Script Date: 6/11/2017 10:56:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblGesture](
	[GEST_Id] [int] IDENTITY(1,1) NOT NULL,
	[GEST_POST_Id] [int] NOT NULL,
	[GEST_Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_tblGesture] PRIMARY KEY CLUSTERED 
(
	[GEST_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblGesture]  WITH CHECK ADD  CONSTRAINT [FK_tblGesture_tblPosture] FOREIGN KEY([GEST_POST_Id])
REFERENCES [dbo].[tblPosture] ([POST_Id])
GO

ALTER TABLE [dbo].[tblGesture] CHECK CONSTRAINT [FK_tblGesture_tblPosture]
GO



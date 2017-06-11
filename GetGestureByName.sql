USE [WindowsControlDB]
GO

/****** Object:  UserDefinedFunction [dbo].[GetGestureByName]    Script Date: 6/11/2017 10:57:54 PM ******/
DROP FUNCTION [dbo].[GetGestureByName]
GO

/****** Object:  UserDefinedFunction [dbo].[GetGestureByName]    Script Date: 6/11/2017 10:57:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[GetGestureByName]
(	
	-- Add the parameters for the function here
	@gestureName nvarchar(150)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT GEST.GEST_Name AS 'Gesture name',POINT.POINT_X as 'Point X',POINT.POINT_Y as 'Point Y',POINT.POINT_Z as 'Point Z'
		   FROM tblGesture GEST, tblPoint POINT, tblPosture POST 
				WHERE GEST.GEST_POST_Id = POST.POST_Id AND POST.POST_POINT_Id = POINT.POINT_POST_Id AND
					  POINT.POINT_Id IN	(SELECT POINT_Id FROM tblPoint where POINT_POST_Id IN (
												SELECT GEST_POST_Id FROM tblGesture WHERE GEST_Name LIKE @gestureName))
)


GO



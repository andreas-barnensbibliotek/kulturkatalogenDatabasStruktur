USE [dnndev_v902.me]
GO

/****** Object:  StoredProcedure [dbo].[kk_aj_proc_getuserdata]    Script Date: 2017-05-23 16:41:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Andreas Josefsson>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[kk_aj_proc_getuserdata]
	-- Add the parameters for the stored procedure here
	@userid int
AS
BEGIN
	SELECT        Users.UserID, Users.Username, Users.FirstName, Users.LastName, Users.Email, UserProfile.PropertyValue, UserProfile.PropertyDefinitionID
FROM            Users INNER JOIN
                         UserProfile ON Users.UserID = UserProfile.UserID
WHERE        (Users.UserID = @userid)
END

GO


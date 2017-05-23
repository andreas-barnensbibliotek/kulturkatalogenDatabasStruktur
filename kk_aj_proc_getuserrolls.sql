USE [dnndev_v902.me]
GO

/****** Object:  StoredProcedure [dbo].[kk_aj_proc_getuserrolls]    Script Date: 2017-05-23 16:41:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[kk_aj_proc_getuserrolls]
	@userid int
AS
BEGIN
	
	SELECT        Roles.RoleName, UserRoles.RoleID
FROM            UserRoles INNER JOIN
                         Roles ON UserRoles.RoleID = Roles.RoleID
WHERE        (UserRoles.UserID = @userid)
end

GO


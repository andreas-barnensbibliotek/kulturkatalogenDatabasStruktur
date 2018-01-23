USE [dnndev_v902.me]
GO

/****** Object:  StoredProcedure [dbo].[kk_aj_proc_Email_konstform]    Script Date: 2018-01-23 13:45:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[kk_aj_proc_Email_konstform]
	@konstformid int
AS
BEGIN
	SELECT        Users.Email, Users.UserID, users.FirstName, users.LastName
FROM            Users INNER JOIN
                         UserRoles ON Users.UserID = UserRoles.UserID INNER JOIN
                         Roles ON UserRoles.RoleID = Roles.RoleID INNER JOIN
                         kk_aj_tbl_Konstformtyp ON Roles.RoleID = kk_aj_tbl_Konstformtyp.dnnRollid
WHERE        (kk_aj_tbl_Konstformtyp.KonstformID = @konstformid)
END

GO


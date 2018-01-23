USE [dnndev_v902.me]
GO

/****** Object:  StoredProcedure [dbo].[kk_aj_proc_userinrollbykonstformtyp]    Script Date: 2018-01-23 13:48:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Andreas Josefsson>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[kk_aj_proc_userinrollbykonstformtyp]
	-- Add the parameters for the stored procedure here
	@konstformtypid int
AS
BEGIN
	SELECT        kk_aj_tbl_Konstformtyp.KonstformID, kk_aj_tbl_Konstformtyp.dnnRollid, Users.UserID, Users.Username, Users.FirstName, Users.LastName, Users.Email, Users.DisplayName
FROM            UserRoles INNER JOIN
                         kk_aj_tbl_Konstformtyp ON UserRoles.RoleID = kk_aj_tbl_Konstformtyp.dnnRollid INNER JOIN
                         Users ON UserRoles.UserID = Users.UserID
WHERE        (kk_aj_tbl_Konstformtyp.KonstformID = @konstformtypid)
END

GO


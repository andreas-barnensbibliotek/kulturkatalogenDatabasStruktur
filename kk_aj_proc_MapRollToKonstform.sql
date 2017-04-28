USE [dnndev_v902.me]
GO

/****** Object:  StoredProcedure [dbo].[kk_aj_proc_MapRollToKonstform]    Script Date: 2017-04-28 16:25:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[kk_aj_proc_MapRollToKonstform]
@userid int

AS
SELECT        kk_aj_tbl_Konstformtyp.KonstformID
FROM            UserRoles INNER JOIN
                         kk_aj_tbl_Konstformtyp ON UserRoles.RoleID = kk_aj_tbl_Konstformtyp.dnnRollid
WHERE        (UserRoles.UserID = @userid)

GO


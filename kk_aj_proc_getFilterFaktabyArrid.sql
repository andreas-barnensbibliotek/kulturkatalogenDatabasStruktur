USE [dnndev_v902.me]
GO

/****** Object:  StoredProcedure [dbo].[kk_aj_proc_getFilterFaktabyArrid]    Script Date: 2018-01-23 13:46:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Andreas Josefsson
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[kk_aj_proc_getFilterFaktabyArrid]
	@arrid int
AS
BEGIN
		SELECT        kk_aj_tbl_fakta.faktatypid, kk_aj_tbl_fakta.faktaValue, kk_aj_tbl_faktatyp.Faktarubrik
FROM            kk_aj_tbl_fakta INNER JOIN
                         kk_aj_tbl_faktatyp ON kk_aj_tbl_fakta.faktatypid = kk_aj_tbl_faktatyp.faktatypid
WHERE        (kk_aj_tbl_fakta.arrid = @arrid) AND (kk_aj_tbl_fakta.faktatypid = 27 OR
                         kk_aj_tbl_fakta.faktatypid = 14 OR
						  kk_aj_tbl_fakta.faktatypid = 19 OR
                         kk_aj_tbl_fakta.faktatypid = 26 OR
                         kk_aj_tbl_fakta.faktatypid = 5)
END

GO


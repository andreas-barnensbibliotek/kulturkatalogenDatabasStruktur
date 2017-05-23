USE [dnndev_v902.me]
GO

/****** Object:  StoredProcedure [dbo].[kk_aj_proc_getfaktabyarrid]    Script Date: 2017-05-23 16:40:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Andreas Josefsson
-- Create date: 2017-05-19
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[kk_aj_proc_getfaktabyarrid]
	-- Add the parameters for the stored procedure here
	@arrid int
AS
BEGIN
	SELECT kk_aj_tbl_faktatyp.Faktarubrik, kk_aj_tbl_fakta.faktaValue, kk_aj_tbl_fakta.faktaid, kk_aj_tbl_fakta.faktatypid
FROM     kk_aj_tbl_fakta INNER JOIN
                  kk_aj_tbl_faktatyp ON kk_aj_tbl_fakta.faktatypid = kk_aj_tbl_faktatyp.faktatypid
WHERE  (kk_aj_tbl_fakta.arrid = @arrid)
END

GO


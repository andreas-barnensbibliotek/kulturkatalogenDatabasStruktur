USE [dnndev_v902.me]
GO

/****** Object:  StoredProcedure [dbo].[kk_aj_proc_listMinMaxYear]    Script Date: 2018-01-23 13:47:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[kk_aj_proc_listMinMaxYear]
	@arrid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        arrid, faktatypid, faktaValue
	FROM            kk_aj_tbl_fakta
	WHERE        (arrid = @arrid) AND 
				 ((faktatypid = 7) OR
				 (faktatypid = 8))
	ORDER BY faktatypid ASC
END

GO


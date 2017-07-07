USE [dnndev_v902.me]
GO

/****** Object:  StoredProcedure [dbo].[kk_aj_proc_Getarrby_Latest]    Script Date: 2017-07-07 11:02:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[kk_aj_proc_Getarrby_Latest] 
	-- Add the parameters for the stored procedure here
	@arrid int
AS
BEGIN
SELECT TOP (1) kk_aj_tbl_content.Rubrik, kk_aj_tbl_content.Underrubrik, kk_aj_tbl_content.ContentText, kk_aj_tbl_content.ImageFotograf, kk_aj_tbl_content.ImageUrl, kk_aj_tbl_content.ImageFilename, 
                  kk_aj_tbl_content.ImageSize, kk_aj_tbl_content.ImageAlt
FROM     kk_aj_tbl_arridtoContent INNER JOIN
                  kk_aj_tbl_content ON kk_aj_tbl_arridtoContent.contentid = kk_aj_tbl_content.Contentid
WHERE  (kk_aj_tbl_arridtoContent.arrid = @arrid)
ORDER BY kk_aj_tbl_arridtoContent.Version DESC
END

GO


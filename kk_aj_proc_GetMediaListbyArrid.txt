USE [dnndev_v902.me]
GO

/****** Object:  StoredProcedure [dbo].[kk_aj_proc_GetMediaListbyArrid]    Script Date: 2017-06-27 13:18:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[kk_aj_proc_GetMediaListbyArrid]
	@arrid int
AS
BEGIN
SELECT       kk_aj_tbl_Media.mediaID, kk_aj_tbl_Media.contentID AS contentid, kk_aj_tbl_Media.mediaUrl, kk_aj_tbl_Media.mediaFileName, kk_aj_tbl_Media.mediaSize, kk_aj_tbl_Media.mediaAlt, kk_aj_tbl_Media.mediaFoto, kk_aj_tbl_Media.mediaVald, kk_aj_tbl_MediaTyp.mediatyp                      
FROM            kk_aj_tbl_arridtoContent INNER JOIN
                         kk_aj_tbl_Media ON kk_aj_tbl_arridtoContent.contentid = kk_aj_tbl_Media.contentID INNER JOIN
                         kk_aj_tbl_MediaTyp ON kk_aj_tbl_Media.mediaTyp = kk_aj_tbl_MediaTyp.mediatypID
WHERE        (kk_aj_tbl_Media.contentID =
                             (SELECT        TOP (1) contentid
                               FROM            kk_aj_tbl_arridtoContent
                               WHERE        (arrid = @arrid)
                               ORDER BY Version DESC))
END

GO


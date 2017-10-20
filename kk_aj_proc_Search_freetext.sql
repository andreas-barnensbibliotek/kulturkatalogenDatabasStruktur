USE [dnndev_v902.me]
GO

/****** Object:  StoredProcedure [dbo].[kk_aj_proc_Search_freetext]    Script Date: 2017-10-18 14:54:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[kk_aj_proc_Search_freetext]
	-- Add the parameters for the stored procedure here
	@searchstr nvarchar(500)
AS
IF EXISTS (
			SELECT kk_aj_tbl_content.Contentid
			FROM     kk_aj_tbl_content INNER JOIN
							  kk_aj_tbl_arridtoContent ON kk_aj_tbl_content.Contentid = kk_aj_tbl_arridtoContent.contentid INNER JOIN
							  kk_aj_tbl_Arrangemang ON kk_aj_tbl_arridtoContent.arrid = kk_aj_tbl_Arrangemang.ArrID
			WHERE  (kk_aj_tbl_Arrangemang.Publicerad = N'ja') AND 
						(CHARINDEX(@searchstr, kk_aj_tbl_content.Rubrik) > 0) OR
						(CHARINDEX(@searchstr, kk_aj_tbl_content.Underrubrik) > 0) OR
						(CHARINDEX(@searchstr, kk_aj_tbl_content.ContentText) > 0)							
			)
		BEGIN
			SELECT kk_aj_tbl_Arrangemang.ArrID, kk_aj_tbl_content.Rubrik, kk_aj_tbl_content.Underrubrik, kk_aj_tbl_content.ImageUrl, kk_aj_tbl_Arrangemang.Datum, kk_aj_tbl_Arrangemang.ArrangemangstypID, kk_aj_tbl_Utovare.Organisation, 
					kk_aj_tbl_Utovare.UtovarID, kk_aj_tbl_Konstformtyp.konstform, kk_aj_tbl_Arrangemang.KonstformID, kk_aj_tbl_Arrangemang.Publicerad, kk_aj_tbl_content.ContentText
			FROM     kk_aj_tbl_Arrangemang INNER JOIN
						  kk_aj_tbl_arridtoContent ON kk_aj_tbl_Arrangemang.ArrID = kk_aj_tbl_arridtoContent.arrid INNER JOIN
						  kk_aj_tbl_content ON kk_aj_tbl_arridtoContent.contentid = kk_aj_tbl_content.Contentid INNER JOIN
						  kk_aj_tbl_Konstformtyp ON kk_aj_tbl_Arrangemang.KonstformID = kk_aj_tbl_Konstformtyp.KonstformID INNER JOIN
						  kk_aj_tbl_Utovare ON kk_aj_tbl_Arrangemang.UtovarID = kk_aj_tbl_Utovare.UtovarID
			WHERE	(kk_aj_tbl_Arrangemang.Publicerad = N'ja') AND 
						(CHARINDEX(@searchstr, kk_aj_tbl_content.Rubrik) > 0) OR
						(CHARINDEX(@searchstr, kk_aj_tbl_content.Underrubrik) > 0) OR
						(CHARINDEX(@searchstr, kk_aj_tbl_content.ContentText) > 0)	
		
		END

		ELSE

		IF EXISTS (
			SELECT kk_aj_tbl_Utovare.Organisation, kk_aj_tbl_Utovare.Fornamn, kk_aj_tbl_Utovare.Efternamn, kk_aj_tbl_Arrangemang.Publicerad
				FROM     kk_aj_tbl_Utovare INNER JOIN
								  kk_aj_tbl_Arrangemang ON kk_aj_tbl_Utovare.UtovarID = kk_aj_tbl_Arrangemang.UtovarID
				WHERE (kk_aj_tbl_Arrangemang.Publicerad = N'ja') AND
						(CHARINDEX(@searchstr, kk_aj_tbl_Utovare.Organisation) > 0) OR
						(CHARINDEX(@searchstr, kk_aj_tbl_Utovare.Fornamn) > 0) OR
						(CHARINDEX(@searchstr, kk_aj_tbl_Utovare.Efternamn) > 0)											
			)
		BEGIN
			SELECT kk_aj_tbl_Arrangemang.ArrID, kk_aj_tbl_content.Rubrik, kk_aj_tbl_content.Underrubrik, kk_aj_tbl_content.ImageUrl, kk_aj_tbl_Arrangemang.Datum, kk_aj_tbl_Arrangemang.ArrangemangstypID, kk_aj_tbl_Utovare.Organisation, 
						kk_aj_tbl_Utovare.UtovarID, kk_aj_tbl_Konstformtyp.konstform, kk_aj_tbl_Arrangemang.KonstformID, kk_aj_tbl_Arrangemang.Publicerad, kk_aj_tbl_content.ContentText
			FROM     kk_aj_tbl_Arrangemang INNER JOIN
					  kk_aj_tbl_arridtoContent ON kk_aj_tbl_Arrangemang.ArrID = kk_aj_tbl_arridtoContent.arrid INNER JOIN
					  kk_aj_tbl_content ON kk_aj_tbl_arridtoContent.contentid = kk_aj_tbl_content.Contentid INNER JOIN
					  kk_aj_tbl_Konstformtyp ON kk_aj_tbl_Arrangemang.KonstformID = kk_aj_tbl_Konstformtyp.KonstformID INNER JOIN
					  kk_aj_tbl_Utovare ON kk_aj_tbl_Arrangemang.UtovarID = kk_aj_tbl_Utovare.UtovarID
			WHERE (kk_aj_tbl_Arrangemang.Publicerad = N'ja') AND
						(CHARINDEX(@searchstr, kk_aj_tbl_Utovare.Organisation) > 0) OR
						(CHARINDEX(@searchstr, kk_aj_tbl_Utovare.Fornamn) > 0) OR
						(CHARINDEX(@searchstr, kk_aj_tbl_Utovare.Efternamn) > 0)	
		END
GO


USE [dnndev_v902.me]
GO

/****** Object:  StoredProcedure [dbo].[kk_aj_proc_search]    Script Date: 2017-10-23 16:26:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[kk_aj_proc_search]
	
	@arrtypid int = 0,
	@konstartid int = 0,
	@startyear int = 0,
	@stoppyear int = 0,
	@pubyesno nvarchar(3)= 'ja'
AS
BEGIN

IF @arrtypid > 0 AND @konstartid = 0 AND @startyear = 0

	SELECT kk_aj_tbl_Arrangemang.ArrID, kk_aj_tbl_content.Rubrik, kk_aj_tbl_content.Underrubrik, kk_aj_tbl_content.ImageUrl, kk_aj_tbl_Arrangemang.Datum, kk_aj_tbl_Arrangemang.ArrangemangstypID, 
                  kk_aj_tbl_Utovare.Organisation, kk_aj_tbl_Utovare.UtovarID, kk_aj_tbl_Konstformtyp.konstform, kk_aj_tbl_Arrangemang.KonstformID
FROM     kk_aj_tbl_Arrangemang INNER JOIN
                  kk_aj_tbl_arridtoContent ON kk_aj_tbl_Arrangemang.ArrID = kk_aj_tbl_arridtoContent.arrid INNER JOIN
                  kk_aj_tbl_content ON kk_aj_tbl_arridtoContent.contentid = kk_aj_tbl_content.Contentid INNER JOIN
                  kk_aj_tbl_Konstformtyp ON kk_aj_tbl_Arrangemang.KonstformID = kk_aj_tbl_Konstformtyp.KonstformID INNER JOIN
                  kk_aj_tbl_Utovare ON kk_aj_tbl_Arrangemang.UtovarID = kk_aj_tbl_Utovare.UtovarID
	WHERE (kk_aj_tbl_Arrangemang.Publicerad = @pubyesno) AND kk_aj_tbl_Arrangemang.ArrangemangstypID =@arrtypid
	ORDER BY kk_aj_tbl_Arrangemang.Datum DESC


IF @arrtypid = 0 AND @konstartid > 0 AND @startyear = 0

	SELECT kk_aj_tbl_Arrangemang.ArrID, kk_aj_tbl_content.Rubrik, kk_aj_tbl_content.Underrubrik, kk_aj_tbl_content.ImageUrl, kk_aj_tbl_Arrangemang.Datum, kk_aj_tbl_Arrangemang.ArrangemangstypID, 
                  kk_aj_tbl_Utovare.Organisation, kk_aj_tbl_Utovare.UtovarID, kk_aj_tbl_Konstformtyp.konstform, kk_aj_tbl_Arrangemang.KonstformID
	FROM     kk_aj_tbl_Arrangemang INNER JOIN
                  kk_aj_tbl_arridtoContent ON kk_aj_tbl_Arrangemang.ArrID = kk_aj_tbl_arridtoContent.arrid INNER JOIN
                  kk_aj_tbl_content ON kk_aj_tbl_arridtoContent.contentid = kk_aj_tbl_content.Contentid INNER JOIN
                  kk_aj_tbl_Konstformtyp ON kk_aj_tbl_Arrangemang.KonstformID = kk_aj_tbl_Konstformtyp.KonstformID INNER JOIN
                  kk_aj_tbl_Utovare ON kk_aj_tbl_Arrangemang.UtovarID = kk_aj_tbl_Utovare.UtovarID	
	WHERE (kk_aj_tbl_Arrangemang.Publicerad = @pubyesno) AND kk_aj_tbl_Arrangemang.KonstformID =@konstartid 
	ORDER BY kk_aj_tbl_Arrangemang.Datum DESC

IF @arrtypid = 0 AND @konstartid = 0 AND @startyear > 0

	SELECT kk_aj_tbl_Arrangemang.ArrID, kk_aj_tbl_content.Rubrik, kk_aj_tbl_content.Underrubrik, kk_aj_tbl_content.ImageUrl, kk_aj_tbl_Arrangemang.Datum, kk_aj_tbl_Arrangemang.ArrangemangstypID, 
                  kk_aj_tbl_Utovare.Organisation, kk_aj_tbl_Utovare.UtovarID, kk_aj_tbl_Konstformtyp.konstform, kk_aj_tbl_Arrangemang.KonstformID
	FROM     kk_aj_tbl_Arrangemang INNER JOIN
                  kk_aj_tbl_arridtoContent ON kk_aj_tbl_Arrangemang.ArrID = kk_aj_tbl_arridtoContent.arrid INNER JOIN
                  kk_aj_tbl_content ON kk_aj_tbl_arridtoContent.contentid = kk_aj_tbl_content.Contentid INNER JOIN
                  kk_aj_tbl_Konstformtyp ON kk_aj_tbl_Arrangemang.KonstformID = kk_aj_tbl_Konstformtyp.KonstformID INNER JOIN
                  kk_aj_tbl_Utovare ON kk_aj_tbl_Arrangemang.UtovarID = kk_aj_tbl_Utovare.UtovarID
	WHERE (kk_aj_tbl_Arrangemang.Publicerad =@pubyesno) AND kk_aj_tbl_Arrangemang.ArrID = Any
		(
		   SELECT DISTINCT arrid
			FROM(
				SELECT     kk_aj_tbl_fakta.arrid,kk_aj_tbl_fakta.faktaValue
				FROM         kk_aj_tbl_fakta 
				WHERE     
				kk_aj_tbl_fakta.faktatypid = 7
			UNION 
				SELECT     kk_aj_tbl_fakta.arrid,kk_aj_tbl_fakta.faktaValue
				FROM         kk_aj_tbl_fakta 
				WHERE       
				kk_aj_tbl_fakta.faktatypid = 8) faktaid
			WHERE
			(faktaValue between @startyear and @stoppyear) 
		)
	ORDER BY kk_aj_tbl_Arrangemang.Datum DESC

IF @arrtypid > 0 AND @konstartid > 0 AND @startyear = 0

	SELECT kk_aj_tbl_Arrangemang.ArrID, kk_aj_tbl_content.Rubrik, kk_aj_tbl_content.Underrubrik, kk_aj_tbl_content.ImageUrl, kk_aj_tbl_Arrangemang.Datum, kk_aj_tbl_Arrangemang.ArrangemangstypID, 
                  kk_aj_tbl_Utovare.Organisation, kk_aj_tbl_Utovare.UtovarID, kk_aj_tbl_Konstformtyp.konstform, kk_aj_tbl_Arrangemang.KonstformID
	FROM     kk_aj_tbl_Arrangemang INNER JOIN
                  kk_aj_tbl_arridtoContent ON kk_aj_tbl_Arrangemang.ArrID = kk_aj_tbl_arridtoContent.arrid INNER JOIN
                  kk_aj_tbl_content ON kk_aj_tbl_arridtoContent.contentid = kk_aj_tbl_content.Contentid INNER JOIN
                  kk_aj_tbl_Konstformtyp ON kk_aj_tbl_Arrangemang.KonstformID = kk_aj_tbl_Konstformtyp.KonstformID INNER JOIN
                  kk_aj_tbl_Utovare ON kk_aj_tbl_Arrangemang.UtovarID = kk_aj_tbl_Utovare.UtovarID	
	WHERE (kk_aj_tbl_Arrangemang.Publicerad = @pubyesno) AND kk_aj_tbl_Arrangemang.KonstformID =@konstartid AND kk_aj_tbl_Arrangemang.ArrangemangstypID =@arrtypid
	ORDER BY kk_aj_tbl_Arrangemang.Datum DESC

IF @arrtypid > 0 AND @konstartid = 0 AND @startyear > 0

	SELECT kk_aj_tbl_Arrangemang.ArrID, kk_aj_tbl_content.Rubrik, kk_aj_tbl_content.Underrubrik, kk_aj_tbl_content.ImageUrl, kk_aj_tbl_Arrangemang.Datum, kk_aj_tbl_Arrangemang.ArrangemangstypID, 
                  kk_aj_tbl_Utovare.Organisation, kk_aj_tbl_Utovare.UtovarID, kk_aj_tbl_Konstformtyp.konstform, kk_aj_tbl_Arrangemang.KonstformID
	FROM     kk_aj_tbl_Arrangemang INNER JOIN
                  kk_aj_tbl_arridtoContent ON kk_aj_tbl_Arrangemang.ArrID = kk_aj_tbl_arridtoContent.arrid INNER JOIN
                  kk_aj_tbl_content ON kk_aj_tbl_arridtoContent.contentid = kk_aj_tbl_content.Contentid INNER JOIN
                  kk_aj_tbl_Konstformtyp ON kk_aj_tbl_Arrangemang.KonstformID = kk_aj_tbl_Konstformtyp.KonstformID INNER JOIN
                  kk_aj_tbl_Utovare ON kk_aj_tbl_Arrangemang.UtovarID = kk_aj_tbl_Utovare.UtovarID
	WHERE (kk_aj_tbl_Arrangemang.Publicerad =@pubyesno) AND kk_aj_tbl_Arrangemang.ArrangemangstypID =@arrtypid AND kk_aj_tbl_Arrangemang.ArrID = Any	
		(
		   SELECT DISTINCT arrid
			FROM(
				SELECT     kk_aj_tbl_fakta.arrid,kk_aj_tbl_fakta.faktaValue
				FROM         kk_aj_tbl_fakta 
				WHERE     
				kk_aj_tbl_fakta.faktatypid = 7
			UNION 
				SELECT     kk_aj_tbl_fakta.arrid,kk_aj_tbl_fakta.faktaValue
				FROM         kk_aj_tbl_fakta 
				WHERE       
				kk_aj_tbl_fakta.faktatypid = 8) faktaid
			WHERE
			(faktaValue between @startyear and @stoppyear) 
		)
	ORDER BY kk_aj_tbl_Arrangemang.Datum DESC

IF @arrtypid = 0 AND @konstartid > 0 AND @startyear > 0

	SELECT kk_aj_tbl_Arrangemang.ArrID, kk_aj_tbl_content.Rubrik, kk_aj_tbl_content.Underrubrik, kk_aj_tbl_content.ImageUrl, kk_aj_tbl_Arrangemang.Datum, kk_aj_tbl_Arrangemang.ArrangemangstypID, 
                  kk_aj_tbl_Utovare.Organisation, kk_aj_tbl_Utovare.UtovarID, kk_aj_tbl_Konstformtyp.konstform, kk_aj_tbl_Arrangemang.KonstformID
	FROM     kk_aj_tbl_Arrangemang INNER JOIN
                  kk_aj_tbl_arridtoContent ON kk_aj_tbl_Arrangemang.ArrID = kk_aj_tbl_arridtoContent.arrid INNER JOIN
                  kk_aj_tbl_content ON kk_aj_tbl_arridtoContent.contentid = kk_aj_tbl_content.Contentid INNER JOIN
                  kk_aj_tbl_Konstformtyp ON kk_aj_tbl_Arrangemang.KonstformID = kk_aj_tbl_Konstformtyp.KonstformID INNER JOIN
                  kk_aj_tbl_Utovare ON kk_aj_tbl_Arrangemang.UtovarID = kk_aj_tbl_Utovare.UtovarID
	WHERE (kk_aj_tbl_Arrangemang.Publicerad = @pubyesno) AND kk_aj_tbl_Arrangemang.KonstformID =@konstartid AND kk_aj_tbl_Arrangemang.ArrID = Any
		(
		   SELECT DISTINCT arrid
			FROM(
				SELECT     kk_aj_tbl_fakta.arrid,kk_aj_tbl_fakta.faktaValue
				FROM         kk_aj_tbl_fakta 
				WHERE     
				kk_aj_tbl_fakta.faktatypid = 7
			UNION 
				SELECT     kk_aj_tbl_fakta.arrid,kk_aj_tbl_fakta.faktaValue
				FROM         kk_aj_tbl_fakta 
				WHERE       
				kk_aj_tbl_fakta.faktatypid = 8) faktaid
			WHERE
			(faktaValue between @startyear and @stoppyear) 
		)
	ORDER BY kk_aj_tbl_Arrangemang.Datum DESC

IF @arrtypid > 0 AND @konstartid > 0 AND @startyear > 0

	SELECT kk_aj_tbl_Arrangemang.ArrID, kk_aj_tbl_content.Rubrik, kk_aj_tbl_content.Underrubrik, kk_aj_tbl_content.ImageUrl, kk_aj_tbl_Arrangemang.Datum, kk_aj_tbl_Arrangemang.ArrangemangstypID, 
                  kk_aj_tbl_Utovare.Organisation, kk_aj_tbl_Utovare.UtovarID, kk_aj_tbl_Konstformtyp.konstform, kk_aj_tbl_Arrangemang.KonstformID
	FROM     kk_aj_tbl_Arrangemang INNER JOIN
                  kk_aj_tbl_arridtoContent ON kk_aj_tbl_Arrangemang.ArrID = kk_aj_tbl_arridtoContent.arrid INNER JOIN
                  kk_aj_tbl_content ON kk_aj_tbl_arridtoContent.contentid = kk_aj_tbl_content.Contentid INNER JOIN
                  kk_aj_tbl_Konstformtyp ON kk_aj_tbl_Arrangemang.KonstformID = kk_aj_tbl_Konstformtyp.KonstformID INNER JOIN
                  kk_aj_tbl_Utovare ON kk_aj_tbl_Arrangemang.UtovarID = kk_aj_tbl_Utovare.UtovarID
	WHERE (kk_aj_tbl_Arrangemang.Publicerad = @pubyesno) AND kk_aj_tbl_Arrangemang.KonstformID =@konstartid AND kk_aj_tbl_Arrangemang.ArrangemangstypID =@arrtypid AND kk_aj_tbl_Arrangemang.ArrID = Any
		(
		   SELECT DISTINCT arrid
			FROM(
				SELECT     kk_aj_tbl_fakta.arrid,kk_aj_tbl_fakta.faktaValue
				FROM         kk_aj_tbl_fakta 
				WHERE     
				kk_aj_tbl_fakta.faktatypid = 7
			UNION 
				SELECT     kk_aj_tbl_fakta.arrid,kk_aj_tbl_fakta.faktaValue
				FROM         kk_aj_tbl_fakta 
				WHERE       
				kk_aj_tbl_fakta.faktatypid = 8) faktaid
			WHERE
			(faktaValue between @startyear and @stoppyear) 
		)
	ORDER BY kk_aj_tbl_Arrangemang.Datum DESC

IF @arrtypid =0 AND @konstartid =0 AND @startyear =0

	SELECT kk_aj_tbl_Arrangemang.ArrID, kk_aj_tbl_content.Rubrik, kk_aj_tbl_content.Underrubrik, kk_aj_tbl_content.ImageUrl, kk_aj_tbl_Arrangemang.Datum, kk_aj_tbl_Arrangemang.ArrangemangstypID, 
                  kk_aj_tbl_Utovare.Organisation, kk_aj_tbl_Utovare.UtovarID, kk_aj_tbl_Konstformtyp.konstform, kk_aj_tbl_Arrangemang.KonstformID
	FROM     kk_aj_tbl_Arrangemang INNER JOIN
                  kk_aj_tbl_arridtoContent ON kk_aj_tbl_Arrangemang.ArrID = kk_aj_tbl_arridtoContent.arrid INNER JOIN
                  kk_aj_tbl_content ON kk_aj_tbl_arridtoContent.contentid = kk_aj_tbl_content.Contentid INNER JOIN
                  kk_aj_tbl_Konstformtyp ON kk_aj_tbl_Arrangemang.KonstformID = kk_aj_tbl_Konstformtyp.KonstformID INNER JOIN
                  kk_aj_tbl_Utovare ON kk_aj_tbl_Arrangemang.UtovarID = kk_aj_tbl_Utovare.UtovarID	
	WHERE  (kk_aj_tbl_Arrangemang.Publicerad = @pubyesno)
	ORDER BY kk_aj_tbl_Arrangemang.Datum DESC
END

GO


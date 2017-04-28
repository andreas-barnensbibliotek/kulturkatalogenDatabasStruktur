USE [dnndev_v902.me]
GO

/****** Object:  StoredProcedure [dbo].[kk_aj_proc_GetArrby_ArrStatus]    Script Date: 2017-04-28 16:25:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Andreas Josefsson
-- Create date: 2017-04-21
-- Description:	
-- 	@arrStatusTyp	<-- här anges vilken status arrangemanget har dvs om det är nya=1, godkända=2, nekade=3, eller arkiverade=4
--	@rolltypAdmin	<-- här anges om användaren är admin (värde=1) som då skall se alla poster(utifrån arrstatus) oavsett arrangemangets rolltillhörighet 
--						annars visas bara dom poster som användaren har behörighet till är medlem av den rollen eller rollerna (är bara 10 olika)
--	@roll1 int,		<-- här anges vilken poster som skall visas ut i från användarens roll. alla måste ha en siffra default = 0
--	@roll2 int,
--	@roll3 int,
--	@roll4 int,
--	@roll5 int,
--	@roll6 int,
--	@roll7 int,
--	@roll8 int,
--	@roll9 int,
--	@roll10 int,
--  @visningsperiod nvarchar(4)	<-- visningsperiod det år som arrangemangen skall visas (ex 2017) används dock inte när @arrStatusTyp = 4 
--							vilket är Arkiverade poster då skall alla visningsperioder visas
-- =============================================
CREATE PROCEDURE [dbo].[kk_aj_proc_GetArrby_ArrStatus] 
	-- Add the parameters for the stored procedure here
	@arrStatusTyp int,
	@rolltypAdmin int,
	@roll1 int,
	@roll2 int,
	@roll3 int,
	@roll4 int,
	@roll5 int,
	@roll6 int,
	@roll7 int,
	@roll8 int,
	@roll9 int,
	@roll10 int,
	@visningsperiod nvarchar(4)
AS
BEGIN

if @rolltypAdmin = 0 and @arrStatusTyp < 4
		SELECT	kk_aj_tbl_Arrangemang.ArrID, kk_aj_tbl_Arrangemang.Datum,
				(SELECT        TOP (1) kk_aj_tbl_content.Rubrik
				FROM            kk_aj_tbl_content INNER JOIN
											kk_aj_tbl_arridtoContent ON kk_aj_tbl_content.Contentid = kk_aj_tbl_arridtoContent.contentid
				WHERE        (kk_aj_tbl_arridtoContent.arrid = kk_aj_tbl_Arrangemang.ArrID and kk_aj_tbl_arridtoContent.Version = 1)
				) AS Rubrik,

				(SELECT        TOP (1) kk_aj_tbl_content_1.Underrubrik
				FROM            kk_aj_tbl_content AS kk_aj_tbl_content_1 INNER JOIN
											kk_aj_tbl_arridtoContent AS kk_aj_tbl_arridtoContent_1 ON kk_aj_tbl_content_1.Contentid = kk_aj_tbl_arridtoContent_1.contentid
				WHERE        (kk_aj_tbl_arridtoContent_1.arrid = kk_aj_tbl_Arrangemang.ArrID and kk_aj_tbl_arridtoContent_1.Version = 1)
				) AS UnderRubrik,					
				kk_aj_tbl_Arrangemang.Publicerad, kk_aj_tbl_Arrangemang.LookedAt, kk_aj_tbl_ArrangemangStatus.ArrangemangStatus, 
				kk_aj_tbl_Arrangemangtyp.arrangemangtyp, kk_aj_tbl_Konstformtyp.konstform, kk_aj_tbl_utovare.Organisation, Users.Username
		FROM	kk_aj_tbl_Arrangemang INNER JOIN
				kk_aj_tbl_utovare ON kk_aj_tbl_Arrangemang.UtovarID = kk_aj_tbl_utovare.UtovarID INNER JOIN
				kk_aj_tbl_ArrangemangStatus ON kk_aj_tbl_Arrangemang.ArrangemangStatusID = kk_aj_tbl_ArrangemangStatus.ArrangemangStatusID INNER JOIN
				kk_aj_tbl_Konstformtyp ON kk_aj_tbl_Arrangemang.KonstformID = kk_aj_tbl_Konstformtyp.KonstformID INNER JOIN
				kk_aj_tbl_Arrangemangtyp ON kk_aj_tbl_Arrangemang.ArrangemangstypID = kk_aj_tbl_Arrangemangtyp.ArrangemangstypID INNER JOIN
				Users ON kk_aj_tbl_Arrangemang.AdminuserID = Users.UserID
		WHERE	(kk_aj_tbl_ArrangemangStatus.ArrangemangStatusID = @arrStatusTyp) AND (kk_aj_tbl_Arrangemang.VisningsPeriod = @visningsperiod) AND 
		(
			(kk_aj_tbl_Arrangemang.KonstformID = @roll1) OR
			(kk_aj_tbl_Arrangemang.KonstformID = @roll2) OR
			(kk_aj_tbl_Arrangemang.KonstformID = @roll3) OR
			(kk_aj_tbl_Arrangemang.KonstformID = @roll4) OR
			(kk_aj_tbl_Arrangemang.KonstformID = @roll5) OR
			(kk_aj_tbl_Arrangemang.KonstformID = @roll6) OR
			(kk_aj_tbl_Arrangemang.KonstformID = @roll7) OR
			(kk_aj_tbl_Arrangemang.KonstformID = @roll8) OR
			(kk_aj_tbl_Arrangemang.KonstformID = @roll9) OR
			(kk_aj_tbl_Arrangemang.KonstformID = @roll10) 
		)

if @rolltypAdmin = 0 and @arrStatusTyp = 4
		SELECT	kk_aj_tbl_Arrangemang.ArrID, kk_aj_tbl_Arrangemang.Datum,
				(SELECT        TOP (1) kk_aj_tbl_content.Rubrik
				FROM            kk_aj_tbl_content INNER JOIN
											kk_aj_tbl_arridtoContent ON kk_aj_tbl_content.Contentid = kk_aj_tbl_arridtoContent.contentid
				WHERE        (kk_aj_tbl_arridtoContent.arrid = kk_aj_tbl_Arrangemang.ArrID)
				) AS Rubrik,
				(SELECT        TOP (1) kk_aj_tbl_content_1.Underrubrik
				FROM            kk_aj_tbl_content AS kk_aj_tbl_content_1 INNER JOIN
											kk_aj_tbl_arridtoContent AS kk_aj_tbl_arridtoContent_1 ON kk_aj_tbl_content_1.Contentid = kk_aj_tbl_arridtoContent_1.contentid
				WHERE        (kk_aj_tbl_arridtoContent_1.arrid = kk_aj_tbl_Arrangemang.ArrID)
				) AS UnderRubrik, 
				kk_aj_tbl_Arrangemang.Publicerad, kk_aj_tbl_Arrangemang.LookedAt, kk_aj_tbl_ArrangemangStatus.ArrangemangStatus, 
				kk_aj_tbl_Arrangemangtyp.arrangemangtyp, kk_aj_tbl_Konstformtyp.konstform, kk_aj_tbl_utovare.Organisation, Users.Username
		FROM	kk_aj_tbl_Arrangemang INNER JOIN
				kk_aj_tbl_utovare ON kk_aj_tbl_Arrangemang.UtovarID = kk_aj_tbl_utovare.UtovarID INNER JOIN
				kk_aj_tbl_ArrangemangStatus ON kk_aj_tbl_Arrangemang.ArrangemangStatusID = kk_aj_tbl_ArrangemangStatus.ArrangemangStatusID INNER JOIN
				kk_aj_tbl_Konstformtyp ON kk_aj_tbl_Arrangemang.KonstformID = kk_aj_tbl_Konstformtyp.KonstformID INNER JOIN
				kk_aj_tbl_Arrangemangtyp ON kk_aj_tbl_Arrangemang.ArrangemangstypID = kk_aj_tbl_Arrangemangtyp.ArrangemangstypID INNER JOIN
				Users ON kk_aj_tbl_Arrangemang.AdminuserID = Users.UserID
		WHERE	(kk_aj_tbl_ArrangemangStatus.ArrangemangStatusID = @arrStatusTyp) AND 
		(
			(kk_aj_tbl_Arrangemang.KonstformID = @roll1) OR
			(kk_aj_tbl_Arrangemang.KonstformID = @roll2) OR
			(kk_aj_tbl_Arrangemang.KonstformID = @roll3) OR
			(kk_aj_tbl_Arrangemang.KonstformID = @roll4) OR
			(kk_aj_tbl_Arrangemang.KonstformID = @roll5) OR
			(kk_aj_tbl_Arrangemang.KonstformID = @roll6) OR
			(kk_aj_tbl_Arrangemang.KonstformID = @roll7) OR
			(kk_aj_tbl_Arrangemang.KonstformID = @roll8) OR
			(kk_aj_tbl_Arrangemang.KonstformID = @roll9) OR
			(kk_aj_tbl_Arrangemang.KonstformID = @roll10) 
		)
	

if @rolltypAdmin = 1 and @arrStatusTyp < 4
		SELECT	kk_aj_tbl_Arrangemang.ArrID, kk_aj_tbl_Arrangemang.Datum,
				(SELECT        TOP (1) kk_aj_tbl_content.Rubrik
				FROM            kk_aj_tbl_content INNER JOIN
											kk_aj_tbl_arridtoContent ON kk_aj_tbl_content.Contentid = kk_aj_tbl_arridtoContent.contentid
				WHERE        (kk_aj_tbl_arridtoContent.arrid = kk_aj_tbl_Arrangemang.ArrID and kk_aj_tbl_arridtoContent.Version = 1)
				) AS Rubrik,

				(SELECT        TOP (1) kk_aj_tbl_content_1.Underrubrik
				FROM            kk_aj_tbl_content AS kk_aj_tbl_content_1 INNER JOIN
											kk_aj_tbl_arridtoContent AS kk_aj_tbl_arridtoContent_1 ON kk_aj_tbl_content_1.Contentid = kk_aj_tbl_arridtoContent_1.contentid
				WHERE        (kk_aj_tbl_arridtoContent_1.arrid = kk_aj_tbl_Arrangemang.ArrID and kk_aj_tbl_arridtoContent_1.Version = 1)
				) AS UnderRubrik,						
				kk_aj_tbl_Arrangemang.Publicerad, kk_aj_tbl_Arrangemang.LookedAt, kk_aj_tbl_ArrangemangStatus.ArrangemangStatus, 
				kk_aj_tbl_Arrangemangtyp.arrangemangtyp, kk_aj_tbl_Konstformtyp.konstform, kk_aj_tbl_utovare.Organisation, Users.Username
		FROM	kk_aj_tbl_Arrangemang INNER JOIN
				kk_aj_tbl_utovare ON kk_aj_tbl_Arrangemang.UtovarID = kk_aj_tbl_utovare.UtovarID INNER JOIN
				kk_aj_tbl_ArrangemangStatus ON kk_aj_tbl_Arrangemang.ArrangemangStatusID = kk_aj_tbl_ArrangemangStatus.ArrangemangStatusID INNER JOIN
				kk_aj_tbl_Konstformtyp ON kk_aj_tbl_Arrangemang.KonstformID = kk_aj_tbl_Konstformtyp.KonstformID INNER JOIN
				kk_aj_tbl_Arrangemangtyp ON kk_aj_tbl_Arrangemang.ArrangemangstypID = kk_aj_tbl_Arrangemangtyp.ArrangemangstypID INNER JOIN
				Users ON kk_aj_tbl_Arrangemang.AdminuserID = Users.UserID
		WHERE	(kk_aj_tbl_ArrangemangStatus.ArrangemangStatusID = @arrStatusTyp) AND (kk_aj_tbl_Arrangemang.VisningsPeriod = @visningsperiod)
	
if @rolltypAdmin = 1 and @arrStatusTyp = 4
		SELECT	kk_aj_tbl_Arrangemang.ArrID, kk_aj_tbl_Arrangemang.Datum,
				(SELECT        TOP (1) kk_aj_tbl_content.Rubrik
				FROM            kk_aj_tbl_content INNER JOIN
											kk_aj_tbl_arridtoContent ON kk_aj_tbl_content.Contentid = kk_aj_tbl_arridtoContent.contentid
				WHERE        (kk_aj_tbl_arridtoContent.arrid = kk_aj_tbl_Arrangemang.ArrID and kk_aj_tbl_arridtoContent.Version = 1)
				) AS Rubrik,

				(SELECT        TOP (1) kk_aj_tbl_content_1.Underrubrik
				FROM            kk_aj_tbl_content AS kk_aj_tbl_content_1 INNER JOIN
											kk_aj_tbl_arridtoContent AS kk_aj_tbl_arridtoContent_1 ON kk_aj_tbl_content_1.Contentid = kk_aj_tbl_arridtoContent_1.contentid
				WHERE        (kk_aj_tbl_arridtoContent_1.arrid = kk_aj_tbl_Arrangemang.ArrID and kk_aj_tbl_arridtoContent_1.Version = 1)
				) AS UnderRubrik,					
				kk_aj_tbl_Arrangemang.Publicerad, kk_aj_tbl_Arrangemang.LookedAt, kk_aj_tbl_ArrangemangStatus.ArrangemangStatus, 
				kk_aj_tbl_Arrangemangtyp.arrangemangtyp, kk_aj_tbl_Konstformtyp.konstform, kk_aj_tbl_utovare.Organisation, Users.Username
		FROM	kk_aj_tbl_Arrangemang INNER JOIN
				kk_aj_tbl_utovare ON kk_aj_tbl_Arrangemang.UtovarID = kk_aj_tbl_utovare.UtovarID INNER JOIN
				kk_aj_tbl_ArrangemangStatus ON kk_aj_tbl_Arrangemang.ArrangemangStatusID = kk_aj_tbl_ArrangemangStatus.ArrangemangStatusID INNER JOIN
				kk_aj_tbl_Konstformtyp ON kk_aj_tbl_Arrangemang.KonstformID = kk_aj_tbl_Konstformtyp.KonstformID INNER JOIN
				kk_aj_tbl_Arrangemangtyp ON kk_aj_tbl_Arrangemang.ArrangemangstypID = kk_aj_tbl_Arrangemangtyp.ArrangemangstypID INNER JOIN
				Users ON kk_aj_tbl_Arrangemang.AdminuserID = Users.UserID
		WHERE	(kk_aj_tbl_ArrangemangStatus.ArrangemangStatusID = @arrStatusTyp)

END

GO


USE [dnndev_v902.me]
GO

/****** Object:  StoredProcedure [dbo].[kk_aj_proc_GetArrGranskaDetails]    Script Date: 2018-01-23 13:45:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Andreas Josefsson
-- Create date: <Create Date,,>
-- Description:	Visar endast arrangemangsdetaljer som är nya och ej publicerade
-- =============================================
CREATE PROCEDURE [dbo].[kk_aj_proc_GetArrGranskaDetails]
	-- Add the parameters for the stored procedure here
	@arrID int

AS
BEGIN
	SELECT        TOP (1) kk_aj_tbl_Arrangemang.ArrID, kk_aj_tbl_Arrangemang.Datum, kk_aj_tbl_Arrangemang.Publicerad, kk_aj_tbl_Arrangemang.LookedAt, kk_aj_tbl_Arrangemang.VisningsPeriod, kk_aj_tbl_Arrangemang.AdminuserID, 
                         kk_aj_tbl_Arrangemang.UtovarID, kk_aj_tbl_Utovare.Organisation, kk_aj_tbl_Utovare.Fornamn, kk_aj_tbl_Utovare.Efternamn, kk_aj_tbl_Utovare.Telefonnummer, kk_aj_tbl_Utovare.Adress, kk_aj_tbl_Utovare.Postnr, 
                         kk_aj_tbl_Utovare.Ort, kk_aj_tbl_Utovare.Epost, kk_aj_tbl_Utovare.Kommun, kk_aj_tbl_Utovare.Hemsida, kk_aj_tbl_Konstformtyp.konstform, kk_aj_tbl_Arrangemangtyp.arrangemangtyp, 
                         kk_aj_tbl_Arrangemangtyp.ArrangemangstypID, kk_aj_tbl_Konstformtyp.KonstformID, kk_aj_tbl_content.Rubrik, kk_aj_tbl_content.Underrubrik, kk_aj_tbl_content.ContentText, kk_aj_tbl_content.ImageUrl, 
                         kk_aj_tbl_content.ImageFilename, kk_aj_tbl_content.ImageSize, kk_aj_tbl_content.ImageAlt, kk_aj_tbl_content.ImageFotograf, kk_aj_tbl_content.MovieClipUrl, kk_aj_tbl_content.MovieClipFilename, 
                         kk_aj_tbl_content.MovieClipSize, kk_aj_tbl_content.MovieClipAlt, kk_aj_tbl_content.MovieClipCredits, kk_aj_tbl_ArrangemangStatus.ArrangemangStatus, kk_aj_tbl_ArrangemangStatus.ArrangemangStatusID, 
                         kk_aj_tbl_arridtoContent.Version, kk_aj_tbl_content.Contentid, kk_aj_tbl_Kontakt.fornamn AS kontaktfornamn, kk_aj_tbl_Kontakt.Efternamn AS kontaktefternamn, kk_aj_tbl_Kontakt.Epost AS kontaktepost, kk_aj_tbl_Kontakt.Telefon,
						 kk_aj_tbl_Arrangemang.konstform2, kk_aj_tbl_Arrangemang.konstform3
FROM            kk_aj_tbl_Arrangemang INNER JOIN
                         kk_aj_tbl_Arrangemangtyp ON kk_aj_tbl_Arrangemang.ArrangemangstypID = kk_aj_tbl_Arrangemangtyp.ArrangemangstypID INNER JOIN
                         kk_aj_tbl_arridtoContent ON kk_aj_tbl_Arrangemang.ArrID = kk_aj_tbl_arridtoContent.arrid INNER JOIN
                         kk_aj_tbl_content ON kk_aj_tbl_arridtoContent.contentid = kk_aj_tbl_content.Contentid INNER JOIN
                         kk_aj_tbl_Konstformtyp ON kk_aj_tbl_Arrangemang.KonstformID = kk_aj_tbl_Konstformtyp.KonstformID INNER JOIN
                         kk_aj_tbl_ArrangemangStatus ON kk_aj_tbl_Arrangemang.ArrangemangStatusID = kk_aj_tbl_ArrangemangStatus.ArrangemangStatusID INNER JOIN
                         kk_aj_tbl_Utovare ON kk_aj_tbl_Arrangemang.UtovarID = kk_aj_tbl_Utovare.UtovarID INNER JOIN
                         kk_aj_tbl_Kontakt ON kk_aj_tbl_Arrangemang.kontaktid = kk_aj_tbl_Kontakt.kontaktid
WHERE			(kk_aj_tbl_Arrangemang.ArrID = @arrID) 
				AND (kk_aj_tbl_Arrangemang.Publicerad = N'nej') 
				AND (kk_aj_tbl_Arrangemang.ArrangemangStatusID = 1)
ORDER BY kk_aj_tbl_arridtoContent.Version DESC
END

GO


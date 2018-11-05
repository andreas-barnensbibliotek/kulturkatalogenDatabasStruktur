USE [dnndev_v902.me]
GO

/****** Object:  StoredProcedure [dbo].[kk_aj_proc_Getarrby_Redovisning]    Script Date: 2018-06-15 12:04:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[kk_aj_proc_Getarrby_Redovisning] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SELECT        kk_aj_tbl_Arrangemang.ArrID, kk_aj_tbl_content.Rubrik, kk_aj_tbl_content.Underrubrik, kk_aj_tbl_Utovare.UtovarID, kk_aj_tbl_Utovare.Organisation, kk_aj_tbl_Utovare.Fornamn, kk_aj_tbl_Utovare.Efternamn, 
                         kk_aj_tbl_Utovare.Telefonnummer, kk_aj_tbl_Utovare.Adress, kk_aj_tbl_Utovare.Postnr, kk_aj_tbl_Utovare.Ort, kk_aj_tbl_Utovare.Epost, kk_aj_tbl_Utovare.Kommun, kk_aj_tbl_Utovare.Hemsida, 
                         kk_aj_tbl_Arrangemang.KonstformID, kk_aj_tbl_Arrangemang.ArrangemangstypID, kk_aj_tbl_Konstformtyp.konstform, kk_aj_tbl_Arrangemangtyp.arrangemangtyp, kk_aj_tbl_Arrangemang.VisningsPeriod, 
                         kk_aj_tbl_Arrangemang.Datum
FROM            kk_aj_tbl_Arrangemang INNER JOIN
                         kk_aj_tbl_arridtoContent ON kk_aj_tbl_Arrangemang.ArrID = kk_aj_tbl_arridtoContent.arrid INNER JOIN
                         kk_aj_tbl_content ON kk_aj_tbl_arridtoContent.contentid = kk_aj_tbl_content.Contentid INNER JOIN
                         kk_aj_tbl_Utovare ON kk_aj_tbl_Arrangemang.UtovarID = kk_aj_tbl_Utovare.UtovarID INNER JOIN
                         kk_aj_tbl_Arrangemangtyp ON kk_aj_tbl_Arrangemang.ArrangemangstypID = kk_aj_tbl_Arrangemangtyp.ArrangemangstypID INNER JOIN
                         kk_aj_tbl_Konstformtyp ON kk_aj_tbl_Arrangemang.KonstformID = kk_aj_tbl_Konstformtyp.KonstformID
WHERE        (kk_aj_tbl_Arrangemang.ArrangemangStatusID = 2)
END

GO


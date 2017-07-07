USE [dnndev_v902.me]
GO

/****** Object:  StoredProcedure [dbo].[kk_aj_proc_GetArrby_LatestEvent]    Script Date: 2017-07-07 11:07:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Andreas Josefsson
-- Create date: 2017-04-21
-- Description:	
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
--	@roll11 int,
--	@roll12 int,
--	@roll13 int,
--	@roll14 int
--  @visningsperiod nvarchar(4)	<-- visningsperiod det år som arrangemangen skall visas (ex 2017) används dock inte när @arrStatusTyp = 4 
--							vilket är Arkiverade poster då skall alla visningsperioder visas
-- =============================================
CREATE PROCEDURE [dbo].[kk_aj_proc_GetArrby_LatestEvent] 
	-- Add the parameters for the stored procedure here	
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
	@roll11 int,
	@roll12 int,
	@roll13 int,
	@roll14 int,
	@visningsperiod nvarchar(4)
AS
BEGIN

if @rolltypAdmin = 0 
		SELECT        kk_aj_tbl_Arrangemang.ArrID, kk_aj_tbl_ArrangemangStatus.ArrangemangStatus, kk_aj_tbl_Log.datum, kk_aj_tbl_Arrangemang.KonstformID, kk_aj_tbl_LogtypTypes.logtyp, kk_aj_tbl_Arrangemang.UtovarID, kk_aj_tbl_LogStatusTypes.statustyp, 
                         kk_aj_tbl_Konstformtyp.dnnRollid
FROM            kk_aj_tbl_Arrangemang INNER JOIN
                         kk_aj_tbl_ArrangemangStatus ON kk_aj_tbl_Arrangemang.ArrangemangStatusID = kk_aj_tbl_ArrangemangStatus.ArrangemangStatusID INNER JOIN
                         kk_aj_tbl_Log ON kk_aj_tbl_Arrangemang.ArrID = kk_aj_tbl_Log.arrid INNER JOIN
                         kk_aj_tbl_LogStatusTypes ON kk_aj_tbl_Log.statusid = kk_aj_tbl_LogStatusTypes.statusid INNER JOIN
                         kk_aj_tbl_LogtypTypes ON kk_aj_tbl_Log.logtypid = kk_aj_tbl_LogtypTypes.logtypid INNER JOIN
                         kk_aj_tbl_Konstformtyp ON kk_aj_tbl_Arrangemang.KonstformID = kk_aj_tbl_Konstformtyp.KonstformID
WHERE (
			(kk_aj_tbl_Konstformtyp.KonstformID = @roll1) OR
			(kk_aj_tbl_Konstformtyp.KonstformID = @roll2) OR
			(kk_aj_tbl_Konstformtyp.KonstformID = @roll3) OR
			(kk_aj_tbl_Konstformtyp.KonstformID = @roll4) OR
			(kk_aj_tbl_Konstformtyp.KonstformID = @roll5) OR
			(kk_aj_tbl_Konstformtyp.KonstformID = @roll6) OR
			(kk_aj_tbl_Konstformtyp.KonstformID = @roll7) OR
			(kk_aj_tbl_Konstformtyp.KonstformID = @roll8) OR
			(kk_aj_tbl_Konstformtyp.KonstformID = @roll9) OR
			(kk_aj_tbl_Konstformtyp.KonstformID = @roll10) OR
			(kk_aj_tbl_Konstformtyp.KonstformID = @roll11) OR
			(kk_aj_tbl_Konstformtyp.KonstformID = @roll12) OR
			(kk_aj_tbl_Konstformtyp.KonstformID = @roll13) OR
			(kk_aj_tbl_Konstformtyp.KonstformID = @roll14) 
		)
ORDER BY kk_aj_tbl_Log.datum DESC

if @rolltypAdmin = 1
		SELECT kk_aj_tbl_Arrangemang.ArrID, kk_aj_tbl_ArrangemangStatus.ArrangemangStatus, kk_aj_tbl_Log.datum, kk_aj_tbl_Arrangemang.KonstformID, kk_aj_tbl_LogtypTypes.logtyp, kk_aj_tbl_Arrangemang.UtovarID, kk_aj_tbl_LogStatusTypes.statustyp
FROM     kk_aj_tbl_Arrangemang INNER JOIN
                  kk_aj_tbl_ArrangemangStatus ON kk_aj_tbl_Arrangemang.ArrangemangStatusID = kk_aj_tbl_ArrangemangStatus.ArrangemangStatusID INNER JOIN
                  kk_aj_tbl_Log ON kk_aj_tbl_Arrangemang.ArrID = kk_aj_tbl_Log.arrid INNER JOIN
                  kk_aj_tbl_LogStatusTypes ON kk_aj_tbl_Log.statusid = kk_aj_tbl_LogStatusTypes.statusid INNER JOIN
                  kk_aj_tbl_LogtypTypes ON kk_aj_tbl_Log.logtypid = kk_aj_tbl_LogtypTypes.logtypid	
	ORDER BY kk_aj_tbl_Log.datum DESC
END

GO


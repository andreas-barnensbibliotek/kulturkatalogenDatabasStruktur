USE [dnndev_v902.me]
GO

/****** Object:  StoredProcedure [dbo].[kk_aj_proc_getStatusCount]    Script Date: 2017-04-28 16:25:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- Returnerar antal "nya" ej lästa poster 
-- =============================================
CREATE PROCEDURE [dbo].[kk_aj_proc_getStatusCount]
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


if @rolltypAdmin = 0 and @arrStatusTyp < 4
	SELECT        COUNT(ArrID) AS antal
FROM            kk_aj_tbl_Arrangemang
WHERE        (VisningsPeriod = @visningsperiod)AND (LookedAt = N'Nej') AND (ArrangemangStatusID = @arrStatusTyp) AND (KonstformID = @roll1 OR
                         KonstformID = @roll2 OR
                         KonstformID = @roll3 OR
                         KonstformID = @roll4 OR
                         KonstformID = @roll5 OR
                         KonstformID = @roll6 OR
                         KonstformID = @roll7 OR
                         KonstformID = @roll8 OR
                         KonstformID = @roll9 OR
                         KonstformID = @roll10) 

if @rolltypAdmin = 0 and @arrStatusTyp = 4
	SELECT        COUNT(ArrID) AS antal
	FROM            kk_aj_tbl_Arrangemang
	WHERE        (ArrangemangStatusID = @arrStatusTyp)AND (LookedAt = N'Nej') AND (KonstformID = @roll1 OR
                         KonstformID = @roll2 OR
                         KonstformID = @roll3 OR
                         KonstformID = @roll4 OR
                         KonstformID = @roll5 OR
                         KonstformID = @roll6 OR
                         KonstformID = @roll7 OR
                         KonstformID = @roll8 OR
                         KonstformID = @roll9 OR
                         KonstformID = @roll10) 
	

if @rolltypAdmin = 1 and @arrStatusTyp < 4
	SELECT        COUNT(ArrID) AS antal
	FROM            kk_aj_tbl_Arrangemang
	WHERE	(ArrangemangStatusID = @arrStatusTyp) AND (LookedAt = N'Nej') AND (kk_aj_tbl_Arrangemang.VisningsPeriod = @visningsperiod)
	

if @rolltypAdmin = 1 and @arrStatusTyp = 4
	SELECT        COUNT(ArrID) AS antal
	FROM            kk_aj_tbl_Arrangemang
	WHERE	(ArrangemangStatusID = @arrStatusTyp) AND (LookedAt = N'Nej')
GO


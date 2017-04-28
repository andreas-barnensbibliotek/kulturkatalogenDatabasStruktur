USE [dnndev_v902.me]
GO

/****** Object:  StoredProcedure [dbo].[kk_aj_proc_getlog]    Script Date: 2017-04-28 16:25:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[kk_aj_proc_getlog]
	@typ int,
	@id int
	  
AS
BEGIN

if @typ = 1

	SELECT        kk_aj_tbl_Log.logid, kk_aj_tbl_LogtypTypes.logtyp, kk_aj_tbl_LogStatusTypes.statustyp, kk_aj_tbl_Log.beskrivning, kk_aj_tbl_Log.datum, Users.Username, kk_aj_tbl_Log.arrid, kk_aj_tbl_Log.logtypid, 
                         kk_aj_tbl_Log.statusid, kk_aj_tbl_Log.changebyuserid
FROM            kk_aj_tbl_Log INNER JOIN
                         kk_aj_tbl_LogStatusTypes ON kk_aj_tbl_Log.statusid = kk_aj_tbl_LogStatusTypes.statusid INNER JOIN
                         kk_aj_tbl_LogtypTypes ON kk_aj_tbl_Log.logtypid = kk_aj_tbl_LogtypTypes.logtypid INNER JOIN
                         Users ON kk_aj_tbl_Log.changebyuserid = Users.UserID
WHERE        (kk_aj_tbl_Log.arrid = @id)
ORDER BY kk_aj_tbl_Log.datum DESC


if @typ =2
SELECT        kk_aj_tbl_Log.logid, kk_aj_tbl_LogtypTypes.logtyp, kk_aj_tbl_LogStatusTypes.statustyp, kk_aj_tbl_Log.beskrivning, kk_aj_tbl_Log.datum, Users.Username, kk_aj_tbl_Log.arrid, kk_aj_tbl_Log.logtypid, 
                         kk_aj_tbl_Log.statusid, kk_aj_tbl_Log.changebyuserid
FROM            kk_aj_tbl_Log INNER JOIN
                         kk_aj_tbl_LogStatusTypes ON kk_aj_tbl_Log.statusid = kk_aj_tbl_LogStatusTypes.statusid INNER JOIN
                         kk_aj_tbl_LogtypTypes ON kk_aj_tbl_Log.logtypid = kk_aj_tbl_LogtypTypes.logtypid INNER JOIN
                         Users ON kk_aj_tbl_Log.changebyuserid = Users.UserID
WHERE        (kk_aj_tbl_Log.logtypid = @id)
ORDER BY kk_aj_tbl_Log.datum DESC

if @typ =3
SELECT        kk_aj_tbl_Log.logid, kk_aj_tbl_LogtypTypes.logtyp, kk_aj_tbl_LogStatusTypes.statustyp, kk_aj_tbl_Log.beskrivning, kk_aj_tbl_Log.datum, Users.Username, kk_aj_tbl_Log.arrid, kk_aj_tbl_Log.logtypid, 
                         kk_aj_tbl_Log.statusid, kk_aj_tbl_Log.changebyuserid
FROM            kk_aj_tbl_Log INNER JOIN
                         kk_aj_tbl_LogStatusTypes ON kk_aj_tbl_Log.statusid = kk_aj_tbl_LogStatusTypes.statusid INNER JOIN
                         kk_aj_tbl_LogtypTypes ON kk_aj_tbl_Log.logtypid = kk_aj_tbl_LogtypTypes.logtypid INNER JOIN
                         Users ON kk_aj_tbl_Log.changebyuserid = Users.UserID
WHERE        (kk_aj_tbl_Log.statusid = @id)
ORDER BY kk_aj_tbl_Log.datum DESC

END

GO


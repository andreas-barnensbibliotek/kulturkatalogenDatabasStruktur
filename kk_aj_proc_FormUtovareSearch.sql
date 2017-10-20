USE [dnndev_v902.me]
GO

/****** Object:  StoredProcedure [dbo].[kk_aj_proc_FormUtovareSearch]    Script Date: 2017-09-04 09:02:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[kk_aj_proc_FormUtovareSearch]
	-- Add the parameters for the stored procedure here
	@epost nvarchar(200),
	@postnr nvarchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT UtovarID, Organisation, Fornamn, Efternamn, Telefonnummer, Adress, Postnr, Ort, Epost, Kommun, Hemsida, Ovrigt, Bild
FROM     kk_aj_tbl_Utovare
WHERE  (Epost = @epost) AND (Postnr = @postnr)
END

GO


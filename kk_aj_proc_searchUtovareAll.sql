USE [dnndev_v902.me]
GO

/****** Object:  StoredProcedure [dbo].[kk_aj_proc_searchUtovareAll]    Script Date: 2017-06-29 09:00:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Andreas Josefsson>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[kk_aj_proc_searchUtovareAll]
	-- Add the parameters for the stored procedure here
	@search nvarchar(500)

AS
BEGIN
	SELECT * FROM  kk_aj_tbl_Utovare
	WHERE        (Organisation like '%'+ @search +'%')
						 OR (Fornamn like '%'+ @search +'%') 
						 OR (Efternamn like '%'+ @search +'%') 
						 OR (Telefonnummer like '%'+ @search +'%') 
						 OR (Adress like '%'+ @search +'%')
						 OR (Postnr like '%'+ @search +'%') 
						 OR (Ort like '%'+ @search +'%') 
						 OR (Epost like '%'+ @search +'%') 
						 OR (Kommun like '%'+ @search +'%') 
						 OR (Hemsida like '%'+ @search +'%') 
						 OR (Ovrigt like '%'+ @search +'%')
END

GO


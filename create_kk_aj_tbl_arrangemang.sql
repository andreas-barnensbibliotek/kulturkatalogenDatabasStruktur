USE [dnndev_v902.me]
GO

/****** Object:  Table [dbo].[kk_aj_tbl_Arrangemang]    Script Date: 2017-04-28 16:21:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[kk_aj_tbl_Arrangemang](
	[ArrID] [int] IDENTITY(1,1) NOT NULL,
	[ArrangemangstypID] [int] NULL,
	[KonstformID] [int] NULL,
	[UtovarID] [int] NULL,
	[AdminuserID] [int] NULL,
	[ArrangemangStatusID] [int] NULL,
	[Datum] [datetime] NULL,
	[Publicerad] [nvarchar](10) NULL,
	[LookedAt] [nvarchar](10) NULL,
	[VisningsPeriod] [nvarchar](10) NULL,
 CONSTRAINT [PK_kk_aj_tbl_Arrangemang] PRIMARY KEY CLUSTERED 
(
	[ArrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[kk_aj_tbl_Arrangemang] ADD  CONSTRAINT [DF_kk_aj_tbl_Arrangemang_datum]  DEFAULT (getdate()) FOR [Datum]
GO

ALTER TABLE [dbo].[kk_aj_tbl_Arrangemang] ADD  CONSTRAINT [DF_kk_aj_tbl_Arrangemang_VisningsPeriod]  DEFAULT (datepart(year,getdate())) FOR [VisningsPeriod]
GO


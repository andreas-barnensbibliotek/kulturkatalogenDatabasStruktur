USE [dnndev_v902.me]
GO

/****** Object:  Table [dbo].[kk_aj_tbl_ArrGrupp]    Script Date: 2017-08-25 09:10:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[kk_aj_tbl_ArrGrupp](
	[arrgruppID] [int] IDENTITY(1,1) NOT NULL,
	[arrgrupptitel] [nvarchar](250) NULL,
	[datum] [datetime] NULL,
 CONSTRAINT [PK_kk_aj_tbl_ArrGrupp] PRIMARY KEY CLUSTERED 
(
	[arrgruppID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[kk_aj_tbl_ArrGrupp] ADD  CONSTRAINT [DF_kk_aj_tbl_ArrGrupp_datum]  DEFAULT (getdate()) FOR [datum]
GO


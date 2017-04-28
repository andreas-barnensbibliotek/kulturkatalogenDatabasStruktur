USE [dnndev_v902.me]
GO

/****** Object:  Table [dbo].[kk_aj_tbl_Konstformtyp]    Script Date: 2017-04-28 16:23:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[kk_aj_tbl_Konstformtyp](
	[KonstformID] [int] IDENTITY(1,1) NOT NULL,
	[konstform] [nvarchar](250) NULL,
	[dnnRollid] [int] NULL,
 CONSTRAINT [PK_kk_aj_konstformtyp] PRIMARY KEY CLUSTERED 
(
	[KonstformID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


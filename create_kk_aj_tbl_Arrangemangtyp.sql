USE [dnndev_v902.me]
GO

/****** Object:  Table [dbo].[kk_aj_tbl_Arrangemangtyp]    Script Date: 2017-04-28 16:22:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[kk_aj_tbl_Arrangemangtyp](
	[ArrangemangstypID] [int] IDENTITY(1,1) NOT NULL,
	[arrangemangtyp] [nvarchar](250) NULL,
 CONSTRAINT [PK_kk_aj_Arrangemangtyp] PRIMARY KEY CLUSTERED 
(
	[ArrangemangstypID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


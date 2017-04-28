USE [dnndev_v902.me]
GO

/****** Object:  Table [dbo].[kk_aj_tbl_ArrangemangStatus]    Script Date: 2017-04-28 16:21:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[kk_aj_tbl_ArrangemangStatus](
	[ArrangemangStatusID] [int] IDENTITY(1,1) NOT NULL,
	[ArrangemangStatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_kk_aj_tbl_ArrangemangStatus] PRIMARY KEY CLUSTERED 
(
	[ArrangemangStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


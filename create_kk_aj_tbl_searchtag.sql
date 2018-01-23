USE [dnndev_v902.me]
GO

/****** Object:  Table [dbo].[kk_aj_tbl_searchtag]    Script Date: 2018-01-23 13:44:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[kk_aj_tbl_searchtag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[arrid] [int] NULL,
	[tag] [nvarchar](50) NULL,
 CONSTRAINT [PK_kk_aj_tbl_searchtag] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [dnndev_v902.me]
GO

/****** Object:  Table [dbo].[kk_aj_tbl_faktatyp]    Script Date: 2017-04-28 16:23:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[kk_aj_tbl_faktatyp](
	[faktatypid] [int] IDENTITY(1,1) NOT NULL,
	[Faktarubrik] [nvarchar](150) NULL,
 CONSTRAINT [PK_kk_aj_tbl_faktatyp] PRIMARY KEY CLUSTERED 
(
	[faktatypid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


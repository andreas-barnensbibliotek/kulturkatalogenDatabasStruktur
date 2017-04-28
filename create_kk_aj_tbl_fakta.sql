USE [dnndev_v902.me]
GO

/****** Object:  Table [dbo].[kk_aj_tbl_fakta]    Script Date: 2017-04-28 16:23:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[kk_aj_tbl_fakta](
	[faktaid] [int] IDENTITY(1,1) NOT NULL,
	[arrid] [int] NULL,
	[faktatypid] [int] NULL,
	[faktaValue] [nvarchar](450) NULL,
 CONSTRAINT [PK_kk_aj_tbl_fakta] PRIMARY KEY CLUSTERED 
(
	[faktaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


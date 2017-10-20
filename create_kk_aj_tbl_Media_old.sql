USE [dnndev_v902.me]
GO

/****** Object:  Table [dbo].[kk_aj_tbl_Media]    Script Date: 2017-06-27 12:04:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[kk_aj_tbl_Media](
	[mediaID] [int] IDENTITY(1,1) NOT NULL,
	[contentID] [int] NULL,
	[mediaUrl] [nvarchar](250) NULL,
	[mediaFileName] [nvarchar](150) NULL,
	[mediaSize] [nvarchar](20) NULL,
	[mediaAlt] [nvarchar](250) NULL,
	[mediaFoto] [nvarchar](150) NULL,
	[mediaTyp] [nvarchar](50) NULL,
	[mediaVald] [nvarchar](10) NULL,
 CONSTRAINT [PK_kk_aj_tblMedia] PRIMARY KEY CLUSTERED 
(
	[mediaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [dnndev_v902.me]
GO

/****** Object:  Table [dbo].[kk_aj_tbl_Notifieringar]    Script Date: 2017-05-23 16:39:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[kk_aj_tbl_Notifieringar](
	[noteID] [int] IDENTITY(1,1) NOT NULL,
	[noteTypId] [int] NULL,
	[userid] [int] NULL,
	[title] [nvarchar](100) NULL,
	[url] [nvarchar](250) NULL,
	[extranote] [nvarchar](250) NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_kk_aj_tbl_Notifieringar] PRIMARY KEY CLUSTERED 
(
	[noteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[kk_aj_tbl_Notifieringar] ADD  CONSTRAINT [DF_kk_aj_tbl_Notifieringar_date]  DEFAULT (getdate()) FOR [date]
GO


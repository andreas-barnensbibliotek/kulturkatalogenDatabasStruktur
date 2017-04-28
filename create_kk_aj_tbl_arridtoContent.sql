USE [dnndev_v902.me]
GO

/****** Object:  Table [dbo].[kk_aj_tbl_arridtoContent]    Script Date: 2017-04-28 16:22:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[kk_aj_tbl_arridtoContent](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[arrid] [int] NULL,
	[contentid] [int] NULL,
	[Version] [int] NULL,
	[datum] [datetime] NULL,
 CONSTRAINT [PK_kk_aj_tbl_arridtoContent] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[kk_aj_tbl_arridtoContent] ADD  CONSTRAINT [DF_kk_aj_tbl_arridtoContent_datum]  DEFAULT (getdate()) FOR [datum]
GO


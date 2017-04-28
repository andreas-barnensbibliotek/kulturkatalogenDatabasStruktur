USE [dnndev_v902.me]
GO

/****** Object:  Table [dbo].[kk_aj_tbl_content]    Script Date: 2017-04-28 16:22:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[kk_aj_tbl_content](
	[Contentid] [int] IDENTITY(1,1) NOT NULL,
	[Rubrik] [nvarchar](250) NULL,
	[Underrubrik] [nvarchar](250) NULL,
	[ContentText] [nvarchar](4000) NULL,
	[ImageUrl] [nvarchar](1000) NULL,
	[ImageFilename] [nvarchar](100) NULL,
	[ImageSize] [nvarchar](50) NULL,
	[ImageAlt] [nvarchar](150) NULL,
	[ImageFotograf] [nvarchar](100) NULL,
	[MovieClipUrl] [nvarchar](1000) NULL,
	[MovieClipFilename] [nvarchar](100) NULL,
	[MovieClipSize] [nvarchar](50) NULL,
	[MovieClipAlt] [nvarchar](150) NULL,
	[MovieClipCredits] [nvarchar](100) NULL,
	[datum] [datetime] NULL,
 CONSTRAINT [PK_kk_aj_tbl_content] PRIMARY KEY CLUSTERED 
(
	[Contentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[kk_aj_tbl_content] ADD  CONSTRAINT [DF_kk_aj_tbl_content_datum]  DEFAULT (getdate()) FOR [datum]
GO


USE [dnndev_v902.me]
GO

/****** Object:  Table [dbo].[kk_aj_tbl_MediaTyp]    Script Date: 2017-06-27 12:05:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[kk_aj_tbl_MediaTyp](
	[mediatypID] [int] IDENTITY(1,1) NOT NULL,
	[mediatyp] [nvarchar](50) NULL,
 CONSTRAINT [PK_kk_aj_tbl_MediaTyp] PRIMARY KEY CLUSTERED 
(
	[mediatypID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


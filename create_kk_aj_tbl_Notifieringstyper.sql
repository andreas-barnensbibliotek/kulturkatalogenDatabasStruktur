USE [dnndev_v902.me]
GO

/****** Object:  Table [dbo].[kk_aj_tbl_Notifieringstyper]    Script Date: 2017-05-23 16:39:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[kk_aj_tbl_Notifieringstyper](
	[noteTypID] [int] IDENTITY(1,1) NOT NULL,
	[notetyp] [nvarchar](50) NULL,
 CONSTRAINT [PK_kk_aj_tbl_notifieringstyper] PRIMARY KEY CLUSTERED 
(
	[noteTypID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


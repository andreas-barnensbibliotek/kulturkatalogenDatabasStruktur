USE [dnndev_v902.me]
GO

/****** Object:  Table [dbo].[kk_aj_tbl_Log]    Script Date: 2017-04-28 16:23:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[kk_aj_tbl_Log](
	[logid] [int] IDENTITY(1,1) NOT NULL,
	[logtypid] [int] NULL,
	[arrid] [int] NULL,
	[beskrivning] [nvarchar](4000) NULL,
	[datum] [datetime] NULL,
	[statusid] [int] NULL,
	[changebyuserid] [int] NULL,
	[currenttimestamp] [timestamp] NULL,
 CONSTRAINT [PK_kk_aj_tbl_Log] PRIMARY KEY CLUSTERED 
(
	[logid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[kk_aj_tbl_Log] ADD  CONSTRAINT [DF_kk_aj_tbl_Log_datum]  DEFAULT (getdate()) FOR [datum]
GO


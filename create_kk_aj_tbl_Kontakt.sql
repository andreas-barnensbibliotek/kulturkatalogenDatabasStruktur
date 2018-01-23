USE [dnndev_v902.me]
GO

/****** Object:  Table [dbo].[kk_aj_tbl_Kontakt]    Script Date: 2018-01-23 13:43:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[kk_aj_tbl_Kontakt](
	[kontaktid] [int] IDENTITY(1,1) NOT NULL,
	[fornamn] [nvarchar](50) NULL,
	[Efternamn] [nvarchar](50) NULL,
	[Telefon] [nvarchar](50) NULL,
	[Epost] [nvarchar](150) NULL,
 CONSTRAINT [PK_tblKontakt] PRIMARY KEY CLUSTERED 
(
	[kontaktid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


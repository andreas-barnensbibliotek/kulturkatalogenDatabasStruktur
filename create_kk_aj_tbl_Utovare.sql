USE [dnndev_v902.me]
GO

/****** Object:  Table [dbo].[kk_aj_tbl_Utovare]    Script Date: 2017-07-06 08:47:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[kk_aj_tbl_Utovare](
	[UtovarID] [int] IDENTITY(1,1) NOT NULL,
	[Organisation] [nvarchar](150) NULL,
	[Fornamn] [nvarchar](70) NULL,
	[Efternamn] [nvarchar](70) NULL,
	[Telefonnummer] [nvarchar](50) NULL,
	[Adress] [nvarchar](70) NULL,
	[Postnr] [nvarchar](10) NULL,
	[Ort] [nvarchar](80) NULL,
	[Epost] [nvarchar](150) NULL,
	[Kommun] [nvarchar](80) NULL,
	[Hemsida] [nvarchar](250) NULL,
	[Ovrigt] [nvarchar](250) NULL,
	[Bild] [nvarchar](250) NULL,
 CONSTRAINT [PK_kk_aj_tbl_utovare] PRIMARY KEY CLUSTERED 
(
	[UtovarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


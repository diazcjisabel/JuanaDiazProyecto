
/****** Object:  Database [PRESTAMOS]    Script Date: 27/10/2022 1:03:20 ******/
CREATE DATABASE [PRESTAMOS]

/****** Object:  Table [dbo].[Articulo]    Script Date: 27/10/2022 1:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[id_articulo] [int] IDENTITY(1,1) NOT NULL,
	[titulo_art] [varchar](150) NOT NULL,
	[inicio] [date] NOT NULL,
	[fin] [date] NOT NULL,
	[numero] [int] NOT NULL,
 CONSTRAINT [PK_Articulo] PRIMARY KEY CLUSTERED 
(
	[id_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articulo_Autor]    Script Date: 27/10/2022 1:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo_Autor](
	[id_aa] [int] IDENTITY(1,1) NOT NULL,
	[posicion] [int] NOT NULL,
	[id_articulo] [int] NOT NULL,
	[id_autor] [int] NOT NULL,
 CONSTRAINT [PK_Articulo_Autor] PRIMARY KEY CLUSTERED 
(
	[id_aa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 27/10/2022 1:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor](
	[id_autor] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](30) NOT NULL,
	[apellidos] [varchar](30) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[cedula] [varchar](16) NOT NULL,
	[fechaNac] [date] NULL,
 CONSTRAINT [PK_Autor] PRIMARY KEY CLUSTERED 
(
	[id_autor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Revista]    Script Date: 27/10/2022 1:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Revista](
	[numero] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](150) NOT NULL,
	[ayo] [int] NULL,
	[issn] [varchar](30) NULL,
 CONSTRAINT [PK_Revista] PRIMARY KEY CLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Autor] ON 

INSERT [dbo].[Autor] ([id_autor], [nombres], [apellidos], [email], [cedula], [fechaNac]) VALUES (2, N'Francis', N'Centeno', N'fcenteno@g', N'1212708900005K', CAST(N'1990-08-27' AS Date))
INSERT [dbo].[Autor] ([id_autor], [nombres], [apellidos], [email], [cedula], [fechaNac]) VALUES (3, N'Joseph', N'Centeno', N'jcenteno@g', N'1211612910005L', CAST(N'1990-12-16' AS Date))
SET IDENTITY_INSERT [dbo].[Autor] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_tituloArt]    Script Date: 27/10/2022 1:03:20 ******/
ALTER TABLE [dbo].[Articulo] ADD  CONSTRAINT [UQ_tituloArt] UNIQUE NONCLUSTERED 
(
	[titulo_art] ASC
)
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_titulo]    Script Date: 27/10/2022 1:03:20 ******/
ALTER TABLE [dbo].[Revista] ADD  CONSTRAINT [UQ_titulo] UNIQUE NONCLUSTERED 
(
	[titulo] ASC
)
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Revista_numero] FOREIGN KEY([numero])
REFERENCES [dbo].[Revista] ([numero])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_Revista_numero]
GO
ALTER TABLE [dbo].[Articulo_Autor]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_id_articulo] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[Articulo] ([id_articulo])
GO
ALTER TABLE [dbo].[Articulo_Autor] CHECK CONSTRAINT [FK_Articulo_id_articulo]
GO
ALTER TABLE [dbo].[Articulo_Autor]  WITH CHECK ADD  CONSTRAINT [FK_Autor_id_autor] FOREIGN KEY([id_autor])
REFERENCES [dbo].[Autor] ([id_autor])
GO
ALTER TABLE [dbo].[Articulo_Autor] CHECK CONSTRAINT [FK_Autor_id_autor]
GO
ALTER TABLE [dbo].[Revista]  WITH CHECK ADD  CONSTRAINT [CH_ayo] CHECK  (([ayo]<=(2018)))
GO
ALTER TABLE [dbo].[Revista] CHECK CONSTRAINT [CH_ayo]
GO
USE [master]
GO
ALTER DATABASE [PRESTAMOS] SET  READ_WRITE 
GO
USE [Bank2]
GO
/****** Object:  Table [dbo].[Balance]    Script Date: 29.09.2024 0:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Balance](
	[IdBalance] [int] NOT NULL,
	[Amount] [decimal](18, 2) NULL,
	[IdCurrency] [int] NOT NULL,
	[IdUser] [int] NULL,
 CONSTRAINT [PK_Balance] PRIMARY KEY CLUSTERED 
(
	[IdBalance] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 29.09.2024 0:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[IdCurrency] [int] NOT NULL,
	[CurrencyName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[IdCurrency] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 29.09.2024 0:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[IdGender] [int] NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[IdGender] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operation]    Script Date: 29.09.2024 0:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operation](
	[IdOperation] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NOT NULL,
	[IdBalance] [int] NOT NULL,
	[IdTransaction] [int] NOT NULL,
 CONSTRAINT [PK_Operation] PRIMARY KEY CLUSTERED 
(
	[IdOperation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 29.09.2024 0:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[IdTransaction] [int] NOT NULL,
	[TransactionName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[IdTransaction] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 29.09.2024 0:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[IdUser] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NOT NULL,
	[IdGender] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 29.09.2024 0:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[IdUserLogin] [int] NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserLogin] PRIMARY KEY CLUSTERED 
(
	[IdUserLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Balance] ([IdBalance], [Amount], [IdCurrency], [IdUser]) VALUES (1, CAST(20000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[Balance] ([IdBalance], [Amount], [IdCurrency], [IdUser]) VALUES (2, CAST(18702.39 AS Decimal(18, 2)), 2, 2)
INSERT [dbo].[Balance] ([IdBalance], [Amount], [IdCurrency], [IdUser]) VALUES (3, CAST(10000.00 AS Decimal(18, 2)), 3, 3)
GO
INSERT [dbo].[Currency] ([IdCurrency], [CurrencyName]) VALUES (1, N'Рубль')
INSERT [dbo].[Currency] ([IdCurrency], [CurrencyName]) VALUES (2, N'Доллар')
INSERT [dbo].[Currency] ([IdCurrency], [CurrencyName]) VALUES (3, N'Евро')
GO
INSERT [dbo].[Gender] ([IdGender], [Gender]) VALUES (1, N'Мужчина')
INSERT [dbo].[Gender] ([IdGender], [Gender]) VALUES (2, N'Женщина')
GO
SET IDENTITY_INSERT [dbo].[Operation] ON 

INSERT [dbo].[Operation] ([IdOperation], [IdUser], [IdBalance], [IdTransaction]) VALUES (0, 1, 1, 1)
INSERT [dbo].[Operation] ([IdOperation], [IdUser], [IdBalance], [IdTransaction]) VALUES (2, 1, 1, 1)
INSERT [dbo].[Operation] ([IdOperation], [IdUser], [IdBalance], [IdTransaction]) VALUES (3, 1, 1, 1)
INSERT [dbo].[Operation] ([IdOperation], [IdUser], [IdBalance], [IdTransaction]) VALUES (4, 1, 1, 3)
INSERT [dbo].[Operation] ([IdOperation], [IdUser], [IdBalance], [IdTransaction]) VALUES (5, 2, 2, 3)
INSERT [dbo].[Operation] ([IdOperation], [IdUser], [IdBalance], [IdTransaction]) VALUES (6, 2, 2, 1)
INSERT [dbo].[Operation] ([IdOperation], [IdUser], [IdBalance], [IdTransaction]) VALUES (7, 1, 1, 1)
INSERT [dbo].[Operation] ([IdOperation], [IdUser], [IdBalance], [IdTransaction]) VALUES (8, 1, 1, 3)
INSERT [dbo].[Operation] ([IdOperation], [IdUser], [IdBalance], [IdTransaction]) VALUES (9, 1, 1, 1)
INSERT [dbo].[Operation] ([IdOperation], [IdUser], [IdBalance], [IdTransaction]) VALUES (10, 1, 1, 1)
INSERT [dbo].[Operation] ([IdOperation], [IdUser], [IdBalance], [IdTransaction]) VALUES (11, 1, 1, 1)
INSERT [dbo].[Operation] ([IdOperation], [IdUser], [IdBalance], [IdTransaction]) VALUES (12, 1, 1, 1)
INSERT [dbo].[Operation] ([IdOperation], [IdUser], [IdBalance], [IdTransaction]) VALUES (13, 1, 1, 1)
INSERT [dbo].[Operation] ([IdOperation], [IdUser], [IdBalance], [IdTransaction]) VALUES (14, 1, 1, 1)
INSERT [dbo].[Operation] ([IdOperation], [IdUser], [IdBalance], [IdTransaction]) VALUES (15, 1, 1, 1)
INSERT [dbo].[Operation] ([IdOperation], [IdUser], [IdBalance], [IdTransaction]) VALUES (16, 1, 1, 1)
INSERT [dbo].[Operation] ([IdOperation], [IdUser], [IdBalance], [IdTransaction]) VALUES (17, 1, 1, 3)
SET IDENTITY_INSERT [dbo].[Operation] OFF
GO
INSERT [dbo].[Transaction] ([IdTransaction], [TransactionName]) VALUES (1, N'Пополнение')
INSERT [dbo].[Transaction] ([IdTransaction], [TransactionName]) VALUES (2, N'Перевод')
INSERT [dbo].[Transaction] ([IdTransaction], [TransactionName]) VALUES (3, N'Снятие')
GO
INSERT [dbo].[User] ([IdUser], [Name], [Surname], [Patronymic], [Birthday], [IdGender]) VALUES (1, N'Дмитрий', N'Афоньев', N'Олегович', CAST(N'1989-05-22' AS Date), 1)
INSERT [dbo].[User] ([IdUser], [Name], [Surname], [Patronymic], [Birthday], [IdGender]) VALUES (2, N'Светлякова', N'Ольга', N'Михайловна', CAST(N'2000-11-10' AS Date), 2)
INSERT [dbo].[User] ([IdUser], [Name], [Surname], [Patronymic], [Birthday], [IdGender]) VALUES (3, N'Степанов', N'Степан', N'Степанович', CAST(N'1999-01-09' AS Date), 1)
GO
INSERT [dbo].[UserLogin] ([IdUserLogin], [Login], [Password]) VALUES (1, N'1', N'1')
INSERT [dbo].[UserLogin] ([IdUserLogin], [Login], [Password]) VALUES (2, N'2', N'2')
INSERT [dbo].[UserLogin] ([IdUserLogin], [Login], [Password]) VALUES (3, N'3', N'3')
GO
ALTER TABLE [dbo].[Balance]  WITH CHECK ADD  CONSTRAINT [FK_Balance_Currency] FOREIGN KEY([IdCurrency])
REFERENCES [dbo].[Currency] ([IdCurrency])
GO
ALTER TABLE [dbo].[Balance] CHECK CONSTRAINT [FK_Balance_Currency]
GO
ALTER TABLE [dbo].[Balance]  WITH CHECK ADD  CONSTRAINT [FK_Balance_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Balance] CHECK CONSTRAINT [FK_Balance_User]
GO
ALTER TABLE [dbo].[Operation]  WITH CHECK ADD  CONSTRAINT [FK_Operation_Balance] FOREIGN KEY([IdBalance])
REFERENCES [dbo].[Balance] ([IdBalance])
GO
ALTER TABLE [dbo].[Operation] CHECK CONSTRAINT [FK_Operation_Balance]
GO
ALTER TABLE [dbo].[Operation]  WITH CHECK ADD  CONSTRAINT [FK_Operation_Transaction] FOREIGN KEY([IdTransaction])
REFERENCES [dbo].[Transaction] ([IdTransaction])
GO
ALTER TABLE [dbo].[Operation] CHECK CONSTRAINT [FK_Operation_Transaction]
GO
ALTER TABLE [dbo].[Operation]  WITH CHECK ADD  CONSTRAINT [FK_Operation_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Operation] CHECK CONSTRAINT [FK_Operation_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Gender] FOREIGN KEY([IdGender])
REFERENCES [dbo].[Gender] ([IdGender])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Gender]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserLogin] FOREIGN KEY([IdUser])
REFERENCES [dbo].[UserLogin] ([IdUserLogin])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserLogin]
GO

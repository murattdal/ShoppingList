USE [DbShoppingList]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10.08.2023 22:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lists]    Script Date: 10.08.2023 22:38:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lists](
	[listId] [int] IDENTITY(1,1) NOT NULL,
	[listName] [nvarchar](max) NOT NULL,
	[userId] [int] NOT NULL,
	[situation] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productCategorys]    Script Date: 10.08.2023 22:38:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productCategorys](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productImages]    Script Date: 10.08.2023 22:38:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productImages](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [nvarchar](255) NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[Category] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 10.08.2023 22:38:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](max) NOT NULL,
	[productUrl] [nvarchar](max) NOT NULL,
	[productDescription] [nvarchar](max) NOT NULL,
	[listId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[productCategory] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 10.08.2023 22:38:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](max) NOT NULL,
	[lastName] [nvarchar](max) NOT NULL,
	[email] [nvarchar](255) NULL,
	[password] [nvarchar](max) NOT NULL,
	[isAdmin] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230804050136_DbShoppingListMigration', N'7.0.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230804054329_DbShoppingListMigration1', N'7.0.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230807171142_DbShoppingListMigration_1', N'7.0.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230810123055_DbShoppingListMigration_2', N'7.0.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230810173903_DbShoppingListMigration_3', N'7.0.9')
GO
SET IDENTITY_INSERT [dbo].[lists] ON 

INSERT [dbo].[lists] ([listId], [listName], [userId], [situation]) VALUES (5, N'Market Alışverişi', 2, 0)
INSERT [dbo].[lists] ([listId], [listName], [userId], [situation]) VALUES (8, N'sadasd', 3, 0)
INSERT [dbo].[lists] ([listId], [listName], [userId], [situation]) VALUES (9, N'dfgdfg', 2, 0)
SET IDENTITY_INSERT [dbo].[lists] OFF
GO
SET IDENTITY_INSERT [dbo].[productCategorys] ON 

INSERT [dbo].[productCategorys] ([CategoryId], [CategoryName]) VALUES (1, N'İçecekler')
INSERT [dbo].[productCategorys] ([CategoryId], [CategoryName]) VALUES (3, N'Kahvaltı')
INSERT [dbo].[productCategorys] ([CategoryId], [CategoryName]) VALUES (4, N'Kuru Gıda')
INSERT [dbo].[productCategorys] ([CategoryId], [CategoryName]) VALUES (2, N'Meyve')
INSERT [dbo].[productCategorys] ([CategoryId], [CategoryName]) VALUES (5, N'Sebze')
SET IDENTITY_INSERT [dbo].[productCategorys] OFF
GO
SET IDENTITY_INSERT [dbo].[productImages] ON 

INSERT [dbo].[productImages] ([ImageId], [ImageName], [ImageUrl], [Category]) VALUES (2, N'Soğan', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Fonion.jpeg?alt=media&token=8549eddc-73bc-40ed-af18-68716af7792c', N'Sebze')
INSERT [dbo].[productImages] ([ImageId], [ImageName], [ImageUrl], [Category]) VALUES (3, N'Sarımsak', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Fgarlic.jpg?alt=media&token=dcd99158-503e-4855-b2ff-33d2b3be6f1b', N'Sebze')
INSERT [dbo].[productImages] ([ImageId], [ImageName], [ImageUrl], [Category]) VALUES (4, N'Patates', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Fpotato.webp?alt=media&token=25a50db0-3528-43a5-9208-1b31b4d9cb05', N'Sebze')
INSERT [dbo].[productImages] ([ImageId], [ImageName], [ImageUrl], [Category]) VALUES (5, N'Lahana', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Fcabbage.jpg?alt=media&token=1f003e8b-0555-4922-afd6-c6b58af8d55c', N'Sebze')
INSERT [dbo].[productImages] ([ImageId], [ImageName], [ImageUrl], [Category]) VALUES (6, N'Patlıcan', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Feggplant.jpg?alt=media&token=aebd7be1-5650-4522-8c7a-1a3f0328d35f', N'Sebze')
INSERT [dbo].[productImages] ([ImageId], [ImageName], [ImageUrl], [Category]) VALUES (7, N'Domates', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Ftomato.jpg?alt=media&token=201ef660-610d-45c7-a51b-2e72720fa908', N'Sebze')
INSERT [dbo].[productImages] ([ImageId], [ImageName], [ImageUrl], [Category]) VALUES (8, N'Biber', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Fpepper.jpg?alt=media&token=a9af7cf3-e725-4143-977e-e8ff9843bde0', N'Sebze')
INSERT [dbo].[productImages] ([ImageId], [ImageName], [ImageUrl], [Category]) VALUES (9, N'Makarna', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Fpasta.jpg?alt=media&token=ca2b230e-5649-433a-80e0-7ed7b9451d81', N'Kuru Gıda')
INSERT [dbo].[productImages] ([ImageId], [ImageName], [ImageUrl], [Category]) VALUES (10, N'Pirinç', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Frice.jpg?alt=media&token=ca046cea-3a90-4bd6-9bfa-b2353ed37284', N'Kuru Gıda')
INSERT [dbo].[productImages] ([ImageId], [ImageName], [ImageUrl], [Category]) VALUES (11, N'Bulgur', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Fwheat.webp?alt=media&token=76ca96ab-ba3a-4523-b65e-4047703a8489', N'Kuru Gıda')
INSERT [dbo].[productImages] ([ImageId], [ImageName], [ImageUrl], [Category]) VALUES (12, N'Mercimek', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Flentil.jpg?alt=media&token=98bc5ec3-fbe7-4c03-979c-7f5f721e934e', N'Kuru Gıda')
INSERT [dbo].[productImages] ([ImageId], [ImageName], [ImageUrl], [Category]) VALUES (13, N'Kuru Fasulye', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2FdriedBeans.webp?alt=media&token=f842ee67-96e8-4fab-872c-4f45b9cc2a3f', N'Kuru Gıda')
INSERT [dbo].[productImages] ([ImageId], [ImageName], [ImageUrl], [Category]) VALUES (14, N'Peynir', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Fcheese.jpg?alt=media&token=4292b636-8706-4cc5-a582-008f2b5b5363', N'Kahvaltı')
INSERT [dbo].[productImages] ([ImageId], [ImageName], [ImageUrl], [Category]) VALUES (15, N'Kaşar', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Fcheddar.jpg?alt=media&token=d91b7a28-eb2f-4896-9efc-d40323f1fe15', N'Kahvaltı')
INSERT [dbo].[productImages] ([ImageId], [ImageName], [ImageUrl], [Category]) VALUES (16, N'Zeytin', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Folive.webp?alt=media&token=079e48ab-104d-4fe7-9e20-f0f0766a5dee', N'Kahvaltı')
INSERT [dbo].[productImages] ([ImageId], [ImageName], [ImageUrl], [Category]) VALUES (18, N'Elma', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Fapple.jpg?alt=media&token=bb1cbad2-b486-453d-a617-ad7a36055fe4', N'Meyve')
INSERT [dbo].[productImages] ([ImageId], [ImageName], [ImageUrl], [Category]) VALUES (19, N'Armut', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Fpear.jpg?alt=media&token=aaab6e98-b39f-4fd5-8eb4-8ac5b70956b6', N'Meyve')
INSERT [dbo].[productImages] ([ImageId], [ImageName], [ImageUrl], [Category]) VALUES (20, N'Portakal', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Forange.jpg?alt=media&token=f45875e2-7ccf-40a2-bd83-e55e881f7ac4', N'Meyve')
INSERT [dbo].[productImages] ([ImageId], [ImageName], [ImageUrl], [Category]) VALUES (21, N'Mandalina', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Fmandarin.jpg?alt=media&token=fcca2f09-edf3-4f97-8e15-41d44fbbe2bd', N'Meyve')
INSERT [dbo].[productImages] ([ImageId], [ImageName], [ImageUrl], [Category]) VALUES (22, N'Su', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Fwater.jpg?alt=media&token=24e43ac3-6267-4d30-875f-75c30afe1d5f', N'İçecekler')
INSERT [dbo].[productImages] ([ImageId], [ImageName], [ImageUrl], [Category]) VALUES (23, N'Maden Suyu', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2FmineralWater.jpg?alt=media&token=ce268079-f55d-4f12-ab46-0139e57a968b', N'İçecekler')
INSERT [dbo].[productImages] ([ImageId], [ImageName], [ImageUrl], [Category]) VALUES (25, N'Ayran', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Fbuttermilk.jpg?alt=media&token=b13a8e8a-fa3c-4fca-949d-e8be60e771c6', N'İçecekler')
INSERT [dbo].[productImages] ([ImageId], [ImageName], [ImageUrl], [Category]) VALUES (26, N'Coca Cola', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Fcola.jpg?alt=media&token=62d41bec-b062-452f-9ec8-9c92dfd59599', N'İçecekler')
INSERT [dbo].[productImages] ([ImageId], [ImageName], [ImageUrl], [Category]) VALUES (29, N'Fanta', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Ffanta.webp?alt=media&token=9a9ef376-443a-448c-b99f-3572daf8fc61', N'İçecekler')
SET IDENTITY_INSERT [dbo].[productImages] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([productId], [productName], [productUrl], [productDescription], [listId], [userId], [productCategory]) VALUES (11, N'Mercimek', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Flentil.jpg?alt=media&token=98bc5ec3-fbe7-4c03-979c-7f5f721e934e', N'sgdfg', 5, 2, N'Kuru Gıda')
INSERT [dbo].[products] ([productId], [productName], [productUrl], [productDescription], [listId], [userId], [productCategory]) VALUES (12, N'Makarna', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Fpasta.jpg?alt=media&token=ca2b230e-5649-433a-80e0-7ed7b9451d81', N'sdsfgdfsg', 5, 2, N'Kuru Gıda')
INSERT [dbo].[products] ([productId], [productName], [productUrl], [productDescription], [listId], [userId], [productCategory]) VALUES (13, N'Peynir', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Fcheese.jpg?alt=media&token=4292b636-8706-4cc5-a582-008f2b5b5363', N'cgj', 5, 2, N'Kahvaltı')
INSERT [dbo].[products] ([productId], [productName], [productUrl], [productDescription], [listId], [userId], [productCategory]) VALUES (17, N'Su', N'https://firebasestorage.googleapis.com/v0/b/shoppinglist-7e03f.appspot.com/o/images%2Fwater.jpg?alt=media&token=24e43ac3-6267-4d30-875f-75c30afe1d5f', N'asdsad', 8, 3, N'İçecekler')
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([userId], [firstName], [lastName], [email], [password], [isAdmin]) VALUES (1, N'Admin', N' ', N'admin@gmail.com', N'Wasd1234', 1)
INSERT [dbo].[users] ([userId], [firstName], [lastName], [email], [password], [isAdmin]) VALUES (2, N'Murat', N'DAL', N'muratdal339@gmail.com', N'Wasd1234', 0)
INSERT [dbo].[users] ([userId], [firstName], [lastName], [email], [password], [isAdmin]) VALUES (3, N'dfg', N'dfg', N'dfg@gmail.com', N'Wasd1234', 0)
INSERT [dbo].[users] ([userId], [firstName], [lastName], [email], [password], [isAdmin]) VALUES (4, N'dfgmurat', N'fdgdfg', N'dfgfd@gmail.com', N'Wasd1234', 0)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_CategoryName]    Script Date: 10.08.2023 22:38:49 ******/
ALTER TABLE [dbo].[productCategorys] ADD  CONSTRAINT [UQ_CategoryName] UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_productCategorys_CategoryName]    Script Date: 10.08.2023 22:38:49 ******/
ALTER TABLE [dbo].[productCategorys] ADD  CONSTRAINT [UQ_productCategorys_CategoryName] UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_ImageName]    Script Date: 10.08.2023 22:38:49 ******/
ALTER TABLE [dbo].[productImages] ADD  CONSTRAINT [UQ_ImageName] UNIQUE NONCLUSTERED 
(
	[ImageName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Email]    Script Date: 10.08.2023 22:38:49 ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [UQ_Email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_users_email]    Script Date: 10.08.2023 22:38:49 ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [UQ_users_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[lists] ADD  CONSTRAINT [DF_situation]  DEFAULT ((0)) FOR [situation]
GO
ALTER TABLE [dbo].[productImages] ADD  DEFAULT (N'') FOR [Category]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT (N'') FOR [productCategory]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (CONVERT([bit],(0))) FOR [isAdmin]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_list] FOREIGN KEY([listId])
REFERENCES [dbo].[lists] ([listId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_list]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_user] FOREIGN KEY([userId])
REFERENCES [dbo].[users] ([userId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_user]
GO

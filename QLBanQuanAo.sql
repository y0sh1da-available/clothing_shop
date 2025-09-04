USE [QLBanQuanAo]
GO
/****** Object:  Table [dbo].[brands]    Script Date: 4/22/2025 12:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brands](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 4/22/2025 12:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 4/22/2025 12:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[price] [float] NULL,
	[number_of_products] [int] NULL,
	[total_money] [float] NULL,
	[status] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 4/22/2025 12:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[fullname] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[phone_number] [nvarchar](20) NOT NULL,
	[address] [nvarchar](200) NOT NULL,
	[note] [nvarchar](100) NULL,
	[order_date] [datetime] NULL,
	[status] [nvarchar](50) NULL,
	[total_money] [float] NULL,
	[shipping_method] [nvarchar](50) NULL,
	[shipping_date] [date] NULL,
	[tracking_number] [nvarchar](100) NULL,
	[payment_method] [nvarchar](50) NULL,
	[active] [bit] NULL,
	[IsQuickPurchase] [bit] NOT NULL,
	[CaptureId] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_images]    Script Date: 4/22/2025 12:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[image_url] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 4/22/2025 12:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](350) NOT NULL,
	[price] [float] NOT NULL,
	[description] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[category_id] [int] NULL,
	[image] [nvarchar](255) NULL,
	[brand_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReviewMedia]    Script Date: 4/22/2025 12:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewMedia](
	[media_id] [int] IDENTITY(1,1) NOT NULL,
	[review_id] [int] NOT NULL,
	[media_type] [varchar](20) NOT NULL,
	[media_url] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[media_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 4/22/2025 12:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[review_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[rating] [tinyint] NOT NULL,
	[review_text] [text] NULL,
	[review_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 4/22/2025 12:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingAddress]    Script Date: 4/22/2025 12:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingAddress](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[address] [nvarchar](200) NOT NULL,
	[phone_number] [nvarchar](20) NOT NULL,
	[is_default] [bit] NULL,
	[fullname] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[social_accounts]    Script Date: 4/22/2025 12:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[social_accounts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[provider] [nvarchar](20) NOT NULL,
	[provider_id] [nvarchar](50) NOT NULL,
	[email] [nvarchar](150) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tokens]    Script Date: 4/22/2025 12:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tokens](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[token_type] [nvarchar](50) NOT NULL,
	[token] [nvarchar](255) NOT NULL,
	[user_id] [int] NULL,
	[expiration_date] [datetime] NULL,
	[revoked] [bit] NOT NULL,
	[expired] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 4/22/2025 12:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](100) NULL,
	[phone_number] [nvarchar](10) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[is_active] [bit] NULL,
	[date_of_birth] [date] NULL,
	[facebook_account_id] [int] NULL,
	[google_account_id] [int] NULL,
	[role_id] [int] NULL,
	[email] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[brands] ON 
GO
INSERT [dbo].[brands] ([id], [name]) VALUES (1, N'Nike')
GO
INSERT [dbo].[brands] ([id], [name]) VALUES (2, N'Adidas')
GO
INSERT [dbo].[brands] ([id], [name]) VALUES (3, N'Puma')
GO
INSERT [dbo].[brands] ([id], [name]) VALUES (4, N'Reebok')
GO
INSERT [dbo].[brands] ([id], [name]) VALUES (5, N'Under Armour')
GO
INSERT [dbo].[brands] ([id], [name]) VALUES (6, N'New Balance')
GO
INSERT [dbo].[brands] ([id], [name]) VALUES (7, N'Asics')
GO
INSERT [dbo].[brands] ([id], [name]) VALUES (8, N'Fila')
GO
INSERT [dbo].[brands] ([id], [name]) VALUES (9, N'Converse')
GO
INSERT [dbo].[brands] ([id], [name]) VALUES (11, N'Vans')
GO
SET IDENTITY_INSERT [dbo].[brands] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (1, N'Áo thun')
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (2, N'Áo khoác')
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (3, N'Áo kiểu')
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (4, N'Đầm ngắn')
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (5, N'Váy')
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (6, N'Quần')
GO
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[order_details] ON 
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (54, 55, 2, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (55, 56, 6, 27.040000915527344, 2, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (56, 57, 2, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (59, 59, 1, 14.539999961853027, 2, 29.079999923706055, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (60, 60, 2, 14.539999961853027, 2, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (62, 61, 6, 27.040000915527344, 1, 27.040000915527344, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (64, 62, 2, 14.539999961853027, 2, 29.079999923706055, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (71, 73, 2, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (74, 58, 2, 14.539999961853027, 2, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (78, 75, 6, 27.040000915527344, 2, 54.080001831054688, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (79, 76, 3, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (81, 78, 2, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (82, 79, 2, 14.539999961853027, 2, 29.079999923706055, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (83, 80, 1, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (85, 81, 5, 24.959999084472656, 1, 24.959999084472656, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (87, 72, 5, 24.959999084472656, 2, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (88, 82, 3, 14.539999961853027, 4, 58.159999847412109, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (89, 83, 2, 14.539999961853027, 2, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (93, 85, 1, 14.539999961853027, 4, 58.159999847412109, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (94, 85, 2, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (95, 70, 2, 14.539999961853027, 4, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (98, 70, 3, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (99, 86, 3, 14.539999961853027, 2, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (104, 88, 2, 14.539999961853027, 3, 43.619999885559082, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (106, 89, 1, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (108, 90, 2, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (111, 91, 32, 29.1299991607666, 1, 29.1299991607666, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (123, 103, 2, 14.539999961853027, 4, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (124, 104, 3, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (125, 65, 2, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (128, 111, 1, 14.539999961853027, 3, 43.619999885559082, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (129, 111, 2, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (133, 113, 1, 14.539999961853027, 3, 43.619999885559082, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (134, 113, 2, 14.539999961853027, 2, 29.079999923706055, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (137, 114, 1, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (138, 114, 2, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (139, 115, 1, 14.539999961853027, 10, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (141, 116, 1, 14.539999961853027, 10, 145.39999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (143, 117, 1, 14.539999961853027, 6, 87.239999771118164, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (145, 118, 1, 14.539999961853027, 10, 145.39999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (150, 123, 1, 14.539999961853027, 6, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (153, 124, 2, 14.539999961853027, 2, 29.079999923706055, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (154, 124, 1, 14.539999961853027, 2, 29.079999923706055, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (186, 138, 2, 14.539999961853027, 3, 43.619999885559082, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (187, 138, 1, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (199, 148, 1, 14.539999961853027, 2, 29.079999923706055, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (200, 148, 3, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (202, 149, 1, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (208, 154, 2, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (211, 155, 1, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (215, 159, 1, 14.539999961853027, 2, 29.079999923706055, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (226, 164, 1, 14.539999961853027, 2, 29.079999923706055, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (236, 171, 2, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (237, 171, 3, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (240, 172, 2, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (241, 172, 3, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (245, 174, 2, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (246, 175, 6, 27.040000915527344, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (255, 184, 1, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (285, 213, 1, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (312, 236, 2, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (313, 237, 2, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (315, 237, 1, 14.539999961853027, 2, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (321, 237, 6, 27.040000915527344, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (334, 246, 2, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (335, 246, 1, 14.539999961853027, 2, 29.079999923706055, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (336, 246, 6, 27.040000915527344, 1, 27.040000915527344, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1311, 1236, 1, 14.539999961853027, 3, 43.619999885559082, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1314, 1237, 1, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1315, 1237, 3, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1323, 1242, 1, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1324, 1242, 2, 14.539999961853027, 2, 29.079999923706055, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1334, 1250, 3, 14.539999961853027, 2, 29.079999923706055, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1336, 1252, 26, 12.460000038146973, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1349, 1264, 5, 24.959999084472656, 2, 49.919998168945312, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1354, 1268, 5, 24.959999084472656, 1, 24.959999084472656, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1357, 1270, 5, 24.959999084472656, 3, 74.879997253417969, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1361, 1274, 1, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1363, 1276, 3, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1364, 1277, 5, 24.959999084472656, 3, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1367, 1279, 1, 14.539999961853027, 3, 43.619999885559082, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1368, 1280, 5, 24.959999084472656, 3, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1392, 1303, 2, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1405, 1315, 1, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1407, 1317, 2, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1408, 1318, 3, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1409, 1319, 2, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1415, 1324, 31, 12.460000038146973, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1419, 1327, 2, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1421, 1329, 1, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1423, 1330, 6, 27.040000915527344, 2, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1424, 1331, 5, 24.959999084472656, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1426, 1333, 3, 14.539999961853027, 2, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1427, 1334, 5, 24.959999084472656, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1428, 1335, 2, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1437, 1341, 3, 14.539999961853027, 2, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1438, 1342, 5, 24.959999084472656, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1447, 1351, 6, 27.040000915527344, 3, 81.120002746582031, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1456, 1358, 2, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1457, 1359, 2, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1458, 1360, 2, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1459, 1361, 2, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1473, 1363, 2, 14.539999961853027, 3, 43.619999885559082, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1474, 1363, 23, 24.959999084472656, 1, 24.959999084472656, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1475, 1363, 6, 27.040000915527344, 1, 27.040000915527344, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1476, 1363, 4, 24.959999084472656, 1, 24.959999084472656, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1477, 1363, 9, 10.380000114440918, 3, 31.140000343322754, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1478, 1363, 7, 27.040000915527344, 1, 27.040000915527344, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1479, 1363, 27, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1502, 1364, 1, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1503, 1364, 2, 14.539999961853027, 4, 58.159999847412109, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1504, 1364, 4, 24.959999084472656, 2, 49.919998168945312, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1505, 1364, 7, 27.040000915527344, 1, 27.040000915527344, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1506, 1364, 3, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1507, 1364, 5, 24.959999084472656, 2, 49.919998168945312, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1508, 1364, 6, 27.040000915527344, 1, 27.040000915527344, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1509, 1364, 12, 24.959999084472656, 1, 24.959999084472656, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1510, 1364, 13, 27.040000915527344, 1, 27.040000915527344, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1511, 1364, 14, 27.040000915527344, 1, 27.040000915527344, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1512, 1364, 15, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1513, 1364, 17, 22.8799991607666, 1, 22.8799991607666, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1514, 1364, 24, 22.8799991607666, 2, 45.7599983215332, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1515, 1364, 19, 16.6299991607666, 1, 16.6299991607666, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1516, 1364, 20, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1517, 1364, 21, 24.959999084472656, 1, 24.959999084472656, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1518, 1364, 22, 29.1299991607666, 1, 29.1299991607666, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1519, 1364, 25, 16.6299991607666, 1, 16.6299991607666, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1520, 1364, 26, 12.460000038146973, 1, 12.460000038146973, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1521, 1364, 27, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1522, 1364, 28, 18.709999084472656, 1, 18.709999084472656, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1523, 1364, 29, 18.5, 1, 18.5, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1525, 134, 3, 14.539999961853027, 51, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1528, 1367, 2, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1532, 1371, 2, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1533, 1372, 24, 22.8799991607666, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1534, 1373, 3, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1535, 1374, 2, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1538, 1376, 2, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1542, 1379, 3, 14.539999961853027, 51, 741.53999805450439, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1552, 1383, 2, 14.539999961853027, 2, 29.079999923706055, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1553, 1383, 3, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1554, 1383, 4, 24.959999084472656, 1, 24.959999084472656, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1557, 156, 3, 14.539999961853027, 1, NULL, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1560, 1388, 3, 14.539999961853027, 1, 14.539999961853027, N'active')
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [price], [number_of_products], [total_money], [status]) VALUES (1561, 1389, 2, 14.539999961853027, 1, NULL, N'active')
GO
SET IDENTITY_INSERT [dbo].[order_details] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (11, 1, N'Nguyen Van A', N'nguyenvana@example.com', N'0901234567', N'123 Lê Lợi, Quận 1, TP. HCM', N'Giao hàng trong giờ hành chính', CAST(N'2024-11-10T20:19:54.840' AS DateTime), N'pending', 150.5, N'Standard Shipping', CAST(N'2024-10-25' AS Date), N'TRK123456', N'COD', 1, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (13, 3, N'Le Van C', N'levanc@example.com', N'0987654321', N'789 Trường Chinh, Quận Tân Bình, TP. HCM', N'Liên hệ khi tới', CAST(N'2024-11-10T20:19:54.840' AS DateTime), N'shipped', 320.75, N'Standard Shipping', CAST(N'2024-10-27' AS Date), N'TRK123458', N'Bank Transfer', 1, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (14, 4, N'Pham Thi D', N'phamthid@example.com', N'0923456789', N'123 Hai Bà Trưng, Quận 3, TP. HCM', N'Không gọi điện khi giao', CAST(N'2024-11-10T20:19:54.840' AS DateTime), N'delivered', 500, N'Standard Shipping', CAST(N'2024-10-28' AS Date), N'TRK123459', N'COD', 1, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (15, 5, N'Nguyen Van E', N'nguyenvane@example.com', N'0934567890', N'654 Điện Biên Phủ, Quận Bình Thạnh, TP. HCM', N'Giao hàng cuối tuần', CAST(N'2024-11-10T20:19:54.840' AS DateTime), N'cancelled', 100, N'Standard Shipping', NULL, NULL, N'COD', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (16, 6, N'Hoang Thi F', N'hoangthif@example.com', N'0945678901', N'321 Nguyễn Văn Trỗi, Quận Phú Nhuận, TP. HCM', N'', CAST(N'2024-11-10T20:19:54.840' AS DateTime), N'pending', 75, N'Express Shipping', CAST(N'2024-10-29' AS Date), N'TRK123460', N'Online Payment', 1, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (17, 7, N'Do Van G', N'dovang@example.com', N'0956789012', N'987 Nguyễn Trãi, Quận 5, TP. HCM', N'Giao hàng cẩn thận', CAST(N'2024-11-10T20:19:54.840' AS DateTime), N'shipped', 280.9, N'Standard Shipping', CAST(N'2024-10-30' AS Date), N'TRK123461', N'Bank Transfer', 1, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (18, 8, N'Phan Thi H', N'phanthih@example.com', N'0967890123', N'654 Phan Đăng Lưu, Quận Phú Nhuận, TP. HCM', N'', CAST(N'2024-11-10T20:19:54.840' AS DateTime), N'processing', 180.2, N'Express Shipping', CAST(N'2024-10-31' AS Date), N'TRK123462', N'COD', 1, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (19, 9, N'Vo Van I', N'vovani@example.com', N'0978901234', N'111 Hoàng Văn Thụ, Quận Tân Bình, TP. HCM', N'', CAST(N'2024-11-10T20:19:54.840' AS DateTime), N'delivered', 125.6, N'Standard Shipping', CAST(N'2024-11-01' AS Date), N'TRK123463', N'Online Payment', 1, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (20, 10, N'Bui Thi J', N'buithij@example.com', N'0989012345', N'222 Nam Kỳ Khởi Nghĩa, Quận 1, TP. HCM', N'', CAST(N'2024-11-10T20:19:54.840' AS DateTime), N'pending', 50, N'Standard Shipping', NULL, NULL, N'COD', 1, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (55, 2, N'THHu', N'', N'0912345678', N'456 Lý Thu?ng Ki?t', N'', CAST(N'2024-11-12T01:02:48.300' AS DateTime), N'processing', 15.54, NULL, NULL, NULL, N'Payoneer', 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (56, 2, N'THHu', N'', N'0912345678', N'456 Lý Thu?ng Ki?t', N'', CAST(N'2024-11-12T01:03:29.713' AS DateTime), N'processing', 55.08, NULL, NULL, NULL, N'Cash on Delivery', 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (57, 2, N'THHu', N'', N'0912345678', N'456 Lý Thu?ng Ki?t', N'', CAST(N'2024-11-12T01:03:58.947' AS DateTime), N'processing', 15.54, NULL, NULL, NULL, N'Cash on Delivery', 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (58, 2, N'Tran Thi L', N'', N'0987654321', N'222 Le Loi, Ho Chi Minh', N'', CAST(N'2024-11-12T01:04:14.763' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (59, 2, N'THHu', N'', N'0912345678', N'456 Lý Thu?ng Ki?t', N'', CAST(N'2024-11-12T01:04:29.187' AS DateTime), N'processing', NULL, NULL, NULL, NULL, N'Direct Bank Transfer', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (60, 2, N'Nguyễn Văn A', N'', N'0123456789', N'123 Đường Mẫu', N'', CAST(N'2024-11-12T13:18:41.130' AS DateTime), N'processing', 30.08, NULL, NULL, NULL, N'Payoneer', 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (61, 2, N'Nguyễn Văn A', N'', N'0123456789', N'123 Đường Mẫu', N'', CAST(N'2024-11-12T13:24:09.987' AS DateTime), N'processing', NULL, NULL, NULL, NULL, N'Direct Bank Transfer', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (62, 2, N'TQH', N'', N'1234567890', N'ko bt', N'', CAST(N'2024-11-12T15:29:58.007' AS DateTime), N'processing', NULL, NULL, NULL, NULL, N'Cash on Delivery', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (65, 16, N'John Doe', N'', N'0945117711', N'123 Main St', N'', CAST(N'2024-11-17T20:07:33.220' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (70, 20, N'huyhung', N'', N'0328995386', N'', N'', CAST(N'2024-11-17T23:06:26.010' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (72, 21, N'huyhung', N'', N'0936766661', N'', N'', CAST(N'2024-11-17T23:16:34.207' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (73, 21, N'l', N'', N'0232222232', N'l', N'', CAST(N'2024-11-17T23:33:22.403' AS DateTime), N'processing', NULL, NULL, NULL, NULL, N'Check Payment', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (75, 16, N'TQH', N'', N'123456', N'ko bt', N'', CAST(N'2024-11-19T10:53:54.583' AS DateTime), N'processing', NULL, NULL, NULL, NULL, N'Direct Bank Transfer', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (76, 16, N'TQH', N'', N'1234567890', N'ko bt', N'', CAST(N'2024-11-19T10:57:15.600' AS DateTime), N'processing', 15.54, NULL, NULL, NULL, N'Direct Bank Transfer', 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (78, 20, N'TQH', N'', N'1234567890', N'ko bt', N'', CAST(N'2024-11-19T13:29:02.733' AS DateTime), N'processing', 15.54, NULL, NULL, NULL, N'Check Payment', 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (79, 20, N'TQH', N'', N'1234567890', N'ko bt', N'', CAST(N'2024-11-19T13:29:34.637' AS DateTime), N'processing', NULL, NULL, NULL, NULL, N'Check Payment', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (80, 16, N'TQH', N'', N'1234567890', N'ko btt', N'', CAST(N'2024-11-19T13:40:54.777' AS DateTime), N'processing', 15.54, NULL, NULL, NULL, N'Paypal', 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (81, 16, N'TQH', N'', N'1234567890', N'ko btt', N'', CAST(N'2024-11-19T13:44:14.807' AS DateTime), N'processing', NULL, NULL, NULL, NULL, N'Payoneer', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (82, 21, N'TQHh', N'', N'1234567890', N'ko bt', N'', CAST(N'2024-11-19T14:04:37.707' AS DateTime), N'processing', NULL, NULL, NULL, NULL, N'Direct Bank Transfer', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (83, 21, N'TQHh', N'', N'1234567890', N'ko bt', N'', CAST(N'2024-11-19T14:05:04.550' AS DateTime), N'processing', 30.08, NULL, NULL, NULL, N'Cash on Delivery', 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (85, 16, N'TQH', N'', N'1234567890', N'ko bt', N'', CAST(N'2025-02-02T22:27:02.277' AS DateTime), N'completed', NULL, NULL, NULL, NULL, N'Cash on Delivery', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (86, 20, N'', N'', N'loading', N'loading', N'', CAST(N'2025-02-16T23:13:59.317' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (88, 16, N'TQH', N'', N'1234567890', N'ko bt', N'', CAST(N'2025-02-17T23:10:35.960' AS DateTime), N'processing', NULL, NULL, NULL, NULL, N'Paypal', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (89, 16, N'TQH', N'', N'1234567890', N'ko bt', N'', CAST(N'2025-02-17T23:26:34.997' AS DateTime), N'processing', NULL, NULL, NULL, NULL, N'Check Payment', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (90, 16, N'TQH', N'', N'1234567890', N'ko bt', N'', CAST(N'2025-02-17T23:29:28.390' AS DateTime), N'processing', NULL, NULL, NULL, NULL, N'Cash on Delivery', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (91, 16, N'TQH', N'', N'1234567890', N'ko bt', N'', CAST(N'2025-02-17T23:34:00.847' AS DateTime), N'processing', NULL, NULL, NULL, NULL, N'Paypal', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (103, 16, N'TQH', N'', N'1234567890', N'ko bt', N'', CAST(N'2025-02-18T14:55:13.580' AS DateTime), N'addressChanged', 59.16, NULL, NULL, NULL, N'Payoneer', 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (104, 16, N'', N'', N'loading', N'loading', N'', CAST(N'2025-02-18T20:53:39.727' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (111, 23, N'THH', N'', N'0904422888', N'ko bt', N'', CAST(N'2025-02-18T21:29:12.607' AS DateTime), N'processing', NULL, NULL, NULL, NULL, N'Check Payment', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (113, 23, N'THH', N'', N'0904422888', N'Việt Nam, Quận Đống Đa, Ngõ 1194 Đường Láng', N'', CAST(N'2025-02-27T00:07:23.137' AS DateTime), N'processing', NULL, NULL, NULL, NULL, N'Direct Bank Transfer', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (114, 23, N'THH', N'', N'0904422888', N'Việt Nam, Quận Đống Đa, Ngõ 1194 Đường Láng', N'', CAST(N'2025-02-27T00:10:21.557' AS DateTime), N'processing', NULL, NULL, NULL, NULL, N'Direct Bank Transfer', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (115, 23, N'THH', N'', N'0904422888', N'Việt Nam, Quận Đống Đa, Ngõ 1194 Đường Láng', N'', CAST(N'2025-02-28T10:43:40.170' AS DateTime), N'processing', 146.39999999999998, NULL, NULL, NULL, N'Direct Bank Transfer', 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (116, 23, N'THH', N'', N'0904422888', N'Việt Nam, Quận Đống Đa, Ngõ 1194 Đường Láng', N'', CAST(N'2025-02-28T10:49:59.923' AS DateTime), N'processing', NULL, NULL, NULL, NULL, N'Direct Bank Transfer', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (117, 23, N'THH', N'', N'0904422888', N'Việt Nam, Quận Đống Đa, Ngõ 1194 Đường Láng', N'', CAST(N'2025-02-28T10:55:35.417' AS DateTime), N'processing', NULL, NULL, NULL, NULL, N'Direct Bank Transfer', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (118, 23, N'aaa', N'', N'1234567890', N'Việt Nam, Huyện Sóc Sơn, Xã Tân Minh, Khu Thủy Lợi 2', N'', CAST(N'2025-03-03T11:15:53.200' AS DateTime), N'processing', NULL, NULL, NULL, NULL, N'Direct Bank Transfer', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (123, 23, N'aaa', N'', N'1234567890', N'Việt Nam, Huyện Sóc Sơn, Xã Tân Minh, Khu Thủy Lợi 2', N'', CAST(N'2025-03-04T22:48:15.947' AS DateTime), N'processing', 8824, NULL, NULL, NULL, N'Direct Bank Transfer', 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (124, 23, N'aaa', N'', N'1234567890', N'Việt Nam, Huyện Sóc Sơn, Xã Tân Minh, Khu Thủy Lợi 2', N'', CAST(N'2025-03-04T23:21:47.823' AS DateTime), N'processing', NULL, NULL, NULL, NULL, N'Cash on Delivery', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (134, 23, N'Ta Huy Hung', N'', N'0904422888', N'Địa chỉ mặc định', N'', CAST(N'2025-03-05T00:50:48.847' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (138, 23, N'THH', N'', N'0904422888', N'Việt Nam, Quận Đống Đa, Ngõ 1194 Đường Láng', N'', CAST(N'2025-03-05T00:52:22.757' AS DateTime), N'completed', 5916, NULL, NULL, NULL, N'Cash on Delivery', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (148, 23, N'try', N'', N'1234567890', N'Việt Nam, 11307, Quận Cầu Giấy, Hẻm 14 Đường Số 800A 3', N'', CAST(N'2025-03-05T01:11:22.693' AS DateTime), N'completed', 4462, NULL, NULL, NULL, N'Direct Bank Transfer', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (149, 23, N'THH', N'', N'0904422888', N'Việt Nam, Quận Đống Đa, Ngõ 1194 Đường Láng', N'', CAST(N'2025-03-05T01:12:28.303' AS DateTime), N'processing', 1554, NULL, NULL, NULL, N'Cash on Delivery', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (154, 23, N'try', N'', N'1234567890', N'Việt Nam, 11307, Quận Cầu Giấy, Hẻm 14 Đường Số 800A 3', N'', CAST(N'2025-03-05T11:04:44.157' AS DateTime), N'completed', 1554, NULL, NULL, NULL, N'Cash on Delivery', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (155, 25, N'TA HUY HUNG', N'', N'1234567890', N'Việt Nam, Quận Đống Đa, Phường Láng Thượng, Hẻm 1194/73/12 Đường Láng', N'', CAST(N'2025-03-05T11:34:42.550' AS DateTime), N'addressChanged', 1554, NULL, NULL, NULL, N'Cash on Delivery', 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (156, 25, N'Huy Hung', N'', N'', N'Địa chỉ mặc định', N'', CAST(N'2025-03-05T11:34:47.540' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (159, 25, N'thh', N'', N'0328995386', N'Việt Nam, 11512, Quận Đống Đa, Ngõ 1194 Đường Láng 99', N'', CAST(N'2025-03-05T11:36:49.013' AS DateTime), N'addressChanged', 3008, NULL, NULL, NULL, N'Cash on Delivery', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (164, 25, N'Huy Hùng', N'', N'1234567890', N'Việt Nam, Quận Đống Đa, Ngõ 1194 Đường Láng', N'', CAST(N'2025-03-05T11:43:24.070' AS DateTime), N'cancelled', 3008, NULL, NULL, NULL, N'Direct Bank Transfer', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (171, 23, N'try', N'', N'1234567890', N'Việt Nam, 11307, Quận Cầu Giấy, Hẻm 14 Đường Số 800A 3', N'', CAST(N'2025-03-05T21:33:54.133' AS DateTime), N'addressChanged', 29.079999923706055, NULL, NULL, NULL, N'Direct Bank Transfer', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (172, 25, N'thh', N'', N'0328995386', N'Việt Nam, 11512, Quận Đống Đa, Ngõ 1194 Đường Láng 99', N'', CAST(N'2025-03-05T21:35:35.410' AS DateTime), N'addressChanged', 3008, NULL, NULL, NULL, N'Direct Bank Transfer', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (174, 25, N'Huy Hùng', N'', N'1234567890', N'Việt Nam, Quận Đống Đa, Ngõ 1194 Đường Láng', N'', CAST(N'2025-03-05T21:38:29.557' AS DateTime), N'processing', 1554, NULL, NULL, NULL, N'Cash on Delivery', 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (175, 25, N'Huy Hùng', N'', N'1234567890', N'Việt Nam, Quận Đống Đa, Ngõ 1194 Đường Láng', N'', CAST(N'2025-03-05T21:39:11.963' AS DateTime), N'processing', 2804, NULL, NULL, NULL, N'Direct Bank Transfer', 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (184, 25, N'TA HUY HUNG', N'', N'0328995386', N'Việt Nam, Quận Hà Đông, Ngõ 1194 Quang Trung', N'', CAST(N'2025-03-07T23:09:37.377' AS DateTime), N'addressChanged', 1554, NULL, NULL, NULL, N'Paypal', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (213, 25, N'thh', N'', N'0328995386', N'Việt Nam, 11512, Quận Đống Đa, Ngõ 1194 Đường Láng 99', N'', CAST(N'2025-03-08T23:34:19.437' AS DateTime), N'shipped', 1554, NULL, NULL, NULL, N'Cash on Delivery', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (236, 33, N'Ta Huy Hung', N'', N'1234567890', N'Canada, BC, Surrey, HWY-99A', N'', CAST(N'2025-03-11T13:59:35.360' AS DateTime), N'processing', 1554, NULL, NULL, NULL, N'Cash on Delivery', 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (237, 33, N'Trần Mạnh Toản', N'', N'', N'Địa chỉ mặc định', N'', CAST(N'2025-03-11T13:59:44.537' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (246, 33, N'', N'', N'loading', N'loading', N'', CAST(N'2025-03-11T14:16:41.857' AS DateTime), N'pending', 70.660000801086426, NULL, NULL, NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1236, 25, N'TA HUY HUNG', N'', N'1234567890', N'Việt Nam, Quận Thanh Xuân, Ngõ 11 Nguyễn Quý Đức', N'', CAST(N'2025-03-11T15:36:41.120' AS DateTime), N'cancelled', 43.619999885559082, NULL, NULL, NULL, N'Direct Bank Transfer', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1237, 25, N'Huy Hùng', N'', N'1234567890', N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'', CAST(N'2025-03-14T22:11:42.350' AS DateTime), N'completed', 3008, NULL, NULL, NULL, N'Cash on Delivery', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1242, 25, N'Huy Hùng', N'', N'1234567890', N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'', CAST(N'2025-03-14T23:21:44.663' AS DateTime), N'processing', 4462, NULL, NULL, NULL, N'Cash on Delivery', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1250, 25, N'Huy Hùng', N'', N'1234567890', N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'', CAST(N'2025-03-18T23:37:40.440' AS DateTime), N'processing', 3008, NULL, NULL, NULL, N'Paypal', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1252, 25, N'Huy Hùng', N'', N'1234567890', N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'', CAST(N'2025-03-18T23:40:41.687' AS DateTime), N'processing', 13.46, NULL, NULL, NULL, N'Paypal', 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1264, 25, N'Huy Hùng', N'', N'1234567890', N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'', CAST(N'2025-03-20T00:04:00.230' AS DateTime), N'cancelled', 5092, NULL, NULL, NULL, N'Paypal', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1268, 25, N'Huy Hùng', N'', N'1234567890', N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'', CAST(N'2025-03-20T00:08:36.497' AS DateTime), N'cancelled', 2596, NULL, NULL, NULL, N'Paypal', 0, 0, N'0RL53906DU739835B')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1270, 25, N'Huy Hùng', N'', N'1234567890', N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'', CAST(N'2025-03-20T00:27:08.230' AS DateTime), N'cancelled', 7588, NULL, NULL, NULL, N'Paypal', 0, 0, N'0AM70692HD997701Y')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1274, 25, N'Huy Hùng', N'', N'1234567890', N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'', CAST(N'2025-03-20T00:55:20.317' AS DateTime), N'cancelled', 15.54, NULL, NULL, NULL, N'Paypal', 0, 1, N'55D097096L036454R')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1276, 25, N'Huy Hùng', N'', N'1234567890', N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'', CAST(N'2025-03-20T00:59:54.777' AS DateTime), N'cancelled', 15.54, NULL, NULL, NULL, N'Cash on Delivery', 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1277, 25, N'Huy Hùng', N'', N'1234567890', N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'', CAST(N'2025-03-20T13:42:50.240' AS DateTime), N'cancelled', 75.88, NULL, NULL, NULL, N'Paypal', 0, 1, N'5FE52635B6326434T')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1279, 25, N'Huy Hùng', N'', N'1234567890', N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'', CAST(N'2025-03-20T13:45:44.820' AS DateTime), N'cancelled', 4462, NULL, NULL, NULL, N'Paypal', 0, 0, N'27B8626446593971R')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1280, 25, N'Huy Hùng', N'', N'1234567890', N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'', CAST(N'2025-03-20T13:46:44.603' AS DateTime), N'cancelled', 75.88, NULL, NULL, NULL, N'Paypal', 0, 1, N'4U517315TS8508840')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1303, 25, N'Huy Hùng', N'', N'1234567890', N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'', CAST(N'2025-03-24T22:02:12.903' AS DateTime), N'cancelled', 15.54, NULL, NULL, NULL, N'Paypal', 0, 0, N'98X99934X32029234')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1315, 25, N'Huy Hùng', N'', N'1234567890', N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'', CAST(N'2025-03-24T22:46:24.307' AS DateTime), N'cancelled', 15.54, NULL, NULL, NULL, N'Paypal', 0, 1, N'7XH05214XN8505621')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1317, 25, N'Huy Hùng', N'', N'1234567890', N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'', CAST(N'2025-03-24T22:49:49.667' AS DateTime), N'cancelled', 15.54, NULL, NULL, NULL, N'Paypal', 0, 1, N'9GW99701JR323833W')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1318, 25, N'Huy Hùng', N'', N'1234567890', N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'', CAST(N'2025-03-24T22:57:36.733' AS DateTime), N'processing', 15.54, NULL, NULL, NULL, N'Cash on Delivery', 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1319, 25, N'Huy Hùng', N'', N'1234567890', N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'', CAST(N'2025-03-24T23:02:51.050' AS DateTime), N'cancelled', 15.54, NULL, NULL, NULL, N'Paypal', 0, 1, N'84426454N24547924')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1324, 23, N'try', N'', N'1234567890', N'Việt Nam, 11307, Quận Cầu Giấy, Hẻm 14 Đường Số 800A 3', N'', CAST(N'2025-03-30T22:21:46.670' AS DateTime), N'completed', 13.46, NULL, NULL, NULL, N'Cash on Delivery', 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1327, 25, N'Huy Hùng', N'', N'1234567890', N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'', CAST(N'2025-04-01T14:28:51.680' AS DateTime), N'cancelled', 15.54, NULL, NULL, NULL, N'Paypal', 0, 1, N'5F281610T64891904')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1329, 25, N'TA HUY HUNG', N'', N'0328995386', N'Việt Nam, Quận Hà Đông, Ngõ 1194 Quang Trung', N'', CAST(N'2025-04-01T14:32:10.943' AS DateTime), N'cancelled', 15.54, NULL, NULL, NULL, N'Paypal', 0, 0, N'2RD605703J800243U')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1330, 23, N'THH', N'', N'0904422888', N'Việt Nam, Quận Đống Đa, Ngõ 1194 Đường Láng', N'', CAST(N'2025-04-01T15:51:08.007' AS DateTime), N'cancelled', 55.08, NULL, NULL, NULL, N'Paypal', 0, 1, N'1C004903D5183353P')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1331, 23, N'TA HUY HUNG', N'', N'0328995386', N'Việt Nam, Huyện Lâm Thao, Phố Lâm Thao', N'', CAST(N'2025-04-01T15:53:25.730' AS DateTime), N'cancelled', 25.96, NULL, NULL, NULL, N'Paypal', 0, 1, N'4ER31688F6767581U')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1333, 25, N'TA HUY HUNG', N'', N'0328995386', N'Việt Nam, Quận Hà Đông, Ngõ 1194 Quang Trung', N'', CAST(N'2025-04-01T15:55:14.750' AS DateTime), N'cancelled', 30.08, NULL, NULL, NULL, N'Paypal', 0, 1, N'9VU937066J526630K')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1334, 23, N'TA HUY HUNG', N'', N'0328995386', N'Việt Nam, Huyện Lâm Thao, Phố Lâm Thao', N'', CAST(N'2025-04-01T15:57:00.997' AS DateTime), N'cancelled', 25.96, NULL, NULL, NULL, N'Paypal', 0, 1, N'8V9457385J7169017')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1335, 23, N'TA HUY HUNG', N'', N'0328995386', N'Việt Nam, Huyện Lâm Thao, Phố Lâm Thao', N'', CAST(N'2025-04-01T15:58:45.420' AS DateTime), N'cancelled', 15.54, NULL, NULL, NULL, N'Paypal', 0, 1, N'99T63491W0049741H')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1341, 23, N'TA HUY HUNG', N'', N'0328995386', N'Việt Nam, Huyện Lâm Thao, Phố Lâm Thao', N'', CAST(N'2025-04-04T08:30:28.510' AS DateTime), N'processing', 30.08, NULL, NULL, NULL, N'Cash on Delivery', 0, 1, N'95R626977H714252C')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1342, 23, N'TA HUY HUNG', N'', N'0328995386', N'Việt Nam, Huyện Lâm Thao, Phố Lâm Thao', N'', CAST(N'2025-04-04T08:39:56.073' AS DateTime), N'cancelled', 25.96, NULL, NULL, NULL, N'Paypal', 0, 1, N'51X15934MB053574V')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1351, 25, N'Huy Hùng', N'', N'1234567890', N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'', CAST(N'2025-04-06T22:55:01.940' AS DateTime), N'processing', 82.12, NULL, NULL, NULL, N'Cash on Delivery', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1358, 23, N'TA HUY HUNG', N'', N'0328995386', N'Việt Nam, Quận Đống Đa, Ngõ 1194 Đường Láng', N'', CAST(N'2025-04-08T10:15:02.510' AS DateTime), N'cancelled', 15.54, NULL, NULL, NULL, N'Paypal', 0, 1, N'34M9092196319913G')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1359, 23, N'TA HUY HUNG', N'', N'0328995386', N'Việt Nam, Quận Đống Đa, Ngõ 1194 Đường Láng', N'', CAST(N'2025-04-08T10:18:30.630' AS DateTime), N'processing', 15.54, NULL, NULL, NULL, N'Direct Bank Transfer', 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1360, 23, N'TA HUY HUNG', N'', N'0328995386', N'Việt Nam, Quận Đống Đa, Ngõ 1194 Đường Láng', N'', CAST(N'2025-04-08T10:24:47.793' AS DateTime), N'addressChanged', 15.54, NULL, NULL, NULL, N'Cash on Delivery', 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1361, 23, N'THH', N'', N'0904422888', N'Việt Nam, Quận Đống Đa, Ngõ 1194 Đường Láng', N'', CAST(N'2025-04-08T10:25:20.233' AS DateTime), N'addressChanged', 15.54, NULL, NULL, NULL, N'Paypal', 0, 1, N'1CH42934UP1811823')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1363, 23, N'TA HUY HUNG', N'', N'0328995386', N'Việt Nam, Quận Đống Đa, Ngõ 1194 Đường Láng', N'', CAST(N'2025-04-10T08:41:44.063' AS DateTime), N'processing', 194.3, NULL, NULL, NULL, N'Paypal', 0, 0, N'7LR70378JB562232T')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1364, 23, N'TA HUY HUNG', N'', N'0328995386', N'Việt Nam, Quận Đống Đa, Ngõ 1194 Đường Láng', N'', CAST(N'2025-04-10T08:52:23.513' AS DateTime), N'processing', 570.48, NULL, NULL, NULL, N'Cash on Delivery', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1367, 23, N'TA HUY HUNG', N'', N'0328995386', N'Việt Nam, Quận Đống Đa, Ngõ 1194 Đường Láng', N'', CAST(N'2025-04-10T09:04:44.707' AS DateTime), N'processing', 15.54, NULL, NULL, NULL, N'Cash on Delivery', 0, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1371, 25, N'Huy Hùng', N'', N'1234567890', N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'', CAST(N'2025-04-14T10:43:32.903' AS DateTime), N'processing', 15.54, NULL, NULL, NULL, N'Paypal', 0, 0, N'9HC844219T602903R')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1372, 25, N'Huy Hùng', N'', N'1234567890', N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'', CAST(N'2025-04-14T10:43:59.363' AS DateTime), N'processing', 23.88, NULL, NULL, NULL, N'Paypal', 0, 1, N'20X10730XJ359623M')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1373, 25, N'Huy Hùng', N'', N'1234567890', N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'', CAST(N'2025-04-14T10:44:38.730' AS DateTime), N'processing', 15.54, NULL, NULL, NULL, N'Cash on Delivery', 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1374, 25, N'Huy Hùng', N'', N'1234567890', N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'', CAST(N'2025-04-14T10:45:37.160' AS DateTime), N'processing', 15.54, NULL, NULL, NULL, N'Paypal', 0, 1, N'6CT354963P590832E')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1376, 25, N'Huy Hùng', N'', N'1234567890', N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'', CAST(N'2025-04-14T10:46:15.797' AS DateTime), N'processing', 15.54, NULL, NULL, NULL, N'Paypal', 0, 0, N'37N971861P687471E')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1379, 23, N'', N'', N'loading', N'loading', N'', CAST(N'2025-04-14T11:15:35.040' AS DateTime), N'pending', 741.53999805450439, NULL, NULL, NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1383, 25, N'Huy Hùng', N'', N'1234567890', N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'', CAST(N'2025-04-17T09:54:11.277' AS DateTime), N'cancelled', 69.58, NULL, NULL, NULL, N'Paypal', 0, 0, N'46R563538U407154G')
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1388, 25, N'', N'', N'loading', N'loading', N'', CAST(N'2025-04-17T10:02:15.207' AS DateTime), N'pending', 14.539999961853027, NULL, NULL, NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money], [shipping_method], [shipping_date], [tracking_number], [payment_method], [active], [IsQuickPurchase], [CaptureId]) VALUES (1389, 25, N'', N'', N'loading', N'loading', N'', CAST(N'2025-04-17T10:02:57.940' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[product_images] ON 
GO
INSERT [dbo].[product_images] ([id], [product_id], [image_url]) VALUES (1, 1, N'sp1.jpg')
GO
INSERT [dbo].[product_images] ([id], [product_id], [image_url]) VALUES (2, 1, N'sp2.jpg')
GO
INSERT [dbo].[product_images] ([id], [product_id], [image_url]) VALUES (3, 1, N'sp3.jpg')
GO
INSERT [dbo].[product_images] ([id], [product_id], [image_url]) VALUES (4, 2, N'sp4.jpg')
GO
INSERT [dbo].[product_images] ([id], [product_id], [image_url]) VALUES (5, 2, N'sp5.jpg')
GO
INSERT [dbo].[product_images] ([id], [product_id], [image_url]) VALUES (6, 3, N'sp6.jpg')
GO
INSERT [dbo].[product_images] ([id], [product_id], [image_url]) VALUES (7, 3, N'sp7.jpg')
GO
INSERT [dbo].[product_images] ([id], [product_id], [image_url]) VALUES (8, 4, N'sp8.jpg')
GO
INSERT [dbo].[product_images] ([id], [product_id], [image_url]) VALUES (9, 4, N'sp9.jpg')
GO
INSERT [dbo].[product_images] ([id], [product_id], [image_url]) VALUES (10, 5, N'sp10.jpg')
GO
INSERT [dbo].[product_images] ([id], [product_id], [image_url]) VALUES (11, 5, N'sp11.jpg')
GO
INSERT [dbo].[product_images] ([id], [product_id], [image_url]) VALUES (12, 6, N'sp12.jpg')
GO
SET IDENTITY_INSERT [dbo].[product_images] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (1, N'Áo thun tay phối ren', 14.54, N'Áo thun tay phối ren cá tính, trẻ trung và nổi bật. Thiết kế in chữ tạo nên nét đặc biệt khi diện. Trang phục phù hợp dạo phố, thường ngày, đi học... Có 02 màu cho nàng thêm sự lựa chọn', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 1, N'sp1.jpg', 1)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (2, N'Áo Thun Dài Tay đính đá', 14.54, N'Áo Thun Dài Tay đính đá thanh lịch, nữ tính. Trang phục phù hợp dạo phố, đi chơi, du lịch', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 1, N'sp2.jpg', 1)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (3, N'Áo thun thỏ Junnie ', 14.54, N'Thun thun thỏ cá tính, trẻ trung và nổi bật. Thiết kế in chữ tạo nên nét đặc biệt khi diện. Trang phục phù hợp dạo phố, thường ngày, đi học...', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 1, N'sp3.jpg', 1)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (4, N'Áo cardigan', 24.96, N'Áo cardigan cổ tròn thêu charm nơ thời trang, thanh lịch. Trang phục phù hợp dạo phố, đi làm, đi tiệc....', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 2, N'sp4.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (5, N'Áo dệt kim', 24.96, N'Áo dệt kim cổ lọ thêu chữ Meilleur jour de ma vie thời trang, thanh lịch. Trang phục phù hợp dạo phố, đi làm, đi tiệc....', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 3, N'sp5.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (6, N'Áo Khoác dáng Lửng', 27.04, N'Áo Khoác dáng cũn thời trang, thanh lịch. Trang phục phù hợp dạo phố, đi làm, đi tiệc....', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 2, N'sp6.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (7, N'Đầm Mini', 27.04, N'Đầm Mini phối cổ sơmi trẻ trung, năng động. Trang phục được thiết kế đơn giản tập trung vào chất liệu vải denim cao cấp tạo sự thoải mái tối đa cho người mặc. Phù hợp với nhiều mục đích sử dụng như đi học, đi chơi, dạo phố,..', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 4, N'sp7.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (8, N'Chân váy nỉ', 18.71, N'Chân váy nỉ xếp ly phối ren trẻ trung, nữ tính. Trang phục phù hợp dạo phố, thường ngày,...', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 5, N'sp8.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (9, N'Áo thun form boxy', 10.38, N'Áo thun form boxy in cao 3D cá tính, trẻ trung và nổi bật. Trang phục phù hợp dạo phố, thường ngày, đi học...', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 1, N'sp9.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (10, N'Áo pullover', 20.79, N'Áo pullover thêu Ballerina trẻ trung, năng động. Trang phục phù hợp dạo phố, đi làm, đi học...', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 1, N'sp10.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (11, N'Chân váy xốp', 18.71, N'Chân váy xốp nổi hoa văn xếp ly, năng động. Váy được thiết kế đơn giản với điểm nhấn ở phần thắt lưng tạo sự nổi bật cho người sử dụng. Chất liệu vải cao cấp tạo sự thoải mái tối đa cho người mặc', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 5, N'sp11.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (12, N'Áo dệt kim', 24.96, N'Áo dệt kim kiểu vặn thừng ngực thêu chữ J trẻ trung, năng động. Trang phục phù hợp dạo phố, thường ngày, đi học. Phối màu basic dễ sử dụng, phù hợp với nhiều phong cách', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 3, N'sp12.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (13, N'Đầm midi', 27.04, N' Đầm midi sọc ngang nữ tính, thanh lịch.Trang phục thiết kế với form đơn giản, tôn dáng người mặc với điểm nhấn là phần nơ thân sau.Chất liệu jersey kim cao cấp tạo sự thoải mái tối đa cho người mặc.Phù hợp với nhiều mục đích sử dụng khác nhau như đi dạo, đi chơi, mặc thường ngày,...', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 4, N'sp13.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (14, N'Đầm lệch vai', 27.04, N'Đầm lệch vai rút eo.Đầm thiết kế tay phồng, triết ao dây rút tôn dáng và đầy thu hút.Trang phục phù hợp dạo phố, thường ngày, đi tiệc...', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 4, N'sp14.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (15, N'Áo thun kim tuyến', 14.54, N'Áo thun form boxy in kim tuyến cá tính, trẻ trung và nổi bật.Thiết kế in kim tuyến và phối nơ mang lại nét đặc biệt khi diện.Trang phục phù hợp dạo phố, thường ngày, đi học....Có 02 màu cho nàng thêm sự lựa chọn', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 1, N'sp15.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (16, N'Áo vest xốp', 24.96, N'Áo vest xốp nổi hoa văn tay ngắn thanh lịch, thời trang.Trang phục phù hợp dạo phố, đi làm, đi tiệc....', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 3, N'sp16.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (17, N'Áo cest la vie', 22.88, N'Áo dệt ngắn tay cest la vie năng động.Trang phục phù hợp dạo phố, đi học.Chất liệu vải knit đàn hồi cao, tạo sự thoải mái cho người mặc.02 Phối màu phù hợp với nhiều phong cách', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 3, N'sp17.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (18, N'Chân váy tùng bí', 18.71, N' Chân váy ngắn tùng bí thắt nơ xinh xắn, nữ tính.Phù hợp với nhiều mục đích sử dụng như đi chơi, đi học, đi làm, đi dạo phố,..', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 5, N'sp18.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (19, N'Áo tranh đồng hoa', 16.63, N'Áo thun form rộng in kỹ thuật số tranh đồng hoa trẻ trung, năng động.Trang phục phù hợp dạo phố, thường ngày, đi học....Phối màu Trắng cơ bản, dễ sử dụng', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 1, N'sp19.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (20, N'Áo thêu 3D', 14.54, N' Áo thun form boxy thêu 3D "MIAMI AESTHETIC" cá tính, trẻ trung.Trang phục phù hợp dạo phố, thường ngày, đi học...Có 03 phối màu Hồng, Xanh, Xám cho nàng thêm sự lựa chọn', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 1, N'sp20.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (21, N'Đầm Bí Hạ Vai', 24.96, N'Đầm Bí Hạ Vai nữ tính, nổi bật và thu hút.Trang phục phù hợp dạo phố, thường ngày, đi tiệc...', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 4, N'sp21.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (22, N'Đầm maxi', 29.13, N'Đầm maxi 2 dây phối ren thời trang, năng động.Đầm 2 dây sọc dọc tạo cảm giác thon thả cho nàng.Phối màu hiện đại.Chất liệu vải linen cao cấp tạo sự thoải mái tối đa cho người mặc.Phù hợp với nhiều mục đích sử dụng khách nhau như đi học, đi làm, đi chơi,...', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 4, N'sp22.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (23, N'Quần tây', 24.96, N' Quần tây ống đứng xếp ly hiện đại, thanh lịch.Trang phục phù hợp đi học, đi làm, thường ngày,...02 Phối màu Đen và Kem cơ bản, dễ sử dụng, cho nàng thêm lựa chọn', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 6, N'sp23.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (24, N'Áo dệt creme', 22.88, N'Áo dệt creme tay ngắn năng động.Trang phục phù hợp dạo phố, đi học.Chất liệu vải knit đàn hồi cao, tạo sự thoải mái cho người mặc.02 Phối màu Xanh đen và Hồng phù hợp với nhiều phong cách', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 3, N'sp24.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (25, N'Áo dệt cổ vuông', 16.63, N' Áo dệt cổ vuông tay ngắn nữ tính, thời trang.Trang phục phù hợp dạo phố, đi học, đi chơi,....02 Phối màu Đen và Hồng hiện đại phù hợp với nhiều phong cách', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 3, N'sp25.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (26, N'Áo tanktop', 12.46, N'Áo thun tanktop thêu chữ J cách điệu cá tính, năng động.Trang phục phù hợp dạo phố, thường ngày..', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 1, N'sp26.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (27, N'Áo baby tee Cherie', 14.54, N'Áo thun form baby tee Cherie trẻ trung, năng động.Trang phục phù hợp dạo phố, thường ngày, đi học...Có 03 màu sắc trắng, đô, đen cho nàng thêm lựa chọn', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 1, N'sp27.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (28, N'Quần short Jean', 18.71, N'Quần short Jean Form A trẻ trung, năng động.Phù hợp với nhiều phong cách.Trang phục phù hợp đi chơi, đi học, dạo phố...', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 6, N'sp28.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (29, N'Quần váy Jean', 18.5, N'Quần váy Jean trẻ trung, năng động.Phù hợp với nhiều phong cách.Trang phục phù hợp đi chơi, đi học, dạo phố...', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 6, N'sp29.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (30, N'Đầm lửng rút', 27.04, N'Đầm lửng rút nhún in hoa nữ tính.Trang phục phù hợp dạo phố, thường ngày,...', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 4, N'sp30.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (31, N'ÁO IN “MUSÉE”', 12.46, N'Áo thun form boxy in “MUSÉE”.Trang phục phù hợp dạo phố, thường ngày, đi học...', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 1, N'sp31.jpg', NULL)
GO
INSERT [dbo].[products] ([id], [name], [price], [description], [created_at], [updated_at], [category_id], [image], [brand_id]) VALUES (32, N'Đầm sơ mi', 29.13, N'Đầm sơ mi không tay tùng xếp ly thanh lịch, thời trang.Trang phục phù hợp dạo phố, thường ngày,...', CAST(N'2024-11-10T20:15:15.400' AS DateTime), CAST(N'2024-11-10T20:15:15.400' AS DateTime), 4, N'sp32.jpg', NULL)
GO
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[ReviewMedia] ON 
GO
INSERT [dbo].[ReviewMedia] ([media_id], [review_id], [media_type], [media_url]) VALUES (3, 8, N'image/jpeg', N'/uploads/b4161b00-03cd-4181-bd6d-d8171c188372_e21d38b6-f316-4bb7-b82d-5cacfb5b75ee.jpeg')
GO
INSERT [dbo].[ReviewMedia] ([media_id], [review_id], [media_type], [media_url]) VALUES (4, 10, N'video/mp4', N'/uploads/fb7a5a51-8853-4c95-b17a-ebec095d42a7_Bai 12. Cai dat driver cho may that SamSung.mp4')
GO
INSERT [dbo].[ReviewMedia] ([media_id], [review_id], [media_type], [media_url]) VALUES (5, 11, N'video/mp4', N'/uploads/6c614232-edde-4350-99cb-8c9ffa7fefd4_Bai 12. Cai dat driver cho may that SamSung.mp4')
GO
INSERT [dbo].[ReviewMedia] ([media_id], [review_id], [media_type], [media_url]) VALUES (6, 11, N'image/jpeg', N'/uploads/a9b21cc6-865b-455a-882e-2a81bfa0b0ac_cac-hang-ve-may-bay-banner.jpg')
GO
INSERT [dbo].[ReviewMedia] ([media_id], [review_id], [media_type], [media_url]) VALUES (11, 13, N'video/mp4', N'/uploads/d1cdae9f-a5cb-4733-b7e9-ea05db16b08f_Bai 12. Cai dat driver cho may that SamSung.mp4')
GO
INSERT [dbo].[ReviewMedia] ([media_id], [review_id], [media_type], [media_url]) VALUES (12, 13, N'image/jpeg', N'/uploads/ab8130a0-637e-4834-a12d-355fe7a533af_dragon3.jpg')
GO
INSERT [dbo].[ReviewMedia] ([media_id], [review_id], [media_type], [media_url]) VALUES (13, 13, N'image/jpeg', N'/uploads/924755e9-1688-42d2-adc1-c8dc442d2a13_h.jpg')
GO
INSERT [dbo].[ReviewMedia] ([media_id], [review_id], [media_type], [media_url]) VALUES (14, 13, N'image/png', N'/uploads/9b5301cf-180c-426e-b664-37197321e2df_h.png')
GO
INSERT [dbo].[ReviewMedia] ([media_id], [review_id], [media_type], [media_url]) VALUES (15, 13, N'image/png', N'/uploads/c1c5461b-ef5c-4046-88b2-4ee52c42e435_dragon.png')
GO
INSERT [dbo].[ReviewMedia] ([media_id], [review_id], [media_type], [media_url]) VALUES (16, 13, N'image/jpeg', N'/uploads/18f07eb9-aeaa-4820-a388-bfe3293fc582_dragon_11.jpg')
GO
INSERT [dbo].[ReviewMedia] ([media_id], [review_id], [media_type], [media_url]) VALUES (17, 13, N'image/png', N'/uploads/28a7eb16-1818-4915-ae18-5c9bd8f39820_dragon2.png')
GO
INSERT [dbo].[ReviewMedia] ([media_id], [review_id], [media_type], [media_url]) VALUES (18, 14, N'image/jpeg', N'/uploads/71dd9838-e5ac-41be-8cab-d480e2abc13b_arrow.jpg')
GO
INSERT [dbo].[ReviewMedia] ([media_id], [review_id], [media_type], [media_url]) VALUES (19, 14, N'image/png', N'/uploads/6f5f272c-cf16-49be-bf6f-6dc047618d15_arrow.png')
GO
INSERT [dbo].[ReviewMedia] ([media_id], [review_id], [media_type], [media_url]) VALUES (20, 14, N'video/mp4', N'/uploads/6b83c527-14db-400b-bc2b-01a5ac6ca1ed_Bai 7. Cac man hinh quan trong ma lap trinh vien thuong thao tac.mp4')
GO
INSERT [dbo].[ReviewMedia] ([media_id], [review_id], [media_type], [media_url]) VALUES (21, 12, N'image/jpeg', N'/uploads/ee812735-9957-4950-a92e-2bdf1e22ded4_arrow.jpg')
GO
SET IDENTITY_INSERT [dbo].[ReviewMedia] OFF
GO
SET IDENTITY_INSERT [dbo].[Reviews] ON 
GO
INSERT [dbo].[Reviews] ([review_id], [user_id], [product_id], [rating], [review_text], [review_date]) VALUES (8, 25, 3, 4, N'ok', CAST(N'2025-04-01T14:22:37.050' AS DateTime))
GO
INSERT [dbo].[Reviews] ([review_id], [user_id], [product_id], [rating], [review_text], [review_date]) VALUES (10, 25, 1, 5, N'null', CAST(N'2025-04-01T14:22:24.083' AS DateTime))
GO
INSERT [dbo].[Reviews] ([review_id], [user_id], [product_id], [rating], [review_text], [review_date]) VALUES (11, 23, 2, 5, N'ok!ll', CAST(N'2025-04-01T15:44:50.410' AS DateTime))
GO
INSERT [dbo].[Reviews] ([review_id], [user_id], [product_id], [rating], [review_text], [review_date]) VALUES (12, 23, 1, 4, N'cung dc hahahahaha', CAST(N'2025-03-30T23:09:17.630' AS DateTime))
GO
INSERT [dbo].[Reviews] ([review_id], [user_id], [product_id], [rating], [review_text], [review_date]) VALUES (13, 16, 1, 5, N'hahahahahahahahahahahaha', CAST(N'2025-03-16T23:41:02.470' AS DateTime))
GO
INSERT [dbo].[Reviews] ([review_id], [user_id], [product_id], [rating], [review_text], [review_date]) VALUES (14, 23, 3, 4, NULL, CAST(N'2025-03-17T08:45:32.150' AS DateTime))
GO
INSERT [dbo].[Reviews] ([review_id], [user_id], [product_id], [rating], [review_text], [review_date]) VALUES (15, 23, 31, 3, NULL, CAST(N'2025-04-14T10:51:08.503' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 
GO
INSERT [dbo].[roles] ([id], [name]) VALUES (1, N'Seller')
GO
INSERT [dbo].[roles] ([id], [name]) VALUES (2, N'User')
GO
INSERT [dbo].[roles] ([id], [name]) VALUES (3, N'Admin')
GO
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[ShippingAddress] ON 
GO
INSERT [dbo].[ShippingAddress] ([id], [user_id], [address], [phone_number], [is_default], [fullname]) VALUES (1, 1, N'123 Lê L?i', N'0901234567', 1, NULL)
GO
INSERT [dbo].[ShippingAddress] ([id], [user_id], [address], [phone_number], [is_default], [fullname]) VALUES (43, 2, N'ko bt', N'1234567890', 1, N'TQH')
GO
INSERT [dbo].[ShippingAddress] ([id], [user_id], [address], [phone_number], [is_default], [fullname]) VALUES (113, 20, N'ko bt', N'1234567890', 1, N'TQH')
GO
INSERT [dbo].[ShippingAddress] ([id], [user_id], [address], [phone_number], [is_default], [fullname]) VALUES (119, 22, N'ko bt', N'1234567890', 1, N'TQH')
GO
INSERT [dbo].[ShippingAddress] ([id], [user_id], [address], [phone_number], [is_default], [fullname]) VALUES (120, 21, N'ko bt', N'1234567890', 1, N'TQH')
GO
INSERT [dbo].[ShippingAddress] ([id], [user_id], [address], [phone_number], [is_default], [fullname]) VALUES (121, 21, N'ko bt', N'1234567890', 0, N'TQHh')
GO
INSERT [dbo].[ShippingAddress] ([id], [user_id], [address], [phone_number], [is_default], [fullname]) VALUES (122, 16, N'ko bt', N'1234567890', 0, N'TQH')
GO
INSERT [dbo].[ShippingAddress] ([id], [user_id], [address], [phone_number], [is_default], [fullname]) VALUES (124, 16, N'ko bt', N'0936766661', 1, N'thh')
GO
INSERT [dbo].[ShippingAddress] ([id], [user_id], [address], [phone_number], [is_default], [fullname]) VALUES (125, 23, N'Việt Nam, Quận Đống Đa, Ngõ 1194 Đường Láng', N'0904422888', 0, N'THH')
GO
INSERT [dbo].[ShippingAddress] ([id], [user_id], [address], [phone_number], [is_default], [fullname]) VALUES (129, 25, N'Xiang Gang Te Bie Xing Zheng Qu, Xin Jie, Li Dao Qu, Da Dong Lu', N'1234567890', 1, N'Huy Hùng')
GO
INSERT [dbo].[ShippingAddress] ([id], [user_id], [address], [phone_number], [is_default], [fullname]) VALUES (130, 25, N'Việt Nam, 11512, Quận Đống Đa, Ngõ 1194 Đường Láng 99', N'0328995386', 0, N'thh')
GO
INSERT [dbo].[ShippingAddress] ([id], [user_id], [address], [phone_number], [is_default], [fullname]) VALUES (131, 25, N'Việt Nam, Quận Hà Đông, Ngõ 1194 Quang Trung', N'0328995386', 0, N'TA HUY HUNG')
GO
INSERT [dbo].[ShippingAddress] ([id], [user_id], [address], [phone_number], [is_default], [fullname]) VALUES (133, 25, N'Việt Nam, Quận Thanh Xuân, Ngõ 11 Nguyễn Quý Đức', N'1234567890', 0, N'TA HUY HUNG')
GO
INSERT [dbo].[ShippingAddress] ([id], [user_id], [address], [phone_number], [is_default], [fullname]) VALUES (135, 33, N'Canada, BC, Surrey, HWY-99A', N'1234567890', 1, N'Ta Huy Hung')
GO
INSERT [dbo].[ShippingAddress] ([id], [user_id], [address], [phone_number], [is_default], [fullname]) VALUES (1135, 23, N'Việt Nam, Quận Đống Đa, Ngõ 1194 Đường Láng', N'0328995386', 1, N'TA HUY HUNG')
GO
INSERT [dbo].[ShippingAddress] ([id], [user_id], [address], [phone_number], [is_default], [fullname]) VALUES (1136, 25, N'Việt Nam, 12012, Quận Nam Từ Liêm, Ngõ 14 Mễ Trì Hạ 3', N'0328995386', 0, N'TA HUY HUNG')
GO
SET IDENTITY_INSERT [dbo].[ShippingAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[social_accounts] ON 
GO
INSERT [dbo].[social_accounts] ([id], [provider], [provider_id], [email], [name], [user_id]) VALUES (1, N'Facebook', N'fb_id_1', N'user1@example.com', N'User One', 1)
GO
INSERT [dbo].[social_accounts] ([id], [provider], [provider_id], [email], [name], [user_id]) VALUES (2, N'Google', N'google_id_1', N'user2@example.com', N'User Two', 2)
GO
INSERT [dbo].[social_accounts] ([id], [provider], [provider_id], [email], [name], [user_id]) VALUES (3, N'Twitter', N'twitter_id_1', N'user3@example.com', N'User Three', 3)
GO
INSERT [dbo].[social_accounts] ([id], [provider], [provider_id], [email], [name], [user_id]) VALUES (4, N'LinkedIn', N'linkedin_id_1', N'user4@example.com', N'User Four', 4)
GO
INSERT [dbo].[social_accounts] ([id], [provider], [provider_id], [email], [name], [user_id]) VALUES (5, N'Instagram', N'instagram_id_1', N'user5@example.com', N'User Five', 5)
GO
INSERT [dbo].[social_accounts] ([id], [provider], [provider_id], [email], [name], [user_id]) VALUES (6, N'Facebook', N'fb_id_2', N'user6@example.com', N'User Six', 6)
GO
INSERT [dbo].[social_accounts] ([id], [provider], [provider_id], [email], [name], [user_id]) VALUES (7, N'Google', N'google_id_2', N'user7@example.com', N'User Seven', 7)
GO
INSERT [dbo].[social_accounts] ([id], [provider], [provider_id], [email], [name], [user_id]) VALUES (8, N'Twitter', N'twitter_id_2', N'user8@example.com', N'User Eight', 8)
GO
INSERT [dbo].[social_accounts] ([id], [provider], [provider_id], [email], [name], [user_id]) VALUES (9, N'LinkedIn', N'linkedin_id_2', N'user9@example.com', N'User Nine', 9)
GO
INSERT [dbo].[social_accounts] ([id], [provider], [provider_id], [email], [name], [user_id]) VALUES (10, N'Instagram', N'instagram_id_2', N'user10@example.com', N'User Ten', 10)
GO
INSERT [dbo].[social_accounts] ([id], [provider], [provider_id], [email], [name], [user_id]) VALUES (11, N'facebook', N'1845324656240928', N'huyhung.ht487@gmail.com', N'Huy Hung', 25)
GO
INSERT [dbo].[social_accounts] ([id], [provider], [provider_id], [email], [name], [user_id]) VALUES (12, N'facebook', N'1765203317359453', N'trantuong0477@gmail.com', N'Trần Mạnh Toản', 33)
GO
SET IDENTITY_INSERT [dbo].[social_accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[tokens] ON 
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1329, N'RefreshToken', N'7a5f4c6c-5791-41d5-821c-4c1cc95456e1', 23, CAST(N'2025-05-01T09:08:58.067' AS DateTime), 1, 1)
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1330, N'RefreshToken', N'791f35c8-4512-4916-8bb8-5356cfa38950', 25, CAST(N'2025-05-03T16:00:01.250' AS DateTime), 1, 1)
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1331, N'RefreshToken', N'25c8bb16-2989-45b8-8fe0-32f556d51e75', 23, CAST(N'2025-05-03T16:01:05.800' AS DateTime), 1, 1)
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1332, N'RefreshToken', N'02a1d07e-ed10-4b43-830b-433507e432e6', 23, CAST(N'2025-05-04T01:28:57.913' AS DateTime), 1, 1)
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1333, N'RefreshToken', N'4831cc26-3e06-4c9d-8671-1fe56476d5dd', 23, CAST(N'2025-05-04T01:38:20.100' AS DateTime), 1, 1)
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1334, N'RefreshToken', N'eb08cad2-aa26-4b2f-9767-9136860beaa7', 1035, CAST(N'2025-05-04T01:44:21.933' AS DateTime), 1, 1)
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1335, N'RefreshToken', N'7951a8f3-0e37-4361-970e-8345e0362bdf', 23, CAST(N'2025-05-04T01:54:23.077' AS DateTime), 1, 1)
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1336, N'RefreshToken', N'21f85b23-532d-40f9-ac29-6af491b5453b', 25, CAST(N'2025-05-06T15:50:55.557' AS DateTime), 1, 1)
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1337, N'RefreshToken', N'87952bf6-7213-461d-8349-437c5219d596', 25, CAST(N'2025-05-08T03:11:53.307' AS DateTime), 1, 1)
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1338, N'RefreshToken', N'cbc75930-b00c-4579-8f11-eb83803d08c6', 23, CAST(N'2025-05-08T03:13:31.407' AS DateTime), 1, 1)
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1339, N'RefreshToken', N'eedece04-faa9-4d1e-9ae8-42a678ff2d2f', 23, CAST(N'2025-05-08T03:21:47.897' AS DateTime), 1, 1)
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1340, N'RefreshToken', N'55ec41da-583a-4b29-b310-f7576095ea7a', 23, CAST(N'2025-05-10T01:04:33.703' AS DateTime), 1, 1)
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1341, N'RefreshToken', N'26bee331-172e-42b3-b564-7d24f2f9cbd2', 23, CAST(N'2025-05-10T02:04:02.670' AS DateTime), 1, 1)
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1342, N'RefreshToken', N'c47f32c8-0aae-48c3-8112-d9e10f51638b', 23, CAST(N'2025-05-10T02:04:12.047' AS DateTime), 1, 1)
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1343, N'RefreshToken', N'1d8a6abc-8c55-4b6d-99b5-5d57d95679bc', 25, CAST(N'2025-05-10T02:08:16.790' AS DateTime), 1, 1)
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1344, N'RefreshToken', N'719fc75b-c0ad-4f80-a2c2-f53af19ba9a2', 25, CAST(N'2025-05-14T03:38:04.597' AS DateTime), 1, 1)
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1345, N'RefreshToken', N'c3e7885d-94d7-4ed3-a180-1b301ab9738e', 23, CAST(N'2025-05-14T03:50:08.153' AS DateTime), 1, 1)
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1346, N'RefreshToken', N'a22e50f5-b66c-4915-b4f5-9c0fde2001cd', 25, CAST(N'2025-05-15T06:59:47.250' AS DateTime), 0, 0)
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1347, N'RefreshToken', N'f2d98ebb-e1d3-4117-a490-b387520de031', 25, CAST(N'2025-05-17T02:40:54.477' AS DateTime), 0, 0)
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1348, N'RefreshToken', N'b1c3ad8b-972f-4b92-aca6-122fc5aecfa3', 23, CAST(N'2025-05-17T02:43:14.593' AS DateTime), 1, 1)
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1349, N'RefreshToken', N'e73eeecd-f5f3-4dfa-b6cf-d718151ec890', 25, CAST(N'2025-05-17T02:53:22.563' AS DateTime), 0, 0)
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1350, N'RefreshToken', N'40c73398-fc1b-4ac3-9523-ab550256a47f', 23, CAST(N'2025-05-22T03:29:55.047' AS DateTime), 1, 1)
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1351, N'RefreshToken', N'3578dc6b-9e45-4720-bf67-fab17b532000', 23, CAST(N'2025-05-22T03:43:05.103' AS DateTime), 1, 1)
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1352, N'RefreshToken', N'f20e9dde-df23-4102-8306-c51977e3c60c', 16, CAST(N'2025-05-22T03:43:51.493' AS DateTime), 1, 1)
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1353, N'RefreshToken', N'9b8a188b-2d8e-4287-a51a-6fd0ac177b8e', 23, CAST(N'2025-05-22T03:50:04.230' AS DateTime), 1, 1)
GO
INSERT [dbo].[tokens] ([id], [token_type], [token], [user_id], [expiration_date], [revoked], [expired]) VALUES (1354, N'RefreshToken', N'8f25b083-b34e-47cf-b305-36c458d5b785', 16, CAST(N'2025-05-22T03:58:25.763' AS DateTime), 0, 0)
GO
SET IDENTITY_INSERT [dbo].[tokens] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users] ([id], [fullname], [phone_number], [password], [created_at], [updated_at], [is_active], [date_of_birth], [facebook_account_id], [google_account_id], [role_id], [email]) VALUES (1, N'Nguyen Van K', N'0123456780', N'password11', CAST(N'2024-11-10T20:15:15.430' AS DateTime), CAST(N'2024-11-10T20:15:15.430' AS DateTime), 1, CAST(N'1980-01-01' AS Date), 0, 0, 1, NULL)
GO
INSERT [dbo].[users] ([id], [fullname], [phone_number], [password], [created_at], [updated_at], [is_active], [date_of_birth], [facebook_account_id], [google_account_id], [role_id], [email]) VALUES (2, N'Tran Thi L', N'0987654321', N'password12', CAST(N'2024-11-10T20:15:15.430' AS DateTime), CAST(N'2024-11-10T20:15:15.430' AS DateTime), 1, CAST(N'1981-02-02' AS Date), 0, 0, 2, NULL)
GO
INSERT [dbo].[users] ([id], [fullname], [phone_number], [password], [created_at], [updated_at], [is_active], [date_of_birth], [facebook_account_id], [google_account_id], [role_id], [email]) VALUES (3, N'Le Van M', N'0345678900', N'password13', CAST(N'2024-11-10T20:15:15.430' AS DateTime), CAST(N'2024-11-10T20:15:15.430' AS DateTime), 1, CAST(N'1982-03-03' AS Date), 0, 0, 1, NULL)
GO
INSERT [dbo].[users] ([id], [fullname], [phone_number], [password], [created_at], [updated_at], [is_active], [date_of_birth], [facebook_account_id], [google_account_id], [role_id], [email]) VALUES (4, N'Pham Thi N', N'0765432190', N'password14', CAST(N'2024-11-10T20:15:15.430' AS DateTime), CAST(N'2024-11-10T20:15:15.430' AS DateTime), 1, CAST(N'1983-04-04' AS Date), 0, 0, 2, NULL)
GO
INSERT [dbo].[users] ([id], [fullname], [phone_number], [password], [created_at], [updated_at], [is_active], [date_of_birth], [facebook_account_id], [google_account_id], [role_id], [email]) VALUES (5, N'Nguyen Van O', N'0213456790', N'password15', CAST(N'2024-11-10T20:15:15.430' AS DateTime), CAST(N'2024-11-10T20:15:15.430' AS DateTime), 1, CAST(N'1984-05-05' AS Date), 0, 0, 1, NULL)
GO
INSERT [dbo].[users] ([id], [fullname], [phone_number], [password], [created_at], [updated_at], [is_active], [date_of_birth], [facebook_account_id], [google_account_id], [role_id], [email]) VALUES (6, N'Vu Thi P', N'0345126780', N'password16', CAST(N'2024-11-10T20:15:15.430' AS DateTime), CAST(N'2024-11-10T20:15:15.430' AS DateTime), 1, CAST(N'1985-06-06' AS Date), 0, 0, 2, NULL)
GO
INSERT [dbo].[users] ([id], [fullname], [phone_number], [password], [created_at], [updated_at], [is_active], [date_of_birth], [facebook_account_id], [google_account_id], [role_id], [email]) VALUES (7, N'Hoang Van Q', N'0798765430', N'password17', CAST(N'2024-11-10T20:15:15.430' AS DateTime), CAST(N'2024-11-10T20:15:15.430' AS DateTime), 1, CAST(N'1986-07-07' AS Date), 0, 0, 1, NULL)
GO
INSERT [dbo].[users] ([id], [fullname], [phone_number], [password], [created_at], [updated_at], [is_active], [date_of_birth], [facebook_account_id], [google_account_id], [role_id], [email]) VALUES (8, N'Trinh Thi R', N'0423567890', N'password18', CAST(N'2024-11-10T20:15:15.430' AS DateTime), CAST(N'2024-11-10T20:15:15.430' AS DateTime), 1, CAST(N'1987-08-08' AS Date), 0, 0, 2, NULL)
GO
INSERT [dbo].[users] ([id], [fullname], [phone_number], [password], [created_at], [updated_at], [is_active], [date_of_birth], [facebook_account_id], [google_account_id], [role_id], [email]) VALUES (9, N'Ngo Van S', N'0512345670', N'password19', CAST(N'2024-11-10T20:15:15.430' AS DateTime), CAST(N'2024-11-10T20:15:15.430' AS DateTime), 1, CAST(N'1988-09-09' AS Date), 0, 0, 1, NULL)
GO
INSERT [dbo].[users] ([id], [fullname], [phone_number], [password], [created_at], [updated_at], [is_active], [date_of_birth], [facebook_account_id], [google_account_id], [role_id], [email]) VALUES (10, N'Pham Van T', N'0687654320', N'password20', CAST(N'2024-11-10T20:15:15.430' AS DateTime), CAST(N'2024-11-10T20:15:15.430' AS DateTime), 1, CAST(N'1989-10-10' AS Date), 0, 0, 2, NULL)
GO
INSERT [dbo].[users] ([id], [fullname], [phone_number], [password], [created_at], [updated_at], [is_active], [date_of_birth], [facebook_account_id], [google_account_id], [role_id], [email]) VALUES (11, N'John Doe', N'123456789', N'AQAAAAIAAYagAAAAEN9gmAAu5sj8v2XiZyk8LRhO9CYhW7fxGnnvctScXf3CaH89MhpGbk0dBZFpmtPikw==', CAST(N'2024-11-15T17:59:04.867' AS DateTime), CAST(N'2024-11-15T17:59:04.867' AS DateTime), 1, NULL, 0, 0, NULL, NULL)
GO
INSERT [dbo].[users] ([id], [fullname], [phone_number], [password], [created_at], [updated_at], [is_active], [date_of_birth], [facebook_account_id], [google_account_id], [role_id], [email]) VALUES (16, N'Bùi Thị Minh Thủy', N'0945117711', N'AQAAAAIAAYagAAAAEEMe5qNHBq+JCRlOA9hiLOXo702mq3SXPH/VSdxWFpf43OVJ5/Esxu53yV2eIYWMRw==', CAST(N'2024-11-15T17:59:04.867' AS DateTime), CAST(N'2025-02-18T20:42:31.140' AS DateTime), 1, NULL, 0, 0, 3, NULL)
GO
INSERT [dbo].[users] ([id], [fullname], [phone_number], [password], [created_at], [updated_at], [is_active], [date_of_birth], [facebook_account_id], [google_account_id], [role_id], [email]) VALUES (20, N'huyhung', N'0123456789', N'AQAAAAIAAYagAAAAEFrXFEBqhGWqg+z+m/WmsemN5gskSCj3L33i+Y5c39F9PEJdq6JHtsluISyLf72YeA==', NULL, NULL, 1, NULL, 0, 0, 2, NULL)
GO
INSERT [dbo].[users] ([id], [fullname], [phone_number], [password], [created_at], [updated_at], [is_active], [date_of_birth], [facebook_account_id], [google_account_id], [role_id], [email]) VALUES (21, N'huyhun', N'0123456799', N'AQAAAAIAAYagAAAAELlwftoXiuLRU3/AouXY3Qi8KjE1bykRlmxBnOv1m5GSrjPF/vVVRwEF+ZDbZaEpfg==', NULL, CAST(N'2024-11-19T14:05:43.410' AS DateTime), 1, NULL, 0, 0, 2, NULL)
GO
INSERT [dbo].[users] ([id], [fullname], [phone_number], [password], [created_at], [updated_at], [is_active], [date_of_birth], [facebook_account_id], [google_account_id], [role_id], [email]) VALUES (22, N'huy', N'0945117712', N'AQAAAAIAAYagAAAAEDI2gj1ANE8XuWLnbpAc2Rtt/fHX7iJhh5om+YFKw/BXdQ8p0JG/iVDQpNloSg83hg==', CAST(N'2024-11-19T13:51:22.830' AS DateTime), NULL, 1, NULL, 0, 0, 2, NULL)
GO
INSERT [dbo].[users] ([id], [fullname], [phone_number], [password], [created_at], [updated_at], [is_active], [date_of_birth], [facebook_account_id], [google_account_id], [role_id], [email]) VALUES (23, N'Ta Huy Hung', N'0904422888', N'AQAAAAIAAYagAAAAEDsEDMl3/rwxQYbWHZ/Qs6PoV1rcye6A4LGxMeICW8g4tXNPCpGbR5Tdi4RY8NQQcA==', CAST(N'2025-02-18T21:13:26.277' AS DateTime), CAST(N'2025-02-18T21:14:53.030' AS DateTime), 1, NULL, 0, 0, 2, NULL)
GO
INSERT [dbo].[users] ([id], [fullname], [phone_number], [password], [created_at], [updated_at], [is_active], [date_of_birth], [facebook_account_id], [google_account_id], [role_id], [email]) VALUES (25, N'Huy Hung', N'0912345678', N'', CAST(N'2025-03-05T04:07:06.190' AS DateTime), CAST(N'2025-03-10T22:54:56.380' AS DateTime), 1, NULL, 1, 0, 2, N'huyhung.ht487@gmail.com')
GO
INSERT [dbo].[users] ([id], [fullname], [phone_number], [password], [created_at], [updated_at], [is_active], [date_of_birth], [facebook_account_id], [google_account_id], [role_id], [email]) VALUES (33, N'Trần Mạnh Toản', N'', N'', CAST(N'2025-03-11T06:40:59.033' AS DateTime), NULL, 1, NULL, 1, 0, 2, N'trantuong0477@gmail.com')
GO
INSERT [dbo].[users] ([id], [fullname], [phone_number], [password], [created_at], [updated_at], [is_active], [date_of_birth], [facebook_account_id], [google_account_id], [role_id], [email]) VALUES (1035, N'thh', N'0328995386', N'AQAAAAIAAYagAAAAEKafiCN7WmzvIMaef9g1eYc66OqPpfqydIYfA7dO8V6yjBDvV8zlXzTAVCfJnlY+hg==', CAST(N'2025-04-04T08:44:10.997' AS DateTime), NULL, 1, NULL, 0, 0, 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tokens__CA90DA7ABDD19B66]    Script Date: 4/22/2025 12:45:05 PM ******/
ALTER TABLE [dbo].[tokens] ADD UNIQUE NONCLUSTERED 
(
	[token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_PhoneNumber]    Script Date: 4/22/2025 12:45:05 PM ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [UQ_PhoneNumber] UNIQUE NONCLUSTERED 
(
	[phone_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[order_details] ADD  DEFAULT ('active') FOR [status]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT ('') FOR [fullname]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT ('') FOR [email]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT ('') FOR [note]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (getdate()) FOR [order_date]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT ((0)) FOR [IsQuickPurchase]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT ('') FOR [description]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT (getdate()) FOR [review_date]
GO
ALTER TABLE [dbo].[ShippingAddress] ADD  DEFAULT ((0)) FOR [is_default]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ('') FOR [fullname]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [facebook_account_id]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [google_account_id]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK_order_details_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK_order_details_orders]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK_order_details_products] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK_order_details_products]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users]
GO
ALTER TABLE [dbo].[product_images]  WITH CHECK ADD  CONSTRAINT [FK_product_images_products] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[product_images] CHECK CONSTRAINT [FK_product_images_products]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands] FOREIGN KEY([brand_id])
REFERENCES [dbo].[brands] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_Products_Brands]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_categories]
GO
ALTER TABLE [dbo].[ReviewMedia]  WITH CHECK ADD  CONSTRAINT [fk_review_media] FOREIGN KEY([review_id])
REFERENCES [dbo].[Reviews] ([review_id])
GO
ALTER TABLE [dbo].[ReviewMedia] CHECK CONSTRAINT [fk_review_media]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [fk_reviews_products] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [fk_reviews_products]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [fk_reviews_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [fk_reviews_users]
GO
ALTER TABLE [dbo].[ShippingAddress]  WITH CHECK ADD  CONSTRAINT [FK_User_ShippingAddress] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[ShippingAddress] CHECK CONSTRAINT [FK_User_ShippingAddress]
GO
ALTER TABLE [dbo].[social_accounts]  WITH CHECK ADD  CONSTRAINT [FK_social_accounts_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[social_accounts] CHECK CONSTRAINT [FK_social_accounts_users]
GO
ALTER TABLE [dbo].[tokens]  WITH CHECK ADD  CONSTRAINT [FK_tokens_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[tokens] CHECK CONSTRAINT [FK_tokens_users]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_roles]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [CHK_OrderDetail_Status] CHECK  (([status]='cancel' OR [status]='active'))
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [CHK_OrderDetail_Status]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD CHECK  (([number_of_products]>(0)))
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD CHECK  (([price]>=(0)))
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD CHECK  (([total_money]>=(0)))
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD CHECK  (([total_money]>=(0)))
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [CK_orders_status] CHECK  (([status]='addressChanged' OR [status]='returned' OR [status]='cancelled' OR [status]='completed' OR [status]='delivered' OR [status]='shipped' OR [status]='processing' OR [status]='pending'))
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [CK_orders_status]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD CHECK  (([price]>=(0)))
GO

USE [ShopBridge]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 9/9/2021 8:42:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NOT NULL,
	[title] [varchar](75) NOT NULL,
	[metaTitle] [varchar](100) NULL,
	[slug] [varchar](100) NOT NULL,
	[summary] [varchar](200) NULL,
	[type] [int] NOT NULL,
	[sku] [varchar](100) NOT NULL,
	[price] [float] NOT NULL,
	[discount] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[shop] [int] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[publishedAt] [datetime] NULL,
	[startsAt] [datetime] NULL,
	[endsAt] [datetime] NULL,
	[content] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uq_slug] UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/9/2021 8:42:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](50) NULL,
	[middleName] [varchar](50) NULL,
	[lastName] [varchar](50) NULL,
	[mobile] [varchar](10) NULL,
	[email] [varchar](50) NULL,
	[passwordHash] [varchar](32) NOT NULL,
	[admin] [varchar](1) NOT NULL,
	[vendor] [varchar](1) NOT NULL,
	[registeredAt] [datetime] NOT NULL,
	[lastLogin] [datetime] NULL,
	[intro] [varchar](200) NULL,
	[profile] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_mobile] UNIQUE NONCLUSTERED 
(
	[mobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [type]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [shop]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (NULL) FOR [updatedAt]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (NULL) FOR [publishedAt]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (NULL) FOR [startsAt]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (NULL) FOR [endsAt]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (NULL) FOR [content]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [firstName]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [middleName]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [lastName]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [admin]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [vendor]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [lastLogin]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [intro]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [profile]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO

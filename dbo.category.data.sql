SET IDENTITY_INSERT [dbo].[category] ON
INSERT INTO [dbo].[category] ([cat_id], [category], [status]) VALUES (1, N'Featured', N'Active')
INSERT INTO [dbo].[category] ([cat_id], [category], [status]) VALUES (2, N'products', N'Active')
INSERT INTO [dbo].[category] ([cat_id], [category], [status]) VALUES (3, N'new', N'Active')
SET IDENTITY_INSERT [dbo].[category] OFF

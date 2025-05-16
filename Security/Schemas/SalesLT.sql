CREATE SCHEMA [SalesLT]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Contains objects related to products, customers, sales orders, and sales territories.', 'SCHEMA', N'SalesLT'
GO
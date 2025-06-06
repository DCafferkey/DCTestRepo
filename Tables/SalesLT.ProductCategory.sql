﻿CREATE TABLE [SalesLT].[ProductCategory] (
  [ProductCategoryID] [int] IDENTITY,
  [ParentProductCategoryID] [int] NULL,
  [Name] [dbo].[Name] NOT NULL,
  [rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProductCategory_rowguid] DEFAULT (newid()) ROWGUIDCOL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_ProductCategory_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_ProductCategory_ProductCategoryID] PRIMARY KEY CLUSTERED ([ProductCategoryID]),
  CONSTRAINT [AK_ProductCategory_Name] UNIQUE ([Name]),
  CONSTRAINT [AK_ProductCategory_rowguid] UNIQUE ([rowguid])
)
ON [PRIMARY]
GO

ALTER TABLE [SalesLT].[ProductCategory]
  ADD CONSTRAINT [FK_ProductCategory_ProductCategory_ParentProductCategoryID_ProductCategoryID] FOREIGN KEY ([ParentProductCategoryID]) REFERENCES [SalesLT].[ProductCategory] ([ProductCategoryID])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing ProductCategory.ProductCategoryID.', 'SCHEMA', N'SalesLT', 'TABLE', N'ProductCategory', 'CONSTRAINT', N'FK_ProductCategory_ProductCategory_ParentProductCategoryID_ProductCategoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'High-level product categorization.', 'SCHEMA', N'SalesLT', 'TABLE', N'ProductCategory'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for ProductCategory records.', 'SCHEMA', N'SalesLT', 'TABLE', N'ProductCategory', 'COLUMN', N'ProductCategoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product category identification number of immediate ancestor category. Foreign key to ProductCategory.ProductCategoryID.', 'SCHEMA', N'SalesLT', 'TABLE', N'ProductCategory', 'COLUMN', N'ParentProductCategoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Category description.', 'SCHEMA', N'SalesLT', 'TABLE', N'ProductCategory', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'SalesLT', 'TABLE', N'ProductCategory', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'SalesLT', 'TABLE', N'ProductCategory', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered constraint.', 'SCHEMA', N'SalesLT', 'TABLE', N'ProductCategory', 'CONSTRAINT', N'AK_ProductCategory_Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered constraint. Used to support replication samples.', 'SCHEMA', N'SalesLT', 'TABLE', N'ProductCategory', 'CONSTRAINT', N'AK_ProductCategory_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'SalesLT', 'TABLE', N'ProductCategory', 'INDEX', N'PK_ProductCategory_ProductCategoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'SalesLT', 'TABLE', N'ProductCategory', 'CONSTRAINT', N'PK_ProductCategory_ProductCategoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'SalesLT', 'TABLE', N'ProductCategory', 'CONSTRAINT', N'DF_ProductCategory_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()()', 'SCHEMA', N'SalesLT', 'TABLE', N'ProductCategory', 'CONSTRAINT', N'DF_ProductCategory_rowguid'
GO
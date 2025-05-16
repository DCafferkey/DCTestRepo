CREATE TABLE [SalesLT].[ProductModel] (
  [ProductModelID] [int] IDENTITY,
  [Name] [dbo].[Name] NOT NULL,
  [CatalogDescription] [xml] (CONTENT SalesLT.ProductDescriptionSchemaCollection) NULL,
  [rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProductModel_rowguid] DEFAULT (newid()) ROWGUIDCOL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_ProductModel_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_ProductModel_ProductModelID] PRIMARY KEY CLUSTERED ([ProductModelID]),
  CONSTRAINT [AK_ProductModel_Name] UNIQUE ([Name]),
  CONSTRAINT [AK_ProductModel_rowguid] UNIQUE ([rowguid])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PRIMARY XML INDEX [PXML_ProductModel_CatalogDescription]
  ON [SalesLT].[ProductModel] ([CatalogDescription])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered constraint.', 'SCHEMA', N'SalesLT', 'TABLE', N'ProductModel', 'CONSTRAINT', N'AK_ProductModel_Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered constraint. Used to support replication samples.', 'SCHEMA', N'SalesLT', 'TABLE', N'ProductModel', 'CONSTRAINT', N'AK_ProductModel_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'SalesLT', 'TABLE', N'ProductModel', 'INDEX', N'PK_ProductModel_ProductModelID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'SalesLT', 'TABLE', N'ProductModel', 'CONSTRAINT', N'PK_ProductModel_ProductModelID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'SalesLT', 'TABLE', N'ProductModel', 'CONSTRAINT', N'DF_ProductModel_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'SalesLT', 'TABLE', N'ProductModel', 'CONSTRAINT', N'DF_ProductModel_rowguid'
GO
﻿CREATE TABLE [SalesLT].[CustomerAddress] (
  [CustomerID] [int] NOT NULL,
  [AddressID] [int] NOT NULL,
  [AddressType] [dbo].[Name] NOT NULL,
  [rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_CustomerAddress_rowguid] DEFAULT (newid()) ROWGUIDCOL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_CustomerAddress_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_CustomerAddress_CustomerID_AddressID] PRIMARY KEY CLUSTERED ([CustomerID], [AddressID]),
  CONSTRAINT [AK_CustomerAddress_rowguid] UNIQUE ([rowguid])
)
ON [PRIMARY]
GO

ALTER TABLE [SalesLT].[CustomerAddress]
  ADD CONSTRAINT [FK_CustomerAddress_Address_AddressID] FOREIGN KEY ([AddressID]) REFERENCES [SalesLT].[Address] ([AddressID])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Address.AddressID.', 'SCHEMA', N'SalesLT', 'TABLE', N'CustomerAddress', 'CONSTRAINT', N'FK_CustomerAddress_Address_AddressID'
GO

ALTER TABLE [SalesLT].[CustomerAddress]
  ADD CONSTRAINT [FK_CustomerAddress_Customer_CustomerID] FOREIGN KEY ([CustomerID]) REFERENCES [SalesLT].[Customer] ([CustomerID])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Customer.CustomerID.', 'SCHEMA', N'SalesLT', 'TABLE', N'CustomerAddress', 'CONSTRAINT', N'FK_CustomerAddress_Customer_CustomerID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Cross-reference table mapping customers to their address(es).', 'SCHEMA', N'SalesLT', 'TABLE', N'CustomerAddress'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Foreign key to Customer.CustomerID.', 'SCHEMA', N'SalesLT', 'TABLE', N'CustomerAddress', 'COLUMN', N'CustomerID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Foreign key to Address.AddressID.', 'SCHEMA', N'SalesLT', 'TABLE', N'CustomerAddress', 'COLUMN', N'AddressID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'The kind of Address. One of: Archive, Billing, Home, Main Office, Primary, Shipping', 'SCHEMA', N'SalesLT', 'TABLE', N'CustomerAddress', 'COLUMN', N'AddressType'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'SalesLT', 'TABLE', N'CustomerAddress', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'SalesLT', 'TABLE', N'CustomerAddress', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered constraint. Used to support replication samples.', 'SCHEMA', N'SalesLT', 'TABLE', N'CustomerAddress', 'CONSTRAINT', N'AK_CustomerAddress_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'SalesLT', 'TABLE', N'CustomerAddress', 'CONSTRAINT', N'PK_CustomerAddress_CustomerID_AddressID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'SalesLT', 'TABLE', N'CustomerAddress', 'CONSTRAINT', N'DF_CustomerAddress_rowguid'
GO
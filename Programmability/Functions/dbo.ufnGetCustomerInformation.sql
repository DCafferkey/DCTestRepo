﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[ufnGetCustomerInformation](@CustomerID int)
RETURNS TABLE 
AS 
-- Returns the CustomerID, first name, and last name for the specified customer.
RETURN (
    SELECT 
        CustomerID, 
        FirstName, 
        LastName
    FROM [SalesLT].[Customer] 
    WHERE [CustomerID] = @CustomerID
);
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Table value function returning the customer ID, first name, and last name for a given customer.', 'SCHEMA', N'dbo', 'FUNCTION', N'ufnGetCustomerInformation'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Input parameter for the table value function ufnGetCustomerInformation. Enter a valid CustomerID from the Sales.Customer table.', 'SCHEMA', N'dbo', 'FUNCTION', N'ufnGetCustomerInformation', 'PARAMETER', N'@CustomerID'
GO
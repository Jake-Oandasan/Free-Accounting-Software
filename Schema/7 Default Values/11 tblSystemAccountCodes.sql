SET IDENTITY_INSERT tblSystemAccountCodes ON

INSERT INTO tblSystemAccountCodes(Id, Code, Name, Active)
SELECT 1, 'ACCOUNTS PAYABLE', 'ACCOUNTS PAYABLE', 1
	UNION ALL
SELECT 2, 'ACCOUNTS RECEIVABLE', 'ACCOUNTS RECEIVABLE', 1
	UNION ALL
SELECT 3, 'CUSTOMER OVERPAYMENT', 'CUSTOMER OVERPAYMENT', 1
	UNION ALL
SELECT 4, 'INPUT VAT', 'INPUT VAT', 1
	UNION ALL
SELECT 5, 'OUTPUT VAT', 'OUTPUT VAT', 1
	UNION ALL
SELECT 6, 'PURCHASE DISCOUNT', 'PURCHASE DISCOUNT', 1
	UNION ALL
SELECT 7, 'SALES DISCOUNT', 'SALE DISCOUNT', 1
	UNION ALL
SELECT 8, 'WITHHOLDING TAX PAYABLE', 'WITHHOLDING TAX PAYABLE', 1

SET IDENTITY_INSERT tblSystemAccountCodes OFF
GO


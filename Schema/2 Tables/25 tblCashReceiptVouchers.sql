IF OBJECT_ID('tblCashReceiptVouchers') IS NULL
	CREATE TABLE tblCashReceiptVouchers(
		Id INT IDENTITY(1, 1) NOT NULL,
		CompanyId INT NOT NULL,
		TransactionNo VARCHAR(50) NOT NULL,
		[Date] DATETIME NOT NULL,
		ReferenceNo VARCHAR(50) NOT NULL,
		ReferenceNo2 VARCHAR(50) NULL,
		SubsidiaryId INT NOT NULL,
		Remarks VARCHAR(1000) NULL,
		JournalId INT NULL,
		Posted BIT NOT NULL CONSTRAINT DF_tblCashReceiptVouchers_Posted DEFAULT 0,
		Voided BIT NOT NULL CONSTRAINT DF_tblCashReceiptVouchers_Voided DEFAULT 0,
		VoidedById INT NULL,
		DateVoided DATETIME NULL,
		CreatedById INT NOT NULL,
		DateCreated DATETIME NOT NULL,
		ModifiedById INT NOT NULL,
		DateModified DATETIME NOT NULL,
	)
GO

IF OBJECT_ID('tblCashReceiptVouchers_PK') IS NOT NULL
	ALTER TABLE tblCashReceiptVouchers DROP CONSTRAINT tblCashReceiptVouchers_PK
GO

ALTER TABLE tblCashReceiptVouchers ADD CONSTRAINT tblCashReceiptVouchers_PK PRIMARY KEY(Id)
GO

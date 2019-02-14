IF OBJECT_ID('uspUpdateGeneralLedger') IS NOT NULL
	DROP PROCEDURE uspUpdateGeneralLedger
GO

CREATE PROCEDURE uspUpdateGeneralLedger(@Id INT, @IsPost BIT)
AS
SET NOCOUNT ON

DECLARE @CompanyId INT
DECLARE @Date DATETIME
DECLARE @tmp TABLE(AccountId INT, Debit MONEY, Credit MONEY PRIMARY KEY(AccountId))

SELECT @CompanyId = j.CompanyId,
	@Date = j.[Date]
FROM tblJournals j
WHERE j.Id = @Id

INSERT INTO @tmp(AccountId, Debit, Credit)
SELECT jd.AccountId, SUM(jd.Debit), SUM(jd.Credit)
FROM tblJournalDetails jd
WHERE jd.JournalId = @Id
GROUP BY jd.AccountId

IF @IsPost = 1
BEGIN
	UPDATE gl
	SET gl.Debit = gl.Debit + t.Debit,
		gl.Credit = gl.Credit + t.Credit,
		gl.Balance = (
			SELECT MAX(glb.Balance)
			FROM tblGeneralLedger glb
			WHERE glb.CompanyId = @CompanyId
				AND glb.[Date] <= @Date
				AND glb.AccountId = t.AccountId
		) + (t.Debit - t.Credit)
	FROM tblGeneralLedger gl
		INNER JOIN @tmp t ON gl.AccountId = t.AccountId
	WHERE gl.CompanyId = @CompanyId
		AND gl.[Date] >= @Date

	INSERT INTO tblGeneralLedger(CompanyId, [Date], AccountId, Debit, Credit, Balance)
	SELECT @CompanyId, @Date, t.AccountId, t.Debit, t.Credit, ISNULL((
			SELECT MAX(glb.Balance)
			FROM tblGeneralLedger glb
			WHERE glb.CompanyId = @CompanyId
				AND glb.[Date] <= @Date
				AND glb.AccountId = t.AccountId
		), 0) + (t.Debit - t.Credit)
	FROM @tmp t
	WHERE NOT EXISTS(
		SELECT *
		FROM tblGeneralLedger gl
		WHERE gl.CompanyId = @CompanyId
			AND gl.[Date] = @Date
			AND gl.AccountId = t.AccountId
	)
END
ELSE IF @IsPost = 0
BEGIN
	UPDATE gl
	SET gl.Debit = gl.Debit - t.Debit,
		gl.Credit = gl.Credit - t.Credit,
		gl.Balance = (
			SELECT MAX(glb.Balance)
			FROM tblGeneralLedger glb
			WHERE glb.CompanyId = @CompanyId
				AND glb.[Date] <= @Date
				AND glb.AccountId = t.AccountId
		) - (t.Debit - t.Credit)
	FROM tblGeneralLedger gl
		INNER JOIN @tmp t ON gl.AccountId = t.AccountId
	WHERE gl.CompanyId = @CompanyId
		AND gl.[Date] >= @Date

	DELETE gl
	FROM tblGeneralLedger gl
		INNER JOIN @tmp t ON t.AccountId = gl.AccountId
	WHERE gl.CompanyId = @CompanyId
		AND gl.[Date] = @Date
		AND gl.Debit = 0
		AND gl.Credit = 0
END

UPDATE j
	SET j.Posted = @IsPost
	FROM tblJournals j
	WHERE j.Id = @Id
GO

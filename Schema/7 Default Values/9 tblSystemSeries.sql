--Vouchers
EXEC uspAddSystemSeries 'JV' --Journal Voucher
EXEC uspAddSystemSeries 'PV' --Purchase Voucher
EXEC uspAddSystemSeries 'SV' --Sales Voucher
EXEC uspAddSystemSeries 'CP' --Customer Payment
EXEC uspAddSystemSeries 'SP' --Supplier Payment

--Journals
EXEC uspAddSystemSeries 'GJ' --General Journal
EXEC uspAddSystemSeries 'PJ' --Purchase Journal
EXEC uspAddSystemSeries 'SJ' --Sales Journal
EXEC uspAddSystemSeries 'CRJ' --Cash Receipt Journal
EXEC uspAddSystemSeries 'CDJ' --Cash Disbursement Journal

--Others
EXEC uspAddSystemSeries 'COP' --Customer Overpayment
GO


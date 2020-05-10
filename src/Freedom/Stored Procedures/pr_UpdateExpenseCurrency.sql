DELIMITER //

CREATE OR REPLACE PROCEDURE pr_UpdateExpenseCurrency(IN $expenseId VARCHAR(36),
                                                     IN $countryCurrencyCode VARCHAR(10))
BEGIN
    SELECT CurrencyId
    INTO @currencyId
    FROM tb_Currency
    WHERE CountryCurrencyCode = $countryCurrencyCode;

    UPDATE tb_Expense
    SET CurrencyId      = @currencyId,
        UpdatedDateTime = NOW()
    WHERE ExpenseId = $expenseId;
END
//

DELIMITER ;

GRANT EXECUTE ON PROCEDURE Freedom.pr_UpdateExpenseCurrency TO 'FinancialPeace'@'%';
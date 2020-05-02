DELIMITER //

CREATE OR REPLACE PROCEDURE pr_UpdateExpenseCurrency(IN $expenseId VARCHAR(36),
                                                     IN $countryCurrencyCode VARCHAR(10))
BEGIN
    SELECT CurrencyId
    INTO @currencyId
    FROM tb_Currency
    WHERE CountryCurrencyCode = $countryCurrencyCode;

    UPDATE tb_Expense
    SET CurrencyId = @currencyId
    WHERE ExpenseId = $expenseId;
END
//

DELIMITER ;
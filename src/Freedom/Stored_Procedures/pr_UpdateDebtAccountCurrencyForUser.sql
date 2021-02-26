DELIMITER //

CREATE OR REPLACE PROCEDURE pr_UpdateDebtAccountCurrencyForUser(IN $debtAccountId VARCHAR(36),
                                                                IN $userId VARCHAR(36),
                                                                IN $countryCurrencyCode VARCHAR(10))
BEGIN
    SELECT CurrencyId
    INTO @currencyId
    FROM tb_Currency
    WHERE CountryCurrencyCode = $countryCurrencyCode;

    UPDATE tb_DebtAccount
    SET CurrencyId = @currencyId
    WHERE DebtAccountId = $debtAccountId
      AND UserId = $userId;
END
//

DELIMITER ;

GRANT EXECUTE ON PROCEDURE Freedom.pr_UpdateDebtAccountCurrencyForUser TO 'FinancialPeace'@'%';
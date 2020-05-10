DELIMITER //

CREATE OR REPLACE PROCEDURE pr_UpdateSavingsAccountCurrencyForUser(IN $savingsAccountId VARCHAR(36),
                                                                   IN $userId VARCHAR(36),
                                                                   IN $countryCurrencyCode VARCHAR(10))
BEGIN
    SELECT CurrencyId
    INTO @currencyId
    FROM tb_Currency
    WHERE CountryCurrencyCode = $countryCurrencyCode;

    UPDATE tb_SavingsAccount
    SET CurrencyId = @currencyId
    WHERE SavingsAccountId = $savingsAccountId
      AND UserId = $userId;
END
//

DELIMITER ;

GRANT EXECUTE ON PROCEDURE Freedom.pr_UpdateSavingsAccountCurrencyForUser TO 'FinancialPeace'@'%';
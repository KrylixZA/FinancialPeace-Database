DELIMITER //

CREATE OR REPLACE PROCEDURE pr_CreateDebtAccountForUser(IN $userId VARCHAR(36),
                                                        IN $countryCurrencyCode VARCHAR(10),
                                                        IN $amountOwed DOUBLE,
                                                        IN $targetPayoffDate DATE,
                                                        IN $name VARCHAR(255))
BEGIN
    SELECT CurrencyId
    INTO @currencyId
    FROM tb_Currency
    WHERE CountryCurrencyCode = $countryCurrencyCode;

    INSERT INTO tb_DebtAccount (UserId, CurrencyId, InitialAmountOwed, CurrentAmountOwed, TargetPayoffDate, Name)
    SELECT $userId, @currencyId, $amountOwed, $amountOwed, $targetPayoffDate, $name
    WHERE NOT EXISTS(SELECT DebtAccountId
                     FROM tb_DebtAccount
                     WHERE UserId = $userId
                       AND CurrencyId = @currencyId
                       AND InitialAmountOwed = $amountOwed
                       AND CurrentAmountOwed = $amountOwed
                       AND TargetPayoffDate = $targetPayoffDate
                       AND Name = $name)
    LIMIT 1;

    UPDATE tb_DebtAccount
    SET IsDeleted = FALSE
    WHERE UserId = $userId
      AND CurrencyId = @currencyId
      AND InitialAmountOwed = $amountOwed
      AND CurrentAmountOwed = $amountOwed
      AND TargetPayoffDate = $targetPayoffDate
      AND Name = $name;
END
//

DELIMITER ;

GRANT EXECUTE ON PROCEDURE Freedom.pr_CreateDebtAccountForUser TO 'FinancialPeace'@'%';
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
                       AND Name = $name)
    LIMIT 1;
END
//

DELIMITER ;
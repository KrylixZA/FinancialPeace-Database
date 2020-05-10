DELIMITER //

CREATE OR REPLACE PROCEDURE pr_CreateSavingsAccountForUser(IN $userId VARCHAR(36),
                                                           IN $countryCurrencyCode VARCHAR(10),
                                                           IN $savingsValue DOUBLE,
                                                           IN $savingsTarget DOUBLE,
                                                           IN $name VARCHAR(255))
BEGIN
    SELECT CurrencyId
    INTO @currencyId
    FROM tb_Currency
    WHERE CountryCurrencyCode = $countryCurrencyCode;

    INSERT INTO tb_SavingsAccount (UserId, CurrencyId, InitialSavingsValue, CurrentSavingsValue, SavingsTarget, Name)
    SELECT $userId, @currencyId, $savingsValue, $savingsValue, $savingsTarget, $name
    WHERE NOT EXISTS(SELECT SavingsAccountId
                     FROM tb_SavingsAccount
                     WHERE UserId = $userId
                       AND CurrencyId = @currencyId
                       AND InitialSavingsValue = $savingsValue
                       AND CurrentSavingsValue = $savingsValue
                       AND SavingsTarget = $savingsTarget
                       AND Name = $name)
    LIMIT 1;

    UPDATE tb_SavingsAccount
    SET IsDeleted = FALSE
    WHERE UserId = $userId
      AND CurrencyId = @currencyId
      AND InitialSavingsValue = $savingsValue
      AND CurrentSavingsValue = $savingsValue
      AND SavingsTarget = $savingsTarget
      AND Name = $name;
END
//

DELIMITER ;

GRANT EXECUTE ON PROCEDURE Freedom.pr_CreateSavingsAccountForUser TO 'FinancialPeace'@'%';
DELIMITER //

CREATE OR REPLACE PROCEDURE pr_GetSavingsAccountsForUser(IN $userId VARCHAR(36))
BEGIN
    SELECT sa.SavingsAccountId      AS savingsAccountId,
           curr.CountryCurrencyCode AS countryCurrencyCode,
           sa.InitialSavingsValue   AS initialSavingsValue,
           sa.CurrentSavingsValue   AS currentSavingsValue,
           sa.SavingsTarget         AS savingsTarget,
           sa.Name                  AS name
    FROM tb_SavingsAccount AS sa
             JOIN tb_Currency AS curr ON curr.CurrencyId = sa.CurrencyId
    WHERE sa.UserId = $userId;
END
//

DELIMITER ;
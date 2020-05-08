DELIMITER //

CREATE OR REPLACE PROCEDURE pr_GetDebtAccountsForUser(IN $userId VARCHAR(36))
BEGIN
    SELECT da.DebtAccountId         AS debtAccountId,
           curr.CountryCurrencyCode AS countryCurrencyCode,
           da.InitialAmountOwed     AS initialAmountOwed,
           da.CurrentAmountOwed     AS currentAmountOwed,
           da.TargetPayoffDate      AS targetPayoffDate,
           da.ActualPayoffDate      AS actualPayoffDate,
           da.Name                  AS name
    FROM tb_DebtAccount AS da
             JOIN tb_Currency AS curr ON curr.CurrencyId = da.CurrencyId
    WHERE da.UserId = $userId
      AND da.IsDeleted = FALSE;
END
//

DELIMITER ;
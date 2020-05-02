DELIMITER //

CREATE OR REPLACE PROCEDURE pr_UpdateDebtAccountAmountOwedForUser(IN $debtAccountId VARCHAR(36),
                                                                  IN $userId VARCHAR(36),
                                                                  IN $currentAmountOwed DOUBLE)
BEGIN
    UPDATE tb_DebtAccount
    SET CurrentAmountOwed = $currentAmountOwed
    WHERE DebtAccountId = $debtAccountId
      AND UserId = $userId;
END
//

DELIMITER ;
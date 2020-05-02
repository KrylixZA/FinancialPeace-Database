DELIMITER //

CREATE OR REPLACE PROCEDURE pr_UpdateDebtAccountTargetPayoffDateForUser(IN $debtAccountId VARCHAR(36),
                                                                        IN $userId VARCHAR(36),
                                                                        IN $targetPayoffDate DATE)
BEGIN
    UPDATE tb_DebtAccount
    SET TargetPayoffDate = $targetPayoffDate
    WHERE DebtAccountId = $debtAccountId
      AND UserId = $userId;
END
//

DELIMITER ;
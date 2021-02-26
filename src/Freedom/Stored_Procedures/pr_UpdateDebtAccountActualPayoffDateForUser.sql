DELIMITER //

CREATE OR REPLACE PROCEDURE pr_UpdateDebtAccountActualPayoffDateForUser(IN $debtAccountId VARCHAR(36),
                                                                        IN $userId VARCHAR(36),
                                                                        IN $actualPayoffDate DATE)
BEGIN
    UPDATE tb_DebtAccount
    SET ActualPayoffDate = $actualPayoffDate
    WHERE DebtAccountId = $debtAccountId
      AND UserId = $userId;
END
//

DELIMITER ;

GRANT EXECUTE ON PROCEDURE Freedom.pr_UpdateDebtAccountActualPayoffDateForUser TO 'FinancialPeace'@'%';
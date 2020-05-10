DELIMITER //

CREATE OR REPLACE PROCEDURE pr_UpdateDebtAccountNameForUser(IN $debtAccountId VARCHAR(36),
                                                            IN $userId VARCHAR(36),
                                                            IN $name VARCHAR(255))
BEGIN
    UPDATE tb_DebtAccount
    SET Name = $name
    WHERE DebtAccountId = $debtAccountId
      AND UserId = $userId;
END
//

DELIMITER ;

GRANT EXECUTE ON PROCEDURE Freedom.pr_UpdateDebtAccountNameForUser TO 'FinancialPeace'@'%';
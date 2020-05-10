DELIMITER //

CREATE OR REPLACE PROCEDURE pr_UpdateSavingsAccountTargetForUser(IN $savingsAccountId VARCHAR(36),
                                                                 IN $userId VARCHAR(36),
                                                                 IN $savingsTarget DOUBLE)
BEGIN
    UPDATE tb_SavingsAccount
    SET SavingsTarget = $savingsTarget
    WHERE SavingsAccountId = $savingsAccountId
      AND UserId = $userId;
END
//

DELIMITER ;

GRANT EXECUTE ON PROCEDURE Freedom.pr_UpdateSavingsAccountTargetForUser TO 'FinancialPeace'@'%';
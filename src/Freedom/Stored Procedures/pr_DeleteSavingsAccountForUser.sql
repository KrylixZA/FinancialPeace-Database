DELIMITER //

CREATE OR REPLACE PROCEDURE pr_DeleteSavingsAccountForUser(IN $savingsAccountId VARCHAR(36),
                                                           IN $userId VARCHAR(36))
BEGIN
    UPDATE tb_SavingsAccount
    SET IsDeleted       = TRUE,
        UpdatedDateTime = NOW()
    WHERE SavingsAccountId = $savingsAccountId
      AND UserId = $userId;
END
//

DELIMITER ;

GRANT EXECUTE ON PROCEDURE Freedom.pr_DeleteSavingsAccountForUser TO 'FinancialPeace'@'%';
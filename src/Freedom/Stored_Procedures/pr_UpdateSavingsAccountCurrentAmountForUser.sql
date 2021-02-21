DELIMITER //

CREATE OR REPLACE PROCEDURE pr_UpdateSavingsAccountCurrentAmountForUser(IN $savingsAccountId VARCHAR(36),
                                                                        IN $userId VARCHAR(36),
                                                                        IN $currentAmount DOUBLE)
BEGIN
    UPDATE tb_SavingsAccount
    SET CurrentSavingsValue = $currentAmount
    WHERE SavingsAccountId = $savingsAccountId
      AND UserId = $userId;
END
//

DELIMITER ;

GRANT EXECUTE ON PROCEDURE Freedom.pr_UpdateSavingsAccountCurrentAmountForUser TO 'FinancialPeace'@'%';
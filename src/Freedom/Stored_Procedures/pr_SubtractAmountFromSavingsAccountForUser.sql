DELIMITER //

CREATE OR REPLACE PROCEDURE pr_SubtractAmountFromSavingsAccountForUser(IN $savingsAccountId VARCHAR(36),
                                                                       IN $userId VARCHAR(36),
                                                                       IN $amount DOUBLE)
BEGIN
    SELECT CurrentSavingsValue
    INTO @currentSavingsValue
    FROM tb_SavingsAccount
    WHERE SavingsAccountId = $savingsAccountId
      AND UserId = $userId;

    UPDATE tb_SavingsAccount
    SET CurrentSavingsValue = (@currentSavingsValue - $amount),
        UpdatedDateTime     = NOW()
    WHERE SavingsAccountId = $savingsAccountId
      AND UserId = $userId;
END
//

DELIMITER ;

GRANT EXECUTE ON PROCEDURE Freedom.pr_SubtractAmountFromSavingsAccountForUser TO 'FinancialPeace'@'%';
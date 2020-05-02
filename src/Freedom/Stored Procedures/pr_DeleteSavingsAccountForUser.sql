DELIMITER //

CREATE OR REPLACE PROCEDURE pr_DeleteSavingsAccountForUser(IN $savingsAccountId VARCHAR(36),
                                                           IN $userId VARCHAR(36))
BEGIN
    DELETE
    FROM tb_SavingsAccount
    WHERE SavingsAccountId = $savingsAccountId
      AND UserId = $userId;
END
//

DELIMITER ;
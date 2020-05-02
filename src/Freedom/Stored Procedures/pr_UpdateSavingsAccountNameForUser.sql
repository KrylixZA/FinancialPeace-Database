DELIMITER //

CREATE OR REPLACE PROCEDURE pr_UpdateSavingsAccountNameForUser(IN $savingsAccountId VARCHAR(36),
                                                               IN $userId VARCHAR(36),
                                                               IN $name VARCHAR(255))
BEGIN
    UPDATE tb_SavingsAccount
    SET Name = $name
    WHERE SavingsAccountId = $savingsAccountId
      AND UserId = $userId;
END
//

DELIMITER ;
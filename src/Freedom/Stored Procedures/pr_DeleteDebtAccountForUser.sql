DELIMITER //

CREATE OR REPLACE PROCEDURE pr_DeleteDebtAccountForUser(IN $debtAccountId VARCHAR(36),
                                                        IN $userId VARCHAR(36))
BEGIN
    DELETE
    FROM tb_DebtAccount
    WHERE DebtAccountId = $debtAccountId
      AND UserId = $userId;
END
//

DELIMITER ;
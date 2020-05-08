DELIMITER //

CREATE OR REPLACE PROCEDURE pr_DeleteDebtAccountForUser(IN $debtAccountId VARCHAR(36),
                                                        IN $userId VARCHAR(36))
BEGIN
    UPDATE tb_DebtAccount
    SET IsDeleted       = TRUE,
        UpdatedDateTime = NOW()
    WHERE DebtAccountId = $debtAccountId
      AND UserId = $userId;
END
//

DELIMITER ;
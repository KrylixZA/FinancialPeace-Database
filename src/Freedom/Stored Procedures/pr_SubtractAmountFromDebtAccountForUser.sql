DELIMITER //

CREATE OR REPLACE PROCEDURE pr_SubtractAmountFromDebtAccountForUser(IN $debtAccountId VARCHAR(36),
                                                                    IN $userId VARCHAR(36),
                                                                    IN $amount DOUBLE)
BEGIN
    SELECT CurrentAmountOwed
    INTO @currentAmountOwed
    FROM tb_DebtAccount
    WHERE DebtAccountId = $debtAccountId
      AND UserId = $userId;

    UPDATE tb_DebtAccount
    SET CurrentAmountOwed = (@currentAmountOwed - $amount),
        UpdatedDateTime   = NOW()
    WHERE DebtAccountId = $debtAccountId
      AND UserId = $userId;
END
//

DELIMITER ;
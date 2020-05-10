DELIMITER //

CREATE OR REPLACE PROCEDURE pr_DeleteExpenseCategoryForUser(IN $expenseCategoryId VARCHAR(36),
                                                            IN $userId VARCHAR(36))
BEGIN
    UPDATE tb_ExpenseCategoryUserMapping
    SET IsDeleted       = TRUE,
        UpdatedDateTime = NOW()
    WHERE ExpenseCategoryId = $expenseCategoryId
      AND UserId = $userId;
END
//

DELIMITER ;

GRANT EXECUTE ON PROCEDURE Freedom.pr_DeleteExpenseCategoryForUser TO 'FinancialPeace'@'%';
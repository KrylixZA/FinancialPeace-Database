DELIMITER //

CREATE OR REPLACE PROCEDURE pr_CreateExpenseCategoryForUser(IN $userId VARCHAR(36),
                                                            IN $expenseCategoryName VARCHAR(50))
BEGIN
    CALL pr_CreateExpenseCategory($expenseCategoryName, @expenseCategoryId);

    INSERT INTO tb_ExpenseCategoryUserMapping (ExpenseCategoryId, UserId)
    SELECT @expenseCategoryId, $userId
    WHERE NOT EXISTS(
            SELECT ExpenseCategoryId, UserId
            FROM tb_ExpenseCategoryUserMapping
            WHERE ExpenseCategoryId = @expenseCategoryId
              AND UserId = $userId)
    LIMIT 1;

    UPDATE tb_ExpenseCategoryUserMapping
    SET IsDeleted = FALSE
    WHERE ExpenseCategoryId = @expenseCategoryId
      AND UserId = $userId;
END
//

DELIMITER ;
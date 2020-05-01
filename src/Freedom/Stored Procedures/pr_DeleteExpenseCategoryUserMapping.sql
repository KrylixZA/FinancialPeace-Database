DELIMITER //

CREATE OR REPLACE PROCEDURE pr_DeleteExpenseCategoryUserMapping(IN $expenseCategoryId VARCHAR(36),
                                                                IN $userId VARCHAR(36))
BEGIN
    DELETE
    FROM tb_ExpenseCategoryUserMapping
    WHERE ExpenseCategoryId = $expenseCategoryId
      AND UserId = $userId;
END
//

DELIMITER ;
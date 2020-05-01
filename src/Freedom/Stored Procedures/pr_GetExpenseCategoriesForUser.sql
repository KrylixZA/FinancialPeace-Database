DELIMITER //

CREATE OR REPLACE PROCEDURE pr_GetExpenseCategoriesForUser(IN $userId VARCHAR(36))
BEGIN
    SELECT ec.ExpenseCategoryId   AS expenseCategoryId,
           ec.ExpenseCategoryName AS expenseCategoryName
    FROM tb_ExpenseCategory AS ec
             JOIN tb_ExpenseCategoryUserMapping AS ecu ON ecu.ExpenseCategoryId = ec.ExpenseCategoryId
    WHERE ecu.UserId = $userId;
END
//

DELIMITER ;
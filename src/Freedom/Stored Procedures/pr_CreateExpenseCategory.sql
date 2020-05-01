DELIMITER //

CREATE OR REPLACE PROCEDURE pr_CreateExpenseCategory(IN $expenseCategoryName VARCHAR(50),
                                                     OUT $expenseCategoryId VARCHAR(36))
BEGIN
    INSERT INTO tb_ExpenseCategory (ExpenseCategoryName)
    SELECT $expenseCategoryName
    WHERE NOT EXISTS(
            SELECT ExpenseCategoryId
            FROM tb_ExpenseCategory
            WHERE ExpenseCategoryName = $expenseCategoryName)
    LIMIT 1;

    SELECT ExpenseCategoryId
    INTO $expenseCategoryId
    FROM tb_ExpenseCategory
    WHERE ExpenseCategoryName = $expenseCategoryName;
END
//

DELIMITER ;
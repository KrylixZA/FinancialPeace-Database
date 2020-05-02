DELIMITER //

CREATE OR REPLACE PROCEDURE pr_UpdateExpenseExpenseCategory(IN $expenseId VARCHAR(36),
                                                            IN $expenseCategoryName VARCHAR(50))
BEGIN
    SELECT ExpenseCategoryId
    INTO @expenseCategoryId
    FROM tb_ExpenseCategory
    WHERE ExpenseCategoryName = $expenseCategoryName;

    UPDATE tb_Expense
    SET ExpenseCategoryId = @expenseCategoryId
    WHERE ExpenseId = $expenseId;
END
//

DELIMITER ;
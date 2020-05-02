DELIMITER //

CREATE OR REPLACE PROCEDURE pr_DeleteExpenseForUser(IN $expenseId VARCHAR(36),
                                                    IN $userId VARCHAR(36))
BEGIN
    SELECT BudgetId
    INTO @budgetId
    FROM tb_Budget
    WHERE UserId = $userId;

    DELETE
    FROM tb_Expense
    WHERE ExpenseId = $expenseId
      AND BudgetId = @budgetId;
END
//

DELIMITER ;
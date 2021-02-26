DELIMITER //

CREATE OR REPLACE PROCEDURE pr_DeleteExpenseForUser(IN $expenseId VARCHAR(36),
                                                    IN $userId VARCHAR(36))
BEGIN
    SELECT BudgetId
    INTO @budgetId
    FROM tb_Budget
    WHERE UserId = $userId;

    UPDATE tb_Expense
    SET IsDeleted       = TRUE,
        UpdatedDateTime = NOW()
    WHERE ExpenseId = $expenseId;
END
//

DELIMITER ;

GRANT EXECUTE ON PROCEDURE Freedom.pr_DeleteExpenseForUser TO 'FinancialPeace'@'%';
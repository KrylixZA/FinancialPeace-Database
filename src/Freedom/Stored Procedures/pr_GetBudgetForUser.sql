DELIMITER //

CREATE OR REPLACE PROCEDURE pr_GetBudgetForUser(IN $userId VARCHAR(36))
BEGIN
    SELECT budg.BudgetId            AS budgetId,
           budg.UserId              AS userId,
           exp.ExpenseId            AS expenseId,
           ec.ExpenseCategoryName   AS displayName,
           curr.CountryCurrencyCode AS countryCurrencyCode,
           exp.Value                AS value
    FROM tb_Budget AS budg
             JOIN tb_Expense AS exp ON exp.BudgetId = budg.BudgetId
             JOIN tb_ExpenseCategory AS ec ON ec.ExpenseCategoryId = exp.ExpenseCategoryId
             JOIN tb_Currency AS curr ON curr.CurrencyId = exp.CurrencyId
    WHERE budg.UserId = $userId;
END
//

DELIMITER ;
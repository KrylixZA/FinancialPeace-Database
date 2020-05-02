DELIMITER //

CREATE OR REPLACE PROCEDURE pr_CreateExpenseForUser(IN $userId VARCHAR(36),
                                                    IN $expenseCategoryName VARCHAR(50),
                                                    IN $countryCurrencyCode VARCHAR(10),
                                                    IN $value DOUBLE)
BEGIN
    SELECT ExpenseCategoryId
    INTO @expenseCategoryId
    FROM tb_ExpenseCategory
    WHERE ExpenseCategoryName = $expenseCategoryName;

    SELECT CurrencyId
    INTO @currencyId
    FROM tb_Currency
    WHERE CountryCurrencyCode = $countryCurrencyCode;

    SELECT BudgetId
    INTO @budgetId
    FROM tb_Budget
    WHERE UserId = $userId;

    IF (@budgetId IS NULL) THEN
        SET @budgetId = UUID();
        INSERT INTO tb_Budget (BudgetId, UserId)
        VALUES (@budgetId, $userId);
    END IF;

    INSERT INTO tb_Expense (ExpenseCategoryId, CurrencyId, BudgetId, Value)
    SELECT @expenseCategoryId, @currencyId, @budgetId, $value
    WHERE NOT EXISTS(SELECT ExpenseId
                     FROM tb_Expense
                     WHERE BudgetId = @budgetId
                       AND ExpenseCategoryId = @expenseCategoryId)
    LIMIT 1;
END
//

DELIMITER ;
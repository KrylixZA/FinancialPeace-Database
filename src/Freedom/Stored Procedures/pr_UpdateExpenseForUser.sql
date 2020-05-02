DELIMITER //

CREATE OR REPLACE PROCEDURE pr_UpdateExpenseForUser(IN $expenseId VARCHAR(36),
                                                    IN $userId VARCHAR(36),
                                                    IN $expenseCategoryName VARCHAR(50),
                                                    IN $countryCurrencyCode VARCHAR(10),
                                                    IN $value DOUBLE)
BEGIN
    SELECT BudgetId
    INTO @budgetId
    FROM tb_Budget
    WHERE UserId = $userId;

    IF (@budgetId IS NOT NULL) THEN
        IF ($expenseCategoryName IS NOT NULL) THEN
            CALL pr_UpdateExpenseExpenseCategory($expenseId, $expenseCategoryName);
        END IF;

        IF ($countryCurrencyCode IS NOT NULL) THEN
            CALL pr_UpdateExpenseCurrency($expenseId, $countryCurrencyCode);
        END IF;

        IF ($value IS NOT NULL) THEN
            CALL pr_UpdateExpenseValue($expenseId, $value);
        END IF;
    END IF;
END
//

DELIMITER ;
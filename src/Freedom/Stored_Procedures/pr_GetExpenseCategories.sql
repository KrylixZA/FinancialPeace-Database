DELIMITER //

CREATE OR REPLACE PROCEDURE pr_GetExpenseCategories()
BEGIN
    SELECT ec.ExpenseCategoryId   AS expenseCategoryId,
           ec.ExpenseCategoryName AS expenseCategoryName
    FROM tb_ExpenseCategory AS ec;
END
//

DELIMITER ;

GRANT EXECUTE ON PROCEDURE Freedom.pr_GetExpenseCategories TO 'FinancialPeace'@'%';
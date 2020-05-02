DELIMITER //

CREATE OR REPLACE PROCEDURE pr_UpdateExpenseValue(IN $expenseId VARCHAR(36),
                                                   IN $value DOUBLE)
BEGIN
    UPDATE tb_Expense
    SET Value = $value
    WHERE ExpenseId = $expenseId;
END
//

DELIMITER ;
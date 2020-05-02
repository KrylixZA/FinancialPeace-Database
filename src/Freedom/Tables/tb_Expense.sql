CREATE TABLE IF NOT EXISTS tb_Expense
(
    ExpenseId         VARCHAR(36)  NOT NULL DEFAULT UUID(),
    ExpenseCategoryId VARCHAR(36)  NOT NULL,
    CurrencyId        VARCHAR(36)  NOT NULL,
    BudgetId          VARCHAR(36)  NOT NULL,
    Value             DOUBLE       NOT NULL,
    PRIMARY KEY (ExpenseId),
    CONSTRAINT fk_tb_Expense_ExpenseCategoryId FOREIGN KEY (ExpenseCategoryId) REFERENCES tb_ExpenseCategory (ExpenseCategoryId),
    CONSTRAINT fk_tb_Expense_CurrencyId FOREIGN KEY (CurrencyId) REFERENCES tb_Currency (CurrencyId),
    CONSTRAINT fk_tb_Expense_BudgetId FOREIGN KEY (BudgetId) REFERENCES tb_Budget (BudgetId)
);
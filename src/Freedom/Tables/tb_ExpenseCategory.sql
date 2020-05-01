CREATE TABLE IF NOT EXISTS tb_ExpenseCategory
(
    ExpenseCategoryId   VARCHAR(36) NOT NULL DEFAULT UUID(),
    ExpenseCategoryName VARCHAR(50) NOT NULL,
    PRIMARY KEY (ExpenseCategoryId)
);
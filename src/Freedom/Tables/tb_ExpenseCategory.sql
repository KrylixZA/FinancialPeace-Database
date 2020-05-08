CREATE TABLE IF NOT EXISTS tb_ExpenseCategory
(
    ExpenseCategoryId   VARCHAR(36) NOT NULL DEFAULT UUID(),
    ExpenseCategoryName VARCHAR(50) NOT NULL,
    CreatedDateTime     DATETIME    NOT NULL DEFAULT NOW(),
    PRIMARY KEY (ExpenseCategoryId)
);
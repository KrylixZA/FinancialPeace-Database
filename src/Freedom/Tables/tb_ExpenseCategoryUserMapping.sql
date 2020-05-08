CREATE TABLE IF NOT EXISTS tb_ExpenseCategoryUserMapping
(
    ExpenseCategoryId VARCHAR(36) NOT NULL,
    UserId            VARCHAR(36) NOT NULL,
    CreatedDateTime   DATETIME    NOT NULL DEFAULT NOW(),
    UpdatedDateTime   DATETIME    NULL,
    IsDeleted         BOOLEAN     NOT NULl DEFAULT FALSE,
    PRIMARY KEY (ExpenseCategoryId, UserId),
    CONSTRAINT fk_tb_ExpenseCategoryUserMapping_ExpenseCategoryId FOREIGN KEY (ExpenseCategoryId) REFERENCES tb_ExpenseCategory (ExpenseCategoryId),
    CONSTRAINT fk_tb_ExpenseCategoryUserMapping_UserId FOREIGN KEY (UserId) REFERENCES tb_User (UserId)
);
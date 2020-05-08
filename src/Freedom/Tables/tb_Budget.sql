CREATE TABLE IF NOT EXISTS tb_Budget
(
    BudgetId        VARCHAR(36) NOT NULL DEFAULT UUID(),
    UserId          VARCHAR(36) NOT NULL,
    CreatedDateTime DATETIME    NOT NULL DEFAULT NOW(),
    PRIMARY KEY (BudgetId)
);
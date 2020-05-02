CREATE TABLE IF NOT EXISTS tb_DebtAccount
(
    DebtAccountId     VARCHAR(36)  NOT NULL DEFAULT UUID(),
    UserId            VARCHAR(36)  NOT NULL,
    CurrencyId        VARCHAR(36)  NOT NULL,
    InitialAmountOwed DOUBLE       NOT NULL,
    CurrentAmountOwed DOUBLE       NOT NULL,
    TargetPayoffDate  DATE         NOT NULL,
    ActualPayoffDate  DATE         NULL,
    Name              VARCHAR(255) NOT NULL,
    PRIMARY KEY (DebtAccountId),
    CONSTRAINT fk_tb_Debt_UserId FOREIGN KEY (UserId) REFERENCES tb_User (UserId),
    CONSTRAINT fk_tb_Debt_CurrencyId FOREIGN KEY (CurrencyId) REFERENCES tb_Currency (CurrencyId)
);
CREATE TABLE IF NOT EXISTS tb_SavingsAccount
(
    SavingsAccountId    VARCHAR(36)  NOT NULL DEFAULT UUID(),
    UserId              VARCHAR(36)  NOT NULL,
    CurrencyId          VARCHAR(36)  NOT NULL,
    InitialSavingsValue DOUBLE       NOT NULL,
    CurrentSavingsValue DOUBLE       NOT NULL,
    SavingsTarget       DOUBLE       NULL,
    Name                VARCHAR(255) NOT NULL,
    CreatedDateTime     DATETIME     NOT NULL DEFAULT NOW(),
    UpdatedDateTime     DATETIME     NULL,
    IsDeleted           BOOLEAN      NOT NULl DEFAULT FALSE,
    PRIMARY KEY (SavingsAccountId),
    CONSTRAINT fk_tb_SavingsAccount_UserId FOREIGN KEY (UserId) REFERENCES tb_User (UserId),
    CONSTRAINT fk_tb_SavingsAccount_CurrencyId FOREIGN KEY (CurrencyId) REFERENCES tb_Currency (CurrencyId)
);
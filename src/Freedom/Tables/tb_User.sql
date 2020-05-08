CREATE TABLE IF NOT EXISTS tb_User
(
    UserId            VARCHAR(36)  NOT NULL DEFAULT UUID(),
    Username          VARCHAR(255) NOT NULL,
    Email             VARCHAR(255) NOT NULL,
    EncryptedPassword VARCHAR(255) NOT NULL,
    CreatedDateTime   DATETIME     NOT NULL DEFAULT NOW(),
    UpdatedDateTime   DATETIME     NULL,
    PRIMARY KEY (UserId)
);
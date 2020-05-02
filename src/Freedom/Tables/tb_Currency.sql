CREATE TABLE IF NOT EXISTS tb_Currency
(
    CurrencyId          VARCHAR(36)  NOT NULL DEFAULT UUID(),
    Country             VARCHAR(255) NULL,
    Name                VARCHAR(255) NOT NULL,
    CountryCurrencyCode VARCHAR(10)  NOT NULL,
    RandExchangeRate    DOUBLE       NOT NULL,
    PRIMARY KEY (CurrencyId)
);
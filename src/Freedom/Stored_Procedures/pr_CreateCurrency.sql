DELIMITER //

CREATE OR REPLACE PROCEDURE pr_CreateCurrency(IN $country VARCHAR(255),
                                              IN $name VARCHAR(255),
                                              IN $countryCurrencyCode VARCHAR(10),
                                              IN $randExchangeRate DOUBLE)
BEGIN
    INSERT INTO tb_Currency (Country, Name, CountryCurrencyCode, RandExchangeRate)
    SELECT $country, $name, $countryCurrencyCode, $randExchangeRate
    WHERE NOT EXISTS(SELECT CurrencyId
                     FROM tb_Currency
                     WHERE Country = $country
                       AND Name = $name
                       AND CountryCurrencyCode = $countryCurrencyCode
                       AND RandExchangeRate = $randExchangeRate)
    LIMIT 1;
END
//

DELIMITER ;

GRANT EXECUTE ON PROCEDURE Freedom.pr_CreateCurrency TO 'FinancialPeace'@'%';
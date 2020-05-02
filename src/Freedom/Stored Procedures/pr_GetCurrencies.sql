DELIMITER //

CREATE OR REPLACE PROCEDURE pr_GetCurrencies()
BEGIN
    SELECT curr.CurrencyId          AS currencyId,
           curr.CountryCurrencyCode AS countryCurrencyCode,
           curr.Name                AS name,
           curr.Country             AS country,
           curr.RandExchangeRate    AS randExchangeRate
    FROM tb_Currency AS curr
    ORDER BY curr.CountryCurrencyCode;
END
//

DELIMITER ;
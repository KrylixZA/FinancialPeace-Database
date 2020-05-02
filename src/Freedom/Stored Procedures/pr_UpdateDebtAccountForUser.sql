DELIMITER //

CREATE OR REPLACE PROCEDURE pr_UpdateDebtAccountForUser(IN $debtAccountId VARCHAR(36),
                                                        IN $userId VARCHAR(36),
                                                        IN $countryCurrencyCode VARCHAR(10),
                                                        IN $currentAmountOwed DOUBLE,
                                                        IN $targetPayoffDate DATE,
                                                        IN $actualPayoffDate DATE,
                                                        IN $name VARCHAR(255))
BEGIN
    IF ($countryCurrencyCode IS NOT NULL) THEN
        CALL pr_UpdateDebtAccountCurrencyForUser($debtAccountId,
                                                 $userId,
                                                 $countryCurrencyCode);
    END IF;

    IF ($currentAmountOwed IS NOT NULL) THEN
        CALL pr_UpdateDebtAccountAmountOwedForUser($debtAccountId,
                                                   $userId,
                                                   $currentAmountOwed);
    END IF;

    IF ($targetPayoffDate IS NOT NULL) THEN
        CALL pr_UpdateDebtAccountTargetPayoffDateForUser($debtAccountId,
                                                         $userId,
                                                         $targetPayoffDate);
    END IF;

    IF ($actualPayoffDate IS NOT NULL) THEN
        CALL pr_UpdateDebtAccountActualPayoffDateForUser($debtAccountId,
                                                         $userId,
                                                         $actualPayoffDate);
    END IF;

    IF ($name IS NOT NULL) THEN
        CALL pr_UpdateDebtAccountNameForUser($debtAccountId,
                                             $userId,
                                             $name);
    END IF;
END
//

DELIMITER ;
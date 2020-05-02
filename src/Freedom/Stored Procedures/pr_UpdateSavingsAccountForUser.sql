DELIMITER //

CREATE OR REPLACE PROCEDURE pr_UpdateSavingsAccountForUser(IN $savingsAccountId VARCHAR(36),
                                                           IN $userId VARCHAR(36),
                                                           IN $countryCurrencyCode VARCHAR(10),
                                                           IN $currentSavingsAmount DOUBLE,
                                                           IN $savingsTarget DOUBLE,
                                                           IN $name VARCHAR(255))
BEGIN
    IF ($countryCurrencyCode IS NOT NULL) THEN
        CALL pr_UpdateSavingsAccountCurrencyForUser($savingsAccountId,
                                                    $userId,
                                                    $countryCurrencyCode);
    END IF;

    IF ($currentSavingsAmount IS NOT NULL) THEN
        CALL pr_UpdateSavingsAccountCurrentAmountForUser($savingsAccountId,
                                                         $userId,
                                                         $currentSavingsAmount);
    END IF;

    IF ($savingsTarget IS NOT NULL) THEN
        CALL pr_UpdateSavingsAccountTargetForUser($savingsAccountId,
                                                  $userId,
                                                  $savingsTarget);
    END IF;

    IF ($name IS NOT NULL) THEN
        CALL pr_UpdateSavingsAccountNameForUser($savingsAccountId,
                                                $userId,
                                                $name);
    END IF;
END
//

DELIMITER ;
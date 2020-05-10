DELIMITER //

CREATE OR REPLACE PROCEDURE pr_UpdateUserPassword(IN $userId VARCHAR(36),
                                                  IN $encryptedPassword VARCHAR(255))
BEGIN
    UPDATE tb_User
    SET EncryptedPassword = $encryptedPassword
    WHERE UserId = $userId;
END
//

DELIMITER ;

GRANT EXECUTE ON PROCEDURE Freedom.pr_UpdateUserPassword TO 'FinancialPeace'@'%';
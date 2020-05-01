DELIMITER //

CREATE OR REPLACE PROCEDURE pr_UpdateUserPassword(IN $userId VARCHAR(36),
                                                  IN $password VARCHAR(255))
BEGIN
    UPDATE tb_User
    SET Password = $password
    WHERE UserId = $userId;
END
//

DELIMITER ;
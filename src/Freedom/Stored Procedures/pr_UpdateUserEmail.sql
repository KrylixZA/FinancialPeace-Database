DELIMITER //

CREATE OR REPLACE PROCEDURE pr_UpdateUserEmail(IN $userId VARCHAR(36),
                                               IN $email VARCHAR(255))
BEGIN
    UPDATE tb_User
    SET Email = $email
    WHERE UserId = $userId;
END
//

DELIMITER ;
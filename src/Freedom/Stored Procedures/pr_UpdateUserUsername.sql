DELIMITER //

CREATE OR REPLACE PROCEDURE pr_UpdateUserUsername(IN $userId VARCHAR(36),
                                                  IN $username VARCHAR(255))
BEGIN
    UPDATE tb_User
    SET Username = $username
    WHERE UserId = $userId;
END
//

DELIMITER ;
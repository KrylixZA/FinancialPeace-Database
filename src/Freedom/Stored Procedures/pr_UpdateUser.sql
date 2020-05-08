DELIMITER //

CREATE OR REPLACE PROCEDURE pr_UpdateUser(IN $userId VARCHAR(36),
                                          IN $username VARCHAR(255),
                                          IN $email VARCHAR(255),
                                          IN $encryptedPassword VARCHAR(255))
BEGIN
    IF ($username IS NOT NULL) THEN
        CALL pr_UpdateUserUsername($userId, $username);
    END IF;

    IF ($email IS NOT NULL) THEN
        CALL pr_UpdateUserEmail($userId, $email);
    END IF;

    IF ($encryptedPassword IS NOT NULL) THEN
        CALL pr_UpdateUserPassword($userId, $encryptedPassword);
    END IF;

    UPDATE tb_User
    SET UpdatedDateTime = NOW()
    WHERE UserId = $userId;
END
//

DELIMITER ;
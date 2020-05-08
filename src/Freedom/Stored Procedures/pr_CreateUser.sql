DELIMITER //

CREATE OR REPLACE PROCEDURE pr_CreateUser(IN $username VARCHAR(255),
                                          IN $email VARCHAR(255),
                                          IN $encryptedPassword VARCHAR(255))
BEGIN
    INSERT INTO tb_User (Username, Email, EncryptedPassword)
    SELECT $username, $email, $encryptedPassword
    WHERE NOT EXISTS(
            SELECT UserID
            FROM tb_User
            WHERE Username = $username
               OR Email = $email)
    LIMIT 1;
END
//

DELIMITER ;
DELIMITER //

CREATE OR REPLACE PROCEDURE pr_GetUser(IN $username VARCHAR(255),
                                       IN $email VARCHAR(255),
                                       IN $encryptedPassword VARCHAR(255))
BEGIN
    SELECT UserId AS userId
    FROM tb_User
    WHERE (Username = $username AND EncryptedPassword = $encryptedPassword)
       OR (Email = $email AND EncryptedPassword = $encryptedPassword);
END
//

DELIMITER ;
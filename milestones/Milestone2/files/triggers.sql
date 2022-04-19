SET SQL_SAFE_UPDATES = 0; 
CREATE DATABASE IF NOT EXISTS ATMManagementDB;
USE ATMManagementDB;

DELIMITER $$
CREATE TRIGGER update_employee_isAdmin AFTER INSERT 
ON Admin
FOR EACH ROW
	BEGIN
		UPDATE `Employee`
        SET isAdmin = 1
        WHERE Employee.employee_id = new.employee_id;
	END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER update_generalUser_isVerified AFTER INSERT 
ON VerifiedUser
FOR EACH ROW
	BEGIN
		UPDATE `GeneralUser`
        SET is_verified = 1
        WHERE GeneralUser.general_user_id = new.general_user_id; 
	END $$
DELIMITER ;

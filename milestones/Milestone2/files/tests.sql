-- Script name: tests.sql
       -- Author:      Darren Wong
       -- Purpose:     test the integrity of this database system
       
SET SQL_SAFE_UPDATES = 0; 
USE ATMManagementDB;



-- 1. Bank
-- DELETE FROM Bank WHERE bank_id = 3;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`atmmanagementdb`.`accountpermissions`, CONSTRAINT `FK_account_accountPermissions` FOREIGN KEY (`bank_account_id`) REFERENCES `bankaccount` (`bank_account_id`))

UPDATE Bank SET address = "55 Powell Street" WHERE name = "Wells Fargo";

-- 2. General User
DELETE FROM GeneralUser WHERE general_user_id = 3;
UPDATE GeneralUser SET email = "iAmNickFury@yahoo.com" WHERE name = "Samuel L. Jackson";

-- 3. Bank Account
DELETE FROM BankAccount WHERE bank_account_id = 10;
UPDATE BankAccount SET account_number = 15 WHERE bank_account_id = 5;

-- 4. CheckingAccount
DELETE FROM CheckingAccount WHERE checking_account_id = 5;
UPDATE CheckingAccount SET fees = 4 WHERE checking_account_id = 4;

-- 5. SavingsAccount
DELETE FROM SavingsAccount WHERE savings_account_id = 4;
UPDATE SavingsAccount SET interest_rate = 6 WHERE savings_account_id = 3;

-- 6. Owner
-- DELETE FROM Owner WHERE owner_id = 312;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`atmmanagementdb`.`owns`, CONSTRAINT `FK_owner_owns` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`owner_id`))	0.016 sec

UPDATE Owner SET last_name = "McCown" WHERE owner_id = 42;

-- 7. Owns
DELETE FROM Owns WHERE owns_id = 4;
UPDATE Owns SET bank_id = 2 WHERE owns_id = 3;

-- 8. Affiliate 
DELETE FROM Affiliate WHERE affiliate_id = 7;
UPDATE Affiliate SET name = "Hayden Christensen" WHERE affiliate_id = 3011;

-- 9. Affiliations
DELETE FROM Affiliations WHERE affiliation_id = 2;
UPDATE Affiliations SET affiliate_id = 674 WHERE affiliation_id = 1;

-- 10. Employee
DELETE FROM Employee WHERE employee_id = 811;
UPDATE Employee SET name = "Riley House" WHERE employee_id = 7832;

-- 11. Admin
-- DELETE FROM Admin WHERE admin_id = 1;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`atmmanagementdb`.`atmmachine`, CONSTRAINT `FK_admin_atm` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON UPDATE CASCADE)	0.016 sec

UPDATE Admin SET privileges = "ATM management, roles, permissions" WHERE admin_id = 4;

-- 12. Security
DELETE FROM Security WHERE security_id = 3;
UPDATE Security SET privileges = "Locking the doors, Guarding the vault" WHERE security_id = 2;

-- 13. Analyst
DELETE FROM Analyst WHERE analyst_id = 3;
UPDATE Analyst SET privileges =  "Analyze login sessions and bank transactions" WHERE analyst_id = 2;

-- 14. Consultant
DELETE FROM Consultant WHERE consultant_id = 3;
UPDATE Consultant SET privileges = "Consult customers and clients" WHERE consultant_id = 2;

-- 15. Teller
DELETE FROM Teller WHERE teller_id = 3;
UPDATE Teller SET privileges = "Record transactions and count currency" WHERE teller_id = 2;

-- 16. Permissions
DELETE FROM Permissions WHERE permissions_id = 4;
UPDATE Permissions SET type = "Admin access" WHERE permissions_id = 3;

-- 17. Manages
DELETE FROM manages WHERE manage_id = 4;
UPDATE manages SET admin_id = 2 WHERE manage_id = 3;

-- 18. AccountPermissions
DELETE FROM AccountPermissions WHERE account_perm_id = 2;
UPDATE AccountPermissions SET bank_account_id = 5 WHERE account_perm_id = 3;

-- 19. Manufacturer
DELETE FROM Manufacturer WHERE manufacturer_id = 4;
UPDATE Manufacturer SET name = "Sony" WHERE manufacturer_id = 2;

-- 20. Security Alarm
DELETE FROM SecurityAlarm WHERE security_alarm_id = 3;

-- UPDATE SecurityAlarm SET manufacturer_id = 4 WHERE security_alarm_id = 2;
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`atmmanagementdb`.`securityalarm`, CONSTRAINT `FK_manufacturer_securityAlarm` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer` (`manufacturer_id`))	0.015 sec

-- 21. Informs
DELETE FROM Informs WHERE informs_id = 2;
UPDATE Informs SET security_id = 2 WHERE informs_id = 1;

-- 22. ATMMachine
DELETE FROM ATMMachine WHERE atm_machine_id = 3;
UPDATE ATMMachine SET status = "Not working" WHERE atm_machine_id = 2;

-- 23. Languages
DELETE FROM Languages WHERE language_id = 3;
UPDATE Languages SET country = "Spain, LatinAmerica" WHERE language_id = 4; 

-- 24. Supports
DELETE FROM Supports WHERE support_id = 4;
UPDATE Supports SET language_id = 2 WHERE support_id = 1;

-- 25. Loans
-- DELETE FROM Loans WHERE loan_id = 3;
-- Cannot delete or update a parent row: a foreign key constraint fails (`atmmanagementdb`.`paysoff`, CONSTRAINT `FK_loan_paysOff` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`loan_id`))	0.016 sec

UPDATE Loans SET type = "Auto" WHERE loan_id = 2;

-- 26. Devices
DELETE FROM Devices WHERE device_id = 2;
UPDATE Devices SET type = "ETC." WHERE device_id = 4;

-- 27. Speaker
UPDATE Speaker SET status = "Not working" WHERE speaker_id = 4;
DELETE FROM Speaker WHERE speaker_id = 4;

-- 28. CardReader
DELETE FROM CardReader WHERE card_reader_id = 3;
UPDATE CardReader SET status = "Working" WHERE card_reader_id = 2;

-- 29. NFCScanner
DELETE FROM NFCScanner WHERE nfc_scanner_id = 3;
UPDATE NFCScanner SET status = "Not working" WHERE nfc_scanner_id = 2;

-- 30. Keypad
DELETE FROM Keypad WHERE keypad_id = 3;
UPDATE Keypad SET status = "Not working" WHERE keypad_id = 2;

-- 31. OLEDScreen
DELETE FROM OLEDScreen WHERE oled_screen_id = 3;
UPDATE OLEDScreen SET status = "Working" WHERE oled_screen_id = 2;

-- 32. DepositCheckSlot
DELETE FROM DepositCheckSlot WHERE check_slot_id = 3;
UPDATE DepositCheckSlot SET status = "Not working" WHERE check_slot_id = 2;

-- 33. CashDispenser
DELETE FROM CashDispenser WHERE cash_dispenser_id = 3;
UPDATE CashDispenser SET status = "Working" WHERE cash_dispenser_id = 2;

-- 34. ReceiptPrinter
DELETE FROM ReceiptPrinter WHERE receipt_printer_id = 3;
UPDATE ReceiptPrinter SET status = "Working" WHERE receipt_printer_id = 2;

-- 35. VerifiedUser
DELETE FROM VerifiedUser WHERE verified_user_id = 1;
UPDATE VerifiedUser SET privileges = 2 WHERE verified_user_id = 2;

-- 36. VerifiedDevices
UPDATE VerifiedDevices SET device_type = "iPad" WHERE verified_devices_id = 4;
DELETE FROM VerifiedDevices WHERE verified_devices_id = 4;

-- 37. Notifications
UPDATE Notifications SET message = "hi" WHERE notification_id = 5;
DELETE FROM Notifications WHERE notification_id = 5;

-- 38. Received
UPDATE Received SET verified_device_id = 4 WHERE received_id = 4;
DELETE FROM Received WHERE received_id = 2;

-- 39. Logins
UPDATE Logins SET data = "New Message" WHERE login_id = 2;
DELETE FROM Logins WHERE login_id = 2;

-- 40. Verifies
DELETE FROM Verifies WHERE verifies_id = 1;
UPDATE Verifies SET nfc_scanner_id = 2 WHERE verifies_id = 2;

-- 41. VerificationMethod
UPDATE VerificationMethod SET verification_type = "Digital Wallet" WHERE verification_method_id = 3;
DELETE FROM VerificationMethod WHERE verification_method_id = 3;

-- 42. Card
DELETE FROM Card WHERE card_id = 6;
UPDATE CARD SET CVV = 96 WHERE card_id = 5;

-- 43. DebitCard
DELETE FROM DebitCard WHERE debit_card_number = 3;
UPDATE DebitCard SET CVV = 52 WHERE debit_card_number = 2;

-- 44. CreditCard
DELETE FROM CreditCard WHERE credit_card_number = 1;
UPDATE CreditCard SET CVV = 72 WHERE credit_card_number = 1;

-- 45. DigitalWallet
DELETE FROM DigitalWallet WHERE wallet_id = 3;
UPDATE DigitalWallet SET type = "paypal" WHERE wallet_id = 2;

-- 46. Scans
DELETE FROM Scans WHERE scans_id = 3;
UPDATE Scans SET nfc_scanner_id = 2 WHERE scans_id = 1;

-- 47. Checks
DELETE FROM Checks WHERE check_id = 3;
UPDATE Checks SET amount = 354 WHERE check_id = 2;

-- 48. Currency
DELETE FROM Currency WHERE currency_id = 3;
UPDATE Currency SET amount = 20 WHERE currency_id = 2;

-- 49. Transactions
UPDATE Transactions SET amount = 10 WHERE transactions_id = 3;
DELETE FROM Transactions WHERE transactions_id = 3;

-- 50. Payment
UPDATE Payment SET balance = 10 WHERE payment_id = 1;

-- DELETE FROM Payment WHERE payment_id = 1;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`atmmanagementdb`.`paysoff`, CONSTRAINT `FK_payment_paysOff` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`) ON UPDATE CASCADE)	0.016 sec

-- 51. PaysOff
UPDATE PaysOff SET payment_id = 2 WHERE pays_off_id = 2;
DELETE FROM PaysOff WHERE pays_off_id = 2;

-- 52. Transfer
DELETE FROM Transfer WHERE transfer_id = 3;
UPDATE Transfer SET balance = 4 WHERE transfer_id = 2;

-- 53. CashWithdrawal
UPDATE CashWithdrawal SET balance = 3 WHERE cash_withdrawal_id = 2;
DELETE FROM CashWithdrawal WHERE cash_withdrawal_id = 2;

-- 54. CashDeposit
UPDATE CashDeposit SET balance = 4 WHERE cash_deposit_id = 1;
DELETE FROM CashDeposit WHERE cash_deposit_id = 1;

-- 55. CheckDeposit
UPDATE CheckDeposit SET balance = 100 WHERE check_deposit_id = 1;
DELETE FROM CheckDeposit WHERE check_deposit_id = 1;

-- 56. CashProcess
UPDATE CashProcess SET cash_withdrawal_id = 1 WHERE cash_process_id = 1;
DELETE FROM CashProcess WHERE cash_process_id = 1;


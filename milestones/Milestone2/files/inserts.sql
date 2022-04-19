SET SQL_SAFE_UPDATES = 0; 
USE ATMManagementDB;

INSERT INTO Bank (bank_id, name, address)
VALUES
(1, "Chase", "128 Taraval Ave"),
(2, "Wells Fargo", "512 San Bruno Ave"),
(3, "Bank of the West", "54 California Street");

INSERT INTO GeneralUser (general_user_id, name, email, ssn, address)
VALUES
(1, "Steph Curry", "splashfather@gmail.com", 1, "1 Warriors Way"),
(2, "Samuel L. Jackson", "imMaceWindu@yahoo.com", 2, "124 Coruscant St"),
(3, "Will Smith", "catchThemHands@oscars.com", 3, "2 Academy Place");

INSERT INTO BankAccount (bank_account_id, bank_id, general_user_id, account_number)
VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3);

INSERT INTO CheckingAccount(checking_account_id, bank_account_id, balance, fees)
VALUES
(1, 1, 100, 0),
(2, 2, 400, 1),
(3, 3, 100000, 4);

INSERT INTO SavingsAccount(savings_account_id, bank_account_id, balance, interest_rate)
VALUES
(1, 1, 3000, 2),
(2, 2, 5234, 3),
(3, 3, 45301, 1);

INSERT INTO Owner (owner_id, name, last_name)
VALUES
(42, "Harrison Wells", "Fargo"),
(5321, "Chase Samuel", "McLaughlin"),
(73261, "Westly Van", "Duke");

INSERT INTO Owns (owns_id, bank_id, owner_id)
VALUES
(1, 1, 42),
(2, 2, 5321),
(3, 3, 73261);

INSERT INTO Affiliate (affiliate_id, name, contract)
VALUES
(42027, "Selena Gomez", "$5000 for each appearance/commercial"),
(3011, "Ewan McGregor", "$2500 for each appearance/commercial"),
(7, "Jeremy Lin", "$1000 for each appearance/commercial");

INSERT INTO Affiliations (affiliation_id, affiliate_id, bank_id)
VALUES
(1, 42027, 1),
(2, 3011, 2),
(3, 7, 3);

INSERT INTO Employee (employee_id, name, email, bank_id, isAdmin)
VALUES
(31130, "Raymond Gonzalez", "rgonz@chase.com", 1, 0),
(15, "Betty Tress", "btress@wellsfargo.com", 2, 1),
(4232, "Charles Knight", "cknight2@west.com", 3, 0),
(3511, "Whitney Williams", "wwilliams3@chase.com", 1, 1),
(2330, "Jennifer Ngyuen", "jnguyen5@west.com", 3, 1),
(7239, "Jason Brigs", "jbrigs@wells.com", 2, 0),
(7240, "Elton Brigs", "ebrigs@wellsfargo.com", 2, 0),
(6338, "Kenny Wong", "kwong9@chase.com", 1, 0),
(532, "Anna Blouse", "ablouse3@west.com", 2, 0),
(7428, "Jeff Grimes", "jgrimes@wellsfargo.com", 3, 0),
(9759, "Eren Chavez", "echavez71@chase.com", 3, 0),
(9057, "Sasha Blakeman", "sblakeman@west.com", 3, 0),
(87041, "Levi Samuel", "lsamuel@chase.com", 1, 0),
(72, "Ryan Reynolds", "rreynolds@wellsfargo.com", 2, 0),
(6954, "Oscar Thompson", "othompson3@wellsfargo.com", 2, 0),
(5214, "Chris Smith", "csmith@chase.com", 1, 0),
(7832, "Riley Evans", "revans24@west.com", 1, 0),
(811, "Charlie Gibens", "cgibens1@chase.com", 1, 0);

INSERT INTO Admin (admin_id, employee_id, privileges)
VALUES
(1, 31130, "ATM management, permissions"),
(2, 15, "ATM management, verification"),
(3, 3511, "ATM management, roles, permissions"),
(4, 2330, "ATM management, roles");

INSERT INTO Security (security_id, employee_id, privileges)
VALUES
(1, 7239, "Locking the doors"),
(2, 7240, "Guarding the vault"),
(3, 6338, "Camera duty");

INSERT INTO Analyst(analyst_id, employee_id, privileges)
VALUES
(1, 532, "Analyze bank transactions"),
(2, 7428, "Analyze login sessions"),
(3, 9759, "Analyze bank transactions");

INSERT INTO Consultant(consultant_id, employee_id, privileges)
VALUES
(1, 9057, "Consult clients"),
(2, 87041, "Consult customers"),
(3, 72, "Consult agents");

INSERT INTO Teller (teller_id, employee_id, privileges)
VALUES
(1, 6954, "Record transactions"),
(2, 5214, "Count currency"),
(3, 7832, "Promote services");

INSERT INTO Permissions (permissions_id, admin_id, type, bank_account_id)
VALUES
(1, 1, "Access Loans", 1),
(2, 2, "Access Checking Account", 1),
(3, 3, "Access Savings Account", 2);

INSERT INTO Manages (manage_id, admin_id, permission_id)
VALUES
(1, 1, 1), 
(2, 2, 2),
(3, 3, 3);

INSERT INTO AccountPermissions(account_perm_id, bank_account_id, permission_id)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

INSERT INTO Manufacturer (manufacturer_id, name, address)
VALUES
(1, "LG Display", "2 LG Way"),
(2, "Sony LLD", "500 Industrial Way"),
(3, "Samsan Tech", "324 Startup Ave");

INSERT INTO SecurityAlarm(security_alarm_id, manufacturer_id, alarm_range)
VALUES
(1, 3, 5),
(2, 2, 4),
(3, 2, 3);

INSERT INTO Informs (informs_id, security_id, security_alarm_id)
VALUES
(1, 1, 1),
(2, 2, 2), 
(3, 3, 3);

INSERT INTO ATMMachine (atm_machine_id, status, bank_id, admin_id)
VALUES
(1, "Working", 1, 1),
(2, "Working", 2, 2),
(3, "Not Working", 3, 3);

INSERT INTO Languages (language_id, language_name, country)
VALUES
(1, "English", "United States"),
(2, "Chinese", "China"),
(3, "Korean", "Korea"),
(4, "Spanish", "Spain");

INSERT INTO Supports (support_id, language_id, atm_machine_id)
VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 1);

INSERT INTO Loans(loan_id, type, interest_type, bank_id, bank_account_id)
VALUES
(1, "Personal", "Flat", 1, 1),
(2, "Business", "Fixed", 2, 2),
(3, "Mortgage", "Variable", 3, 3);

INSERT INTO Devices (device_id, manufacturer_id, type, status, atm_machine_id)
VALUES
(1, 1, "Screen", "Working", 1),
(2, 2, "Sound", "Working", 1),
(3, 3, "Scanner", "Not working", 1),
(4, 3, "I/O", "Working", 1);

INSERT INTO Speaker(speaker_id, manufacturer_id, status, device_id)
VALUES
(1, 2, "Working", 2),
(2, 2, "Not working", 2),
(3, 2, "Working", 2);

INSERT INTO CardReader(card_reader_id, manufacturer_id, status, device_id)
VALUES
(1, 3, "Working", 3),
(2, 3, "Not working", 3),
(3, 3, "Working", 3);

INSERT INTO NFCScanner(nfc_scanner_id, manufacturer_id, status, device_id)
VALUES
(1, 3, "Not working", 3),
(2, 3, "Working", 3),
(3, 3, "Not working", 3);

INSERT INTO Keypad(keypad_id, manufacturer_id, status, device_id)
VALUES 
(1, 3, "Working", 4),
(2, 3, "Working", 4),
(3, 3, "Not working", 4);

INSERT INTO OLEDScreen(oled_screen_id, manufacturer_id, status, device_id)
VALUES
(1, 3, "Not Working", 4),
(2, 3, "Not Working", 4),
(3, 3, "Not Working", 4);

INSERT INTO DepositCheckSlot (check_slot_id, manufacturer_id, status, device_id)
VALUES
(1, 3, "Working", 4),
(2, 3, "Working", 4),
(3, 3, "Working", 4);

INSERT INTO CashDispenser (cash_dispenser_id, manufacturer_id, status, device_id)
VALUES
(1, 3, "Not working", 4),
(2, 3, "Not working", 4),
(3, 3, "Not working", 4);

INSERT INTO ReceiptPrinter(receipt_printer_id, manufacturer_id, status, device_id)
VALUES
(1, 3, "Working", 4),
(2, 3, "Not working", 4),
(3, 3, "Not working", 4);

INSERT INTO VerifiedUser (verified_user_id, general_user_id, privileges, oled_screen_id, keypad_id)
VALUES
(1, 1, 4, 1, 1),
(2, 2, 3, 2, 2),
(3, 3, 5, 3, 3);

INSERT INTO VerifiedDevices (verified_devices_id, verified_user_id, device_type)
VALUES
(1, 1, "Android Phone"),
(2, 2, "iPhone"),
(3, 3, "HP Probook");

INSERT INTO Notifications (notification_id, message, timestamp, verified_device_id, security_alarm_id)
VALUES
(1, "Account has been temporarily locked out", now(), 1, 1),
(2, "Account has been deducted $100", now(), 1, 2),
(3, "Account has paid off this month's balance", now(), 2, 2);

INSERT INTO Received(received_id, verified_device_id, notification_id)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

INSERT Logins (login_id, verified_user_id, data, expiration, atm_machine_id)
VALUES
(1, 1, "User has logged into the ATM machine", now(), 1),
(2, 2, "User has logged into the ATM machine", now(), 2),
(3, 3, "User has logged into the ATM machine", now(), 3);

INSERT INTO Verifies(verifies_id, keypad_id, NFC_scanner_id, card_reader_id, bank_account_id)
VALUES
(1, 1, 1, 1, 1),
(2, 2, 2, 2, 2),
(3, 3, 3, 3, 3);

INSERT INTO VerificationMethod(verification_method_id, verified_user_id, verification_type)
VALUES
(1, 1, "Card"),
(2, 1, "DigitalWallet"),
(3, 2, "Card");

INSERT INTO Card (card_id, type, CVV, zip, exp_date, verification_method_id)
VALUES
(1, "Visa", 92, 92113, now(), 1),
(2, "American Express", 45, 88112, now(), 1),
(3, "MasterCard", 38, 82314, now(), 1),
(4, "Visa", 45, 83929, now(), 3),
(5, "American Express", 56, 64231, now(), 3),
(6, "MasterCard", 57, 72913, now(), 1);

INSERT INTO DebitCard(debit_card_number, card_id, CVV, zip, exp_date)
VALUES
(1, 1, 92, 92113, now()),
(2, 2, 45, 88112, now()),
(3, 3, 38, 82314, now());

INSERT INTO CreditCard(credit_card_number, card_id, cvv, zip, exp_date)
VALUES
(1, 4, 45, 83929, now()),
(2, 5, 56, 64231, now()),
(3, 6, 57, 72913, now());

INSERT INTO DigitalWallet(wallet_id, card_number, type, verification_method_id)
VALUES
(1, 1, "Venmo", 2),
(2, 2, "Zelle", 2),
(3, 3, "CashApp", 3);

INSERT INTO Scans(scans_id, card_id, card_reader_id, nfc_scanner_id)
VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3);

INSERT INTO Checks(check_id, verified_user_id, amount, check_slot_id)
VALUES
(1, 1, 5000, 1),
(2, 2, 3541, 2),
(3, 3, 5401, 3);

INSERT INTO Currency(currency_id, type, amount, verified_user_id, cash_dispenser_id)
VALUES
(1, "Dollars", 5, 1, 1),
(2, "Cents", 10, 1, 2),
(3, "Canadian Dollars", 5, 1, 3);

INSERT INTO Transactions(transactions_id, amount, atm_machine_id, bank_id, receipt_printer_id)
VALUES
(1, 5, 1, 1, 1),
(2, 10, 2, 2, 2),
(3, 15, 3, 3, 3);

INSERT INTO Payment(payment_id, transaction_id, balance)
VALUES
(1, 1, 5),
(2, 1, 5),
(3, 1, 5);

INSERT INTO PaysOff(pays_off_id, payment_id, loan_id)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

INSERT INTO Transfer(transfer_id, transaction_id, balance)
VALUES
(1, 2, 10),
(2, 2, 10),
(3, 2, 10);

INSERT INTO CashWithdrawal(cash_withdrawal_id, transaction_id, balance)
VALUES
(1, 2, 15),
(2, 2, 15),
(3, 2, 15);

INSERT INTO CashDeposit(cash_deposit_id, transaction_id, balance)
VALUES
(1, 2, 15),
(2, 2, 15),
(3, 2, 15);

INSERT INTO CheckDeposit(check_deposit_id, transaction_id, balance, check_slot_id)
VALUES
(1, 2, 20, 1),
(2, 2, 20, 1),
(3, 2, 20, 1);

INSERT INTO CashProcess(cash_process_id, cash_withdrawal_id, cash_deposit_id, cash_dispenser_id)
VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3);
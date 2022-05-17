# database.py
# Handles all the methods interacting with the database of the application.
# Students must implement their own methods here to meet the project requirements.

import os
import pymysql.cursors

db_host = os.environ['DB_HOST']
db_username = os.environ['DB_USER']
db_password = os.environ['DB_PASSWORD']
db_name = os.environ['DB_NAME']


def connect():
    try:
        conn = pymysql.connect(host=db_host,
                               port=3306,
                               user=db_username,
                               password=db_password,
                               db=db_name,
                               charset="utf8mb4", cursorclass=pymysql.cursors.DictCursor)
        print("Bot connected to database {}".format(db_name))
        return conn
    except:
        print("Bot failed to create a connection with your database because your secret environment variables " +
              "(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME) are not set".format(db_name))
        print("\n")

# your code here
def response(msg):
    db_response = None
    command_parts = msg.split()
    bot_command = command_parts[0]
    if "/find_accounts" in bot_command:
        floor_balance = command_parts[1]
        threshold_balance = command_parts[2]
        db_response = find_accounts(floor_balance, threshold_balance)
        return db_response
    elif "/find_expiration" in bot_command:
        year = command_parts[1]
        db_response = find_expiration(year)
        return db_response
    elif "/find_machine_status" in bot_command:
        status_type = command_parts[1]
        db_response = find_machine_status(status_type)
        return db_response
    elif "/get_logins" in bot_command:
        date = command_parts[1]
        db_response = get_logins(date)
        return db_response
    elif "/get_owners" in bot_command:
        bank_id = command_parts[1]
        db_response = get_owners(bank_id)
        return db_response
    elif "/get_verified_devices" in bot_command:
        general_user_id = command_parts[1]
        db_response = get_verified_devices(general_user_id)
        return db_response
    elif "/change_savings_balance" in bot_command:
        balance = command_parts[1]
        account_id = command_parts[2]
        db_response = change_savings_balance(balance, account_id)
        return db_response
    elif "/change_checking_balance" in bot_command:
        balance = command_parts[1]
        account_id = command_parts[2]
        db_response = change_checking_balance(balance, account_id)
        return db_response
    elif "/average_balances" in bot_command:
        account_type = command_parts[1]
        db_response = average_balances(account_type)
        return db_response
    elif "/get_languages" in bot_command:
        db_response = get_languages()
        return db_response
    elif "/get_notifications" in bot_command:
        db_response = get_notifications()
        return db_response
    elif "/get_owner_names" in bot_command:
        db_response = get_owner_names()
        return db_response
    elif "/get_verifications" in bot_command:
        date = command_parts[1]
        db_response = get_verifications(date)
        return db_response
    elif "/get_contracts" in bot_command:
        db_response = get_contracts()
        return db_response
    elif "/bank_loan_terms" in bot_command:
        bank_id = command_parts[1]
        db_response = bank_loan_terms(bank_id)
        return db_response
    elif "/get_card_scanned" in bot_command:
        start_date = command_parts[1]
        end_date = command_parts[2]
        db_response = get_card_scanned(start_date, end_date)
        return db_response
    elif "/find_devices" in bot_command:
        manufacturer_id = command_parts[1]
        db_response = find_devices(manufacturer_id)
        return db_response

# reference working function       
def seeaccounts(floor_balance, threshold_balance):
    print("hello")
    results = None
    try:
        connection = connect()
        if connection:
            cursor = connection.cursor()
            query = ("""SELECT * FROM BankAccount""")

            variables = (floor_balance, threshold_balance)
            cursor.execute(query, variables)

            results = cursor.fetchall()
            cursor.close()
            connection.close()

            result = []
            if results: 
                for data in results:
                    result.append(data)
                    print(data)
            return result
                
    except Exception as error:
        results = -1
        print("help")
        return results

def find_accounts(floor_balance, threshold_balance):
    print("hello")
    results = None
    results2 = None
    try:
        connection = connect()
        if connection:
            cursor = connection.cursor()
            query = ("""SELECT BankAccount.account_number,                                CheckingAccount.checking_account_id, CheckingAccount.balance FROM             BankAccount JOIN GeneralUser ON BankAccount.general_user_id =                 GeneralUser.general_user_id JOIN CheckingAccount ON                           CheckingAccount.bank_account_id = BankAccount.bank_account_id                 WHERE CheckingAccount.balance > %s AND CheckingAccount.balance <              %s GROUP BY BankAccount.account_number,                                       CheckingAccount.checking_account_id, CheckingAccount.balance""")

            variables = (floor_balance, threshold_balance)
            cursor.execute(query, variables)
            results = cursor.fetchall()

            query2 = ("""SELECT BankAccount.account_number,                               SavingsAccount.savings_account_id, SavingsAccount.balance FROM                BankAccount JOIN GeneralUser ON BankAccount.general_user_id =                 GeneralUser.general_user_id JOIN SavingsAccount ON                            SavingsAccount.bank_account_id = BankAccount.bank_account_id                  WHERE SavingsAccount.balance >= %s AND SavingsAccount.balance <=              %s GROUP BY BankAccount.account_number,                                       SavingsAccount.savings_account_id, SavingsAccount.balance""")

            cursor.execute(query2, variables);
            results2 = cursor.fetchall()
            
            cursor.close()
            connection.close()

            result = []
            if results: 
                for data in results:
                    result.append(data)
                for data2 in results2:
                    result.append(data2)
            return result
                
                
    except Exception as error:
        results = -1
        return results

def find_expiration(year):
    results = None
    results2 = None
    try:
        connection = connect()
        if connection:
            cursor = connection.cursor()
            print("test")
            query = ("""SELECT Card.card_id, DebitCard.debit_card_number,                 DebitCard.exp_date FROM Card JOIN DebitCard ON DebitCard.card_id             = Card.card_id WHERE YEAR(DebitCard.exp_date) = %s GROUP BY                 Card.card_id, DebitCard.debit_card_number, DebitCard.exp_date""")

            variables = (year)
            cursor.execute(query, variables)
            results = cursor.fetchall()

            query2 = ("""SELECT Card.card_id, CreditCard.credit_card_number,              CreditCard.exp_date FROM Card JOIN CreditCard ON                              CreditCard.card_id = Card.card_id WHERE YEAR(CreditCard.exp_date)             = %s GROUP BY Card.card_id, CreditCard.credit_card_number,                    CreditCard.exp_date""")

            cursor.execute(query2, variables);
            results2 = cursor.fetchall()
            
            cursor.close()
            connection.close()

            result = []
            if results: 
                for data in results:
                    result.append(data)
                for data2 in results2:
                    result.append(data2)
            return result
    except Exception as error:
        results = -1
        return results

def find_machine_status(status_type):
    results = None
    try:
        connection = connect()
        if connection:
            cursor = connection.cursor()
            query = ("""SELECT Bank.bank_id, ATMMachine.atm_machine_id,                   ATMMachine.status FROM ATMMachine JOIN Bank ON ATMMachine.bank_id             = Bank.bank_id WHERE ATMMachine.status = %s GROUP BY                   Bank.bank_id, ATMMachine.atm_machine_id, ATMMachine.status""")

            variables = (status_type)
            cursor.execute(query, variables)
            results = cursor.fetchall()

            cursor.close()
            connection.close()

            result = []
            if results: 
                for data in results:
                    result.append(data)
            return result
                
    except Exception as error:
        results = -1
        print("help")
        return results


def get_logins(date):
    results = None
    try:
        connection = connect()
        if connection:
            cursor = connection.cursor()
            print("test")
            query = ("""SELECT ATMMachine.atm_machine_id,                                 VerifiedUser.verified_user_id, Logins.logged_in FROM Logins JOIN              VerifiedUser ON VerifiedUser.verified_user_id =                               Logins.verified_user_id JOIN ATMMachine ON                                    ATMMachine.atm_machine_id = Logins.verified_user_id WHERE                     Logins.logged_in = "%s" GROUP BY                                              ATMMachine.atm_machine_id, VerifiedUser.verified_user_id,                     Logins.logged_in""")


            variables = (date)

            cursor.execute(query, variables)
            results = cursor.fetchall()

            cursor.close()
            connection.close()


            result = []
            if results: 
                for data in results:
                    result.append(data)
                    print(data)
            return result
                
    except Exception as error:
        results = -1
        print("help")
        return 

def get_owners(bank_id):
    results = None
    try:
        connection = connect()
        if connection:
            cursor = connection.cursor()
            print("test")
            query = ("""SELECT Bank.name, Owner.name FROM Owns JOIN Bank ON               Owns.bank_id = Bank.bank_id JOIN Owner ON Owns.owner_id =                     Owner.owner_id WHERE Bank.bank_id = %s GROUP BY Bank.name,                     Owner.name""")

            variables = (bank_id)
            cursor.execute(query, variables)
            results = cursor.fetchall()

            cursor.close()
            connection.close()

            result = []
            if results: 
                for data in results:
                    result.append(data)
                    print(data)
            return result
                
    except Exception as error:
        results = -1
        print("help")
        return results

def get_verified_devices(general_user_id):
    print("hello")
    results = None
    try:
        connection = connect()
        if connection:
            cursor = connection.cursor()
            query = ("""SELECT VerifiedDevices.verified_devices_id,                       VerifiedDevices.device_type, GeneralUser.name FROM VerifiedUser               JOIN VerifiedDevices ON VerifiedDevices.verified_user_id =                    VerifiedUser.verified_user_id JOIN GeneralUser ON                             GeneralUser.general_user_id = VerifiedUser.general_user_id WHERE              GeneralUser.general_user_id = %s GROUP BY                                     VerifiedDevices.verified_devices_id,                                          VerifiedDevices.device_type,             GeneralUser.name""")

            variables = (general_user_id)
            cursor.execute(query, variables)

            results = cursor.fetchall()
            cursor.close()
            connection.close()

            result = []
            if results: 
                for data in results:
                    result.append(data)
                    print(data)
            return result
                
    except Exception as error:
        results = -1
        print("help")
        return results

def change_savings_balance(balance, account_id):
    results = None
    try:
        connection = connect()
        if connection:
            cursor = connection.cursor()
            query = ("""UPDATE SavingsAccount
            SET SavingsAccount.balance = %s
            WHERE SavingsAccount.savings_account_id = %s""")

            variables = (balance, account_id)
            cursor.execute(query, variables)
            connection.commit()

            cursor.close()
            connection.close()

            results = "Updated!"
            return results
            
    except Exception as error:
        results = -1
        print("help")
        return results

def change_checking_balance(balance, account_id):

    results = None
    try:
        connection = connect()
        if connection:
            cursor = connection.cursor()
            query = ("""UPDATE CheckingAccount SET                                        CheckingAccount.balance = %s WHERE                                           CheckingAccount.checking_account_id = %s""")

            variables = (balance, account_id)
            cursor.execute(query, variables)
            connection.commit()

            cursor.close()
            connection.close()

            results = "Updated!"
            return results
            
    except Exception as error:
        results = -1
        print("help")
        return results

def average_balances(account_type):
    results = None
    try:
        connection = connect()
        if connection:
            cursor = connection.cursor()
            if account_type == "checking":
                query = ("""SELECT AVG(CheckingAccount.balance) FROM                          CheckingAccount""")
                cursor.execute(query)

            elif account_type == "savings":
                query = ("""SELECT AVG(SavingsAccount.balance) FROM                           SavingsAccount""")
                cursor.execute(query)

            results = cursor.fetchall()
            cursor.close()
            connection.close()

            return results
 
    except Exception as error:
        results = -1
        print("help")
        return results

# reference working function       
def get_languages():
    results = None
    try:
        connection = connect()
        if connection:
            cursor = connection.cursor()
            query = ("""SELECT ATMMachine.atm_machine_id,                                 Languages.language_name FROM Supports JOIN Languages ON                       Supports.language_id = Languages.language_id JOIN ATMMachine ON               Supports.atm_machine_id = ATMMachine.atm_machine_id GROUP BY                  ATMMachine.atm_machine_id, Languages.language_name ORDER BY                   ATMMachine.atm_machine_id LIMIT 20""")

            cursor.execute(query)

            results = cursor.fetchall()
            cursor.close()
            connection.close()

            result = []
            if results: 
                for data in results:
                    result.append(data)
                    print(data)
            return result
                
    except Exception as error:
        results = -1
        print("help")
        return results

# reference working function       
def get_notifications():
    results = None
    try:
        connection = connect()
        if connection:
            cursor = connection.cursor()
            query = ("""SELECT VerifiedDevices.verified_devices_id,                       VerifiedDevices.device_type, Notifications.message FROM Received              JOIN VerifiedDevices ON VerifiedDevices.verified_devices_id =                 Received.verified_device_id JOIN Notifications ON                             Notifications.notification_id = Received.notification_id GROUP BY             VerifiedDevices.verified_devices_id, VerifiedDevices.device_type,             Notifications.message ORDER BY                                                VerifiedDevices.verified_devices_id LIMIT 20""")

            cursor.execute(query)

            results = cursor.fetchall()
            cursor.close()
            connection.close()

            result = []
            if results: 
                for data in results:
                    result.append(data)
                    print(data)
            return result
                
    except Exception as error:
        results = -1
        print("help")
        return results

# reference working function       
def get_owner_names():
    results = None
    try:
        connection = connect()
        if connection:
            cursor = connection.cursor()
            query = ("""SELECT Owner.name, Bank.name FROM Owns JOIN Owner ON              Owner.owner_id = Owns.owner_id JOIN Bank ON Bank.bank_id =                    Owns.bank_id GROUP BY Owner.name, Bank.name LIMIT 20""")

            variables = ()
            cursor.execute(query)

            results = cursor.fetchall()
            cursor.close()
            connection.close()

            result = []
            if results: 
                for data in results:
                    result.append(data)
                    print(data)
            return result
                
    except Exception as error:
        results = -1
        print("help")
        return results

def get_verifications(date):
    results = None
    try:
        connection = connect()
        if connection:
            cursor = connection.cursor()
            query = ("""SELECT Verifies.verifies_id, Verifies.verified_at,                BankAccount.account_number FROM Verifies JOIN BankAccount ON                  BankAccount.bank_account_id = Verifies.bank_account_id WHERE                  Verifies.verified_at = "%s" GROUP BY                                          Verifies.verifies_id, Verifies.verified_at,                                   BankAccount.account_number""")

            variables = (date)
            cursor.execute(query, variables)

            results = cursor.fetchall()
            cursor.close()
            connection.close()

            result = []
            if results: 
                for data in results:
                    result.append(data)
                    print(data)
            return result
                
    except Exception as error:
        results = -1
        print("help")
        return results

def get_contracts():
    results = None
    try:
        connection = connect()
        if connection:
            cursor = connection.cursor()
            query = ("""SELECT Bank.name, Affiliate.name, Affiliate.contract              FROM Affiliations JOIN Bank ON Bank.bank_id =                                 Affiliations.bank_id JOIN Affiliate ON Affiliate.affiliate_id =               Affiliations.affiliate_id GROUP BY Bank.name, Affiliate.name,                 Affiliate.contract LIMIT 10""")

            cursor.execute(query)

            results = cursor.fetchall()
            cursor.close()
            connection.close()

            result = []
            if results: 
                for data in results:
                    result.append(data)
                    print(data)
            return result
                
    except Exception as error:
        results = -1
        print("help")
        return results

def bank_loan_terms(bank_id):
    print("hello")
    results = None
    try:
        connection = connect()
        if connection:
            cursor = connection.cursor()
            query = ("""SELECT Bank.name, Loans.type, Loans.terms_conditions              FROM Loans JOIN Bank ON Bank.bank_id = Loans.bank_id WHERE                    Bank.bank_id = %s GROUP BY Bank.name, Loans.type,                              Loans.terms_conditions""")

            variables = (bank_id)
            cursor.execute(query, variables)

            results = cursor.fetchall()
            cursor.close()
            connection.close()

            result = []
            if results: 
                for data in results:
                    result.append(data)
                    print(data)
            return result
                
    except Exception as error:
        results = -1
        print("help")
        return results

def get_card_scanned(start_date, end_date):
    results = None
    try:
        connection = connect()
        if connection:
            cursor = connection.cursor()
            query = ("""SELECT Scans.scans_id, Card.card_id, Scans.scanned                FROM Scans JOIN Card ON Card.card_id = Scans.card_id WHERE                    Scans.scanned BETWEEN "%s" AND "%s" GROUP BY                  Scans.scans_id, Card.card_id, Scans.scanned""")

            variables = (start_date, end_date)
            cursor.execute(query, variables)

            results = cursor.fetchall()
            cursor.close()
            connection.close()

            result = []
            if results: 
                for data in results:
                    result.append(data)
                    print(data)
            return result
                
    except Exception as error:
        results = -1
        print("help")
        return results

def find_devices(manufacturer_id):
    results = None
    try:
        connection = connect()
        if connection:
            cursor = connection.cursor()
            query = ("""SELECT Devices.device_id, ATMMachine.atm_machine_id,              Devices.made FROM Devices JOIN ATMMachine ON                                  ATMMachine.atm_machine_id = Devices.atm_machine_id WHERE                      Devices.manufacturer_id = %s GROUP BY Devices.device_id,                      ATMMachine.atm_machine_id, Devices.made""")

            variables = (manufacturer_id)
            cursor.execute(query, variables)

            results = cursor.fetchall()
            cursor.close()
            connection.close()

            result = []
            if results: 
                for data in results:
                    result.append(data)
                    print(data)
            return result
                
    except Exception as error:
        results = -1
        print("help")
        return results
